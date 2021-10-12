Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034D42A971
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:30:43 +0200 (CEST)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKfo-0003Qd-Rg
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXY-00066j-Sp
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXW-00042f-Vk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q5so6290688pgr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iit+FHbqq4AHjQFze/NmYkeoKdz7m6lRYWz6z/sE/n0=;
 b=DhlupXDN2xSNilR5gcAhfRGgFBLESY35GkMElpK8S42isI4L01IZkCpN20HtgL+Flb
 F4e0dZUWv0GL/c9qCaTgID102rMv4WD1LruvW2jdlWxH8guXFzGamppNe4Xvf2dQuuym
 9NCVavmjDyHIviiisO/rGyamPbs/e+8GJKyUZSu/mLOh/CnTF4mw+qGoIm+bc9QARu8p
 pSe5YMXeGJKbw86bVOYvwPFKQltIZK7wBxcUazJD4TVD2H5W9h7BA2hBohPBqiCKOsbl
 sKHjYpzx/aVmYxMQsHBHd4Modb1t8AIGiNn89Bub57HaMpNcx+E7eVWD4faFJn4pzXyc
 ZQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iit+FHbqq4AHjQFze/NmYkeoKdz7m6lRYWz6z/sE/n0=;
 b=CpUU7bOOY4fR3Iy299SCg1o+e5JUq6hG5lLHeHBDGHXD67gUMHAib2viQXf+KyKFvV
 00+Jgx+S+oVR89r2V0G3+j98csBbyAJMHtOQowZ1w5H9Z1Driu1ey9s888fSjsDWgXvw
 nMn0aaoSmsmuh9DuNiIwOt7E1RQXLfHkSAihW5Qn9PpITrvJSVjlAowRZ+6Wug1G5quy
 8VCfwvSZBiCNvbNL0VJfQzH8QBSxH2s3UHfxw8TIRDOrsHXjpS0Tn3/D/NUgpefZGBxH
 psxFO0Sko0pTDa1Xy1VaWaSlG/od9JvLEbsAC+V2Pf82k4t4Hv2i43DieV2NJW5m9YqT
 OUOw==
X-Gm-Message-State: AOAM530kAOs0vKo3/EWqC7dyYmnfknz116D4W4xmdyYlEJPVEOAlee+G
 tN2EbaqEKcjnSOoDRLGqumDyJzsqdmp5RA==
X-Google-Smtp-Source: ABdhPJwQvmY06XTs6k4mqGzOfn8jN5boxUr9cSpoCiUNrCeWefLZNKzzNy79XsZ0Ne4ZN5M5bNbMiw==
X-Received: by 2002:a63:374c:: with SMTP id g12mr23555270pgn.35.1634055725549; 
 Tue, 12 Oct 2021 09:22:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] target/arm: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:42 -0700
Message-Id: <20211012162159.471406-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 target/arm/translate.c     | 36 ++++++------------------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 717afd481c..cec672f229 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -404,8 +404,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
         gen_a64_set_pc_im(dest);
         if (s->ss_active) {
             gen_step_complete_exception(s);
-        } else if (s->base.singlestep_enabled) {
-            gen_exception_internal(EXCP_DEBUG);
         } else {
             tcg_gen_lookup_and_goto_ptr();
             s->base.is_jmp = DISAS_NORETURN;
@@ -14879,7 +14877,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (unlikely(dc->base.singlestep_enabled || dc->ss_active)) {
+    if (unlikely(dc->ss_active)) {
         /* Note that this means single stepping WFI doesn't halt the CPU.
          * For conditional branch insns this is harmless unreachable code as
          * gen_goto_tb() has already handled emitting the debug exception
@@ -14891,11 +14889,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* fall through */
         case DISAS_EXIT:
         case DISAS_JUMP:
-            if (dc->base.singlestep_enabled) {
-                gen_exception_internal(EXCP_DEBUG);
-            } else {
-                gen_step_complete_exception(dc);
-            }
+            gen_step_complete_exception(dc);
             break;
         case DISAS_NORETURN:
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f7086c66a5..d6af5b1b03 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -341,7 +341,7 @@ static void gen_exception_internal(int excp)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_step_complete_exception(DisasContext *s)
+static void gen_singlestep_exception(DisasContext *s)
 {
     /* We just completed step of an insn. Move from Active-not-pending
      * to Active-pending, and then also take the swstep exception.
@@ -357,30 +357,6 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_singlestep_exception(DisasContext *s)
-{
-    /* Generate the right kind of exception for singlestep, which is
-     * either the architectural singlestep or EXCP_DEBUG for QEMU's
-     * gdb singlestepping.
-     */
-    if (s->ss_active) {
-        gen_step_complete_exception(s);
-    } else {
-        gen_exception_internal(EXCP_DEBUG);
-    }
-}
-
-static inline bool is_singlestepping(DisasContext *s)
-{
-    /* Return true if we are singlestepping either because of
-     * architectural singlestep or QEMU gdbstub singlestep. This does
-     * not include the command line '-singlestep' mode which is rather
-     * misnamed as it only means "one instruction per TB" and doesn't
-     * affect the code we generate.
-     */
-    return s->base.singlestep_enabled || s->ss_active;
-}
-
 void clear_eci_state(DisasContext *s)
 {
     /*
@@ -837,7 +813,7 @@ static inline void gen_bx_excret_final_code(DisasContext *s)
     /* Is the new PC value in the magic range indicating exception return? */
     tcg_gen_brcondi_i32(TCG_COND_GEU, cpu_R[15], min_magic, excret_label);
     /* No: end the TB as we would for a DISAS_JMP */
-    if (is_singlestepping(s)) {
+    if (s->ss_active) {
         gen_singlestep_exception(s);
     } else {
         tcg_gen_exit_tb(NULL, 0);
@@ -2606,7 +2582,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
 {
-    if (unlikely(is_singlestepping(s))) {
+    if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_set_pc_im(s, dest);
         s->base.is_jmp = DISAS_JUMP;
@@ -9459,7 +9435,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
 
     /* If architectural single step active, limit to 1.  */
-    if (is_singlestepping(dc)) {
+    if (dc->ss_active) {
         dc->base.max_insns = 1;
     }
 
@@ -9794,7 +9770,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * insn codepath itself.
          */
         gen_bx_excret_final_code(dc);
-    } else if (unlikely(is_singlestepping(dc))) {
+    } else if (unlikely(dc->ss_active)) {
         /* Unconditional and "condition passed" instruction codepath. */
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
@@ -9889,7 +9865,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         /* "Condition failed" instruction codepath for the branch/trap insn */
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
-        if (unlikely(is_singlestepping(dc))) {
+        if (unlikely(dc->ss_active)) {
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-- 
2.25.1


