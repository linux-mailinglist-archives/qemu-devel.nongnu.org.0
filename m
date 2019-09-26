Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DABEF9F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 12:30:48 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDR2p-00011u-M6
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 06:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDQyi-0006fb-Hm
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDQyg-00074o-Q5
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:26:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:54298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDQyb-0006vW-Hk; Thu, 26 Sep 2019 06:26:21 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDQyW-0003nC-Dv; Thu, 26 Sep 2019 13:26:16 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v14 00/14] backup-top filter driver for backup
Date: Thu, 26 Sep 2019 13:26:00 +0300
Message-Id: <20190926102614.28999-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 den@openvz.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series introduce backup-top driver. It's a filter-node, which
do copy-before-write operation. Mirror uses filter-node for handling
guest writes, let's move to filter-node (from write-notifiers) for
backup too.

v13 is queued in Max's branch, but I understand that new range locks
don't work in backup case. So, I've to resend.

v14: Drop range locks, keep old good in-flight requests waiting

12: new patch
14: use old request-waiting scheme instead of range locks

Vladimir Sementsov-Ogievskiy (14):
  block/backup: fix max_transfer handling for copy_range
  block/backup: fix backup_cow_with_offload for last cluster
  block/backup: split shareable copying part from backup_do_cow
  block/backup: improve comment about image fleecing
  block/backup: introduce BlockCopyState
  block/backup: fix block-comment style
  block: move block_copy from block/backup.c to separate file
  block: teach bdrv_debug_breakpoint skip filters with backing
  iotests: prepare 124 and 257 bitmap querying for backup-top filter
  iotests: 257: drop unused Drive.device field
  iotests: 257: drop device_add
  block: move in-flight requests handling from backup to block-copy
  block: introduce backup-top filter driver
  block/backup: use backup-top instead of write notifiers

 qapi/block-core.json          |   8 +-
 block/backup-top.h            |  37 ++
 include/block/block-copy.h    |  92 +++++
 include/block/block_int.h     |   1 +
 block.c                       |  34 +-
 block/backup-top.c            | 240 ++++++++++++
 block/backup.c                | 440 ++++-----------------
 block/block-copy.c            | 370 ++++++++++++++++++
 block/replication.c           |   2 +-
 blockdev.c                    |   1 +
 block/Makefile.objs           |   3 +
 block/trace-events            |  14 +-
 tests/qemu-iotests/056        |   8 +-
 tests/qemu-iotests/124        |  83 ++--
 tests/qemu-iotests/257        |  91 ++---
 tests/qemu-iotests/257.out    | 714 ++++++++++++++--------------------
 tests/qemu-iotests/iotests.py |  27 ++
 17 files changed, 1256 insertions(+), 909 deletions(-)
 create mode 100644 block/backup-top.h
 create mode 100644 include/block/block-copy.h
 create mode 100644 block/backup-top.c
 create mode 100644 block/block-copy.c

-- 
2.21.0


