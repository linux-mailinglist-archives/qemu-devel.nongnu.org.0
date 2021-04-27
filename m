Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EF36C49A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:07:03 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLYU-00045T-8K
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lbLWf-00036p-L2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:05:09 -0400
Received: from mail.sysgo.com ([176.9.12.79]:59306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lbLWc-0002Qb-Op
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:05:08 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Subject: [PATCH v2] amd_iommu: fix wrong MMIO operations
Date: Tue, 27 Apr 2021 13:05:04 +0200
Message-Id: <20210427110504.10878-1-rka@sysgo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=176.9.12.79; envelope-from=rka@sysgo.com;
 helo=mail.sysgo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=0.228 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Kapl <rka@sysgo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address was swapped with value when writing MMIO registers, so the user
saw garbage in lot of cases. The interrupt status was not correctly set.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 hw/i386/amd_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

v1 -> v2: Change the amdvi_writeq_raw  arg order to be consistent with the rest
          of the code.

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 74a93a5d93..8b20914eee 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -99,7 +99,7 @@ static uint64_t amdvi_readq(AMDVIState *s, hwaddr addr)
 }
 
 /* internal write */
-static void amdvi_writeq_raw(AMDVIState *s, uint64_t val, hwaddr addr)
+static void amdvi_writeq_raw(AMDVIState *s, hwaddr addr, uint64_t val)
 {
     stq_le_p(&s->mmior[addr], val);
 }
@@ -382,7 +382,7 @@ static void amdvi_completion_wait(AMDVIState *s, uint64_t *cmd)
     }
     /* set completion interrupt */
     if (extract64(cmd[0], 1, 1)) {
-        amdvi_test_mask(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
+        amdvi_assign_orq(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
         /* generate interrupt */
         amdvi_generate_msi_interrupt(s);
     }
@@ -553,7 +553,7 @@ static void amdvi_cmdbuf_run(AMDVIState *s)
         trace_amdvi_command_exec(s->cmdbuf_head, s->cmdbuf_tail, s->cmdbuf);
         amdvi_cmdbuf_exec(s);
         s->cmdbuf_head += AMDVI_COMMAND_SIZE;
-        amdvi_writeq_raw(s, s->cmdbuf_head, AMDVI_MMIO_COMMAND_HEAD);
+        amdvi_writeq_raw(s, AMDVI_MMIO_COMMAND_HEAD, s->cmdbuf_head);
 
         /* wrap head pointer */
         if (s->cmdbuf_head >= s->cmdbuf_len * AMDVI_COMMAND_SIZE) {
-- 
2.20.1


