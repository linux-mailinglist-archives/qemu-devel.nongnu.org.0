Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E90399C7B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:25:07 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loif4-0000mR-D1
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loict-00066u-WE; Thu, 03 Jun 2021 04:22:52 -0400
Received: from ozlabs.org ([203.11.71.1]:48291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicr-0008Mq-5A; Thu, 03 Jun 2021 04:22:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l1h1Jz9s24; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=wRiKq/BC2J7ZiqKf57WfRZb+cWRnNuHe0kaL6PUGR74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cIsO+ZDJpJ2b1Kx2/AyBxYjPmY+goklbigaQTAsZl7r5FY8OT/KgoS8W0Rf6HbAjn
 HhB/wr8ULupY69blrvvmrzgGNp3BlKwQc3ySVuLCZnJykXvrSvinjSSLlgdZc2aiaG
 7wqrsDG8RP4t3GSTNcIqkutUh7AS7wzIy1lpNX+c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/42] target/ppc: moved ppc_store_lpcr and ppc_store_msr to
 cpu.c
Date: Thu,  3 Jun 2021 18:21:51 +1000
Message-Id: <20210603082231.601214-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

These functions are used in hw/ppc logic, during machine startup, which
means it must be compiled when --disable-tcg is selected, and so it has
been moved into a common code file

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210521201759.85475-3-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.c         | 17 +++++++++++++++++
 target/ppc/misc_helper.c | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 9cf3288b7a..c8e87e30f1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat-helpers.h"
 #include "mmu-hash64.h"
+#include "helper_regs.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -92,3 +93,19 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
     env->spr[SPR_SDR1] = value;
 }
 #endif /* CONFIG_SOFTMMU */
+
+/* GDBstub can read and write MSR... */
+void ppc_store_msr(CPUPPCState *env, target_ulong value)
+{
+    hreg_store_msr(env, value, 0);
+}
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
index 08a31da289..442b12652c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -255,22 +255,6 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t arg)
 /*****************************************************************************/
 /* Special registers manipulation */
 
-/* GDBstub can read and write MSR... */
-void ppc_store_msr(CPUPPCState *env, target_ulong value)
-{
-    hreg_store_msr(env, value, 0);
-}
-
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
2.31.1


