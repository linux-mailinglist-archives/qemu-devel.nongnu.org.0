Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D1505CA5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 18:46:25 +0200 (CEST)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngUW8-000742-I3
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 12:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ngUPj-00079H-Ks; Mon, 18 Apr 2022 12:39:47 -0400
Received: from [187.72.171.209] (port=20022 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ngUPh-0006A6-Qi; Mon, 18 Apr 2022 12:39:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Apr 2022 13:39:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1CEBF80060F;
 Mon, 18 Apr 2022 13:39:03 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-7.1 07/10] target/ppc: Add flag for ISA v2.06 BCDA
 instructions
Date: Mon, 18 Apr 2022 13:38:20 -0300
Message-Id: <20220418163823.61866-8-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418163823.61866-1-victor.colombo@eldorado.org.br>
References: <20220418163823.61866-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2022 16:39:03.0482 (UTC)
 FILETIME=[D048F9A0:01D85342]
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
Cc: danielhb413@gmail.com, groug@kaod.org, victor.colombo@eldorado.org.br,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
---
 target/ppc/cpu.h      | 4 +++-
 target/ppc/cpu_init.c | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 047b24ba50..6163d28c5a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2284,6 +2284,8 @@ enum {
     PPC2_ISA300        = 0x0000000000080000ULL,
     /* POWER ISA 3.1                                                         */
     PPC2_ISA310        = 0x0000000000100000ULL,
+    /* ISA 2.06 BCD assist instructions                                      */
+    PPC2_BCDA_ISA206   = 0x0000000000200000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2292,7 +2294,7 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_BCDA_ISA206)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 073fd10168..dd8486f614 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5984,7 +5984,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206;
+                        PPC2_PM_ISA206 | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6157,7 +6157,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6375,7 +6375,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6588,7 +6588,8 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
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


