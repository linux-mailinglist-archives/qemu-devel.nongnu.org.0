Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E136F375
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:23:29 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHsO-00017M-N4
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlL-00030o-SH
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl5-0007XD-8k
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:11 -0400
Received: by mail-pj1-x102a.google.com with SMTP id t13so9516082pji.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GtzxgNF32jBOW0rDu46zgnrIq+Tr4i7MyBybLCPP5F4=;
 b=pVeWUI2yN7WtPNi2VOm/Oo874xvs4K82CUJ8V7aJbKlWDd2TzXcMSiY8p3iqseb5YB
 F4358xlolmbHkmEsNPjwRyqXU/OC+Yr5vZHYdYV0YYy1MGJt3MedY5KEuSTyCAxfegG2
 MuYB7l55/yHnuWTxVEbzMfNgkclOHwilSLHb0+HfwgRo8LVo7W0L/jv56AhcaXPKpmcl
 6okhB0SDfoMLgIit33Hhia/eKojCFKPWpX1cetzazSyYslHU2e2XYguFy9jaEYsBo8fc
 XS1ed64kH1wE0MK1LmqEqO5iCPWD71gz4EyCD3LuT92TrdEbxv4ai2od/Kqss6NVW0x1
 zcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GtzxgNF32jBOW0rDu46zgnrIq+Tr4i7MyBybLCPP5F4=;
 b=fv0GsxRGgVbAiYuFyRRp6//fNCsZM1LUZwa0LqQmguwJZn89Q4Zudb4D4tWys+3WTb
 2LD8/DD6JRdeYPTYBwUSCxqdR6DxOBnE35ywYmdtZBxBcpt+1Tmba9BNeGn2VkcvWlgZ
 9bb8G2MRJ2GH5ygTtGQaVPVqLqjZv/uE4G2v18EwMHKVDN7CG5brricmF2XJLFl1qAVj
 8yI5R4QnYqfmOPhSU5rFaHNKIk028YNkVHDxsgc3IrzSRZiT/sE3SyQAFWrgxmLowtHR
 SATh2/bVlf6Ce1TpP7LxajgM5PApiHqhdPpx5qqAXUPH1by04N896R0TuZab5qIpJEba
 0iqw==
X-Gm-Message-State: AOAM533NDGesXBKrIuY8ABgSOdHLZbFcSPOoLMnZPHmy1Naal9SVWJL3
 ybkzpXxeOJQnwrBLCH/ghdN7ButqmeRt9w==
X-Google-Smtp-Source: ABdhPJzAzwwCRHG807FUZPE4bfoc7aIbPj3EpodkwUPL0q1Q7fnP/kX2QP41XS3PYDW2SqoiKNnWUA==
X-Received: by 2002:a17:90b:b05:: with SMTP id
 bf5mr2848277pjb.123.1619745351990; 
 Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/30] target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
Date: Thu, 29 Apr 2021 18:15:24 -0700
Message-Id: <20210430011543.1017113-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rewrite ppc_tr_tb_stop to handle these new codes.

Convert ctx->exception into these new codes at the end of
ppc_tr_translate_insn, prior to pushing the change back
throughout translate.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 75 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b58e2ac8dc..7dbdf3d047 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -183,6 +183,11 @@ struct DisasContext {
     uint64_t insns_flags2;
 };
 
+#define DISAS_EXIT         DISAS_TARGET_0  /* exit to main loop, pc updated */
+#define DISAS_EXIT_UPDATE  DISAS_TARGET_1  /* exit to main loop, pc stale */
+#define DISAS_CHAIN        DISAS_TARGET_2  /* lookup next tb, pc updated */
+#define DISAS_CHAIN_UPDATE DISAS_TARGET_3  /* lookup next tb, pc stale */
+
 /* Return true iff byteswap is needed in a scalar memop */
 static inline bool need_byteswap(const DisasContext *ctx)
 {
@@ -8080,28 +8085,78 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
 
-    if (ctx->base.is_jmp == DISAS_NEXT
-        && ctx->exception != POWERPC_EXCP_NONE) {
-        ctx->base.is_jmp = DISAS_TOO_MANY;
+    if (ctx->base.is_jmp == DISAS_NEXT) {
+        switch (ctx->exception) {
+        case POWERPC_EXCP_NONE:
+            break;
+        case POWERPC_EXCP_BRANCH:
+            ctx->base.is_jmp = DISAS_NORETURN;
+            break;
+        case POWERPC_EXCP_SYNC:
+        case POWERPC_EXCP_STOP:
+            ctx->base.is_jmp = DISAS_EXIT;
+            break;
+        default:
+            /* Every other ctx->exception should have set NORETURN. */
+            g_assert_not_reached();
+        }
     }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    DisasJumpType is_jmp = ctx->base.is_jmp;
+    target_ulong nip = ctx->base.pc_next;
 
-    if (ctx->base.is_jmp == DISAS_NORETURN) {
+    if (is_jmp == DISAS_NORETURN) {
+        /* We have already exited the TB. */
         return;
     }
 
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next);
-    } else if (ctx->exception != POWERPC_EXCP_BRANCH) {
-        if (unlikely(ctx->base.singlestep_enabled)) {
-            gen_debug_exception(ctx);
+    /* Honor single stepping. */
+    if (unlikely(ctx->base.singlestep_enabled)) {
+        switch (is_jmp) {
+        case DISAS_TOO_MANY:
+        case DISAS_EXIT_UPDATE:
+        case DISAS_CHAIN_UPDATE:
+            gen_update_nip(ctx, nip);
+            break;
+        case DISAS_EXIT:
+        case DISAS_CHAIN:
+            break;
+        default:
+            g_assert_not_reached();
         }
-        /* Generate the return instruction */
+        gen_debug_exception(ctx);
+        return;
+    }
+
+    switch (is_jmp) {
+    case DISAS_TOO_MANY:
+        if (use_goto_tb(ctx, nip)) {
+            tcg_gen_goto_tb(0);
+            gen_update_nip(ctx, nip);
+            tcg_gen_exit_tb(ctx->base.tb, 0);
+            break;
+        }
+        /* fall through */
+    case DISAS_CHAIN_UPDATE:
+        gen_update_nip(ctx, nip);
+        /* fall through */
+    case DISAS_CHAIN:
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+
+    case DISAS_EXIT_UPDATE:
+        gen_update_nip(ctx, nip);
+        /* fall through */
+    case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


