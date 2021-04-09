Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDB35A23C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:48:05 +0200 (CEST)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtMY-0000SV-Qk
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCe-0002Tw-8B; Fri, 09 Apr 2021 11:37:48 -0400
Received: from [201.28.113.2] (port=41884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCc-0002YS-Mg; Fri, 09 Apr 2021 11:37:48 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 9 Apr 2021 12:19:21 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 7FE06801350;
 Fri,  9 Apr 2021 12:19:21 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/ppc: Add stubs for tcg functions, so it builds
Date: Fri,  9 Apr 2021 12:19:15 -0300
Message-Id: <20210409151916.97326-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 09 Apr 2021 15:19:21.0673 (UTC)
 FILETIME=[B79C5390:01D72D53]
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
Cc: lucas.araujo@eldorado.org.br, lagarcia@br.ibm.com,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file basically adds all stubs required to build the project
with disable-tcg. most of these are not going to remain stubs by the
end, but this part is where it got complicated, and I wanted to get
an RFC ASAP. Most of these have to do with mmu emulation, so they'll
probably be replaced by a KVM implementation in the final product,
but I'm not sure which ones have to be replace, which can remain
stubs, and which should not be called at all. Input in general is
very much welcome.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/tcg-stub.c | 139 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 target/ppc/tcg-stub.c

diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
new file mode 100644
index 0000000000..5dc8cf8911
--- /dev/null
+++ b/target/ppc/tcg-stub.c
@@ -0,0 +1,139 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "mmu-hash64.h"
+
+/* STUFF FOR FIRST LINKER ERROR */
+/* This stuff happens in target/ppc files */
+
+#if !defined(CONFIG_USER_ONLY)
+
+void ppc_store_sdr1(CPUPPCState *env, target_ulong value) {
+    /* stub to make things compile */
+    return;
+}
+
+void ppc_store_ptcr(CPUPPCState *env, target_ulong value) {
+    /* stub to make things compile */
+    return;
+}
+
+#endif /* !defined(CONFIG_USER_ONLY) */
+void ppc_store_msr(CPUPPCState *env, target_ulong value) {
+    /* stub to make things compile */
+    return;
+}
+
+void dump_mmu(CPUPPCState *env){
+    /* stub to make things compile */
+    return;
+}
+
+void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask) {
+    /* stub to make things compile */
+    return;
+}
+
+void ppc_cpu_do_interrupt(CPUState *cpu) {
+    /* stub to make things compile */
+    return;
+}
+
+/* STUFF FOR SECOND LINKER ERROR*/
+/* these errors happen mostly in hw/ppc */
+
+#ifdef TARGET_PPC64
+int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
+                  target_ulong esid, target_ulong vsid) {
+    /* rquired by kvm.c and machine.c */
+    return 0;
+}
+
+void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
+                                 bool (*cb)(void *, uint32_t, uint32_t),
+                                 void *opaque) {
+    /* required by spapr_caps.c */
+    return; 
+}
+
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val) {
+    /* required by spapr_* */
+    return;
+}
+
+const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
+                                             hwaddr ptex, int n) {
+    /* used by spapr_hcall a bunch */
+    return NULL;
+}
+
+void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
+                            hwaddr ptex, int n) {
+    /* used a bunch by spapr_hcall */
+    return; 
+}
+
+void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
+                               target_ulong pte_index,
+                               target_ulong pte0, target_ulong pte1){
+    return; 
+}
+
+unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
+                                          uint64_t pte0, uint64_t pte1) {
+    return 0;
+}
+#endif
+
+void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector) {
+    /* required by spapr_events spapr_mce_dispatch_elog */
+    return;
+}
+#ifndef CONFIG_USER_ONLY
+void ppc_cpu_do_system_reset(CPUState *cs){
+    /* required by pnv and spapr */
+    return;
+}
+#endif
+
+bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid,
+                       ppc_v3_pate_t *entry);
+
+bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid,
+                       ppc_v3_pate_t *entry) {
+    /* used by spapr_hcall: ppc_hash64_hpt_mask */
+    return true;
+}
+
+/* THIRD BATCH OF ERRORS, AFTER MOVING STUFF FROM TRANSLATE TO CPU.C */
+
+/* they are all coming from cpu.c, probably */
+
+void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp) {
+    return;
+}
+
+void init_ppc_proc(PowerPCCPU *cpu) {
+    return;
+}
+
+void destroy_ppc_opcodes(PowerPCCPU *cpu) {
+    return;
+}
+
+void ppc_tlb_invalidate_all(CPUPPCState *env) {
+    return;
+}
+
+void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags) {
+    return;
+}
+
+void ppc_cpu_dump_statistics(CPUState *cpu, int flags) {
+    return;
+}
+
+#include "exec/hwaddr.h"
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr) {
+    return 0;
+}
-- 
2.17.1


