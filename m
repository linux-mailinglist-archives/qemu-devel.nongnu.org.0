Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B9399CA4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:34:41 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loioK-00009a-SC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidO-00077I-2M; Thu, 03 Jun 2021 04:23:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57561 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidM-00006T-8s; Thu, 03 Jun 2021 04:23:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m25b1z9sjJ; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=uVlnYbQEP5t0QebIcwhNNcbgdYOZDHZqrhifawbw43U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LOaPaT5nWIxK87rX3WD5mDsG8wfGx8L8PK+Xs9Xn7EfQlt0HSXJM8b13WDlNNsRB/
 8D4Bz16gFJ/K3BpSceOVlNVWQnKP3+gASiDqTaAj/5ZJLoyg1QEpmF884MLxZdC6LT
 RA2NRSrLPB0HqHFAeNwpjnbWzb3hNlglVuK+Boas=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/42] target/ppc: remove ppc_cpu_dump_statistics
Date: Thu,  3 Jun 2021 18:22:05 +1000
Message-Id: <20210603082231.601214-17-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

This function requires surce code modification to be useful, which means
it probably is not used often, and the move to using decodetree means
the statistics won't even be collected anymore.

Also removed setting dump_statistics in ppc_cpu_realize, since it was
only useful when in conjunction with ppc_cpu_dump_statistics.

Suggested-by: Richard Henderson<richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/cpu_init.c  |  3 ---
 target/ppc/translate.c | 51 ------------------------------------------
 3 files changed, 55 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 27e4661dce..b0934d9be4 100644
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
index 067feeaec0..74a397ad6c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9307,9 +9307,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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
index ea200f9637..b494bd8b9c 100644
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
2.31.1


