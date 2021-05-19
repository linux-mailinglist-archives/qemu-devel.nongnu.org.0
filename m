Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D020E388EA6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:10:45 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLyG-0001Gy-TM
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgl-0000nW-Nt; Wed, 19 May 2021 08:52:41 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgh-0001Eh-Pl; Wed, 19 May 2021 08:52:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnd2gh3z9t0G; Wed, 19 May 2021 22:52:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428725;
 bh=ybLxUFWCZnNn3UfoPCjH3zvWc/PUDjOMEzazDlxW048=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SHEisfKbhS56ZpDWGnYbsvUvqR7620d92WLyQdTICibMoUn15FFiJENUokPsdxL5F
 Nc5uxFTx7d1U0uG/ipFlpBUWhapgVHHqD1dEdwktLHzOxAd1gk4btlhtpxJhOaYjk0
 9cNWug4mZPUDwTSV9TlZGciYlBueJ6DY5SbGIDXg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/48] target/ppc: Split out decode_legacy
Date: Wed, 19 May 2021 22:51:17 +1000
Message-Id: <20210519125148.27720-18-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 115 +++++++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 51 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index abdef7e291..d6a8a04380 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -9062,6 +9062,62 @@ void ppc_cpu_dump_statistics(CPUState *cs, int flags)
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
@@ -9143,66 +9199,23 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.31.1


