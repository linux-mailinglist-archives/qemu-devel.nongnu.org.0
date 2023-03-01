Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E826A65EF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeg-0008VE-Pc; Tue, 28 Feb 2023 21:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-0008Pp-5Q
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:17 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-00035H-Ch
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:14 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so11570633pja.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dzh2V8dOPToqWQJo6n4SFX9SUU5KWduCM2s3vvcT/Rc=;
 b=L6xf8t6vU56IoRFO14tocUGnpW7VnxnEfg4sVj/ro6ZtPElWmYsS7UzLZg0LJdVpOf
 Brcw4DWo5BgKEfvre3KQex83J6v5tM4AXUFFSCjXfXmdFjEmKXCUbSRQmV1MB9u+oEp+
 7lmzIrEHLD9j3fbqf5ma9BS3nPZh7DdfTXhKuI5W4tAvEiyeoTaDZizh7WhYR3Stra4h
 GnqrRwAGnAENTRi/Wl+dw3moTDxvd4NmsUYq2RaKP/Zr6N1TnCAscnccNFDX6X5IPlVN
 Oto2Y43uuPVP1vvhkK/9wMcapRvVbUzKVVVTb88iK8jodoUs+sdtW0TXAgbKA/JPWuIQ
 0dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dzh2V8dOPToqWQJo6n4SFX9SUU5KWduCM2s3vvcT/Rc=;
 b=BiatY08sj7vKa/RfcoMPYthy6MbaL5NCIOK0gU+NnMlICuBSHETKJT5XOeQ9HGB4gQ
 CbQHp+CTqIRjMgeIB2fIXmMCrUrgYXMfIx1tVPW9n6SmjTwa4PVsqZabMH19Zvbu+uU8
 NFxAlFSBp2mm+dTTdCFQ9bn53Q8fElMxP4S+Dr1GxcQFYmDhyyiSJ1HJT1Bj3NPWtcfV
 sUX616WPYenho6UfkAw4C05iV/XGdlTePR/OV37eti3jvqwej/SFqsVQISyMQgI9y9cE
 S3PM3GXJrGhwJrIavZ9fGJCsh5x/++vvCttcoA4hTjMuBtnQ3FfIrvU1euBS5m+7G9ll
 DqSA==
X-Gm-Message-State: AO0yUKVIoKbt7ZzmYqz/AIm2pDGcsSm8YsKkYe6HCKSkZpsYmrAp35YZ
 4f8d4XyxV/V5um10PrjXPyroqPosupAPBs2sSgA=
X-Google-Smtp-Source: AK7set9+Xsf/AETWeg3KMQdNGT/Tp5EorBJMIsoElTmbKUPuLH31bB6UTk5XrXAsJzCTBFrB6i+tYw==
X-Received: by 2002:a17:902:f685:b0:19d:1fce:c9ec with SMTP id
 l5-20020a170902f68500b0019d1fcec9ecmr6316782plg.37.1677639423664; 
 Tue, 28 Feb 2023 18:57:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/62] target/arm: Replace `TARGET_TB_PCREL` with `CF_PCREL`
Date: Tue, 28 Feb 2023 16:55:51 -1000
Message-Id: <20230301025643.1227244-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-7-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 2 +-
 target/arm/cpu.c               | 8 ++++----
 target/arm/tcg/translate-a64.c | 8 ++++----
 target/arm/tcg/translate.c     | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3717824b75..4001372acd 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -23,7 +23,7 @@ typedef struct DisasContext {
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
     /*
-     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
+     * For CF_PCREL, the full value of cpu_pc is not known
      * (although the page offset is known).  For convenience, the
      * translation loop uses the full virtual address that triggered
      * the translation, from base.pc_start through pc_curr.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b21d52cce7..850b018efb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -78,8 +78,8 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    /* The program counter is always up to date with TARGET_TB_PCREL. */
-    if (!TARGET_TB_PCREL) {
+    /* The program counter is always up to date with CF_PCREL. */
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUARMState *env = cs->env_ptr;
         /*
          * It's OK to look at env for the current mode here, because it's
@@ -100,7 +100,7 @@ void arm_restore_state_to_opc(CPUState *cs,
     CPUARMState *env = cs->env_ptr;
 
     if (is_a64(env)) {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
         } else {
             env->pc = data[0];
@@ -108,7 +108,7 @@ void arm_restore_state_to_opc(CPUState *cs,
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
         } else {
             env->regs[15] = data[0];
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 67e9c4ee79..7bbffdd1fe 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -143,7 +143,7 @@ static void reset_btype(DisasContext *s)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i64(dest, s->pc_curr + diff);
@@ -393,7 +393,7 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_a64_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -4297,7 +4297,7 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
     if (page) {
         /* ADRP (page based) */
         offset <<= 12;
-        /* The page offset is ok for TARGET_TB_PCREL. */
+        /* The page offset is ok for CF_PCREL. */
         offset -= s->pc_curr & 0xfff;
     }
 
@@ -14809,7 +14809,7 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     tcg_gen_insn_start(pc_arg, 0, 0);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c23a3462bf..0e7d3b8561 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -269,7 +269,7 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i32(var, s->pc_curr + diff);
@@ -2620,7 +2620,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_long diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -9542,7 +9542,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t condexec_bits;
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     if (dc->eci) {
-- 
2.34.1


