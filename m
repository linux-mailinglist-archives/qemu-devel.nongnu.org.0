Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4AD6A3ADF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWMZ-0007yB-JG; Mon, 27 Feb 2023 00:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMK-0007lj-AD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:37 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMH-000717-Vj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:35 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so5126451pjq.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YED/oFHPDajrG5dAWvXY/hvFs/yeoyJEXCZ48T5LxeE=;
 b=rsAiMs6Jz26cs9pkt9TOU/wdcdRHh+JC8lRtf2p6lJtL+0V4rmI1MGx2guf8m9CAbU
 OXkAoTFb0Py0et4XkuXrBBGYlUmjPKIpOV2DkFnuCf9yvvBo1LBDA3e9YRms99J3oW6e
 miyaa+giwBvxg1UPJPqMl2dNilwnFdQZIzR23/4quFQD1BHTYtBqVv0zuq9ehLWQIZO6
 tgdHd/q6+wBVK5Bl04U1v1Jyucdi6q/JzCvod23sSK+FCF1q6gF4pIeX3KoZ1UNyO106
 JFUXEhdpRijeZG91FofTxV8uIsn5s8CA9lgMKcyh4C2DxZb1MSIB9AhVU0ng47V2X5s0
 jgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YED/oFHPDajrG5dAWvXY/hvFs/yeoyJEXCZ48T5LxeE=;
 b=YkEtIjVosQa1/A0SMsEmvQuuzcG14MofOmr2GvclzmqrR8/f9wFpClO7fqDNG7Cz50
 cuZvMhE2To/pkYF4P/ai4HAvChuschtG4w6SuW9BT0UJ8HsRy9MBg5NZ4wf/TPdJOmRx
 qVSwcnBRdoiiz5j4Zi9yXcvU+7dmcHHvFSzT/HaaMYm+tu6ySDR8Bvm3XyIVz6qracSm
 AF+vKzuc1TBejjb9Srfc15qx7FLGkdbmgayVbNONI5dDPbpAql/1fVfXFsEd7x6pvPAe
 VEbbB60CA6cy+sy4nyQEeqV0k5HhoQkyHZ95lqbslrMcfmCgLfh9cMrmZO7EioFGGKip
 paGQ==
X-Gm-Message-State: AO0yUKXsmSPj+rsppfwY2C+9SgUUxm+7WVshGS4bB05/Ls+vvP4Nxxjd
 oglKInXl2jgAKpb3vsteLBFAYlQFVAcSIe+cznM=
X-Google-Smtp-Source: AK7set+2/UsF36F6i2WPDhNbG40sV3FZUsDC0ucLZUc7sR0EfBM9xjCWNLwlJ2ZLq2q67IN1KPqE+g==
X-Received: by 2002:a17:903:110e:b0:19c:ac96:223b with SMTP id
 n14-20020a170903110e00b0019cac96223bmr18961544plh.40.1677476851065; 
 Sun, 26 Feb 2023 21:47:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 40/70] target/ppc: Avoid tcg_const_* in fp-impl.c.inc
Date: Sun, 26 Feb 2023 19:42:03 -1000
Message-Id: <20230227054233.390271-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/fp-impl.c.inc | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d5d88e7d49..57d8437851 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -348,7 +348,7 @@ static void gen_fcmpo(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
-    crf = tcg_const_i32(crfD(ctx->opcode));
+    crf = tcg_constant_i32(crfD(ctx->opcode));
     get_fpr(t0, rA(ctx->opcode));
     get_fpr(t1, rB(ctx->opcode));
     gen_helper_fcmpo(cpu_env, t0, t1, crf);
@@ -368,7 +368,7 @@ static void gen_fcmpu(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
-    crf = tcg_const_i32(crfD(ctx->opcode));
+    crf = tcg_constant_i32(crfD(ctx->opcode));
     get_fpr(t0, rA(ctx->opcode));
     get_fpr(t1, rB(ctx->opcode));
     gen_helper_fcmpu(cpu_env, t0, t1, crf);
@@ -541,7 +541,7 @@ static void gen_mcrfs(DisasContext *ctx)
     tcg_gen_andi_i64(tnew_fpscr, tnew_fpscr,
                      ~((0xF << shift) & FP_EX_CLEAR_BITS));
     /* FEX and VX need to be updated, so don't set fpscr directly */
-    tmask = tcg_const_i32(1 << nibble);
+    tmask = tcg_constant_i32(1 << nibble);
     gen_helper_store_fpscr(cpu_env, tnew_fpscr, tmask);
 }
 
@@ -681,9 +681,7 @@ static void gen_mtfsb0(DisasContext *ctx)
     crb = 31 - crbD(ctx->opcode);
     gen_reset_fpstatus();
     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX)) {
-        TCGv_i32 t0;
-        t0 = tcg_const_i32(crb);
-        gen_helper_fpscr_clrbit(cpu_env, t0);
+        gen_helper_fpscr_clrbit(cpu_env, tcg_constant_i32(crb));
     }
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
@@ -703,9 +701,7 @@ static void gen_mtfsb1(DisasContext *ctx)
     crb = 31 - crbD(ctx->opcode);
     /* XXX: we pretend we can only do IEEE floating-point computations */
     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX && crb != FPSCR_NI)) {
-        TCGv_i32 t0;
-        t0 = tcg_const_i32(crb);
-        gen_helper_fpscr_setbit(cpu_env, t0);
+        gen_helper_fpscr_setbit(cpu_env, tcg_constant_i32(crb));
     }
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
@@ -733,10 +729,12 @@ static void gen_mtfsf(DisasContext *ctx)
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
-    if (l) {
-        t0 = tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff : 0xff);
+    if (!l) {
+        t0 = tcg_constant_i32(flm << (w * 8));
+    } else if (ctx->insns_flags2 & PPC2_ISA205) {
+        t0 = tcg_constant_i32(0xffff);
     } else {
-        t0 = tcg_const_i32(flm << (w * 8));
+        t0 = tcg_constant_i32(0xff);
     }
     t1 = tcg_temp_new_i64();
     get_fpr(t1, rB(ctx->opcode));
@@ -767,8 +765,8 @@ static void gen_mtfsfi(DisasContext *ctx)
         return;
     }
     sh = (8 * w) + 7 - bf;
-    t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
-    t1 = tcg_const_i32(1 << sh);
+    t0 = tcg_constant_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
+    t1 = tcg_constant_i32(1 << sh);
     gen_helper_store_fpscr(cpu_env, t0, t1);
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
-- 
2.34.1


