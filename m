Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850E36F39E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:27:38 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHwO-0004ds-Tv
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlH-0002xA-ST
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl2-0007VG-34
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id m37so5794927pgb.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9COUAsCjy8i0aYnHRPYrPkNqOSvGCjbx4DBRwicJwc=;
 b=PfJrQfLzK02CmQhFnAn5N+CNTMWyAsVGBhwCAGPb9bbt7IO8IIVJtI/73LUxPndNif
 OqIiORG1XB9LATtBO4wx0f9YIQyRUHwYDNlOs00vKfyjKZX2q9/sdIYgaiZ1OnQ071Ww
 v6dHcr8Z0enPXP8chPlvVwVRUSWauS+QkibwUcIzuIS3rxAZIw+kgkZOp1+OiFqMp2/2
 a7df2jTpi0ZIFetyUptO+VyMhkcdCMLkLJdhnarVWJZDCahlVF3q4iZSLxdnR0CVac6+
 6WPp1k+Yir1z19Tt+zUrwraLQQEEW3rMQrJvvfJG5mJZMkCDGLCpCm8d4/f0eH27rWB4
 KgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9COUAsCjy8i0aYnHRPYrPkNqOSvGCjbx4DBRwicJwc=;
 b=SrH5h90SGE7SmwUvD/sLKbFvwxxTQMzsnVyOu4FckHgJOCJtgv1eQW+kUQD/L4CFAq
 a2VMOk9ZseQPY2SNToZRX57gwN/KStauDcUBo641qxu52fa95EaUiaep08mfeff0pNxP
 gyUuD/4pxwXCii8Mcrn+aXJeC/jmucOghAbWZVBm1R2kBqKhA5mmBYGE3mGoTJr3xhXu
 Sm+ukVANwOVPuIsWT8qNdA2e2p+P4azEFsU5NfAyTyAXG6haIN0wSI9hSrGtNEMltAkw
 MFCMLoqOub7SHHlbZPYy4b5f9PKHSdSmDf6daCCxmrjgp/ckIpGJCX2HHH8tGEOXKied
 Q+qw==
X-Gm-Message-State: AOAM533JXrlNl1mGI6hJ9+gXiZM1AwHF76QunOIs687vKjBV2U6Ym0fc
 mQ+QTwm7EL+Xouq7W/mtUS2TjQl5G0NnbA==
X-Google-Smtp-Source: ABdhPJzMq71zv1vCBbdszLh4OrZnCSFkrHKMeNH8etw5knvSeJA3slZ0McwyUmNZmWBqQbqRtfuqJQ==
X-Received: by 2002:a63:ba5b:: with SMTP id l27mr2343913pgu.343.1619745348713; 
 Thu, 29 Apr 2021 18:15:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/30] target/ppc: Split out decode_legacy
Date: Thu, 29 Apr 2021 18:15:19 -0700
Message-Id: <20210430011543.1017113-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


