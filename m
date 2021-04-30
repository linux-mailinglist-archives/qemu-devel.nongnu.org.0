Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B036F3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:37:01 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI5U-0007TF-Hp
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlU-0003D4-S5
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl7-0007YH-3m
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:20 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v20so8460994plo.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUG5NdpCvCLBDV3mEQiJZX4nWaWXd3Zyx+1DQFsvHC4=;
 b=yyZnlhcMhPk3VVjRRKfPn9af21+phu5cQniiOQszJYHR75JdNyE4haP/nIHWP7e8/l
 RbI1y9OMheJRWWGTnTPftYJl58wYEYJ58byCUoW3LdC3+QHareSpl0v3YmhY+wObFvzt
 5pj7+qsmzdsxedtrtjr/FiFZZZtZ+T9ZKKqya1K/2LgauSPBxDiiTfgYWHjFAmK3Uas7
 DKqkgSe/GO5pQORP1U2xearsr/ZGAiSd2JrcE77716WtxW87ykkEqIEMrapVDJzEsQSl
 0SfOs30/mdR9CYNtcIE9v7n2P3h9qZ2G9fDWmegrj2WdURN6Wku+/1KhCkJXXElpTAI5
 6aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUG5NdpCvCLBDV3mEQiJZX4nWaWXd3Zyx+1DQFsvHC4=;
 b=S6Q8IQar47FZYlNM52mNDL7EpEYMTwX7VLmdWuJYSI8Qgq8PkV3QB4vs7hwgHSXLt8
 /g3qKxqV1cF1uEZrb09g6Vu1tg0nKxka7BJs4I/5CfUOirgLVq97DLTWWADu1ZzoVbID
 ZjqrnDkVwrmjVgw1XVJcJ0gg0WLu1xFHHA4SF3DRc+dAk8lrPzNWJxJ8cVjtPWM9e+Ly
 a4YZ4cd3T8Ud/kaawMsTfuKqs3o2x5aOuIHRRn7VqNNFMYBJ+DVLAKbUPMpRSl+KQ3eC
 auPfgHTj/y4N07znWpSqt/WBlM/FGczgwtcSM+nAbpCLmfhjYW7cCqo0MB2ajWA7kL71
 +FMw==
X-Gm-Message-State: AOAM533RuZMdIjwMZKrMloYal1Mix0weXleIO+AMg8XNssUHD2moSeFQ
 j31MgFFBHZ4pkCryQTbA5ZPs6HPS+oEBQg==
X-Google-Smtp-Source: ABdhPJwu3/dvb9g8IDgdwbnnoWqOI9DyN01nCtp9Asy2GX0ndptSPA8xUT6V0gpOS5ZE+HOmT6rYpQ==
X-Received: by 2002:a17:90a:9f4b:: with SMTP id
 q11mr12217886pjv.180.1619745354668; 
 Thu, 29 Apr 2021 18:15:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/30] target/ppc: Replace POWERPC_EXCP_STOP with
 DISAS_EXIT_UPDATE
Date: Thu, 29 Apr 2021 18:15:28 -0700
Message-Id: <20210430011543.1017113-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h                |  1 -
 linux-user/ppc/cpu_loop.c       |  3 ---
 target/ppc/translate.c          | 20 +++++---------------
 target/ppc/translate_init.c.inc |  4 ++--
 4 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cf10117065..9bb370abba 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -132,7 +132,6 @@ enum {
     /* EOL                                                                   */
     POWERPC_EXCP_NB       = 103,
     /* QEMU exceptions: used internally during code translation              */
-    POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
     POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index df71e15a25..4c308835bd 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Maintenance exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_STOP:     /* stop translation                      */
-            /* We did invalidate the instruction cache. Go on */
-            break;
         case POWERPC_EXCP_BRANCH:   /* branch instruction:                   */
             /* We just stopped because of a branch. Go on */
             break;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 45cd3189c0..82fdf0bb77 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -367,13 +367,6 @@ static inline void gen_hvpriv_exception(DisasContext *ctx, uint32_t error)
     gen_exception_err(ctx, POWERPC_EXCP_HV_EMU, POWERPC_EXCP_PRIV | error);
 }
 
-/* Stop translation */
-static inline void gen_stop_exception(DisasContext *ctx)
-{
-    gen_update_nip(ctx, ctx->base.pc_next);
-    ctx->exception = POWERPC_EXCP_STOP;
-}
-
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
 GEN_OPCODE(name, opc1, opc2, opc3, inval, type, PPC_NONE)
 
@@ -3157,7 +3150,7 @@ static void gen_isync(DisasContext *ctx)
         gen_check_tlb_flush(ctx, false);
     }
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))
@@ -4434,7 +4427,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -4477,7 +4470,7 @@ static void gen_mtmsr(DisasContext *ctx)
         tcg_temp_free(msr);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif
 }
 
@@ -6614,7 +6607,7 @@ static void gen_wrtee(DisasContext *ctx)
      * Stop translation to have a chance to raise an exception if we
      * just set msr_ee to 1
      */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6628,7 +6621,7 @@ static void gen_wrteei(DisasContext *ctx)
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
-        gen_stop_exception(ctx);
+        ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else {
         tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
     }
@@ -8083,9 +8076,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         case POWERPC_EXCP_BRANCH:
             ctx->base.is_jmp = DISAS_NORETURN;
             break;
-        case POWERPC_EXCP_STOP:
-            ctx->base.is_jmp = DISAS_EXIT;
-            break;
         default:
             /* Every other ctx->exception should have set NORETURN. */
             g_assert_not_reached();
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9af3fb2066..f3e79b8685 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -463,7 +463,7 @@ static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
     /* Must stop the translation as endianness may have changed */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 #endif
 
@@ -511,7 +511,7 @@ static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
-    gen_stop_exception(ctx);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
-- 
2.25.1


