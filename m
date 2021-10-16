Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878A430426
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:22:19 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboK2-00006s-5S
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-0008Lx-Qd
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDM-0001v3-D0
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so9740663pjb.0
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iit+FHbqq4AHjQFze/NmYkeoKdz7m6lRYWz6z/sE/n0=;
 b=wvVznH5faSgLLHktV8vpX7LtlkvAsf4+H3Oy08BmmPYk4APG9SvOWwRqwoRAhQY0Zy
 lKNVDY1i5Fws9Nz2dNPuft5aiWgbSggXMFPCRhtXZ6BOTE1PpyVgtpdJ4Nn2CYfutwD2
 yyBwwsxBjEAJNWZAt2tgqo6My05xz83vv5w3vgwk761iHUJdLiZKE5fDAN8COR5fFf3z
 IgnZCeWDFnSJ/eNAKqoUXqn8zCy3VGp671AyOLPWh5KxLn088FZyxTincOfdH3BIz7d/
 9DD9FU5E+RckBv3K9RM7ph5sHs2M5LFDA1EOVJt/uJ351Bi5rnzTFZE5fIXBaurR8sr/
 23Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iit+FHbqq4AHjQFze/NmYkeoKdz7m6lRYWz6z/sE/n0=;
 b=lE2LmUgAhTEB5tlDGrABc/c2d9RRIZy5o0WAl3kyLnRpYJeGhw33HhYCjnXys6Rmx5
 FDgD/ioRGX2bsdI2hp5NZ08v7FNtviuEAF2SZ0azDzlf80YEXHteBbGMwwGL+jZsOMrS
 nOgII+VS1+MQ/dRvjOd/rdgykH/uHIKnRCkl5YPn+1JqWafBfctbPuatRzp2kMBCHiuy
 c2IOhh4BRzXCjztz4KIax7HnqqWPaOcSdnOEgpwK2aBMONjkxqzEuw/leNjgXJ1s+m9n
 xE5GjBFo4QUCxOrcjNO+SCxmIthAn8zV9x1fecWsGjiuXl4LBVkRSo0aejLWvYPFf3fT
 joAQ==
X-Gm-Message-State: AOAM532uaJF7lMUSCayvbnYtzOjmJZQLcILrkvWMhhd9AWfGMDT+QZ1Q
 D6Q0HKxoC5IsuJoCcNz2qyVyvrjPz5wHsQ==
X-Google-Smtp-Source: ABdhPJxrBERw83X6tbiXJANjfzB1JepbZiZeqxmh4zms1uruXeQZ2w3WVslBELdOufRl6NzsoMK/lQ==
X-Received: by 2002:a17:903:234f:b0:13e:e6e1:c132 with SMTP id
 c15-20020a170903234f00b0013ee6e1c132mr17731103plh.57.1634408122458; 
 Sat, 16 Oct 2021 11:15:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] target/arm: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:56 -0700
Message-Id: <20211016181514.3165661-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


