Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7AFC06FA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:07:32 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDquB-0003W5-7v
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqCh-0003UF-RZ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqCg-0000KR-LF
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:49752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDqCd-0000IU-AO; Fri, 27 Sep 2019 09:22:31 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDpHx-0003za-B2; Fri, 27 Sep 2019 15:23:57 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 0/9] qcow2-bitmaps: rewrite reopening logic
Date: Fri, 27 Sep 2019 15:23:46 +0300
Message-Id: <20190927122355.7344-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Bitmaps reopening is buggy, reopening-rw just not working at all and
reopening-ro may lead to producing broken incremental
backup if we do temporary snapshot in a meantime.

v5:
01: - add Max's r-b
    - fix s/QSIMPLE_INIT/QTAILQ_INIT/ in a comment
02: - add Max's and John's a-b
03: - improve test to check bitmap hashes in more safe way
07: - drop wrong statement from commit message
    - log events by hand
08: - drop 'the' from comment
    - add Corruption in case of existent IN_USE on RO->RW reopen
09: - add Max's a-b and John's r-b

v4: Drop complicated solution around reopening logic [Kevin], fix
    the existing bug in a simplest way

Vladimir Sementsov-Ogievskiy (9):
  block: switch reopen queue from QSIMPLEQ to QTAILQ
  block: reverse order for reopen commits
  iotests: add test-case to 165 to test reopening qcow2 bitmaps to RW
  block/qcow2-bitmap: get rid of bdrv_has_changed_persistent_bitmaps
  block/qcow2-bitmap: drop qcow2_reopen_bitmaps_rw_hint()
  block/qcow2-bitmap: do not remove bitmaps on reopen-ro
  iotests: add test 260 to check bitmap life after snapshot + commit
  block/qcow2-bitmap: fix and improve qcow2_reopen_bitmaps_rw
  qcow2-bitmap: move bitmap reopen-rw code to qcow2_reopen_commit

 block/qcow2.h                |   5 +-
 include/block/block.h        |   2 +-
 include/block/block_int.h    |   6 --
 include/block/dirty-bitmap.h |   1 -
 block.c                      |  53 +++++------
 block/dirty-bitmap.c         |  12 ---
 block/qcow2-bitmap.c         | 164 ++++++++++++++++++++++-------------
 block/qcow2.c                |  17 +++-
 tests/qemu-iotests/165       |  57 +++++++++++-
 tests/qemu-iotests/165.out   |   4 +-
 tests/qemu-iotests/260       |  89 +++++++++++++++++++
 tests/qemu-iotests/260.out   |  52 +++++++++++
 tests/qemu-iotests/group     |   1 +
 13 files changed, 343 insertions(+), 120 deletions(-)
 create mode 100755 tests/qemu-iotests/260
 create mode 100644 tests/qemu-iotests/260.out

-- 
2.21.0


