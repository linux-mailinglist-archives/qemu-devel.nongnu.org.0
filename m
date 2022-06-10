Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A9546C59
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:30:13 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjOe-00055V-Pm
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJr-00012b-Rk; Fri, 10 Jun 2022 14:25:19 -0400
Received: from [187.72.171.209] (port=48290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJp-0003eJ-FD; Fri, 10 Jun 2022 14:25:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DA87E801399;
 Fri, 10 Jun 2022 15:23:42 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH RESEND v2 08/11] target/ppc: Add flag for ISA v2.06 BCDA
 instructions
Date: Fri, 10 Jun 2022 15:23:07 -0300
Message-Id: <20220610182310.68715-9-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:43.0119 (UTC)
 FILETIME=[372249F0:01D87CF7]
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
 target/ppc/cpu.h      |  5 ++++-
 target/ppc/cpu_init.c | 10 ++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f37..642bae311f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2277,6 +2277,8 @@ enum {
     PPC2_ISA310        = 0x0000000000100000ULL,
     /*   lwsync instruction                                                  */
     PPC2_MEM_LWSYNC    = 0x0000000000200000ULL,
+    /* ISA 2.06 BCD assist instructions                                      */
+    PPC2_BCDA_ISA206   = 0x0000000000400000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2285,7 +2287,8 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC | \
+                        PPC2_BCDA_ISA206)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0f891afa04..a5d2fe4057 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5985,7 +5985,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
+                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6159,7 +6159,8 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC |
+                        PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6379,7 +6380,8 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC |
+                        PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6597,7 +6599,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
                         PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310 |
-                        PPC2_MEM_LWSYNC;
+                        PPC2_MEM_LWSYNC | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
-- 
2.25.1


