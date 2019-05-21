Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAB24AB5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 10:47:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT0RB-0004eo-NX
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 04:47:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hT0Oo-0003ZM-G6
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hT0On-0004GP-MF
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:45:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:60610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hT0Ol-0004AL-J4; Tue, 21 May 2019 04:45:27 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hT0Oh-0003ut-9k; Tue, 21 May 2019 11:45:23 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 11:45:19 +0300
Message-Id: <20190521084522.15050-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [RFC PATCH 0/3] block: qiov_offset parameter for io
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is idea of adding qiov_offset parameter to io path, to avoid
a lot of places with same pattern of creating local_qiov or hd_qiov
variables. Here is only read path for qcow2, if we like it, I'll
make v2 with both read and write paths for qcow2.

Vladimir Sementsov-Ogievskiy (3):
  block/io: introduce bdrv_co_preadv_part
  block/qcow2: refactor qcow2_co_preadv to use buffer-based io
  block/qcow2: implement .bdrv_co_preadv_part

 include/block/block_int.h |  6 +++
 block/io.c                | 87 ++++++++++++++++++++++++++-------------
 block/qcow2.c             | 67 +++++++++++++++---------------
 3 files changed, 97 insertions(+), 63 deletions(-)

-- 
2.18.0


