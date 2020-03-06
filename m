Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A768617B794
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:40:36 +0100 (CET)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA7b1-0007gI-N2
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZG-000523-Cy
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZF-0008GS-8y
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:46 -0500
Received: from relay.sw.ru ([185.231.240.75]:37978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7ZC-0007wo-Hc; Fri, 06 Mar 2020 02:38:42 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7Z7-0002Qu-OL; Fri, 06 Mar 2020 10:38:37 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/9] block-copy improvements: part I
Date: Fri,  6 Mar 2020 10:38:22 +0300
Message-Id: <20200306073831.7737-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
01: new
03: fix block_copy_do_copy
04: add comment, rebase on 01
05: s/block_copy_find_inflight_req/find_conflicting_inflight_req/
06: add overflow check
    use int64_t for block_copy bytes parameter
    fix preexisting typo in modified comment
07: update forgotten block_copy prototype
    keep Max's r-b
08: changed a lot
    - check MIN after block_copy_block_status
    - refactor loop in block_copy()
09: drop BackupBlockJob.bcs_bitmap

Vladimir Sementsov-Ogievskiy (9):
  job: refactor progress to separate object
  block/block-copy: fix progress calculation
  block/block-copy: specialcase first copy_range request
  block/block-copy: use block_status
  block/block-copy: factor out find_conflicting_inflight_req
  block/block-copy: refactor interfaces to use bytes instead of end
  block/block-copy: rename start to offset in interfaces
  block/block-copy: reduce intersecting request lock
  block/block-copy: hide structure definitions

 include/block/block-copy.h    |  64 +-----
 include/qemu/job.h            |  11 +-
 include/qemu/progress_meter.h |  58 +++++
 block/backup-top.c            |   6 +-
 block/backup.c                |  38 ++--
 block/block-copy.c            | 404 ++++++++++++++++++++++++++--------
 blockjob.c                    |  16 +-
 job-qmp.c                     |   4 +-
 job.c                         |   6 +-
 qemu-img.c                    |   6 +-
 block/trace-events            |   1 +
 11 files changed, 419 insertions(+), 195 deletions(-)
 create mode 100644 include/qemu/progress_meter.h

-- 
2.21.0


