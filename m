Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA72DA33B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:20:57 +0100 (CET)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowDA-0006yx-5N
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6Z-0000BX-EQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:07 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6W-0004b5-Rq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:07 -0500
Received: by mail-ot1-x343.google.com with SMTP id b18so17407265ots.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXWJfPIZobw28rXcpmksqEkRI3kkMq+o5FnlNZTZN2Y=;
 b=Fp78xmxGmwMdWrSvANHW9Zj1MtcqyDdTH2kfsbR0T5TxnjUm7YonOdO9w0Ek6xaIMx
 p0hJtRC5WwekKe5sfFM6Bf7wAbN7WkJAci2SPxoDhw7gD/++/mj9cI2gP5GU0X4yADGI
 etiw3imWlflO/Nh9pxhvS6AHuQAyrALSk9ZAmS8m25RSCGQzXTsWzqGXPpDJyM44BXpF
 kYZTsZImnpIX5uA4xOoDY+uj/q7u9CtNHG4ihBfvR00bKXKURvv0mjyTDHuoQJNuiXEw
 cxgCNeC12msazMPuRciPNr+YazY/XPm6raldtEDQGQf30yINjv46qIuZHV3WNZBCnv7X
 nKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXWJfPIZobw28rXcpmksqEkRI3kkMq+o5FnlNZTZN2Y=;
 b=rgw5QL8jPc5aFoqHkxw9OwxOKqkdxJj9X92kFMkCA1T6Ta0K1+kzC44+J1UjJ4Mczo
 iwegw/eMSZE1BVlWg4guDdXrPK3R9SoxXoqUqynESzMDsJlH1Cv7SfK0dMTDTwSmyPdd
 MgidmHBmJG9ddizQ6IXKdS2rXGOqxilrlw6qG0LhjGl7+B1H+2gor1ffddSKEkqAP9rL
 zZ5or/7EHEC+uKGsPGNvmjmC/2u7f9DDxZW2v1bYjjim2pjW/Hzq9fxz/pZtN+RzEbLl
 kDISH93SoiOd3UnAT7t8VgkSp/CNV60WbDqu8lwdbrPTCcfiswQGgCqVwIpLvOe4SrIi
 DgCQ==
X-Gm-Message-State: AOAM532FbpGkc/fbTJ2Vx+hE6elDO197GJsDDBf+IEb2cbFEYDoM1QMm
 9pdN3RzRPijrqUQ7LMIoBwG/28+yMCxwCTEW
X-Google-Smtp-Source: ABdhPJxnQ96lVpymglRwp/Y9vghTEfTvfxUTDUToTm35Frf5mcA/ZP6vqhlWoS1w5ptNkkHRMi5e8Q==
X-Received: by 2002:a9d:7746:: with SMTP id t6mr21683131otl.349.1607984043094; 
 Mon, 14 Dec 2020 14:14:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b71sm2193033oii.5.2020.12.14.14.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:14:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] target/s390x: Improve SUB LOGICAL WITH BORROW
Date: Mon, 14 Dec 2020 16:13:56 -0600
Message-Id: <20201214221356.68039-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214221356.68039-1-richard.henderson@linaro.org>
References: <20201214221356.68039-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that SUB LOGICAL outputs borrow, we can use that as input directly.
It also means we can re-use CC_OP_SUBU and produce an output borrow
directly from SUB LOGICAL WITH BORROW.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/internal.h    |  2 -
 target/s390x/cc_helper.c   | 32 ----------------
 target/s390x/helper.c      |  2 -
 target/s390x/translate.c   | 76 +++++++++++++++++++++-----------------
 target/s390x/insn-data.def |  8 ++--
 5 files changed, 46 insertions(+), 74 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 4077047494..11515bb617 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -172,14 +172,12 @@ enum cc_op {
 
     CC_OP_ADD_64,               /* overflow on add (64bit) */
     CC_OP_SUB_64,               /* overflow on subtraction (64bit) */
-    CC_OP_SUBB_64,              /* overflow on unsigned sub-borrow (64bit) */
     CC_OP_ABS_64,               /* sign eval on abs (64bit) */
     CC_OP_NABS_64,              /* sign eval on nabs (64bit) */
     CC_OP_MULS_64,              /* overflow on signed multiply (64bit) */
 
     CC_OP_ADD_32,               /* overflow on add (32bit) */
     CC_OP_SUB_32,               /* overflow on subtraction (32bit) */
-    CC_OP_SUBB_32,              /* overflow on unsigned sub-borrow (32bit) */
     CC_OP_ABS_32,               /* sign eval on abs (64bit) */
     CC_OP_NABS_32,              /* sign eval on nabs (64bit) */
     CC_OP_MULS_32,              /* overflow on signed multiply (32bit) */
diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index c7728d1225..e7039d0d18 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -164,19 +164,6 @@ static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
     }
 }
 
-static uint32_t cc_calc_subb_64(uint64_t a1, uint64_t a2, uint64_t ar)
-{
-    int borrow_out;
-
-    if (ar != a1 - a2) {	/* difference means borrow-in */
-        borrow_out = (a2 >= a1);
-    } else {
-        borrow_out = (a2 > a1);
-    }
-
-    return (ar != 0) + 2 * !borrow_out;
-}
-
 static uint32_t cc_calc_abs_64(int64_t dst)
 {
     if ((uint64_t)dst == 0x8000000000000000ULL) {
@@ -237,19 +224,6 @@ static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
     }
 }
 
-static uint32_t cc_calc_subb_32(uint32_t a1, uint32_t a2, uint32_t ar)
-{
-    int borrow_out;
-
-    if (ar != a1 - a2) {	/* difference means borrow-in */
-        borrow_out = (a2 >= a1);
-    } else {
-        borrow_out = (a2 > a1);
-    }
-
-    return (ar != 0) + 2 * !borrow_out;
-}
-
 static uint32_t cc_calc_abs_32(int32_t dst)
 {
     if ((uint32_t)dst == 0x80000000UL) {
@@ -450,9 +424,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_SUB_64:
         r =  cc_calc_sub_64(src, dst, vr);
         break;
-    case CC_OP_SUBB_64:
-        r =  cc_calc_subb_64(src, dst, vr);
-        break;
     case CC_OP_ABS_64:
         r =  cc_calc_abs_64(dst);
         break;
@@ -472,9 +443,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_SUB_32:
         r =  cc_calc_sub_32(src, dst, vr);
         break;
-    case CC_OP_SUBB_32:
-        r =  cc_calc_subb_32(src, dst, vr);
-        break;
     case CC_OP_ABS_32:
         r =  cc_calc_abs_32(dst);
         break;
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index fa3aa500e5..7678994feb 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -405,12 +405,10 @@ const char *cc_name(enum cc_op cc_op)
         [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
         [CC_OP_ADD_64]    = "CC_OP_ADD_64",
         [CC_OP_SUB_64]    = "CC_OP_SUB_64",
-        [CC_OP_SUBB_64]   = "CC_OP_SUBB_64",
         [CC_OP_ABS_64]    = "CC_OP_ABS_64",
         [CC_OP_NABS_64]   = "CC_OP_NABS_64",
         [CC_OP_ADD_32]    = "CC_OP_ADD_32",
         [CC_OP_SUB_32]    = "CC_OP_SUB_32",
-        [CC_OP_SUBB_32]   = "CC_OP_SUBB_32",
         [CC_OP_ABS_32]    = "CC_OP_ABS_32",
         [CC_OP_NABS_32]   = "CC_OP_NABS_32",
         [CC_OP_COMP_32]   = "CC_OP_COMP_32",
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 40add1df1f..3d5c0d6106 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -601,10 +601,8 @@ static void gen_op_calc_cc(DisasContext *s)
         /* FALLTHRU */
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
-    case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-    case CC_OP_SUBB_32:
         local_cc_op = tcg_const_i32(s->cc_op);
         break;
     case CC_OP_CONST0:
@@ -663,10 +661,8 @@ static void gen_op_calc_cc(DisasContext *s)
         break;
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
-    case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-    case CC_OP_SUBB_32:
         /* 3 arguments */
         gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, cc_vr);
         break;
@@ -4746,29 +4742,51 @@ static DisasJumpType op_subu64(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_subb(DisasContext *s, DisasOps *o)
+/* Compute borrow (0, -1) into cc_src. */
+static void compute_borrow(DisasContext *s)
 {
-    DisasCompare cmp;
-    TCGv_i64 borrow;
-
-    tcg_gen_sub_i64(o->out, o->in1, o->in2);
-
-    /* The !borrow flag is the msb of CC.  Since we want the inverse of
-       that, we ask for a comparison of CC=0 | CC=1 -> mask of 8 | 4.  */
-    disas_jcc(s, &cmp, 8 | 4);
-    borrow = tcg_temp_new_i64();
-    if (cmp.is_64) {
-        tcg_gen_setcond_i64(cmp.cond, borrow, cmp.u.s64.a, cmp.u.s64.b);
-    } else {
-        TCGv_i32 t = tcg_temp_new_i32();
-        tcg_gen_setcond_i32(cmp.cond, t, cmp.u.s32.a, cmp.u.s32.b);
-        tcg_gen_extu_i32_i64(borrow, t);
-        tcg_temp_free_i32(t);
+    switch (s->cc_op) {
+    case CC_OP_SUBU:
+        /* The borrow value is already in cc_src (0,-1). */
+        break;
+    default:
+        gen_op_calc_cc(s);
+        /* fall through */
+    case CC_OP_STATIC:
+        /* The carry flag is the msb of CC; compute into cc_src. */
+        tcg_gen_extu_i32_i64(cc_src, cc_op);
+        tcg_gen_shri_i64(cc_src, cc_src, 1);
+        /* fall through */
+    case CC_OP_ADDU:
+        /* Convert carry (1,0) to borrow (0,-1). */
+        tcg_gen_subi_i64(cc_src, cc_src, 1);
+        break;
     }
-    free_compare(&cmp);
+}
+
+static DisasJumpType op_subb32(DisasContext *s, DisasOps *o)
+{
+    compute_borrow(s);
+
+    /* Borrow is {0, -1}, so add to subtract. */
+    tcg_gen_add_i64(o->out, o->in1, cc_src);
+    tcg_gen_sub_i64(o->out, o->out, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_subb64(DisasContext *s, DisasOps *o)
+{
+    compute_borrow(s);
+
+    /*
+     * Borrow is {0, -1}, so add to subtract; replicate the
+     * borrow input to produce 128-bit -1 for the addition.
+     */
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, cc_src);
+    tcg_gen_sub2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
+    tcg_temp_free_i64(zero);
 
-    tcg_gen_sub_i64(o->out, o->out, borrow);
-    tcg_temp_free_i64(borrow);
     return DISAS_NEXT;
 }
 
@@ -5307,16 +5325,6 @@ static void cout_subu64(DisasContext *s, DisasOps *o)
     gen_op_update2_cc_i64(s, CC_OP_SUBU, cc_src, o->out);
 }
 
-static void cout_subb32(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_SUBB_32, o->in1, o->in2, o->out);
-}
-
-static void cout_subb64(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_SUBB_64, o->in1, o->in2, o->out);
-}
-
 static void cout_tm32(DisasContext *s, DisasOps *o)
 {
     gen_op_update2_cc_i64(s, CC_OP_TM_32, o->in1, o->in2);
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 7ff3e7e517..26badb663a 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -916,10 +916,10 @@
     C(0xc205, SLFI,    RIL_a, EI,  r1_32u, i2_32u, new, r1_32, sub, subu32)
     C(0xc204, SLGFI,   RIL_a, EI,  r1, i2_32u, r1, 0, subu64, subu64)
 /* SUBTRACT LOGICAL WITH BORROW */
-    C(0xb999, SLBR,    RRE,   Z,   r1, r2, new, r1_32, subb, subb32)
-    C(0xb989, SLBGR,   RRE,   Z,   r1, r2, r1, 0, subb, subb64)
-    C(0xe399, SLB,     RXY_a, Z,   r1, m2_32u, new, r1_32, subb, subb32)
-    C(0xe389, SLBG,    RXY_a, Z,   r1, m2_64, r1, 0, subb, subb64)
+    C(0xb999, SLBR,    RRE,   Z,   r1_32u, r2_32u, new, r1_32, subb32, subu32)
+    C(0xb989, SLBGR,   RRE,   Z,   r1, r2, r1, 0, subb64, subu64)
+    C(0xe399, SLB,     RXY_a, Z,   r1_32u, m2_32u, new, r1_32, subb32, subu32)
+    C(0xe389, SLBG,    RXY_a, Z,   r1, m2_64, r1, 0, subb64, subu64)
 
 /* SUPERVISOR CALL */
     C(0x0a00, SVC,     I,     Z,   0, 0, 0, 0, svc, 0)
-- 
2.25.1


