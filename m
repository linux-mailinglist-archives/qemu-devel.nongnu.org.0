Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D836F3B2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:31:57 +0200 (CEST)
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI0a-0001f3-KA
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlU-0003C8-H2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:20 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl9-0007ZQ-3k
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id c17so12744271pfn.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FG8lZNLGBFMSNwAJ87zP7K0VIxx2bT3pD9iURDdrTvs=;
 b=aA6d4RcCrK1Mw/SsO8LfVyMJcYm/BwMsyZ6QjnaGfNyQlFtb5hZOc5+T3KsgOEGCxF
 OPmyJeZTQezvngq6zYozd2ZUoUa6dummK22iJs3uqqJSzyPWfs0SK7NP/xmNBl014XwX
 5JM6h8/5GR967M3BGphi1M8rfrpR3m5012q3bhTzM7QqZwZyZIEui8SDTsIeW2Sqyy74
 VOByVSdBzqrL6x5d4y4//uS6Qejnk6YH3bvxO67110EKCu5crLSSNZNFb9JUmW0Pp3qn
 ddwKomMdVM/l/LE0r5NSdcVVgsYpYFVZ6WtLv/lHOHKmNAutRJZ9tTjYYlbnQFB4hjGj
 fe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FG8lZNLGBFMSNwAJ87zP7K0VIxx2bT3pD9iURDdrTvs=;
 b=QCgaDGDnuYwMTUZFSoNy0qqielhL58qiHNLrGyiXRxufYUrGM9hEsl/guRjpkEi/5x
 KdhwGb3e6WFn3jWT/UOmf7O8Iu4w6JbFZVGS/q3EkzunTaJ88Vd2RXmaKjUt8pdERLuU
 eJ/NKSkbq8tTr4Tu5g3PwPD9AshAQsJUoEv6t5EfNOGKJJudd7mP4G2nkiMqgvJLagGK
 4imfUX9TMfd2R9c0fyfh6eq2hNPKX3mxJ9vIY9eLK59akia4lC11Xya12tqG4dY7DdeU
 BmTuR9sZDBldLfl/Zpx/ZzDvm2dB6hyJBjYWXbeUUzNk1YcaqG/Fpq6chDr1jg2qtWk0
 t4ug==
X-Gm-Message-State: AOAM532ihi9r23dZPpoGIhQoqUkcRv5JaFiy6aEOaopGC2AD4oh9MYNh
 G7Ky2f05mT//pluPV3AdYqmye+P7YKMMUQ==
X-Google-Smtp-Source: ABdhPJy/RJVjOl8ya97o7v2bEYzn9l5SC77pW4JXSSD5v5nkp1fRRPNilfIJj4EtTYLxNX69SWn16g==
X-Received: by 2002:a62:6202:0:b029:208:f11c:2143 with SMTP id
 w2-20020a6262020000b0290208f11c2143mr2788727pfb.32.1619745356543; 
 Thu, 29 Apr 2021 18:15:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/30] target/ppc: Move single-step check to ppc_tr_tb_stop
Date: Thu, 29 Apr 2021 18:15:31 -0700
Message-Id: <20210430011543.1017113-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

When single-stepping, force max_insns to 1 in init_disas
so that we exit the translation loop immediately.

Combine the single-step checks in tb_stop, and give the
gdb exception priority over the cpu exception, just as
we already do in gen_lookup_and_goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d78071a4a4..c018960ce9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7910,7 +7910,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
-    int bound;
 
     ctx->spr_cb = env->spr_cb;
     ctx->pr = msr_pr;
@@ -7986,13 +7985,13 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-#if defined(DO_SINGLE_STEP) && 0
-    /* Single step trace mode */
-    msr_se = 1;
-#endif
 
-    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+    if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
+        ctx->base.max_insns = 1;
+    } else {
+        int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
+        ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+    }
 }
 
 static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -8046,14 +8045,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
-    /* Check trace mode exceptions */
-    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
-                 (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->base.is_jmp != DISAS_NORETURN)) {
-        uint32_t excp = gen_prep_dbgex(ctx);
-        gen_exception_nip(ctx, excp, ctx->base.pc_next);
-    }
-
     if (tcg_check_temp_count()) {
         qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
                  "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
@@ -8066,6 +8057,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = ctx->base.is_jmp;
     target_ulong nip = ctx->base.pc_next;
+    int sse;
 
     if (is_jmp == DISAS_NORETURN) {
         /* We have already exited the TB. */
@@ -8073,7 +8065,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Honor single stepping. */
-    if (unlikely(ctx->base.singlestep_enabled)) {
+    sse = ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP);
+    if (unlikely(sse)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
         case DISAS_EXIT_UPDATE:
@@ -8086,8 +8079,16 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         default:
             g_assert_not_reached();
         }
-        gen_debug_exception(ctx);
-        return;
+
+        if (sse & GDBSTUB_SINGLE_STEP) {
+            gen_debug_exception(ctx);
+            return;
+        }
+        /* else CPU_SINGLE_STEP... */
+        if (nip <= 0x100 || nip > 0xf00) {
+            gen_exception(ctx, gen_prep_dbgex(ctx));
+            return;
+        }
     }
 
     switch (is_jmp) {
-- 
2.25.1


