Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976204E07D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 08:17:57 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heCs0-0003QY-R0
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 02:17:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47109)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chen.zhang@intel.com>) id 1heClQ-0005C7-AY
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1heCXe-0005rf-JH
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 01:56:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:60483)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1heCXd-0005l6-DS; Fri, 21 Jun 2019 01:56:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 22:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,399,1557212400"; d="scan'208";a="171116418"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga002.jf.intel.com with ESMTP; 20 Jun 2019 22:56:44 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Xie Changlong <xiechanglong.d@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 qemu-dev <qemu-devel@nongnu.org>
Date: Fri, 21 Jun 2019 13:52:02 +0800
Message-Id: <20190621055202.28270-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH V2] block/replication.c: Fix crash issue after
 failover
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

If we try to close replication after failover, it will crash here.
So we need check the block job on active disk before cancel the job.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 block/replication.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/replication.c b/block/replication.c
index 3d4dedddfc..845f796dd4 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -146,7 +146,9 @@ static void replication_close(BlockDriverState *bs)
         replication_stop(s->rs, false, NULL);
     }
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
-        job_cancel_sync(&s->active_disk->bs->job->job);
+        if (s->active_disk->bs->job) {
+            job_cancel_sync(&s->active_disk->bs->job->job);
+        }
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
-- 
2.17.GIT


