Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43393376906
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:49:53 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3fk-0000BQ-9Q
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lf3Y8-00056i-Vy; Fri, 07 May 2021 12:42:01 -0400
Received: from [201.28.113.2] (port=46166 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lf3Y6-0004U0-Vo; Fri, 07 May 2021 12:42:00 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 7 May 2021 13:41:54 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 4B45980139F;
 Fri,  7 May 2021 13:41:54 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4] hw/ppc: moved has_spr to cpu.h
Date: Fri,  7 May 2021 13:41:46 -0300
Message-Id: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
Based-on: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 07 May 2021 16:41:54.0441 (UTC)
 FILETIME=[E341BF90:01D7435F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved has_spr to cpu.h as ppc_has_spr and turned it into an inline function.
Change spr verification in pnv.c and spapr.c to a version that can
compile in a !TCG environment.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
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
2.17.1


