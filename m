Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AA36F3B4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:33:58 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI2X-0003gl-Lp
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlT-0003BL-46
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl7-0007YV-3a
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso912702pjn.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otPhcvbNJ17mxlPliTzuao80JoAxdfhn5Twl3YLl2dY=;
 b=d4p4Wqjgb26lk8uPtCQSMef/IKxLF+wPfemCHxHoNEqkLwwBRMoEslZHE1YJf1iDZI
 NJ2ypzKS4i6Xz/eDxIIusdfSJ11LXbRGkimaVTgtIbxHZl0E+cfPjKTb0xgdteWEHFDy
 w2UcBcuuUmQ/rb5xgH3VR8A5eFxA2gGJOUxuo0HezMk9detdJwRAO7qao+Ckd8NKT0ZS
 a+stD+jTzsV5WbF+e1CmjMAxR2x83rctMfnxnN62hsRVSP2jdaz540SroNuBTIi3c8SP
 Y5Tsx3TcQ791JKr/87vMYKAMfqotgX4vryJ3j8vHpOzh6/F6hLmVzy9Pt+hU2+9BYCBY
 Yx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otPhcvbNJ17mxlPliTzuao80JoAxdfhn5Twl3YLl2dY=;
 b=iiOqxwzLwfXzp365s/C7yOWWFCVbkBVnez9Q8KsKzaLO0DOVOQDlmkNTYQa0KNZTwg
 pKSpR3BBJ94U2m9qhTIEykfz0v+dmMF/nppRq4eiz5CS3O+DWo3lxmwguWRvk/Vxrpt2
 VkLH7ixLRka4Mx6zIuIBdrSftuy+AbsMYOfaAHQSNulTL/R75LVjQUBeR5Iygf2iO/Kl
 acsatP0w9t2/QKtS0VuC1WmKFTFQb7apRCjdOEA038kaF2jJEh71jo93L8TiZ4D9XOBC
 5GjUA6KonafN0bsYNHlYUcV+S8BKleh04HP1pxQCageyYLTuEpp/BK5rQY/N2i2HhcoF
 goUA==
X-Gm-Message-State: AOAM532uJZnnSIhCv/eTOuHKUgnEGBH/aTaUDHzK3TVOoZlxNrqYFF5J
 NANCUneWXVPyk5ZFNOkKgsYQiAQRV4R/JA==
X-Google-Smtp-Source: ABdhPJwlFn77pbcopN+CYsePq2uouNSyQqJ99k0Y7m/kxEU6pYdFJrke+OSJzLYNNzlKvnBxJSDD7w==
X-Received: by 2002:a17:902:4d:b029:ec:94df:c9aa with SMTP id
 71-20020a170902004db02900ec94dfc9aamr2779364pla.7.1619745355265; 
 Thu, 29 Apr 2021 18:15:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] target/ppc: Replace POWERPC_EXCP_BRANCH with
 DISAS_NORETURN
Date: Thu, 29 Apr 2021 18:15:29 -0700
Message-Id: <20210430011543.1017113-17-richard.henderson@linaro.org>
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

The translation of branch instructions always results in exit from
the TB.  Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h          | 2 --
 linux-user/ppc/cpu_loop.c | 3 ---
 target/ppc/translate.c    | 8 ++------
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9bb370abba..5b22eb64dc 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -131,8 +131,6 @@ enum {
     POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
     /* EOL                                                                   */
     POWERPC_EXCP_NB       = 103,
-    /* QEMU exceptions: used internally during code translation              */
-    POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 4c308835bd..adf5a8a4e6 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Maintenance exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_BRANCH:   /* branch instruction:                   */
-            /* We just stopped because of a branch. Go on */
-            break;
         case POWERPC_EXCP_SYSCALL_USER:
             /* system call in user-mode emulation */
             /* WARNING:
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 82fdf0bb77..276a4a2a79 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3769,7 +3769,6 @@ static void gen_b(DisasContext *ctx)
 {
     target_ulong li, target;
 
-    ctx->exception = POWERPC_EXCP_BRANCH;
     /* sign extend LI */
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
@@ -3783,6 +3782,7 @@ static void gen_b(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_goto_tb(ctx, 0, target);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 #define BCOND_IM  0
@@ -3795,7 +3795,6 @@ static void gen_bcond(DisasContext *ctx, int type)
     uint32_t bo = BO(ctx->opcode);
     TCGLabel *l1;
     TCGv target;
-    ctx->exception = POWERPC_EXCP_BRANCH;
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
         target = tcg_temp_local_new();
@@ -3902,6 +3901,7 @@ static void gen_bcond(DisasContext *ctx, int type)
         gen_set_label(l1);
         gen_goto_tb(ctx, 1, ctx->base.pc_next);
     }
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_bc(DisasContext *ctx)
@@ -8057,7 +8057,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
@@ -8073,9 +8072,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         switch (ctx->exception) {
         case POWERPC_EXCP_NONE:
             break;
-        case POWERPC_EXCP_BRANCH:
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
         default:
             /* Every other ctx->exception should have set NORETURN. */
             g_assert_not_reached();
-- 
2.25.1


