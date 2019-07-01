Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6374A6B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:22:34 +0200 (CEST)
Received: from localhost ([::1]:59506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdGsT-0007v9-G8
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFf-0007QJ-M5
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFY-0005uz-Tu
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:38516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFT-0005Va-Ao; Tue, 18 Jun 2019 11:42:17 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFH-0002Sc-Ec; Tue, 18 Jun 2019 18:42:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 18:41:59 +0300
Message-Id: <20190618154202.89107-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 0/3] block: BDRV_REQ_PREFETCH
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is small new read flag: BDRV_REQ_PREFETCH, which in combination with
BDRV_REQ_COPY_ON_READ does copy-on-read without
extra buffer for read data. This means that only parts that needs COR
will be actually read and only corresponding buffers allocated, no more.

This allows to improve a bit block-stream and NBD_CMD_CACHE

v2: change interface to be just one flag BDRV_REQ_PREFETCH

v1 was "[PATCH 0/3] block: blk_co_pcache"
   https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg01047.html

Vladimir Sementsov-Ogievskiy (3):
  block: implement BDRV_REQ_PREFETCH
  block/stream: use BDRV_REQ_PREFETCH
  nbd: improve CMD_CACHE: use blk_co_pcache

 include/block/block.h |  8 +++++++-
 block/io.c            | 18 ++++++++++++------
 block/stream.c        | 20 +++++++-------------
 nbd/server.c          | 43 +++++++++++++++++++++++++++++++++++--------
 4 files changed, 61 insertions(+), 28 deletions(-)

-- 
2.18.0


