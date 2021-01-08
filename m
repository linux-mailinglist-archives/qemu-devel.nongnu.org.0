Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83B2EEF28
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 10:09:32 +0100 (CET)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxnlz-0004hy-IG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 04:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kxnkz-0003pz-Dr; Fri, 08 Jan 2021 04:08:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42254
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kxnku-00007E-LR; Fri, 08 Jan 2021 04:08:26 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D41F85FC66;
 Fri,  8 Jan 2021 10:08:17 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCHv2 1/2] target/arm: ARMv8.4-TTST extension
Date: Fri,  8 Jan 2021 11:08:16 +0200
Message-Id: <20210108090817.6127-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds for the Small Translation tables extension in AArch64 state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..ad37ff61c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3936,6 +3936,11 @@ static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
 }
 
+static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d0d4cd1e1..bf54616c23 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10842,7 +10842,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi;
+    int select, tsz, tbi, max_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10877,7 +10877,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
     }
-    tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
+
+    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+        max_tsz = 48 - using64k;
+    } else {
+        max_tsz = 39;
+    }
+
+    tsz = MIN(tsz, max_tsz);
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
 
     /* Present TBI as a composite with TBID.  */
@@ -11096,6 +11103,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
+
+            if (cpu_isar_feature(aa64_st, cpu)) {
+                startlevel &= 3;
+            }
         } else {
             /* 16KB or 64KB pages */
             startlevel = 3 - sl0;
-- 
2.30.0


