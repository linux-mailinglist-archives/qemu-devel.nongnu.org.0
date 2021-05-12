Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E237BF7F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpcA-0000L3-6H
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXq-0004ZZ-HI; Wed, 12 May 2021 10:09:05 -0400
Received: from [201.28.113.2] (port=48830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXp-00081F-02; Wed, 12 May 2021 10:09:02 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 138F08000C2;
 Wed, 12 May 2021 11:08:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/ppc: moved ppc_store_lpcr to cpu.c
Date: Wed, 12 May 2021 11:08:07 -0300
Message-Id: <20210512140813.112884-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:39.0228 (UTC)
 FILETIME=[4E8C57C0:01D74738]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is used in !TCG cases, so it has been moved into a file
that is compiled when --disable-tcg is selected.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.c         | 11 +++++++++++
 target/ppc/misc_helper.c | 10 ----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0ab7ac1af1..8a82e2ffa8 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat-helpers.h"
 #include "mmu-hash64.h"
+#include "helper_regs.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -90,3 +91,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
     /* FIXME: Should check for valid HTABMASK values in 32-bit case */
     env->spr[SPR_SDR1] = value;
 }
+
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+    /* The gtse bit affects hflags */
+    hreg_compute_hflags(env);
+}
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b910ac6479..442b12652c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -255,16 +255,6 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t arg)
 /*****************************************************************************/
 /* Special registers manipulation */
 
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
-    /* The gtse bit affects hflags */
-    hreg_compute_hflags(env);
-}
-
 /*
  * This code is lifted from MacOnLinux. It is called whenever THRM1,2
  * or 3 is read an fixes up the values in such a way that will make
-- 
2.17.1


