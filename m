Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FB6AF0BD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9j-0003mY-TF; Tue, 07 Mar 2023 13:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9h-0003kJ-OJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:21 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9f-0007pH-VC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:21 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p6so15187255plf.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlBTOJV1hh3a1cn6MWiBu2NRUMEpbWBiiyC1zmA0wSE=;
 b=JrruKltrnD+ae4XwiJQD3PQd18pWL5Og91XndComSmIDLI7B1snFk53BKt1iUT2LKP
 PZhCrxo5RFkbGYglEIoLdYGFBDvNAen5MVZ3kq7eMpdmuQ5lzSjfqwFHcOEO83NW+mRH
 dqtUl369S0x2DMMbuhGJGntKQ+L9ZeolkAqjcIb0gOFOtjvMPXGNjwS2cxgW9dka+hPy
 JH5JUfSU4+zUwqIrEfq2FJ2faYNCWZbP1pSHf5+wU6bqhMsXlKONTzgZt74oFNkFv9Nn
 pTYVDSiLWcLnvkDoViAmqsik06LIwDD2DmGvTi3ymNJgKwRbJCVHI0B/SBCNxYU4Zwit
 3VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlBTOJV1hh3a1cn6MWiBu2NRUMEpbWBiiyC1zmA0wSE=;
 b=PpJz3Pa0oaUXFqslZX7x0aTBnznpraZPRjVfXCLYT7IydxmDUaWRNDXD1tlyFfRIVr
 nCC1mCH87Wvs2enhTm/kj2YNaM16R9bNejycKzDJ1t1LCNIW32uJM0zsYYMwmFvzrbmC
 S27kVJh7ZBnF3hJqRsvNCRAPNJFEYT20nywiSufGreU9PK85XfHm6bZBStMgcaRwDSYZ
 4cUmKUBr9t9IcJgOndiJGmcFJZw/rrEwFtJmiOMAPFpPUl0vYnuuwUXPTQNHmQuNKG7l
 FD073XlFjUyPyz3qQcpIVCDVQwwibw/NKzJzvpiSqAL9k41+OsbhqOBpSHUAppDifCbn
 OfpQ==
X-Gm-Message-State: AO0yUKVee7LWCmfM+epwbYgBTI6RLHVmpEQkHp/Hw4DnHYabC5+BW6l6
 FoTMqoanJr7vtmyLH3GyO+/NCK/NVN+gqDH2AbU=
X-Google-Smtp-Source: AK7set8ctAbPu23Cv7eSq2fwtc1Mw9tm+K9+dPNqa31pv0HIW1bgAb0mP+2WtTfq+skd3tOff4XJqA==
X-Received: by 2002:a17:90b:4a48:b0:234:106a:34b7 with SMTP id
 lb8-20020a17090b4a4800b00234106a34b7mr15264079pjb.46.1678214118680; 
 Tue, 07 Mar 2023 10:35:18 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 18/25] target/ppc: Avoid tcg_const_* in fp-impl.c.inc
Date: Tue,  7 Mar 2023 10:34:56 -0800
Message-Id: <20230307183503.2512684-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
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


