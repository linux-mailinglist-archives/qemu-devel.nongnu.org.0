Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E323437C034
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:32:48 +0200 (CEST)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpup-0000xA-Rg
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZC-0006Bn-9I; Wed, 12 May 2021 10:10:29 -0400
Received: from [201.28.113.2] (port=32758 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZA-0000Pm-IZ; Wed, 12 May 2021 10:10:26 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 5109680139F;
 Wed, 12 May 2021 11:08:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with ifdefs
Date: Wed, 12 May 2021 11:08:10 -0300
Message-Id: <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:39.0462 (UTC)
 FILETIME=[4EB00C60:01D74738]
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

Wrapped some function calls in cpu_init.c and gdbstub.c that were TCG only
with ifdef CONFIG_TCG, to make it easier to build without it.

This seemed to be the minimum amount of changes to make the project
compile, but we wanted some feedback about wether we excluded something
important or if we should reorder some code to minimize ifdef count

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 include/exec/helper-proto.h | 2 ++
 target/ppc/cpu_init.c       | 8 ++++++++
 target/ppc/excp_helper.c    | 6 +++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index ba100793a7..ce287222ee 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 #define IN_HELPER_PROTO
 
 #include "helper.h"
+#ifdef CONFIG_TCG
 #include "trace/generated-helpers.h"
+#endif
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0fa219880..9d72dc49cf 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1204,11 +1204,13 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i = 0; i < 8; i++) {
+#ifdef CONFIG_TCG
         void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
             &spr_write_generic32;
         if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
             uea_write = &spr_write_generic;
         }
+#endif
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
@@ -8606,7 +8608,9 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     create_ppc_opcodes(cpu, &local_err);
+#endif
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         goto unrealize;
@@ -8799,7 +8803,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 
     cpu_remove_sync(CPU(cpu));
 
+#ifdef CONFIG_TCG
     destroy_ppc_opcodes(cpu);
+#endif
 }
 
 static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
@@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
+#ifdef CONFIG_TCG
     cc->dump_statistics = ppc_cpu_dump_statistics;
+#endif
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f4f15279eb..824e16a32a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -21,7 +21,9 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
+#endif
 #include "internal.h"
 #include "helper_regs.h"
 
@@ -1492,7 +1494,7 @@ void helper_book3s_msgsnd(target_ulong rb)
     book3s_msgsnd_common(pir, PPC_INTERRUPT_HDOORBELL);
 }
 
-#if defined(TARGET_PPC64)
+#if defined(TARGET_PPC64) && defined(CONFIG_TCG)
 void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
 {
     helper_hfscr_facility_check(env, HFSCR_MSGP, "msgclrp", HFSCR_IC_MSGP);
@@ -1525,6 +1527,7 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
 #endif
 #endif
 
+#ifdef CONFIG_TCG
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
@@ -1540,3 +1543,4 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = insn & 0x03FF0000;
     cpu_loop_exit(cs);
 }
+#endif
-- 
2.17.1


