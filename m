Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1E36CA56
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRW8-00089F-IQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLh-0001Qa-6R; Tue, 27 Apr 2021 13:18:13 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLe-00023I-D1; Tue, 27 Apr 2021 13:18:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6B7A68013BA;
 Tue, 27 Apr 2021 14:16:52 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 03/15] target/ppc: Split out decode_legacy
Date: Tue, 27 Apr 2021 14:16:37 -0300
Message-Id: <20210427171649.364699-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:52.0667 (UTC)
 FILETIME=[1DC420B0:01D73B89]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 115 +++++++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 51 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ee25badba2..ebe5afe7ae 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7876,6 +7876,62 @@ void ppc_cpu_dump_statistics(CPUState *cs, int flags)
 #endif
 }
 
+static bool decode_legacy(PowerPCCPU *cpu, DisasContext *ctx, uint32_t insn)
+{
+    opc_handler_t **table, *handler;
+    uint32_t inval;
+
+    ctx->opcode = insn;
+
+    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
+              insn, opc1(insn), opc2(insn), opc3(insn), opc4(insn),
+              ctx->le_mode ? "little" : "big");
+
+    table = cpu->opcodes;
+    handler = table[opc1(insn)];
+    if (is_indirect_opcode(handler)) {
+        table = ind_table(handler);
+        handler = table[opc2(insn)];
+        if (is_indirect_opcode(handler)) {
+            table = ind_table(handler);
+            handler = table[opc3(insn)];
+            if (is_indirect_opcode(handler)) {
+                table = ind_table(handler);
+                handler = table[opc4(insn)];
+            }
+        }
+    }
+
+    /* Is opcode *REALLY* valid ? */
+    if (unlikely(handler->handler == &gen_invalid)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported opcode: "
+                      "%02x - %02x - %02x - %02x (%08x) "
+                      TARGET_FMT_lx "\n",
+                      opc1(insn), opc2(insn), opc3(insn), opc4(insn),
+                      insn, ctx->cia);
+        return false;
+    }
+
+    if (unlikely(handler->type & (PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE)
+                 && Rc(insn))) {
+        inval = handler->inval2;
+    } else {
+        inval = handler->inval1;
+    }
+
+    if (unlikely((insn & inval) != 0)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid bits: %08x for opcode: "
+                      "%02x - %02x - %02x - %02x (%08x) "
+                      TARGET_FMT_lx "\n", insn & inval,
+                      opc1(insn), opc2(insn), opc3(insn), opc4(insn),
+                      insn, ctx->cia);
+        return false;
+    }
+
+    handler->handler(ctx);
+    return true;
+}
+
 static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -7997,66 +8053,23 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = cs->env_ptr;
-    opc_handler_t **table, *handler;
+    uint32_t insn;
+    bool ok;
 
     LOG_DISAS("----------------\n");
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
     ctx->cia = ctx->base.pc_next;
-    ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
-                                      need_byteswap(ctx));
-
-    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
-              ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
-              opc3(ctx->opcode), opc4(ctx->opcode),
-              ctx->le_mode ? "little" : "big");
+    insn = translator_ldl_swap(env, ctx->base.pc_next, need_byteswap(ctx));
     ctx->base.pc_next += 4;
-    table = cpu->opcodes;
-    handler = table[opc1(ctx->opcode)];
-    if (is_indirect_opcode(handler)) {
-        table = ind_table(handler);
-        handler = table[opc2(ctx->opcode)];
-        if (is_indirect_opcode(handler)) {
-            table = ind_table(handler);
-            handler = table[opc3(ctx->opcode)];
-            if (is_indirect_opcode(handler)) {
-                table = ind_table(handler);
-                handler = table[opc4(ctx->opcode)];
-            }
-        }
-    }
-    /* Is opcode *REALLY* valid ? */
-    if (unlikely(handler->handler == &gen_invalid)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported opcode: "
-                      "%02x - %02x - %02x - %02x (%08x) "
-                      TARGET_FMT_lx " %d\n",
-                      opc1(ctx->opcode), opc2(ctx->opcode),
-                      opc3(ctx->opcode), opc4(ctx->opcode),
-                      ctx->opcode, ctx->cia, (int)msr_ir);
-    } else {
-        uint32_t inval;
 
-        if (unlikely(handler->type & (PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE)
-                     && Rc(ctx->opcode))) {
-            inval = handler->inval2;
-        } else {
-            inval = handler->inval1;
-        }
-
-        if (unlikely((ctx->opcode & inval) != 0)) {
-            qemu_log_mask(LOG_GUEST_ERROR, "invalid bits: %08x for opcode: "
-                          "%02x - %02x - %02x - %02x (%08x) "
-                          TARGET_FMT_lx "\n", ctx->opcode & inval,
-                          opc1(ctx->opcode), opc2(ctx->opcode),
-                          opc3(ctx->opcode), opc4(ctx->opcode),
-                          ctx->opcode, ctx->cia);
-            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-            ctx->base.is_jmp = DISAS_NORETURN;
-            return;
-        }
+    ok = decode_legacy(cpu, ctx, insn);
+    if (!ok) {
+        gen_invalid(ctx);
+        ctx->base.is_jmp = DISAS_NORETURN;
     }
-    (*(handler->handler))(ctx);
+
 #if defined(DO_PPC_STATISTICS)
     handler->count++;
 #endif
-- 
2.25.1


