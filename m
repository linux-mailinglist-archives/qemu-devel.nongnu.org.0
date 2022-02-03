Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D362A4A86F2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:49:40 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdQZ-0000wQ-LM
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nFd1I-00028R-Cv; Thu, 03 Feb 2022 09:23:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34076 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nFd1G-0007FO-EE; Thu, 03 Feb 2022 09:23:32 -0500
Received: from localhost.localdomain
 (dynamic-095-114-033-227.95.114.pool.telefonica.de [95.114.33.227])
 by csgraf.de (Postfix) with ESMTPSA id 39B4F6080DA9;
 Thu,  3 Feb 2022 15:23:22 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: arm: Add simple dirty bitmap tracking
Date: Thu,  3 Feb 2022 15:23:20 +0100
Message-Id: <20220203142320.33022-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The actual tracking of dirty bitmap updates is happening in architecture code.
So far, the aarch64 hvf code has not updated QEMU's dirty bitmap at all. The
net result of that is that the VGA device's framebuffer would not update.

This patch adds simplistic dirty bitmap updates. Unfortunately hvf can only set
permissions per full region, so we have to mark the complete region as dirty
when only a single byte was modified inside.

We also handle the write protect update logic before we handle any writes.
This allows us to even handle non-ISV instructions on dirty logging enabled
memory regions: Once we flip the region to writable again, we just rerun
the trapping instruction.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0dc96560d3..92ad0d29c4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1163,6 +1163,28 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
 
+        /*
+         * Dirty log updates work without isv as well. We just run the write
+         * again with write permissions set. So handle them before the assert.
+         */
+        if (iswrite) {
+            uint64_t gpa = hvf_exit->exception.physical_address;
+            hvf_slot *slot = hvf_find_overlap_slot(gpa, 1);
+
+            if (slot && slot->flags & HVF_SLOT_LOG) {
+                /*
+                 * HVF can only set a full region's permissions, so let's just
+                 * mark the full region as dirty.
+                 */
+                memory_region_set_dirty(slot->region, 0, slot->size);
+                hv_vm_protect(slot->start, slot->size, HV_MEMORY_READ |
+                              HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+
+                /* Run the same instruction again, without write faulting */
+                break;
+            }
+        }
+
         assert(isv);
 
         if (iswrite) {
-- 
2.32.0 (Apple Git-132)


