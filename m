Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6F1815DE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 11:33:06 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jByfh-0005cb-4S
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 06:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jByd7-0002tK-Ii
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 06:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jByd6-0001Wj-JX
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 06:30:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:33042)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jByd3-0001RW-IQ; Wed, 11 Mar 2020 06:30:21 -0400
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jBycx-0005cJ-As; Wed, 11 Mar 2020 13:30:15 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 0/9] block-copy improvements: part I
Date: Wed, 11 Mar 2020 13:29:55 +0300
Message-Id: <20200311103004.7649-1-vsementsov@virtuozzo.com>
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

v4:

01: add Max's r-b
02: rm ProgressResetCallbackFunc typedef
03-06: add Max's r-b
07: fix indentation
08: update in_flight_bytes in block_copy_inflight_req_shrink
    improve comment above block_copy() definition
09: add Andrey's and Max's r-b
    drop hunk fixing indentation (merged to 07)

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

 include/block/block-copy.h    |  65 +-----
 include/qemu/job.h            |  11 +-
 include/qemu/progress_meter.h |  58 +++++
 block/backup-top.c            |   6 +-
 block/backup.c                |  38 ++--
 block/block-copy.c            | 405 ++++++++++++++++++++++++++--------
 blockjob.c                    |  16 +-
 job-qmp.c                     |   4 +-
 job.c                         |   6 +-
 qemu-img.c                    |   6 +-
 block/trace-events            |   1 +
 11 files changed, 420 insertions(+), 196 deletions(-)
 create mode 100644 include/qemu/progress_meter.h

-- 
2.21.0


