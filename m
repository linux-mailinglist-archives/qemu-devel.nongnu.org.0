Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140139217C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:29:03 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm09G-0003qn-Bc
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02a-0007T7-67; Wed, 26 May 2021 16:22:08 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02Y-00019i-KZ; Wed, 26 May 2021 16:22:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 7316C8013CA;
 Wed, 26 May 2021 17:21:07 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Date: Wed, 26 May 2021 17:21:01 -0300
Message-Id: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 26 May 2021 20:21:07.0604 (UTC)
 FILETIME=[A9006540:01D7526C]
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
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function requires surce code modification to be useful, which means
it probably is not used often, and the move to using decodetree means
the statistics won't even be collected anymore.

Also removed setting dump_statistics in ppc_cpu_realize, since it was
only useful when in conjunction with ppc_cpu_dump_statistics.

Suggested-by: Richard Henderson<richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/cpu_init.c  |  3 ---
 target/ppc/translate.c | 51 ------------------------------------------
 3 files changed, 55 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 203f07e48e..c3d1b492e4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f5ae2f150d..bd05f53fa4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
-#ifdef CONFIG_TCG
-    cc->dump_statistics = ppc_cpu_dump_statistics;
-#endif
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 6c0f424d81..fc9fd790ca 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8881,57 +8881,6 @@ int ppc_fixup_cpu(PowerPCCPU *cpu)
     return 0;
 }
 
-
-void ppc_cpu_dump_statistics(CPUState *cs, int flags)
-{
-#if defined(DO_PPC_STATISTICS)
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    opc_handler_t **t1, **t2, **t3, *handler;
-    int op1, op2, op3;
-
-    t1 = cpu->env.opcodes;
-    for (op1 = 0; op1 < 64; op1++) {
-        handler = t1[op1];
-        if (is_indirect_opcode(handler)) {
-            t2 = ind_table(handler);
-            for (op2 = 0; op2 < 32; op2++) {
-                handler = t2[op2];
-                if (is_indirect_opcode(handler)) {
-                    t3 = ind_table(handler);
-                    for (op3 = 0; op3 < 32; op3++) {
-                        handler = t3[op3];
-                        if (handler->count == 0) {
-                            continue;
-                        }
-                        qemu_printf("%02x %02x %02x (%02x %04d) %16s: "
-                                    "%016" PRIx64 " %" PRId64 "\n",
-                                    op1, op2, op3, op1, (op3 << 5) | op2,
-                                    handler->oname,
-                                    handler->count, handler->count);
-                    }
-                } else {
-                    if (handler->count == 0) {
-                        continue;
-                    }
-                    qemu_printf("%02x %02x    (%02x %04d) %16s: "
-                                "%016" PRIx64 " %" PRId64 "\n",
-                                op1, op2, op1, op2, handler->oname,
-                                handler->count, handler->count);
-                }
-            }
-        } else {
-            if (handler->count == 0) {
-                continue;
-            }
-            qemu_printf("%02x       (%02x     ) %16s: %016" PRIx64
-                        " %" PRId64 "\n",
-                        op1, op1, handler->oname,
-                        handler->count, handler->count);
-        }
-    }
-#endif
-}
-
 static bool decode_legacy(PowerPCCPU *cpu, DisasContext *ctx, uint32_t insn)
 {
     opc_handler_t **table, *handler;
-- 
2.17.1


