Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C85388E7E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:59:59 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLnq-0006UC-J2
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLga-0000eg-I8; Wed, 19 May 2021 08:52:28 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgX-00017Z-SH; Wed, 19 May 2021 08:52:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnX558Dz9sXh; Wed, 19 May 2021 22:52:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428720;
 bh=mWHrSzRgEqfjkpCIdyrsHgqWS8dY+GPuoiulDLzJ/4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sogtp/i4fT502z1GDPbvAVelrupupIQ4nxuzSTNm9Jg93laJc5+fc7byLdlBhCjhm
 K8uW+urXgr7qkj2GXHlWU7T3R8Er/yBlm8W8OaucGEx6qxqlbcMWCWbhyJnnbsRpkw
 nIAbXSadeV03bS4dvVMzI3o4SA/7L1EaVAFiYwDY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/48] hw/ppc: moved has_spr to cpu.h
Date: Wed, 19 May 2021 22:51:09 +1000
Message-Id: <20210519125148.27720-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved has_spr to cpu.h as ppc_has_spr and turned it into an inline function.
Change spr verification in pnv.c and spapr.c to a version that can
compile in a !TCG environment.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         |  2 +-
 hw/ppc/spapr.c       |  4 ++--
 hw/ppc/spapr_hcall.c | 12 +++---------
 target/ppc/cpu.h     |  6 ++++++
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ffe01977cd..d16dd2d080 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -196,7 +196,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
     _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
 
-    if (env->spr_cb[SPR_PURR].oea_read) {
+    if (ppc_has_spr(cpu, SPR_PURR)) {
         _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
     }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4db448d63e..c23bcc4490 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -703,10 +703,10 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
     _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
 
-    if (env->spr_cb[SPR_PURR].oea_read) {
+    if (ppc_has_spr(cpu, SPR_PURR)) {
         _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
     }
-    if (env->spr_cb[SPR_SPURR].oea_read) {
+    if (ppc_has_spr(cpu, SPR_PURR)) {
         _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
     }
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6dbaa93d15..f25014afda 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -20,12 +20,6 @@
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
 
-static bool has_spr(PowerPCCPU *cpu, int spr)
-{
-    /* We can test whether the SPR is defined by checking for a valid name */
-    return cpu->env.spr_cb[spr].name != NULL;
-}
-
 bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
 {
     MachineState *machine = MACHINE(spapr);
@@ -212,12 +206,12 @@ static target_ulong h_set_sprg0(PowerPCCPU *cpu, SpaprMachineState *spapr,
 static target_ulong h_set_dabr(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                target_ulong opcode, target_ulong *args)
 {
-    if (!has_spr(cpu, SPR_DABR)) {
+    if (!ppc_has_spr(cpu, SPR_DABR)) {
         return H_HARDWARE;              /* DABR register not available */
     }
     cpu_synchronize_state(CPU(cpu));
 
-    if (has_spr(cpu, SPR_DABRX)) {
+    if (ppc_has_spr(cpu, SPR_DABRX)) {
         cpu->env.spr[SPR_DABRX] = 0x3;  /* Use Problem and Privileged state */
     } else if (!(args[0] & 0x4)) {      /* Breakpoint Translation set? */
         return H_RESERVED_DABR;
@@ -232,7 +226,7 @@ static target_ulong h_set_xdabr(PowerPCCPU *cpu, SpaprMachineState *spapr,
 {
     target_ulong dabrx = args[1];
 
-    if (!has_spr(cpu, SPR_DABR) || !has_spr(cpu, SPR_DABRX)) {
+    if (!ppc_has_spr(cpu, SPR_DABR) || !ppc_has_spr(cpu, SPR_DABRX)) {
         return H_HARDWARE;
     }
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a976e7f7b0..98fcf1c4d6 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2642,6 +2642,12 @@ static inline ppc_avr_t *cpu_avr_ptr(CPUPPCState *env, int i)
     return (ppc_avr_t *)((uintptr_t)env + avr_full_offset(i));
 }
 
+static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
+{
+    /* We can test whether the SPR is defined by checking for a valid name */
+    return cpu->env.spr_cb[spr].name != NULL;
+}
+
 void dump_mmu(CPUPPCState *env);
 
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
-- 
2.31.1


