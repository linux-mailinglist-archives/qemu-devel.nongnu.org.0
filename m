Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB23C7555
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:52:42 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LeD-0004Hx-Fd
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUG-0006ww-Ng
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUD-0005hq-Vq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso1810424pjz.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9g0TMe4PewTmlA7yR++xZQeLCjd2V186Zm/OTs48w30=;
 b=oliKWXqE/Dzjycq08ACgvTKMlOud4n8Us9UDDv6EXyfCKPIy3A00GuVdTHO7LGqkaO
 2wYLODvpwsGogSHB4R7qi9t4kDM1BcV8fegEtG09Z9RlClLiVG6OazaxGl0dVFg1B7IK
 qhhN4zxPjA+yGZkXg2OlZH6xuS6lDhUTiPN13pODmtsvdyPhm6jfu08foomxAZ/ybes9
 0CwCRlDZa3bZDQR9YJXY1InW1gG9szPCrnrHg6mOJaziFe6G/2eU/phvPonkgqT7C6zs
 lRxUrI9mB4vr+FS5WoQAD08XzNceeP8ApKne6QokAkLj7tDRO15kqeqcLuIH24MPK3OP
 xq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9g0TMe4PewTmlA7yR++xZQeLCjd2V186Zm/OTs48w30=;
 b=lTnpFE+O1DhF0pz4SK2KFZ/dHKPMXtdBR3tAML95eYNnu63tjBXQT4yxjJVBYtp782
 0xN0LVOxc5lALyuJoDMl0YjJ0Su/6nxw+6hXJXPXaY/CVvd7uG2DSiwYrZVi35/C8UnA
 P74hCsBgugPBfLZB1zwLsxkY5tWnHaNFgffllWJqVhUcpMrYyUTZ1rUDOI3GNE4aoEuo
 RPNmyrBlVm1k9ZZs5DKzEkiXKhDEFu7GroIxVazSMxv6+R/guaWd0iZ4VlRuRgUQIGpx
 bUdNzHwcRg2G9rvtV/laeJXfUENEW2XQP3o0TDIJVoZXb7sAWRGhDvV6MiDaWnmIlx6E
 dpRA==
X-Gm-Message-State: AOAM530jvvRfF0pmoRV7bmznsnB6Fjv1pxiWJOEGpZy0b+A/Q+yJ8BFh
 vn62SuFI0KbEA0SrCmEclrBHeFgMW6O/0Q==
X-Google-Smtp-Source: ABdhPJzIiLn9svPoBleC9mF9N1KObFqhIDRnr+5umu8MHsVsmZk3WurUUGQYWB/FlLiJm/qreg7wEA==
X-Received: by 2002:a17:902:fe87:b029:12a:ef40:57a2 with SMTP id
 x7-20020a170902fe87b029012aef4057a2mr4097836plm.81.1626194540011; 
 Tue, 13 Jul 2021 09:42:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] target/hppa: Use tcg_constant_*
Date: Tue, 13 Jul 2021 09:42:10 -0700
Message-Id: <20210713164211.1520109-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 56 +++++++++++++----------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 835120c038..fa668072d0 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -144,6 +144,7 @@
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
 #define tcg_const_reg        tcg_const_i64
 #define tcg_const_local_reg  tcg_const_local_i64
+#define tcg_constant_reg     tcg_constant_i64
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i64
 #define tcg_gen_add2_reg     tcg_gen_add2_i64
 #define tcg_gen_sub2_reg     tcg_gen_sub2_i64
@@ -238,6 +239,7 @@
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
 #define tcg_const_reg        tcg_const_i32
 #define tcg_const_local_reg  tcg_const_local_i32
+#define tcg_constant_reg     tcg_constant_i32
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i32
 #define tcg_gen_add2_reg     tcg_gen_add2_i32
 #define tcg_gen_sub2_reg     tcg_gen_sub2_i32
@@ -771,9 +773,7 @@ static inline target_ureg iaoq_dest(DisasContext *ctx, target_sreg disp)
 
 static void gen_excp_1(int exception)
 {
-    TCGv_i32 t = tcg_const_i32(exception);
-    gen_helper_excp(cpu_env, t);
-    tcg_temp_free_i32(t);
+    gen_helper_excp(cpu_env, tcg_constant_i32(exception));
 }
 
 static void gen_excp(DisasContext *ctx, int exception)
@@ -787,12 +787,9 @@ static void gen_excp(DisasContext *ctx, int exception)
 
 static bool gen_excp_iir(DisasContext *ctx, int exc)
 {
-    TCGv_reg tmp;
-
     nullify_over(ctx);
-    tmp = tcg_const_reg(ctx->insn);
-    tcg_gen_st_reg(tmp, cpu_env, offsetof(CPUHPPAState, cr[CR_IIR]));
-    tcg_temp_free(tmp);
+    tcg_gen_st_reg(tcg_constant_reg(ctx->insn),
+                   cpu_env, offsetof(CPUHPPAState, cr[CR_IIR]));
     gen_excp(ctx, exc);
     return nullify_end(ctx);
 }
@@ -1150,13 +1147,12 @@ static void do_add(DisasContext *ctx, unsigned rt, TCGv_reg in1,
     }
 
     if (!is_l || cond_need_cb(c)) {
-        TCGv_reg zero = tcg_const_reg(0);
+        TCGv_reg zero = tcg_constant_reg(0);
         cb_msb = get_temp(ctx);
         tcg_gen_add2_reg(dest, cb_msb, in1, zero, in2, zero);
         if (is_c) {
             tcg_gen_add2_reg(dest, cb_msb, dest, cb_msb, cpu_psw_cb_msb, zero);
         }
-        tcg_temp_free(zero);
         if (!is_l) {
             cb = get_temp(ctx);
             tcg_gen_xor_reg(cb, in1, in2);
@@ -1242,7 +1238,7 @@ static void do_sub(DisasContext *ctx, unsigned rt, TCGv_reg in1,
     cb = tcg_temp_new();
     cb_msb = tcg_temp_new();
 
-    zero = tcg_const_reg(0);
+    zero = tcg_constant_reg(0);
     if (is_b) {
         /* DEST,C = IN1 + ~IN2 + C.  */
         tcg_gen_not_reg(cb, in2);
@@ -1258,7 +1254,6 @@ static void do_sub(DisasContext *ctx, unsigned rt, TCGv_reg in1,
         tcg_gen_eqv_reg(cb, in1, in2);
         tcg_gen_xor_reg(cb, cb, dest);
     }
-    tcg_temp_free(zero);
 
     /* Compute signed overflow if required.  */
     sv = NULL;
@@ -2449,17 +2444,16 @@ static bool trans_probe(DisasContext *ctx, arg_probe *a)
     form_gva(ctx, &addr, &ofs, a->b, 0, 0, 0, a->sp, 0, false);
 
     if (a->imm) {
-        level = tcg_const_i32(a->ri);
+        level = tcg_constant_i32(a->ri);
     } else {
         level = tcg_temp_new_i32();
         tcg_gen_trunc_reg_i32(level, load_gpr(ctx, a->ri));
         tcg_gen_andi_i32(level, level, 3);
     }
-    want = tcg_const_i32(a->write ? PAGE_WRITE : PAGE_READ);
+    want = tcg_constant_i32(a->write ? PAGE_WRITE : PAGE_READ);
 
     gen_helper_probe(dest, cpu_env, addr, level, want);
 
-    tcg_temp_free_i32(want);
     tcg_temp_free_i32(level);
 
     save_gpr(ctx, a->t, dest);
@@ -2599,17 +2593,13 @@ static bool trans_lpa(DisasContext *ctx, arg_ldst *a)
 
 static bool trans_lci(DisasContext *ctx, arg_lci *a)
 {
-    TCGv_reg ci;
-
     CHECK_MOST_PRIVILEGED(EXCP_PRIV_OPR);
 
     /* The Coherence Index is an implementation-defined function of the
        physical address.  Two addresses with the same CI have a coherent
        view of the cache.  Our implementation is to return 0 for all,
        since the entire address space is coherent.  */
-    ci = tcg_const_reg(0);
-    save_gpr(ctx, a->t, ci);
-    tcg_temp_free(ci);
+    save_gpr(ctx, a->t, tcg_constant_reg(0));
 
     cond_free(&ctx->null_cond);
     return true;
@@ -2710,8 +2700,6 @@ static bool trans_or(DisasContext *ctx, arg_rrr_cf *a)
          *                      currently implemented as idle.
          */
         if ((rt == 10 || rt == 31) && r1 == rt && r2 == rt) { /* PAUSE */
-            TCGv_i32 tmp;
-
             /* No need to check for supervisor, as userland can only pause
                until the next timer interrupt.  */
             nullify_over(ctx);
@@ -2722,10 +2710,8 @@ static bool trans_or(DisasContext *ctx, arg_rrr_cf *a)
             nullify_set(ctx, 0);
 
             /* Tell the qemu main loop to halt until this cpu has work.  */
-            tmp = tcg_const_i32(1);
-            tcg_gen_st_i32(tmp, cpu_env, -offsetof(HPPACPU, env) +
-                                         offsetof(CPUState, halted));
-            tcg_temp_free_i32(tmp);
+            tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
+                           offsetof(CPUState, halted) - offsetof(HPPACPU, env));
             gen_excp_1(EXCP_HALTED);
             ctx->base.is_jmp = DISAS_NORETURN;
 
@@ -2833,7 +2819,7 @@ static bool trans_ds(DisasContext *ctx, arg_rrr_cf *a)
     add2 = tcg_temp_new();
     addc = tcg_temp_new();
     dest = tcg_temp_new();
-    zero = tcg_const_reg(0);
+    zero = tcg_constant_reg(0);
 
     /* Form R1 << 1 | PSW[CB]{8}.  */
     tcg_gen_add_reg(add1, in1, in1);
@@ -2851,7 +2837,6 @@ static bool trans_ds(DisasContext *ctx, arg_rrr_cf *a)
     tcg_gen_add2_i32(dest, cpu_psw_cb_msb, dest, cpu_psw_cb_msb, addc, zero);
 
     tcg_temp_free(addc);
-    tcg_temp_free(zero);
 
     /* Write back the result register.  */
     save_gpr(ctx, a->t, dest);
@@ -2967,9 +2952,8 @@ static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
      */
     gen_helper_ldc_check(addr);
 
-    zero = tcg_const_reg(0);
+    zero = tcg_constant_reg(0);
     tcg_gen_atomic_xchg_reg(dest, addr, zero, ctx->mmu_idx, mop);
-    tcg_temp_free(zero);
 
     if (a->m) {
         save_gpr(ctx, a->b, ofs);
@@ -3882,15 +3866,13 @@ static bool trans_fcmp_f(DisasContext *ctx, arg_fclass2 *a)
 
     ta = load_frw0_i32(a->r1);
     tb = load_frw0_i32(a->r2);
-    ty = tcg_const_i32(a->y);
-    tc = tcg_const_i32(a->c);
+    ty = tcg_constant_i32(a->y);
+    tc = tcg_constant_i32(a->c);
 
     gen_helper_fcmp_s(cpu_env, ta, tb, ty, tc);
 
     tcg_temp_free_i32(ta);
     tcg_temp_free_i32(tb);
-    tcg_temp_free_i32(ty);
-    tcg_temp_free_i32(tc);
 
     return nullify_end(ctx);
 }
@@ -3904,15 +3886,13 @@ static bool trans_fcmp_d(DisasContext *ctx, arg_fclass2 *a)
 
     ta = load_frd0(a->r1);
     tb = load_frd0(a->r2);
-    ty = tcg_const_i32(a->y);
-    tc = tcg_const_i32(a->c);
+    ty = tcg_constant_i32(a->y);
+    tc = tcg_constant_i32(a->c);
 
     gen_helper_fcmp_d(cpu_env, ta, tb, ty, tc);
 
     tcg_temp_free_i64(ta);
     tcg_temp_free_i64(tb);
-    tcg_temp_free_i32(ty);
-    tcg_temp_free_i32(tc);
 
     return nullify_end(ctx);
 }
-- 
2.25.1


