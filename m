Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C431A6580
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 13:13:31 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNx1u-0004Hk-D3
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 07:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58843)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1jNx0t-0002ic-So
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:12:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1jNx0s-0000iQ-Jr
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:12:27 -0400
Received: from relay.sw.ru ([185.231.240.75]:40336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jNx0s-0000g1-Ck
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:12:26 -0400
Received: from vgpu0.qa.sw.ru ([10.94.1.107])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jNx0h-0002VQ-4V; Mon, 13 Apr 2020 14:12:15 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC patch v1 0/3] qemu-file writing performance improving
Date: Mon, 13 Apr 2020 14:12:11 +0300
Message-Id: <1586776334-641239-1-git-send-email-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: den@openvz.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Problem description: qcow2 internal snapshot saving time is too big on HDD ~ 25 sec

When a qcow2 image is placed on a regular HDD and the image is openned with
O_DIRECT the snapshot saving time is around 26 sec.
The snapshot saving time can be 4 times sorter.
The patch series propose the way to achive that. 

Why is the saving time = ~25 sec?

There are three things:
1. qemu-file iov limit (currently 64)
2. direct qemu_fflush calls, inducing disk writings
3. ram data copying and synchronous disk wrtings

When 1, 2 are quite clear, the 3rd needs some explaination:

Internal snapshot uses qemu-file as an interface to store the data with
stream semantics.
qemu-file avoids data coping when possible (mostly for ram data)
and use iovectors to propagate the data to an undelying block driver state.
In the case when qcow2 openned with O_DIRECT it is suboptimal.

This is what happens: on writing, when the iovectors query goes from qemu-file
to bdrv (here and further by brdv I mean qcow2 with posix O_DIRECT openned backend),
the brdv checks all iovectors to be base and size aligned, if it's not the case,
the data copied to an internal buffer and synchronous pwrite is called.
If the iovectors are aligned, io_submit is called.

In our case, snapshot almost always induces pwrite, since we never have all
the iovectors aligned in the query, because of frequent adding a short iovector:
8 byte ram-page delimiters, after adding each ram page iovector.

So the qemu-file code in this case:
1. doesn't aviod ram copying
2. works fully synchronously

How to improve the snapshot time:

1. easy way: to increase iov limit to IOV_MAX (1024).
This will reduce synchronous writing frequency.
My test revealed that with iov limit = IOV_MAX the snapshot time *~12 sec*.

2. complex way: do writings asynchronously.
Introduce both base- and size-aligned buffer, write the data only when
the buffer is full, write the buffer asynchronously, meanwhile filling another
buffer with snapshot data.
My test revealed that this complex way provides the snapshot time *~6 sec*,
2 times better than just iov limit increasing.

The patch proposes how to improve the snapshot performance in the complex way,
allowing to use the asyncronous writings when needed.

This is an RFC series, as I didn't confident that I fully understand all
qemu-file use cases. I tried to make the series in a safe way to not break
anything related to qemu-file using in other places, like migration.

All comments are *VERY* appriciated!

Thanks,
Denis

Denis Plotnikov (3):
  qemu-file: introduce current buffer
  qemu-file: add buffered mode
  migration/savevm: use qemu-file buffered mode for non-cached bdrv

 include/qemu/typedefs.h |   2 +
 migration/qemu-file.c   | 479 +++++++++++++++++++++++++++++++++++++++++-------
 migration/qemu-file.h   |   9 +
 migration/savevm.c      |  38 +++-
 4 files changed, 456 insertions(+), 72 deletions(-)

-- 
1.8.3.1


