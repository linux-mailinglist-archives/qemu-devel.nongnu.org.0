Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC550B73C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:27:14 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsNV-0003ui-3j
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhd-0004rx-U2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhc-0003et-1D
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q1so9098431plx.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NMOdGKNSjvZVppRIA94oCOB6Vz0RgsTXLNiP0Un9qYE=;
 b=ZtEV4ANKMAbBUF3JhV9521gApjZTSYFg0VyIG9db48IiZL/yrCSveZKmbVxOxp5Z2p
 9PDVcJsIqBvo10jt+TZj/4eJWypU5Jpdo0fYiFw5L60XCS+F5fyjasI6a63R4EJ9nf17
 Uoj3YOujTNuzl8JkZ3XjPjFEIJblYccbbEkblfLXsttVFZdaZjA2VeN9+1iwlB2jvZNO
 VYRPCneJuCqqgxhSsf27RmKXYqQlnlBycDINZMFCqbnamEx5Oc25ojDA4vDcAMOD1bAu
 jZRqKm6lKsUEjB09PcxAotz2FPD4aMcQCkGk5wmk97tuXkIVy1bJUrIrZw1sx2q5nXFm
 Vnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMOdGKNSjvZVppRIA94oCOB6Vz0RgsTXLNiP0Un9qYE=;
 b=LbI2x1V+R61VtmYd7bFLkRhfbSRXBFEWyEq4kD34tAKuyzpLo4pHUAWEgYA5kJsziZ
 /581nVtE6xbY4myImYrrN7sKuFWOW4phxm/BZLdgL5L4TxpFS/sT9+LOhAzrxyhwAfmq
 ZBd5E6xE8ljqo2ZpshYB0d5j6Buv+wq2H89pO8w0fnTa3/7ylS7xd/eZEYe+3MlGvMlO
 hFBWNVcFSTiMQyt6gp5ApK1Sw+o9n8N9S5XpB4lmEPKK2IlEkF6QtPwkA93mhvnOz65C
 YrQbH+etX3FJhiWX3yqbgP8lEWX+lVNWslj6VrSsMCeer0kve08wFNApO0176iToaz4n
 dXrw==
X-Gm-Message-State: AOAM533jm6gWrdNRFd327ZHvLeHpeOZff6qCmkiX3ZV/0tIG8WaoR9bw
 0FlzVYPMDQhKRL5nquttJIGS8vt85aI=
X-Google-Smtp-Source: ABdhPJzSfAiBWYtcs+OQRqXCraEQwOJ/hHuWrdC2AIiAt4kZh3yFSuYT/1JMQ6YFlNvkbhjsV8KQ6A==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr4140808pls.23.1650627834394; 
 Fri, 22 Apr 2022 04:43:54 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:53 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] target/xtensa: use tcg_constant_* for remaining opcodes
Date: Fri, 22 Apr 2022 04:43:32 -0700
Message-Id: <20220422114332.374472-8-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- gen_jumpi passes target PC to the helper;
- gen_callw_slot uses callinc (1..3);
- gen_brcondi passes immediate field (less than 32 different possible
  values) to the helper;
- disas_xtensa_insn passes PC to the helpers;
- translate_entry passes PC, stack register number (0..15) and stack
  frame size to the helper;
- gen_check_exclusive passes PC and boolean flag to the helper;
- test_exceptions_retw passes PC to the helper;
- gen_check_atomctl passes PC to the helper;
- translate_ssai passes immediate shift amount (0..31) to the helper;
- gen_waiti passes next PC and an immediate (0..15) to the helper;

use tcg_constant_* for the constants listed above. Fold gen_waiti body
into the translate_waiti as it's the only user.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- convert gen_jumpi, disas_xtensa_insn, test_exceptions_retw and
  gen_check_atomctl
- use tcg_constant_* for PC

 target/xtensa/translate.c | 75 +++++++++++++--------------------------
 1 file changed, 24 insertions(+), 51 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 09fb3df40934..9b3c5c0ca45e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -396,19 +396,15 @@ static int adjust_jump_slot(DisasContext *dc, uint32_t dest, int slot)
 
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
 {
-    TCGv_i32 tmp = tcg_const_i32(dest);
-    gen_jump_slot(dc, tmp, adjust_jump_slot(dc, dest, slot));
-    tcg_temp_free(tmp);
+    gen_jump_slot(dc, tcg_constant_i32(dest),
+                  adjust_jump_slot(dc, dest, slot));
 }
 
 static void gen_callw_slot(DisasContext *dc, int callinc, TCGv_i32 dest,
         int slot)
 {
-    TCGv_i32 tcallinc = tcg_const_i32(callinc);
-
     tcg_gen_deposit_i32(cpu_SR[PS], cpu_SR[PS],
-            tcallinc, PS_CALLINC_SHIFT, PS_CALLINC_LEN);
-    tcg_temp_free(tcallinc);
+            tcg_constant_i32(callinc), PS_CALLINC_SHIFT, PS_CALLINC_LEN);
     tcg_gen_movi_i32(cpu_R[callinc << 2],
             (callinc << 30) | (dc->base.pc_next & 0x3fffffff));
     gen_jump_slot(dc, dest, slot);
@@ -454,9 +450,7 @@ static void gen_brcond(DisasContext *dc, TCGCond cond,
 static void gen_brcondi(DisasContext *dc, TCGCond cond,
                         TCGv_i32 t0, uint32_t t1, uint32_t addr)
 {
-    TCGv_i32 tmp = tcg_const_i32(t1);
-    gen_brcond(dc, cond, t0, tmp, addr);
-    tcg_temp_free(tmp);
+    gen_brcond(dc, cond, t0, tcg_constant_i32(t1), addr);
 }
 
 static uint32_t test_exceptions_sr(DisasContext *dc, const OpcodeArg arg[],
@@ -541,21 +535,6 @@ static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
     return mop;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void gen_waiti(DisasContext *dc, uint32_t imm4)
-{
-    TCGv_i32 pc = tcg_const_i32(dc->base.pc_next);
-    TCGv_i32 intlevel = tcg_const_i32(imm4);
-
-    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_waiti(cpu_env, pc, intlevel);
-    tcg_temp_free(pc);
-    tcg_temp_free(intlevel);
-}
-#endif
-
 static bool gen_window_check(DisasContext *dc, uint32_t mask)
 {
     unsigned r = 31 - clz32(mask);
@@ -1070,17 +1049,15 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
     }
 
     if (op_flags & XTENSA_OP_UNDERFLOW) {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_test_underflow_retw(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_test_underflow_retw(cpu_env, pc);
     }
 
     if (op_flags & XTENSA_OP_ALLOCA) {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_movsp(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_movsp(cpu_env, pc);
     }
 
     if (coprocessor && !gen_check_cpenable(dc, coprocessor)) {
@@ -1659,13 +1636,10 @@ static uint32_t test_overflow_entry(DisasContext *dc, const OpcodeArg arg[],
 static void translate_entry(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
-    TCGv_i32 pc = tcg_const_i32(dc->pc);
-    TCGv_i32 s = tcg_const_i32(arg[0].imm);
-    TCGv_i32 imm = tcg_const_i32(arg[1].imm);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
+    TCGv_i32 s = tcg_constant_i32(arg[0].imm);
+    TCGv_i32 imm = tcg_constant_i32(arg[1].imm);
     gen_helper_entry(cpu_env, pc, s, imm);
-    tcg_temp_free(imm);
-    tcg_temp_free(s);
-    tcg_temp_free(pc);
 }
 
 static void translate_extui(DisasContext *dc, const OpcodeArg arg[],
@@ -1745,12 +1719,10 @@ static void gen_check_exclusive(DisasContext *dc, TCGv_i32 addr, bool is_write)
 static void gen_check_exclusive(DisasContext *dc, TCGv_i32 addr, bool is_write)
 {
     if (!option_enabled(dc, XTENSA_OPTION_MPU)) {
-        TCGv_i32 tpc = tcg_const_i32(dc->pc);
-        TCGv_i32 write = tcg_const_i32(is_write);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_check_exclusive(cpu_env, tpc, addr, write);
-        tcg_temp_free(tpc);
-        tcg_temp_free(write);
+        gen_helper_check_exclusive(cpu_env, pc, addr,
+                                   tcg_constant_i32(is_write));
     }
 }
 #endif
@@ -2127,10 +2099,9 @@ static uint32_t test_exceptions_retw(DisasContext *dc, const OpcodeArg arg[],
                       "Illegal retw instruction(pc = %08x)\n", dc->pc);
         return XTENSA_OP_ILL;
     } else {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_test_ill_retw(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_test_ill_retw(cpu_env, pc);
         return 0;
     }
 }
@@ -2290,10 +2261,9 @@ static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 #else
 static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 {
-    TCGv_i32 tpc = tcg_const_i32(dc->pc);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
     gen_helper_check_atomctl(cpu_env, tpc, addr);
-    tcg_temp_free(tpc);
 }
 #endif
 
@@ -2514,9 +2484,7 @@ static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
 static void translate_ssai(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
-    gen_right_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
+    gen_right_shift_sar(dc, tcg_constant_i32(arg[0].imm));
 }
 
 static void translate_ssl(DisasContext *dc, const OpcodeArg arg[],
@@ -2550,7 +2518,12 @@ static void translate_waiti(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    gen_waiti(dc, arg[0].imm);
+    TCGv_i32 pc = tcg_constant_i32(dc->base.pc_next);
+
+    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_waiti(cpu_env, pc, tcg_constant_i32(arg[0].imm));
 #endif
 }
 
-- 
2.30.2


