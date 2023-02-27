Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC96A3AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:47:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWJS-0007Vt-CY; Mon, 27 Feb 2023 00:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJD-0006fe-Pk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:44:23 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ6-0005Rk-LO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:44:23 -0500
Received: by mail-pg1-x536.google.com with SMTP id s17so2854969pgv.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5HkfxXUrjRf6po5AE8ZwpRBRkLy99acvSQejoULsiE=;
 b=HJtPyqVmDbZkgrjR6skBdWao80/147CJzeLpkaoa5Qup7+gzeMZoqPUvYB9AVab+OA
 tUS4tDYsCZmStrpSW7l9qYxpyDxYAtjz/EfckDRjXrS1rtIthE46WPfidyYso4K8KHZE
 Pd8ZuI/oMrPVszutLQlYwLOTEtWN3nSbr+Zm3GfUIzuuAqXo4fjeYzOgkXqYl1JMqp3i
 e8H7uZIsVCXqbH7WhuAL7DBCf3PNqQZfBDu5VG+xYfPtnlQ4E18m+XNZdivDGWsIekZu
 qQPyfi1/8mchybosbCMsRcZLbKnCpliQhHPzEXp05v2jGNuamvYzou0VNX7+IZM3h93I
 eRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5HkfxXUrjRf6po5AE8ZwpRBRkLy99acvSQejoULsiE=;
 b=Z/8GI2LFKZKzGmTtTKc7evIBF2kRLT3Tza0bTBFFX3RNKCMyogSAIq3tJXAS+XTMLV
 uo+fLXu/dYvCNSFnkcqHfFLbH6XpQaUyhJYtlWVqMNe3jymSAX6qSWVec9jSmY2b/H4l
 eykEbfh0l0aI/cBS1ZX+MUii0LGuyvDqNSYGGvVcqD9DMlM5J1g+YVgnrDlRUg/mAByS
 kC4E8nlDIDtKtDZxd54JaoZ/8jPDcXXkscxeUgMO+Rc05/nwm0LXKAYRHNxy0l+vHKy9
 Yw/J+awyN4DkcBMzuDCPly1hgrBzRpiWesuD0TMF64r9q4fnLq5jwQtVyW2dG5bi6bVI
 x68A==
X-Gm-Message-State: AO0yUKX4m41AVhXQWlZ2P3TcXZC7PYeC60A7To/La5LVXvqzkMNvmcBv
 jSKJwSKwCH9tWKH9ZRIyNnEZLBLeCN6SyPktsAk=
X-Google-Smtp-Source: AK7set8QQec0H6rT/7LNWgM60GmPY8aqdWL56d9mYqnseMEPgzFS2X8soCgRdv7axS1KKLWWbN587Q==
X-Received: by 2002:aa7:981c:0:b0:5e2:62b7:f785 with SMTP id
 e28-20020aa7981c000000b005e262b7f785mr10315566pfl.29.1677476646144; 
 Sun, 26 Feb 2023 21:44:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 31/70] target/mips: Split out gen_lxr
Date: Sun, 26 Feb 2023 19:41:54 -1000
Message-Id: <20230227054233.390271-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Common subroutine for LDR and LWR.
Use tcg_constant_tl of ~1 instead of tcg_const_tl of 0x..fe.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 116 +++++++++++++-----------------------
 1 file changed, 40 insertions(+), 76 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f8ea7a54a3..5c5660da5a 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2021,11 +2021,39 @@ static void gen_lxl(DisasContext *ctx, TCGv reg, TCGv addr,
     tcg_gen_or_tl(reg, t0, t1);
 }
 
+/* LWR or LDR, depending on MemOp. */
+static void gen_lxr(DisasContext *ctx, TCGv reg, TCGv addr,
+                     int mem_idx, MemOp mop)
+{
+    int size = memop_size(mop);
+    int sizem1 = size - 1;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    /*
+     * Do a byte access to possibly trigger a page
+     * fault with the unaligned address.
+     */
+    tcg_gen_qemu_ld_tl(t1, addr, mem_idx, MO_UB);
+    tcg_gen_andi_tl(t1, addr, sizem1);
+    if (cpu_is_bigendian(ctx)) {
+        tcg_gen_xori_tl(t1, t1, sizem1);
+    }
+    tcg_gen_shli_tl(t1, t1, 3);
+    tcg_gen_andi_tl(t0, addr, ~sizem1);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, mop);
+    tcg_gen_shr_tl(t0, t0, t1);
+    tcg_gen_xori_tl(t1, t1, size * 8 - 1);
+    tcg_gen_shl_tl(t1, tcg_constant_tl(~1), t1);
+    tcg_gen_and_tl(t1, reg, t1);
+    tcg_gen_or_tl(reg, t0, t1);
+}
+
 /* Load */
 static void gen_ld(DisasContext *ctx, uint32_t opc,
                    int rt, int base, int offset)
 {
-    TCGv t0, t1, t2;
+    TCGv t0, t1;
     int mem_idx = ctx->mem_idx;
 
     if (rt == 0 && ctx->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F |
@@ -2066,26 +2094,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_LDR:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 7);
-        if (cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 7);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~7);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
-        tcg_gen_shr_tl(t0, t0, t1);
-        tcg_gen_xori_tl(t1, t1, 63);
-        t2 = tcg_const_tl(0xfffffffffffffffeull);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_and_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        gen_store_gpr(t0, rt);
+        gen_lxr(ctx, t1, t0, mem_idx, MO_TEUQ);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LDPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
@@ -2153,27 +2164,10 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         /* fall through */
     case OPC_LWR:
         t1 = tcg_temp_new();
-        /*
-         * Do a byte access to possibly trigger a page
-         * fault with the unaligned address.
-         */
-        tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
-        tcg_gen_andi_tl(t1, t0, 3);
-        if (cpu_is_bigendian(ctx)) {
-            tcg_gen_xori_tl(t1, t1, 3);
-        }
-        tcg_gen_shli_tl(t1, t1, 3);
-        tcg_gen_andi_tl(t0, t0, ~3);
-        tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
-        tcg_gen_shr_tl(t0, t0, t1);
-        tcg_gen_xori_tl(t1, t1, 31);
-        t2 = tcg_const_tl(0xfffffffeull);
-        tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
-        tcg_gen_and_tl(t1, t1, t2);
-        tcg_gen_or_tl(t0, t0, t1);
-        tcg_gen_ext32s_tl(t0, t0);
-        gen_store_gpr(t0, rt);
+        gen_lxr(ctx, t1, t0, mem_idx, MO_TEUL);
+        tcg_gen_ext32s_tl(t1, t1);
+        gen_store_gpr(t1, rt);
         break;
     case OPC_LLE:
         mem_idx = MIPS_HFLAG_UM;
@@ -4150,7 +4144,7 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                                int rs, int rd)
 {
-    TCGv t0, t1, t2;
+    TCGv t0, t1;
     TCGv_i32 fp0;
 #if defined(TARGET_MIPS64)
     int lsq_rt1 = ctx->opcode & 0x1f;
@@ -4225,29 +4219,12 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         case OPC_GSLWRC1:
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
-            t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 3);
-            if (cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 3);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 31);
-            t2 = tcg_const_tl(0xfffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, rt);
+            t1 = tcg_temp_new();
             tcg_gen_ext_i32_tl(t1, fp0);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-#if defined(TARGET_MIPS64)
-            tcg_gen_extrl_i64_i32(fp0, t0);
-#else
-            tcg_gen_ext32s_tl(fp0, t0);
-#endif
+            gen_lxr(ctx, t1, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_trunc_tl_i32(fp0, t1);
             gen_store_fpr32(ctx, fp0, rt);
             break;
 #if defined(TARGET_MIPS64)
@@ -4263,22 +4240,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             check_cp1_enabled(ctx);
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             t1 = tcg_temp_new();
-            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
-            tcg_gen_andi_tl(t1, t0, 7);
-            if (cpu_is_bigendian(ctx)) {
-                tcg_gen_xori_tl(t1, t1, 7);
-            }
-            tcg_gen_shli_tl(t1, t1, 3);
-            tcg_gen_andi_tl(t0, t0, ~7);
-            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_gen_shr_tl(t0, t0, t1);
-            tcg_gen_xori_tl(t1, t1, 63);
-            t2 = tcg_const_tl(0xfffffffffffffffeull);
-            tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
-            tcg_gen_and_tl(t1, t1, t2);
-            tcg_gen_or_tl(t0, t0, t1);
-            gen_store_fpr64(ctx, t0, rt);
+            gen_lxr(ctx, t1, t0, ctx->mem_idx, MO_TEUQ);
+            gen_store_fpr64(ctx, t1, rt);
             break;
 #endif
         default:
-- 
2.34.1


