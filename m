Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF342A97E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:34:42 +0200 (CEST)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKjh-0002OB-FS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXj-0006hE-GL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXg-00049z-CK
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id t11so13829970plq.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OsVHscHYtLfwDDw+tqvsDJaaSG6z+QDdlNvtyfnUTaI=;
 b=hIinLvsOQNH/8xHp6OJmOeLtdm0mLeBg16ib5xOoyajRzbBqCXQSlM0CDloIZxXern
 T3XTttM8MPn4dZWa4nMTOmO8fF8AOFh8ajSwyJ9QaBRwlw14Vk+Zls60TUN3EmObk87C
 nI0rd/x1jnP7jhYudRIKvq3RTIo34r8IeW6J+poCube2MaziUTsFpTFx6hhs4p9N+Zi+
 yGrkSBBBF3HEPW6ujYogzA+jV4s5qG29lZkPevfrJk+/KXPfUuuH8wTg4DLbPaItCWQ3
 NW5MfcJ8gZajWlEPWtQTcxQHs1i1RJYOHiJ7WFrq9AzJRKV9wwnDK04RsD3yR7BYKYTM
 m0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsVHscHYtLfwDDw+tqvsDJaaSG6z+QDdlNvtyfnUTaI=;
 b=lCZE3YMCldFTDf+gb68JmIRD7lrP9MYq7EXqNHelJvYMm4IEBcON70NWsyUcRFuJSi
 gttDihV5xvSMhcCWCuNWN5sSkyrji3vz2Fjeu+x19lo9KIhz1eWglis1M9MALx2sidrR
 tHNViUB6gvik7ZpxhQuGhBGk0nf4oMvD+wJEf6gN7hYpd99RDjeTmXdim77TEICU+6eF
 Oq+n0F75acoKPf7KFp/hoYsZ1i872HaAdO3M4VsBOWm4ThqtgcXE2bCLXBJTtgU51iiO
 TD51yFXPhHCifn0P6vELmt9EA7vrC9XuCHiNYF1qTQjSmn/4nN6IzS6MxvAODWGf+aSO
 WOZQ==
X-Gm-Message-State: AOAM531A01UWOd2iis5gibWKB4LP0M9w8HcfUOdTtLR6g6TA0LzXnjQz
 ONJD41tzpKeUgNO6Z9LfPfeROBQutPdEhA==
X-Google-Smtp-Source: ABdhPJydasuXV9kNPy+BFmn/gWR8HJKnX2/jEDdkjuaZVbQLQ1HHEiovxbFxbnOs7H8WHDv1mW18ZA==
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr7213794pjb.63.1634055734994; 
 Tue, 12 Oct 2021 09:22:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/23] target/riscv: Remove exit_tb and lookup_and_goto_ptr
Date: Tue, 12 Oct 2021 09:21:54 -0700
Message-Id: <20211012162159.471406-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically, which means
we don't need to do anything in the wrappers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                      | 27 +------------------
 .../riscv/insn_trans/trans_privileged.c.inc   |  4 +--
 target/riscv/insn_trans/trans_rvi.c.inc       |  8 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
 4 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d2442f0cf5..6d7fbca1fa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -149,31 +149,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_debug(void)
-{
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
-}
-
-/* Wrapper around tcg_gen_exit_tb that handles single stepping */
-static void exit_tb(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
-}
-
-/* Wrapper around tcg_gen_lookup_and_goto_ptr that handles single stepping */
-static void lookup_and_goto_ptr(DisasContext *ctx)
-{
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_debug();
-    } else {
-        tcg_gen_lookup_and_goto_ptr();
-    }
-}
-
 static void gen_exception_illegal(DisasContext *ctx)
 {
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
@@ -192,7 +167,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        lookup_and_goto_ptr(ctx);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index a7afcb15ce..75c6ef80a6 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-        exit_tb(ctx); /* no chaining */
+        tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         return false;
@@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-    exit_tb(ctx); /* no chaining */
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 920ae0edb3..a6a57c94bb 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -71,9 +71,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
-
-    /* No chaining with JALR. */
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
 
     if (misaligned) {
         gen_set_label(misaligned);
@@ -421,7 +419,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * however we need to end the translation block
      */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    exit_tb(ctx);
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -430,7 +428,7 @@ static bool do_csr_post(DisasContext *ctx)
 {
     /* We may have changed important cpu state -- exit to main loop. */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    exit_tb(ctx);
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..081a5ca34d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -41,7 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     gen_set_gpr(ctx, a->rd, dst);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    lookup_and_goto_ptr(ctx);
+    tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
-- 
2.25.1


