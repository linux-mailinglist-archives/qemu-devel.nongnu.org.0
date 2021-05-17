Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A244C383DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:49:42 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijFF-0002Fe-Oo
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lij5z-00052Z-7A
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:40:07 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lij5w-0004cV-RT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:40:06 -0400
Received: by mail-lf1-x129.google.com with SMTP id m11so10526267lfg.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EwBZkGcIw/3Aw2yvjixSEJlA/JmPCIne7Quu7iprgqw=;
 b=Xa/4YZQweuut1yjhvtWQLoAW7Ioob9PyV5mjOsvD3ekyKUDZYhfAFiaz7vwy/NmpPh
 i6coArvvqQV+7WeCk4TYmuZ85ZBHLm6d8wtYUkj3tTX5T81+UaLe9yJREBLPdoW0viK5
 O48ajnzAdf5owt0FaR4xPc6liux6VcoEKkcsglm50X0obCgcFHoErRSC2y4cJG7rhkbl
 qFTB4eDTxuD73oHkFZXXpzueeWQheoAReuR3y6PH28b0RApnZSJC2vuc9UoeiyXpGUXw
 SIq5MPD+ftmRblWM/HiNPeAZCsym8UmDHDbKz2vhkz/lIJNo8WIWfk+YFGXma5lxP2j/
 h3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EwBZkGcIw/3Aw2yvjixSEJlA/JmPCIne7Quu7iprgqw=;
 b=npdignsuKQBhGI5rgkbflo9Eegt9HXSuIBAuvJsR387fbM29+Pt6F3oRwgWkZqPpB+
 mevSkUcYbs5MI1BFlmvKM4aHgGX92QbL+QBHLdVZR7rVqZdAMmRoiH7i8Bap3Y0/+R8/
 87yRWvHsjdewccDhd5dTiSMmbk19dqwY2jgaRRCqaDlpa6B28qqKlht8+HCoNYBEKVy9
 T2jKEjApQ8zfHEbptekB6Rq00gqOwXoTvJrclMYdQvD/5T05EaZ5dW62H62M4sDa6lGt
 ECplzTrrR9HpU8jg7zwtMknfJOIFJ2/vSmJ3uBtMhgSgPMfGhR1e9z6fRqBsp5TCBf/K
 RDYQ==
X-Gm-Message-State: AOAM531B1oKEdAEOLmp/0+ph+tpV5AdHoav/vl/9v46dCoCXafWUc09B
 PDLl55oJIkOT7hdLWkuLmbdMXS96p60=
X-Google-Smtp-Source: ABdhPJzcLHPicXoqDsW8/96TgWcTX6n+WPcWNGZILVSwxjjSNxUlwSHUBy8PU+5ggHSfzc4RBYritw==
X-Received: by 2002:a19:9102:: with SMTP id t2mr976092lfd.255.1621280402260;
 Mon, 17 May 2021 12:40:02 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id t24sm1292604ljj.97.2021.05.17.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:40:01 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: clean up unaligned access
Date: Mon, 17 May 2021 12:39:45 -0700
Message-Id: <20210517193945.22992-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-lf1-x129.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xtensa cores may or may not have hardware support for unaligned memory
access. On cores with such support pass MO_UNALN in memory access flags
for all operations that would not raise an exception. Drop condition
from xtensa_cpu_do_unaligned_access and replace it with assertions.
Add a test.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/helper.c             |  14 +--
 target/xtensa/translate.c          | 108 ++++++++++----------
 tests/tcg/xtensa/test_load_store.S | 156 +++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/xtensa/test_load_store.S

diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index eeffee297d15..eceb2958caab 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -270,13 +270,13 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
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
+    assert(!xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT));
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
 }
 
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0ae4efc48a17..8759bea7ff85 100644
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
@@ -554,20 +544,16 @@ static uint32_t test_exceptions_hpi(DisasContext *dc, const OpcodeArg arg[],
     return test_exceptions_sr(dc, arg, par);
 }
 
-static void gen_load_store_alignment(DisasContext *dc, int shift,
-        TCGv_i32 addr, bool no_hw_alignment)
+static MemOp gen_load_store_alignment(DisasContext *dc, int shift,
+                                      TCGv_i32 addr, bool no_hw_alignment)
 {
     if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
         tcg_gen_andi_i32(addr, addr, ~0 << shift);
-    } else if (option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT) &&
-            no_hw_alignment) {
-        TCGLabel *label = gen_new_label();
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_andi_i32(tmp, addr, ~(~0 << shift));
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, label);
-        gen_exception_cause_vaddr(dc, LOAD_STORE_ALIGNMENT_CAUSE, addr);
-        gen_set_label(label);
-        tcg_temp_free(tmp);
+    }
+    if (!no_hw_alignment && option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT)) {
+        return MO_UNALN;
+    } else {
+        return MO_ALIGN;
     }
 }
 
@@ -1784,10 +1770,11 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
-    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL);
+    al = gen_load_store_alignment(dc, 2, addr, false);
+    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL | al);
     tcg_temp_free(addr);
 }
 
@@ -1813,11 +1800,12 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al;
 
     tcg_gen_mov_i32(addr, arg[1].in);
-    gen_load_store_alignment(dc, 2, addr, true);
+    al = gen_load_store_alignment(dc, 2, addr, true);
     gen_check_exclusive(dc, addr, false);
-    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, MO_TEUL);
+    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, MO_TEUL | al);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
     tcg_temp_free(addr);
@@ -1827,18 +1815,19 @@ static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al = MO_UNALN;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
     if (par[0] & MO_SIZE) {
-        gen_load_store_alignment(dc, par[0] & MO_SIZE, addr, par[1]);
+        al = gen_load_store_alignment(dc, par[0] & MO_SIZE, addr, par[1]);
     }
     if (par[2]) {
         if (par[1]) {
             tcg_gen_mb(TCG_BAR_STRL | TCG_MO_ALL);
         }
-        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, par[0]);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, par[0] | al);
     } else {
-        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, par[0]);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, par[0] | al);
         if (par[1]) {
             tcg_gen_mb(TCG_BAR_LDAQ | TCG_MO_ALL);
         }
@@ -1909,9 +1898,11 @@ static void translate_mac16(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 mem32 = tcg_temp_new_i32();
 
     if (ld_offset) {
+        MemOp al;
+
         tcg_gen_addi_i32(vaddr, arg[1].in, ld_offset);
-        gen_load_store_alignment(dc, 2, vaddr, false);
-        tcg_gen_qemu_ld32u(mem32, vaddr, dc->cring);
+        al = gen_load_store_alignment(dc, 2, vaddr, false);
+        tcg_gen_qemu_ld_tl(mem32, vaddr, dc->cring, MO_TEUL | al);
     }
     if (op != MAC16_NONE) {
         TCGv_i32 m1 = gen_mac16_m(arg[off].in,
@@ -2357,13 +2348,14 @@ static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 tmp = tcg_temp_local_new_i32();
     TCGv_i32 addr = tcg_temp_local_new_i32();
+    MemOp al;
 
     tcg_gen_mov_i32(tmp, arg[0].in);
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, true);
+    al = gen_load_store_alignment(dc, 2, addr, true);
     gen_check_atomctl(dc, addr);
     tcg_gen_atomic_cmpxchg_i32(arg[0].out, addr, cpu_SR[SCOMPARE1],
-                               tmp, dc->cring, MO_TEUL);
+                               tmp, dc->cring, MO_TEUL | al);
     tcg_temp_free(addr);
     tcg_temp_free(tmp);
 }
@@ -2372,10 +2364,11 @@ static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
-    tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, MO_TEUL);
+    al = gen_load_store_alignment(dc, 2, addr, false);
+    tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, MO_TEUL | al);
     tcg_temp_free(addr);
 }
 
@@ -2386,14 +2379,15 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 addr = tcg_temp_local_new_i32();
     TCGv_i32 res = tcg_temp_local_new_i32();
     TCGLabel *label = gen_new_label();
+    MemOp al;
 
     tcg_gen_movi_i32(res, 0);
     tcg_gen_mov_i32(addr, arg[1].in);
-    gen_load_store_alignment(dc, 2, addr, true);
+    al = gen_load_store_alignment(dc, 2, addr, true);
     tcg_gen_brcond_i32(TCG_COND_NE, addr, cpu_exclusive_addr, label);
     gen_check_exclusive(dc, addr, true);
     tcg_gen_atomic_cmpxchg_i32(prev, cpu_exclusive_addr, cpu_exclusive_val,
-                               arg[0].in, dc->cring, MO_TEUL);
+                               arg[0].in, dc->cring, MO_TEUL | al);
     tcg_gen_setcond_i32(TCG_COND_EQ, res, prev, cpu_exclusive_val);
     tcg_gen_movcond_i32(TCG_COND_EQ, cpu_exclusive_val,
                         prev, cpu_exclusive_val, prev, cpu_exclusive_val);
@@ -6642,13 +6636,14 @@ static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al;
 
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
-    gen_load_store_alignment(dc, 2, addr, false);
+    al = gen_load_store_alignment(dc, 2, addr, false);
     if (par[0]) {
-        tcg_gen_qemu_st32(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, MO_TEUL | al);
     } else {
-        tcg_gen_qemu_ld32u(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, MO_TEUL | al);
     }
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
@@ -6660,13 +6655,14 @@ static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 addr = tcg_temp_new_i32();
+    MemOp al;
 
     tcg_gen_add_i32(addr, arg[1].in, arg[2].in);
-    gen_load_store_alignment(dc, 2, addr, false);
+    al = gen_load_store_alignment(dc, 2, addr, false);
     if (par[0]) {
-        tcg_gen_qemu_st32(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg[0].in, addr, dc->cring, MO_TEUL | al);
     } else {
-        tcg_gen_qemu_ld32u(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->cring, MO_TEUL | al);
     }
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
@@ -7104,6 +7100,7 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
     TCGv_i32 addr;
+    MemOp al;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7111,11 +7108,11 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 3, addr, false);
+    al = gen_load_store_alignment(dc, 3, addr, false);
     if (par[0]) {
-        tcg_gen_qemu_st64(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, MO_TEQ | al);
     } else {
-        tcg_gen_qemu_ld64(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_i64(arg[0].out, addr, dc->cring, MO_TEQ | al);
     }
     if (par[2]) {
         if (par[1]) {
@@ -7134,6 +7131,7 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 addr;
     OpcodeArg arg32[1];
+    MemOp al;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7141,14 +7139,14 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 2, addr, false);
+    al = gen_load_store_alignment(dc, 2, addr, false);
     if (par[0]) {
         get_f32_i1(arg, arg32, 0);
-        tcg_gen_qemu_st32(arg32[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg32[0].in, addr, dc->cring, MO_TEUL | al);
         put_f32_i1(arg, arg32, 0);
     } else {
         get_f32_o1(arg, arg32, 0);
-        tcg_gen_qemu_ld32u(arg32[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg32[0].out, addr, dc->cring, MO_TEUL | al);
         put_f32_o1(arg, arg32, 0);
     }
     if (par[2]) {
@@ -7167,6 +7165,7 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
     TCGv_i32 addr;
+    MemOp al;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7174,11 +7173,11 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 3, addr, false);
+    al = gen_load_store_alignment(dc, 3, addr, false);
     if (par[0]) {
-        tcg_gen_qemu_st64(arg[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_i64(arg[0].in, addr, dc->cring, MO_TEQ | al);
     } else {
-        tcg_gen_qemu_ld64(arg[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_i64(arg[0].out, addr, dc->cring, MO_TEQ | al);
     }
     if (par[2]) {
         if (par[1]) {
@@ -7197,6 +7196,7 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 addr;
     OpcodeArg arg32[1];
+    MemOp al;
 
     if (par[1]) {
         addr = tcg_temp_new_i32();
@@ -7204,14 +7204,14 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
     } else {
         addr = arg[1].in;
     }
-    gen_load_store_alignment(dc, 2, addr, false);
+    al = gen_load_store_alignment(dc, 2, addr, false);
     if (par[0]) {
         get_f32_i1(arg, arg32, 0);
-        tcg_gen_qemu_st32(arg32[0].in, addr, dc->cring);
+        tcg_gen_qemu_st_tl(arg32[0].in, addr, dc->cring, MO_TEUL | al);
         put_f32_i1(arg, arg32, 0);
     } else {
         get_f32_o1(arg, arg32, 0);
-        tcg_gen_qemu_ld32u(arg32[0].out, addr, dc->cring);
+        tcg_gen_qemu_ld_tl(arg32[0].out, addr, dc->cring, MO_TEUL | al);
         put_f32_o1(arg, arg32, 0);
     }
     if (par[2]) {
diff --git a/tests/tcg/xtensa/test_load_store.S b/tests/tcg/xtensa/test_load_store.S
new file mode 100644
index 000000000000..a193e79d37b4
--- /dev/null
+++ b/tests/tcg/xtensa/test_load_store.S
@@ -0,0 +1,156 @@
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
+.macro load_unaligned_test op, type, data, value
+    .data
+    .align  4
+    .byte   0
+1:
+    \type \data
+    .previous
+
+    reset_ps
+#if XCHAL_UNALIGNED_LOAD_HW
+    set_vector kernel, 0
+#else
+    set_vector kernel, 2f
+#endif
+    movi    a3, 1b
+    addi    a4, a4, 1
+    mov     a5, a4
+1:
+    \op     a5, a3, 0
+#if XCHAL_UNALIGNED_LOAD_HW
+    movi    a6, \value
+    assert  eq, a5, a6
+#else
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
+#endif
+    reset_ps
+.endm
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
+.macro store_unaligned_test op, type, value
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
+#if XCHAL_UNALIGNED_STORE_HW
+    set_vector kernel, 0
+#else
+    set_vector kernel, 4f
+#endif
+    movi    a3, 1b
+    movi    a5, \value
+3:
+    \op     a5, a3, 0
+#if !XCHAL_UNALIGNED_STORE_HW
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
+#endif
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
+
+test load_ok
+    load_ok_test l16si, .short, 0x00001234, 0x00001234
+    load_ok_test l16si, .short, 0x000089ab, 0xffff89ab
+    load_ok_test l16ui, .short, 0x00001234, 0x00001234
+    load_ok_test l16ui, .short, 0x000089ab, 0x000089ab
+    load_ok_test l32i,  .word,  0x12345678, 0x12345678
+test_end
+
+test load_unaligned
+    load_unaligned_test l16si, .short, 0x00001234, 0x00001234
+    load_unaligned_test l16si, .short, 0x000089ab, 0xffff89ab
+    load_unaligned_test l16ui, .short, 0x00001234, 0x00001234
+    load_unaligned_test l16ui, .short, 0x000089ab, 0x000089ab
+    load_unaligned_test l32i,  .word,  0x12345678, 0x12345678
+test_end
+
+test store_ok
+    store_ok_test s16i, .short, 0x00001234
+    store_ok_test s32i, .word,  0x12345678
+test_end
+
+test store_unaligned
+    store_unaligned_test s16i, .short, 0x00001234
+    store_unaligned_test s32i, .word,  0x12345678
+test_end
+
+test_suite_end
-- 
2.20.1


