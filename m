Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E414536F3BF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:36:53 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI5N-0007Cy-1M
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlV-0003E3-Iq
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl7-0007ZE-5B
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:21 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y1so20090389plg.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvFYTR21Ndabo3puJK2zdhaYlEZw9zSgHgo2egIRWs4=;
 b=a+bd3fVBebYnYMekKuIPsNqYpbCviq35aTyaqOhXO69rx3ZAvZ7ugZod2rC0b56AXj
 saqninyBAR7vAwZcGD30uvDMD+Gw5PWD6lgoDliMHdZuLvQUCN34ovCh9heKTjc1TBwS
 E+HTyxIPk/guHB4v/1CRcIYJqei8DPR6IDSI/gQgdmPtFuI2kQZFcc1z7IPchcwqec3/
 wYL/YDOhMKOyY4Z5QH5bHlZstUiNsi5V43SGv9h3AP2UkGkfJmxG7h3qRmK6RFA8N//N
 LQIb1TVNdyQ592hDcGC9GZsmEbiTPCl/82wiAxSqBeTVV+aZIZ4CeSQO+9wExNnVB5zW
 VkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvFYTR21Ndabo3puJK2zdhaYlEZw9zSgHgo2egIRWs4=;
 b=qosJiEbm1dQVhTfKCnVPtb5o+Rff9ZEo+5AeX91xry5XGjm7fW+CwcrfMY9Ci1ekYG
 iqb0c/u6v1yEQfRzkOfmSbEkHCo6UchckLl/thBkjZQxAgFgzbFFVunMaq+/fom+p4H7
 yTikJuntNf1DzzH7sp+Fz540Hwts8r/yX5owgowbuM8MtJhbSpndguPd3Zg0z/rgPlXs
 VSIw4vS5Wi6L/s3Mpvr+gcsFxV7E6/945DTSZdR/c35QmEw8TyG6g2DJ6TGakuowfTCP
 tMHjHFbkbFaqnKIk+Vl6bzc25YRszJpoFKLTH8ZtcVHrDj0qiGnMxRo6xfVdE2iOpIJA
 DWqQ==
X-Gm-Message-State: AOAM533U/KtBk8N45+6qmLCPhcdn0sKUgkfkSc5AqCWZHjcKLTjS8ZiM
 AaeBfJbua2vFTD+nE8i3gbHCfbJ/p38boA==
X-Google-Smtp-Source: ABdhPJzJBNgABF4ZIlkTKaZ8RAoVdpS1VV3ilNK/9XU4F4NSKUpB+uU71u2monpcuXJ2yLVA3AdB5A==
X-Received: by 2002:a17:90b:4b11:: with SMTP id
 lx17mr8922216pjb.130.1619745355895; 
 Thu, 29 Apr 2021 18:15:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/30] target/ppc: Remove DisasContext.exception
Date: Thu, 29 Apr 2021 18:15:30 -0700
Message-Id: <20210430011543.1017113-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Now that we have removed all of the fake exceptions, and all real
exceptions exit via DISAS_NORETURN, we can remove this field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 276a4a2a79..d78071a4a4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -259,15 +259,12 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * These are all synchronous exceptions, we set the PC back to the
      * faulting instruction
      */
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->cia);
-    }
+    gen_update_nip(ctx, ctx->cia);
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -279,13 +276,10 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * These are all synchronous exceptions, we set the PC back to the
      * faulting instruction
      */
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->cia);
-    }
+    gen_update_nip(ctx, ctx->cia);
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -298,7 +292,6 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
-    ctx->exception = excp;
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7919,7 +7912,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     CPUPPCState *env = cs->env_ptr;
     int bound;
 
-    ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
     ctx->pr = msr_pr;
     ctx->mem_idx = env->dmmu_idx;
@@ -8067,16 +8059,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
-
-    if (ctx->base.is_jmp == DISAS_NEXT) {
-        switch (ctx->exception) {
-        case POWERPC_EXCP_NONE:
-            break;
-        default:
-            /* Every other ctx->exception should have set NORETURN. */
-            g_assert_not_reached();
-        }
-    }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


