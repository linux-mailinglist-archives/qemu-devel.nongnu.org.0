Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC59531578
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:20:30 +0200 (CEST)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCfN-0006ug-9R
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntCLI-0007Ii-QG; Mon, 23 May 2022 13:59:44 -0400
Received: from [187.72.171.209] (port=50371 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntCLH-0003pW-3D; Mon, 23 May 2022 13:59:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 23 May 2022 14:58:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id F1EA480031F;
 Mon, 23 May 2022 14:58:16 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2 08/11] target/ppc: Add flag for ISA v2.06 BCDA instructions
Date: Mon, 23 May 2022 14:58:04 -0300
Message-Id: <20220523175807.59333-9-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523175807.59333-1-victor.colombo@eldorado.org.br>
References: <20220523175807.59333-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 May 2022 17:58:17.0163 (UTC)
 FILETIME=[AE2861B0:01D86ECE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Adds an insns_flags2 for the BCD assist instructions introduced in
Power ISA 2.06. These instructions are not listed in the manuals for
e5500[1] and e6500[2], so the flag is only added for POWER7/8/9/10
models.

[1] https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf
[2] https://www.nxp.com/docs/en/reference-manual/E6500RM.pdf

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h      | 4 +++-
 target/ppc/cpu_init.c | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 48596cfb25..8d31e9578e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2271,6 +2271,8 @@ enum {
     PPC2_ISA300        = 0x0000000000080000ULL,
     /* POWER ISA 3.1                                                         */
     PPC2_ISA310        = 0x0000000000100000ULL,
+    /* ISA 2.06 BCD assist instructions                                      */
+    PPC2_BCDA_ISA206   = 0x0000000000200000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2279,7 +2281,7 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_BCDA_ISA206)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 527ad40fcb..e35d0c06ba 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5985,7 +5985,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206;
+                        PPC2_PM_ISA206 | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6159,7 +6159,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6379,7 +6379,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6596,7 +6596,8 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310 |
+                        PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
-- 
2.25.1


