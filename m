Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D1388C0A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:50:25 +0200 (CEST)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJmR-000171-Hs
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljJic-00071u-F4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:46:26 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:34632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljJiP-0000sW-Uz
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:46:21 -0400
Received: by mail-lf1-x136.google.com with SMTP id z13so18386353lft.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDgy/S+H/P1gseX+XF/2cJPQLqUgYCJJy4A99ecqrFw=;
 b=u2TOl62uY3/nMyoiyNIg25dkqV0ReKh4A/4xDJphcAPM6EdrJCjAeFJA+i3ME9ZCOn
 ynNQ88A2GxWQrVLVair/kWNYZGoGG/74XtFi2+Xl2u54UFSnrSxralb5O9LT+WqBHU/a
 iR4+N8RXacP6k7iPchoxM/WV2zk/wcUyiUFiV5I4OJUzjNkLVXFso8TGHLJl+7yi1NlF
 bC0pAZJroOr6llETeygaR4Hf3Z00pURBpJp7FCKGiU/4u6YEK1FXt8UCSYW10wNWMgAU
 FN1FVZA71ETjLIPj8buoNYvxCJqfZmRHGFOjSUzdOUYs5J1l0sUWU+c1rZIftaHw8Cps
 gF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDgy/S+H/P1gseX+XF/2cJPQLqUgYCJJy4A99ecqrFw=;
 b=B78QfwcITa6g/2juxE9oKcMpLjsjI21Q/yGD1CDelocVojAfZEVDYQCN//Ih429pdG
 IuMuqaaF9ho8M1Q5G/iPnx0S8x/wOMafFrB2zPnob0ntZWz+coJwL1GXE0/qPD3P2nZU
 h6MOKGt6wSGRASrJWwoZTvnmbqN4WzVjASseisKBvVQSanl3TdjjWx4BnlbLnaXHrb7R
 FmxG+QSLYaYnyOgZMcCJu408m3h9FK5dUWTr2vwZy+1J4vCnut/nE/V7OppK9Jz0hWOc
 WW5RdFxqSRQt1fKvO6jbVzmnRQSYyOL/FUTsetOxjzD2uk1aKa2uYUKo+OrWJu5vjA0u
 0Ovw==
X-Gm-Message-State: AOAM531XZzFYziTF7hdHwXRIX3nJbHn6RmiM3G9mX7t59zc5kWuST3zC
 3QnKVjLLoyJOx7PIV1wKNZPhPH1Fx0EU0A==
X-Google-Smtp-Source: ABdhPJw36CXHXLLIVeUz1AL16fWHYqzx83SOwpQT/nQLzpN6BXN5FzfhEWSmIq0pBKtHwfHxh6dxEQ==
X-Received: by 2002:a05:6512:3b10:: with SMTP id
 f16mr6893083lfv.393.1621421169444; 
 Wed, 19 May 2021 03:46:09 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id s2sm3674721ljo.14.2021.05.19.03.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:46:08 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] target/xtensa: clean up unaligned access
Date: Wed, 19 May 2021 03:45:57 -0700
Message-Id: <20210519104557.16940-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xtensa cores may or may not have hardware support for unaligned memory
access. Remove TARGET_ALIGNED_ONLY=y from all xtensa configurations and
pass MO_ALIGN in memory access flags for all operations that would raise
an exception.
Simplify use of gen_load_store_alignment by passing access size and
alignment requirements in single parameter.
Drop condition from xtensa_cpu_do_unaligned_access and replace it with
assertion.
Add a test.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v3->v4:
- do additional cleanup in gen_load_store_alignment parameters as
  suggested by Richard.

Changes v2->v3:
- drop assertion for !XTENSA_OPTION_HW_ALIGNMENT from
  xtensa_cpu_do_unaligned_access to correctly handle acquire/release
  intsructions;
- add tests for acquire/release instructions.

Changes v1->v2:
- correctly handle case of !XCHAL_UNALIGNED_*_EXCEPTION in the test

 default-configs/targets/xtensa-linux-user.mak |   1 -
 default-configs/targets/xtensa-softmmu.mak    |   1 -
 .../targets/xtensaeb-linux-user.mak           |   1 -
 default-configs/targets/xtensaeb-softmmu.mak  |   1 -
 target/xtensa/helper.c                        |  13 +-
 target/xtensa/translate.c                     | 120 +++++-----
 tests/tcg/xtensa/test_load_store.S            | 221 ++++++++++++++++++
 7 files changed, 288 insertions(+), 70 deletions(-)
 create mode 100644 tests/tcg/xtensa/test_load_store.S

diff --git a/default-configs/targets/xtensa-linux-user.mak b/default-configs/targets/xtensa-linux-user.mak
index fc95cc60f585..420b30a68d94 100644
--- a/default-configs/targets/xtensa-linux-user.mak
+++ b/default-configs/targets/xtensa-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=xtensa
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_HAS_BFLT=y
diff --git a/default-configs/targets/xtensa-softmmu.mak b/default-configs/targets/xtensa-softmmu.mak
index 26c0285655cd..f075557bfa9d 100644
--- a/default-configs/targets/xtensa-softmmu.mak
+++ b/default-configs/targets/xtensa-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=xtensa
-TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/default-configs/targets/xtensaeb-linux-user.mak b/default-configs/targets/xtensaeb-linux-user.mak
index cfc3518118c9..1ea0f1ba9156 100644
--- a/default-configs/targets/xtensaeb-linux-user.mak
+++ b/default-configs/targets/xtensaeb-linux-user.mak
@@ -1,6 +1,5 @@
 TARGET_ARCH=xtensa
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_WORDS_BIGENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/default-configs/targets/xtensaeb-softmmu.mak b/default-configs/targets/xtensaeb-softmmu.mak
index 14cb9289a620..405cf5acbb4a 100644
--- a/default-configs/targets/xtensaeb-softmmu.mak
+++ b/default-configs/targets/xtensaeb-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=xtensa
-TARGET_ALIGNED_ONLY=y
 TARGET_WORDS_BIGENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index eeffee297d15..f18ab383fd89 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -270,13 +270,12 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
 
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
-        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
-        cpu_restore_state(CPU(cpu), retaddr, true);
-        HELPER(exception_cause_vaddr)(env,
-                                      env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
-                                      addr);
-    }
+    assert(xtensa_option_enabled(env->config,
+                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
 }
 
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f93df87ec490..14028d307d8f 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -339,16 +339,6 @@ static void gen_exception_cause(DisasContext *dc, uint32_t cause)
     }
 }
 
-static void gen_exception_cause_vaddr(DisasContext *dc, uint32_t cause,
-        TCGv_i32 vaddr)
-{
-    TCGv_i32 tpc = tcg_const_i32(dc->pc);
-    TCGv_i32 tcause = tcg_const_i32(cause);
-    gen_helper_exception_cause_vaddr(cpu_env, tpc, tcause, vaddr);
-    tcg_temp_free(tpc);
-    tcg_temp_free(tcause);
-}
-
 static void gen_debug_exception(DisasContext *dc, uint32_t cause)
 {
     TCGv_i32 tpc = tcg_const_i32(dc->pc);
@@ -554,21 +544,20 @@ static uint32_t test_exceptions_hpi(DisasContext *dc, const OpcodeArg arg[],
     return test_exceptions_sr(dc, arg, par);
 }
 
-static void gen_load_store_alignment(DisasContext *dc, int shift,
-        TCGv_i32 addr, bool no_hw_alignment)
+static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
+                                      TCGv_i32 addr)
 {
+    if ((mop & MO_SIZE) == MO_8) {
+        return mop;
+    }
+    if ((mop & MO_AMASK) == MO_UNALN &&
+        !option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT)) {
+        mop |= MO_ALIGN;
+    }
     if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
-        tcg_gen_andi_i32(addr, addr, ~0 << shift);
-    } else if (option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT) &&
-            no_hw_alignment) {
-        TCGLabel *label = gen_new_label();
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_andi_i32(tmp, addr, ~(~0 << shift));
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, label);
-        gen_exception_cause_vaddr(dc, LOAD_STORE_ALIGNMENT_CAUSE, addr);
-        gen_set_label(label);
-        tcg_temp_free(tmp);
+        tcg_gen_andi_i32(addr, addr, ~0 << get_alignment_bits(mop));
     }
+    return mop;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1781,10 +1770,11 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
-    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
+    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, mop);
     tcg_temp_free(addr);
 }
 
@@ -1810,11 +1800,12 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_mov_i32(addr, arg[1].in);
-    gen_load_store_alignment(dc, 2, addr, true);
+    mop = gen_load_store_alignment(dc, MO_TEUL | MO_ALIGN, addr);
     gen_check_exclusive(dc, addr, false);
-    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, MO_TEUL);
+    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, mop);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
     tcg_temp_free(addr);
@@ -1824,18 +1815,18 @@ static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    if (par[0] & MO_SIZE) {
-        gen_load_store_alignment(dc, par[0] & MO_SIZE, addr, par[1]);
-    }
+    mop = gen_load_store_alignment(dc, par[0], addr);
+
     if (par[2]) {
         if (par[1]) {
             tcg_gen_mb(TCG_BAR_STRL | TCG_MO_ALL);
         }
-        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, par[0]);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, mop);
     } else {
-        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, par[0]);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, mop);
         if (par[1]) {
             tcg_gen_mb(TCG_BAR_LDAQ | TCG_MO_ALL);
         }
@@ -1906,9 +1897,11 @@ static void translate_mac16(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 mem32 = tcg_temp_new_i32();
 
     if (ld_offset) {
+        MemOp mop;
+
         tcg_gen_addi_i32(vaddr, arg[1].in, ld_offset);
-        gen_load_store_alignment(dc, 2, vaddr, false);
-        tcg_gen_qemu_ld32u(mem32, vaddr, dc->cring);
+        mop = gen_load_store_alignment(dc, MO_TEUL, vaddr);
+        tcg_gen_qemu_ld_tl(mem32, vaddr, dc->cring, mop);
     }
     if (op != MAC16_NONE) {
         TCGv_i32 m1 = gen_mac16_m(arg[off].in,
@@ -2354,13 +2347,14 @@ static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 tmp = tcg_temp_local_new_i32();
     TCGv_i32 addr = tcg_temp_local_new_i32();
+    MemOp mop;
 
     tcg_gen_mov_i32(tmp, arg[0].in);
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, true);
+    mop = gen_load_store_alignment(dc, MO_TEUL | MO_ALIGN, addr);
     gen_check_atomctl(dc, addr);
     tcg_gen_atomic_cmpxchg_i32(arg[0].out, addr, cpu_SR[SCOMPARE1],
-                               tmp, dc->cring, MO_TEUL);
+                               tmp, dc->cring, mop);
     tcg_temp_free(addr);
     tcg_temp_free(tmp);
 }
@@ -2369,10 +2363,11 @@ static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
-    tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, MO_TEUL);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
+    tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, mop);
     tcg_temp_free(addr);
 }
 
@@ -2383,14 +2378,15 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 addr = tcg_temp_local_new_i32();
     TCGv_i32 res = tcg_temp_local_new_i32();
     TCGLabel *label = gen_new_label();
+    MemOp mop;
 
     tcg_gen_movi_i32(res, 0);
     tcg_gen_mov_i32(addr, arg[1].in);
-    gen_load_store_alignment(dc, 2, addr, true);
+    mop = gen_load_store_alignment(dc, MO_TEUL | MO_ALIGN, addr);
     tcg_gen_brcond_i32(TCG_COND_NE, addr, cpu_exclusive_addr, label);
     gen_check_exclusive(dc, addr, true);
     tcg_gen_atomic_cmpxchg_i32(prev, cpu_exclusive_addr, cpu_exclusive_val,
-                               arg[0].in, dc->cring, MO_TEUL);
+                               arg[0].in, dc->cring, mop);
     tcg_gen_setcond_i32(TCG_COND_EQ, res, prev, cpu_exclusive_val);
     tcg_gen_movcond_i32(TCG_COND_EQ, cpu_exclusive_val,
                         prev, cpu_exclusive_val, prev, cpu_exclusive_val);
@@ -3377,7 +3373,7 @@ static const XtensaOpcodeOps core_ops[] = {
     }, {
         .name = "l32ai",
         .translate = translate_ldst,
-        .par = (const uint32_t[]){MO_TEUL, true, false},
+        .par = (const uint32_t[]){MO_TEUL | MO_ALIGN, true, false},
         .op_flags = XTENSA_OP_LOAD,
     }, {
         .name = "l32e",
@@ -4704,7 +4700,7 @@ static const XtensaOpcodeOps core_ops[] = {
     }, {
         .name = "s32ri",
         .translate = translate_ldst,
-        .par = (const uint32_t[]){MO_TEUL, true, true},
+        .par = (const uint32_t[]){MO_TEUL | MO_ALIGN, true, true},
         .op_flags = XTENSA_OP_STORE,
     }, {
         .name = "s8i",
@@ -6639,13 +6635,14 @@ static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     if (par[0]) {
-        tcg_gen_qemu_st32(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, mop);
     } else {
-        tcg_gen_qemu_ld32u(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, mop);
     }
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
@@ -6657,13 +6654,14 @@ static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp mop;
 
     tcg_gen_add_i32(addr, arg[1].in, arg[2].in);
-    gen_load_store_alignment(dc, 2, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     if (par[0]) {
-        tcg_gen_qemu_st32(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, mop);
     } else {
-        tcg_gen_qemu_ld32u(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, mop);
     }
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
@@ -7101,6 +7099,7 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
     TCGv_i32 addr;
+    MemOp mop;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7108,11 +7107,11 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 3, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEQ, addr);
     if (par[0]) {
-        tcg_gen_qemu_st64(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, mop);
     } else {
-        tcg_gen_qemu_ld64(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_i64(arg[0].out, addr, dc->cring, mop);
     }
     if (par[2]) {
         if (par[1]) {
@@ -7131,6 +7130,7 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 addr;
     OpcodeArg arg32[1];
+    MemOp mop;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7138,14 +7138,14 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 2, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     if (par[0]) {
         get_f32_i1(arg, arg32, 0);
-        tcg_gen_qemu_st32(arg32[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg32[0].in, addr, dc->cring, mop);
         put_f32_i1(arg, arg32, 0);
     } else {
         get_f32_o1(arg, arg32, 0);
-        tcg_gen_qemu_ld32u(arg32[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg32[0].out, addr, dc->cring, mop);
         put_f32_o1(arg, arg32, 0);
     }
     if (par[2]) {
@@ -7164,6 +7164,7 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
     TCGv_i32 addr;
+    MemOp mop;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7171,11 +7172,11 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 3, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEQ, addr);
     if (par[0]) {
-        tcg_gen_qemu_st64(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, mop);
     } else {
-        tcg_gen_qemu_ld64(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_i64(arg[0].out, addr, dc->cring, mop);
     }
     if (par[2]) {
         if (par[1]) {
@@ -7194,6 +7195,7 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 addr;
     OpcodeArg arg32[1];
+    MemOp mop;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7201,14 +7203,14 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 2, addr, false);
+    mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     if (par[0]) {
         get_f32_i1(arg, arg32, 0);
-        tcg_gen_qemu_st32(arg32[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg32[0].in, addr, dc->cring, mop);
         put_f32_i1(arg, arg32, 0);
     } else {
         get_f32_o1(arg, arg32, 0);
-        tcg_gen_qemu_ld32u(arg32[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg32[0].out, addr, dc->cring, mop);
         put_f32_o1(arg, arg32, 0);
     }
     if (par[2]) {
diff --git a/tests/tcg/xtensa/test_load_store.S b/tests/tcg/xtensa/test_load_store.S
new file mode 100644
index 000000000000..b339f40f1280
--- /dev/null
+++ b/tests/tcg/xtensa/test_load_store.S
@@ -0,0 +1,221 @@
+#include "macros.inc"
+
+test_suite load_store
+
+.macro load_ok_test op, type, data, value
+    .data
+    .align  4
+1:
+    \type \data
+    .previous
+
+    reset_ps
+    set_vector kernel, 0
+    movi    a3, 1b
+    addi    a4, a4, 1
+    mov     a5, a4
+    \op     a5, a3, 0
+    movi    a6, \value
+    assert  eq, a5, a6
+.endm
+
+#if XCHAL_UNALIGNED_LOAD_EXCEPTION
+.macro load_unaligned_test will_trap, op, type, data, value
+    .data
+    .align  4
+    .byte   0
+1:
+    \type \data
+    .previous
+
+    reset_ps
+    .ifeq \will_trap
+    set_vector kernel, 0
+    .else
+    set_vector kernel, 2f
+    .endif
+    movi    a3, 1b
+    addi    a4, a4, 1
+    mov     a5, a4
+1:
+    \op     a5, a3, 0
+    .ifeq \will_trap
+    movi    a6, \value
+    assert  eq, a5, a6
+    .else
+    test_fail
+2:
+    rsr     a6, exccause
+    movi    a7, 9
+    assert  eq, a6, a7
+    rsr     a6, epc1
+    movi    a7, 1b
+    assert  eq, a6, a7
+    rsr     a6, excvaddr
+    assert  eq, a6, a3
+    assert  eq, a5, a4
+    .endif
+    reset_ps
+.endm
+#else
+.macro load_unaligned_test will_trap, op, type, data, value
+    .data
+    .align  4
+1:
+    \type \data
+    .previous
+
+    reset_ps
+    set_vector kernel, 0
+    movi    a3, 1b + 1
+    addi    a4, a4, 1
+    mov     a5, a4
+    \op     a5, a3, 0
+    movi    a6, \value
+    assert  eq, a5, a6
+.endm
+#endif
+
+.macro store_ok_test op, type, value
+    .data
+    .align  4
+    .byte   0, 0, 0, 0x55
+1:
+    \type 0
+2:
+    .byte   0xaa
+    .previous
+
+    reset_ps
+    set_vector kernel, 0
+    movi    a3, 1b
+    movi    a5, \value
+    \op     a5, a3, 0
+    movi    a3, 2b
+    l8ui    a5, a3, 0
+    movi    a6, 0xaa
+    assert  eq, a5, a6
+    movi    a3, 1b - 1
+    l8ui    a5, a3, 0
+    movi    a6, 0x55
+    assert  eq, a5, a6
+.endm
+
+#if XCHAL_UNALIGNED_STORE_EXCEPTION
+.macro store_unaligned_test will_trap, op, nop, type, value
+    .data
+    .align  4
+    .byte   0x55
+1:
+    \type   0
+2:
+    .byte   0xaa
+    .previous
+
+    reset_ps
+    .ifeq \will_trap
+    set_vector kernel, 0
+    .else
+    set_vector kernel, 4f
+    .endif
+    movi    a3, 1b
+    movi    a5, \value
+3:
+    \op     a5, a3, 0
+    .ifne \will_trap
+    test_fail
+4:
+    rsr     a6, exccause
+    movi    a7, 9
+    assert  eq, a6, a7
+    rsr     a6, epc1
+    movi    a7, 3b
+    assert  eq, a6, a7
+    rsr     a6, excvaddr
+    assert  eq, a6, a3
+    l8ui    a5, a3, 0
+    assert  eqi, a5, 0
+    .endif
+    reset_ps
+    movi    a3, 2b
+    l8ui    a5, a3, 0
+    movi    a6, 0xaa
+    assert  eq, a5, a6
+    movi    a3, 1b - 1
+    l8ui    a5, a3, 0
+    movi    a6, 0x55
+    assert  eq, a5, a6
+.endm
+#else
+.macro store_unaligned_test will_trap, sop, lop, type, value
+    .data
+    .align  4
+    .byte   0x55
+1:
+    \type   0
+    .previous
+
+    reset_ps
+    set_vector kernel, 0
+    movi    a3, 1b
+    movi    a5, \value
+    \sop    a5, a3, 0
+    movi    a3, 1b - 1
+    \lop    a6, a3, 0
+    assert  eq, a5, a6
+.endm
+#endif
+
+test load_ok
+    load_ok_test l16si, .short, 0x00001234, 0x00001234
+    load_ok_test l16si, .short, 0x000089ab, 0xffff89ab
+    load_ok_test l16ui, .short, 0x00001234, 0x00001234
+    load_ok_test l16ui, .short, 0x000089ab, 0x000089ab
+    load_ok_test l32i,  .word,  0x12345678, 0x12345678
+#if XCHAL_HAVE_RELEASE_SYNC
+    load_ok_test l32ai, .word,  0x12345678, 0x12345678
+#endif
+test_end
+
+#undef WILL_TRAP
+#if XCHAL_UNALIGNED_LOAD_HW
+#define WILL_TRAP 0
+#else
+#define WILL_TRAP 1
+#endif
+
+test load_unaligned
+    load_unaligned_test WILL_TRAP, l16si, .short, 0x00001234, 0x00001234
+    load_unaligned_test WILL_TRAP, l16si, .short, 0x000089ab, 0xffff89ab
+    load_unaligned_test WILL_TRAP, l16ui, .short, 0x00001234, 0x00001234
+    load_unaligned_test WILL_TRAP, l16ui, .short, 0x000089ab, 0x000089ab
+    load_unaligned_test WILL_TRAP, l32i,  .word,  0x12345678, 0x12345678
+#if XCHAL_HAVE_RELEASE_SYNC
+    load_unaligned_test 1,         l32ai, .word,  0x12345678, 0x12345678
+#endif
+test_end
+
+test store_ok
+    store_ok_test s16i,  .short, 0x00001234
+    store_ok_test s32i,  .word,  0x12345678
+#if XCHAL_HAVE_RELEASE_SYNC
+    store_ok_test s32ri, .word,  0x12345678
+#endif
+test_end
+
+#undef WILL_TRAP
+#if XCHAL_UNALIGNED_STORE_HW
+#define WILL_TRAP 0
+#else
+#define WILL_TRAP 1
+#endif
+
+test store_unaligned
+    store_unaligned_test WILL_TRAP, s16i,  l16ui, .short, 0x00001234
+    store_unaligned_test WILL_TRAP, s32i,  l32i,  .word,  0x12345678
+#if XCHAL_HAVE_RELEASE_SYNC
+    store_unaligned_test 1,         s32ri, l32i,  .word,  0x12345678
+#endif
+test_end
+
+test_suite_end
-- 
2.20.1


