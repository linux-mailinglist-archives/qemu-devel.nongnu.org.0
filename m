Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FD749B0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:19:54 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZui-0000Ro-DU
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35741)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZtz-0007SI-61
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZtx-00044S-Uu
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:44212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtx-00041a-MP; Thu, 25 Jul 2019 05:19:05 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtt-0001bs-4e; Thu, 25 Jul 2019 12:19:01 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 12:18:51 +0300
Message-Id: <20190725091900.30542-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3 for-4.1? 0/9] qcow2-bitmaps: rewrite
 reopening logic
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Bitmaps reopening is buggy, we may easily produce broken incremental
backup if we do temporary snapshot. Let's fix it!

v3:
02: John's events_wait already merged in, so my 02 from v2 is not needed.
    Instead, add two simple logging wrappers here
03: rebase on 02 - use new wrappers, move to 260
05: add John's r-b
06: improve function docs [John], add John's r-b

v2:
01: new
02-03: test: splat into two patches, some wording
       improvements and event_wait improved
04: add John's r-b
05: new
06-09: fixes: changed, splat, use patch 01

Vladimir Sementsov-Ogievskiy (9):
  block: add .bdrv_need_rw_file_child_during_reopen_rw handler
  iotests.py: add event_wait_log and events_wait_log helpers
  iotests: add test 260 to check bitmap life after snapshot + commit
  block/qcow2-bitmap: get rid of bdrv_has_changed_persistent_bitmaps
  block/qcow2-bitmap: drop qcow2_reopen_bitmaps_rw_hint()
  block/qcow2-bitmap: do not remove bitmaps on reopen-ro
  block/qcow2-bitmap: fix and improve qcow2_reopen_bitmaps_rw
  block/qcow2-bitmap: fix reopening bitmaps to RW
  qcow2-bitmap: move bitmap reopen-rw code to qcow2_reopen_prepare

 block/qcow2.h                 |   6 +-
 include/block/block_int.h     |   8 +-
 include/block/dirty-bitmap.h  |   1 -
 block.c                       | 163 +++++++++++++++++++++++++++-------
 block/dirty-bitmap.c          |  12 ---
 block/qcow2-bitmap.c          | 149 +++++++++++++++++++------------
 block/qcow2.c                 |   9 +-
 tests/qemu-iotests/260        |  87 ++++++++++++++++++
 tests/qemu-iotests/260.out    |  52 +++++++++++
 tests/qemu-iotests/group      |   1 +
 tests/qemu-iotests/iotests.py |  10 +++
 11 files changed, 384 insertions(+), 114 deletions(-)
 create mode 100755 tests/qemu-iotests/260
 create mode 100644 tests/qemu-iotests/260.out

-- 
2.18.0


