Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF62458EF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbigv-0006QE-Va
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 05:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chen.zhang@intel.com>) id 1hbieD-0004hV-K0
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1hbiac-0001TN-UW
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:33:44 -0400
Received: from mga17.intel.com ([192.55.52.151]:19769)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1hbiab-0001MY-2u; Fri, 14 Jun 2019 05:33:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 02:33:32 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2019 02:33:31 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Xie Changlong <xiechanglong.d@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 qemu-dev <qemu-devel@nongnu.org>
Date: Fri, 14 Jun 2019 17:28:53 +0800
Message-Id: <20190614092853.26551-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH] block/replication.c: Fix crash issue after
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

No block job on active disk after failover.
In the replication_stop() function have canceled the block job,
we check it again here.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 block/replication.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/replication.c b/block/replication.c
index 3d4dedddfc..bdf2bf4bbc 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -146,7 +146,9 @@ static void replication_close(BlockDriverState *bs)
         replication_stop(s->rs, false, NULL);
     }
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
-        job_cancel_sync(&s->active_disk->bs->job->job);
+        if (s->secondary_disk->bs->job) {
+            job_cancel_sync(&s->secondary_disk->bs->job->job);
+        }
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
-- 
2.17.GIT


