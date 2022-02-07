Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2684ACC82
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 00:09:02 +0100 (CET)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHD80-0004uq-PG
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 18:09:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHCrp-0005Ul-In; Mon, 07 Feb 2022 17:52:17 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34154 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHCrm-0007Ty-N1; Mon, 07 Feb 2022 17:52:17 -0500
Received: from localhost.localdomain
 (dynamic-077-009-016-031.77.9.pool.telefonica.de [77.9.16.31])
 by csgraf.de (Postfix) with ESMTPSA id 49FC7608119E;
 Mon,  7 Feb 2022 23:52:12 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
Date: Mon,  7 Feb 2022 23:52:11 +0100
Message-Id: <20220207225211.15281-1-agraf@csgraf.de>
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
those reads trap into QEMU which handles them as faults.

However, according to the ARMv8 spec (issue D17783), reads on this
register in older ARMv8 revisions should be RES0. So let's treat it
as such instead.

Reported-by: Ivan Babrou <ivan@cloudflare.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 92ad0d29c4..045ec69c7c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -54,6 +54,7 @@
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_ID_AA64ISAR2_EL1 SYSREG(3, 0, 0, 6, 2)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -780,6 +781,10 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_ID_AA64ISAR2_EL1:
+        /* We do not support any of the ISAR2 features yet */
+        val = 0;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
-- 
2.32.0 (Apple Git-132)


