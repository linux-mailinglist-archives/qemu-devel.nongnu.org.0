Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374AB2DA31A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:16:02 +0100 (CET)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kow8P-0001Ea-68
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6X-00007K-FZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:05 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6U-0004an-5T
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:05 -0500
Received: by mail-ot1-x341.google.com with SMTP id w3so17376166otp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2vyPK2fc+F5KGu2bjD5WehS57Sv6Ydyg5eJ0ydNqAE=;
 b=PGWQpq6+d7b2r+N97R9PnF2h8pUqPZaz9RXJRArVAM2ju6UsrnoRCUm6CeTmsr59/g
 Te4v+SUoP247nTISVrFeCmaB/PMv8Z8PCFoUyUeoR6LdwA5jM1uhjRIUbqgGitFt6rbX
 3w0nPzL0y4lItXAz3jy5Op2ThLCuW9zwOEUzil3fxJddHCbBOUm8hkFYZDOuCscrS1iB
 AGPhN57Wqeg0AA+Z5BAO4UexyA0e8AIm8tmKSYGDf34Cy3y9rVLYoSfpgvdOnXSIMUn1
 3Vg1eMrmvu6UExcoujEM70/1iDP844EGb9knmDc2gio/TmmNVczm2LmG9Juts0TUX7O/
 tj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2vyPK2fc+F5KGu2bjD5WehS57Sv6Ydyg5eJ0ydNqAE=;
 b=nnU7WghnGF5y4U1IY/DzDrQu6LsbQO1bUrmx8OsZYmM+2SDt/6qC5mt86Ce2tnfMfg
 J3OYoD7BDJP50aQHcvc3QYmtWP8m+sEswRkX8ARizGBSgCIHoi3VoDals2BZK2fkWntv
 xmp6hvYVNiW4P4omKGriT/xVaI4JnAH1wm0jSdESiuWGXnVy47hkzeMqncNW3k/SjsdP
 mU8crbFLbkdj8SwT0Ti9wlZ2esbqkl4exwD6oJlGrKgaTUjkrF+/JO4xNplggYgPKegV
 DlLg2pRNP4Admgy9Oi2TcnRc+yJQvnK1hW+ELr4USVMVKDlNF8nvOCTnPHieS4u7nliq
 BsJA==
X-Gm-Message-State: AOAM5309qPSIdZuHWXUxULY11cM10RmxE5qtDYeAfFW7XoY6ODt+j5SW
 5m8HXRXzS8IXX12dNh5u7o7qXrkuy+ROLBLN
X-Google-Smtp-Source: ABdhPJyFDk1h9b+sQrfWrtieh3r0KqGBXF2gyUNhk6//KZ7nAEgnnWXJ3Ta+BbQw68ubJnLPVm5b8A==
X-Received: by 2002:a05:6830:cf:: with SMTP id
 x15mr21140982oto.55.1607984040678; 
 Mon, 14 Dec 2020 14:14:00 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b71sm2193033oii.5.2020.12.14.14.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:14:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] target/s390x: Improve ADD LOGICAL WITH CARRY
Date: Mon, 14 Dec 2020 16:13:54 -0600
Message-Id: <20201214221356.68039-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214221356.68039-1-richard.henderson@linaro.org>
References: <20201214221356.68039-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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

Now that ADD LOGICAL outputs carry, we can use that as input directly.
It also means we can re-use CC_OP_ADDU and produce an output carry
directly from ADD LOGICAL WITH CARRY.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/internal.h    |  2 --
 target/s390x/cc_helper.c   | 26 ---------------
 target/s390x/helper.c      |  2 --
 target/s390x/translate.c   | 67 ++++++++++++++++++--------------------
 target/s390x/insn-data.def |  8 ++---
 5 files changed, 36 insertions(+), 69 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 55c5442102..f5f3ae063e 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -170,7 +170,6 @@ enum cc_op {
     CC_OP_LTGT0_64,             /* signed less/greater than 0 (64bit) */
 
     CC_OP_ADD_64,               /* overflow on add (64bit) */
-    CC_OP_ADDC_64,              /* overflow on unsigned add-carry (64bit) */
     CC_OP_SUB_64,               /* overflow on subtraction (64bit) */
     CC_OP_SUBU_64,              /* overflow on unsigned subtraction (64bit) */
     CC_OP_SUBB_64,              /* overflow on unsigned sub-borrow (64bit) */
@@ -179,7 +178,6 @@ enum cc_op {
     CC_OP_MULS_64,              /* overflow on signed multiply (64bit) */
 
     CC_OP_ADD_32,               /* overflow on add (32bit) */
-    CC_OP_ADDC_32,              /* overflow on unsigned add-carry (32bit) */
     CC_OP_SUB_32,               /* overflow on subtraction (32bit) */
     CC_OP_SUBU_32,              /* overflow on unsigned subtraction (32bit) */
     CC_OP_SUBB_32,              /* overflow on unsigned sub-borrow (32bit) */
diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index 59da4d1cc2..cd2c5c4b39 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -144,16 +144,6 @@ static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
     }
 }
 
-static uint32_t cc_calc_addc_64(uint64_t a1, uint64_t a2, uint64_t ar)
-{
-    /* Recover a2 + carry_in.  */
-    uint64_t a2c = ar - a1;
-    /* Check for a2+carry_in overflow, then a1+a2c overflow.  */
-    int carry_out = (a2c < a2) || (ar < a1);
-
-    return (ar != 0) + 2 * carry_out;
-}
-
 static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
 {
     if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
@@ -240,16 +230,6 @@ static uint32_t cc_calc_add_32(int32_t a1, int32_t a2, int32_t ar)
     }
 }
 
-static uint32_t cc_calc_addc_32(uint32_t a1, uint32_t a2, uint32_t ar)
-{
-    /* Recover a2 + carry_in.  */
-    uint32_t a2c = ar - a1;
-    /* Check for a2+carry_in overflow, then a1+a2c overflow.  */
-    int carry_out = (a2c < a2) || (ar < a1);
-
-    return (ar != 0) + 2 * carry_out;
-}
-
 static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
 {
     if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
@@ -485,9 +465,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_ADD_64:
         r =  cc_calc_add_64(src, dst, vr);
         break;
-    case CC_OP_ADDC_64:
-        r =  cc_calc_addc_64(src, dst, vr);
-        break;
     case CC_OP_SUB_64:
         r =  cc_calc_sub_64(src, dst, vr);
         break;
@@ -513,9 +490,6 @@ static uint32_t do_calc_cc(CPUS390XState *env, uint32_t cc_op,
     case CC_OP_ADD_32:
         r =  cc_calc_add_32(src, dst, vr);
         break;
-    case CC_OP_ADDC_32:
-        r =  cc_calc_addc_32(src, dst, vr);
-        break;
     case CC_OP_SUB_32:
         r =  cc_calc_sub_32(src, dst, vr);
         break;
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index db87a62a57..4f4561bc64 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -403,14 +403,12 @@ const char *cc_name(enum cc_op cc_op)
         [CC_OP_LTGT0_32]  = "CC_OP_LTGT0_32",
         [CC_OP_LTGT0_64]  = "CC_OP_LTGT0_64",
         [CC_OP_ADD_64]    = "CC_OP_ADD_64",
-        [CC_OP_ADDC_64]   = "CC_OP_ADDC_64",
         [CC_OP_SUB_64]    = "CC_OP_SUB_64",
         [CC_OP_SUBU_64]   = "CC_OP_SUBU_64",
         [CC_OP_SUBB_64]   = "CC_OP_SUBB_64",
         [CC_OP_ABS_64]    = "CC_OP_ABS_64",
         [CC_OP_NABS_64]   = "CC_OP_NABS_64",
         [CC_OP_ADD_32]    = "CC_OP_ADD_32",
-        [CC_OP_ADDC_32]   = "CC_OP_ADDC_32",
         [CC_OP_SUB_32]    = "CC_OP_SUB_32",
         [CC_OP_SUBU_32]   = "CC_OP_SUBU_32",
         [CC_OP_SUBB_32]   = "CC_OP_SUBB_32",
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index b473233edf..d1d97e4696 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -600,12 +600,10 @@ static void gen_op_calc_cc(DisasContext *s)
         dummy = tcg_const_i64(0);
         /* FALLTHRU */
     case CC_OP_ADD_64:
-    case CC_OP_ADDC_64:
     case CC_OP_SUB_64:
     case CC_OP_SUBU_64:
     case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
-    case CC_OP_ADDC_32:
     case CC_OP_SUB_32:
     case CC_OP_SUBU_32:
     case CC_OP_SUBB_32:
@@ -665,12 +663,10 @@ static void gen_op_calc_cc(DisasContext *s)
         gen_helper_calc_cc(cc_op, cpu_env, local_cc_op, cc_src, cc_dst, dummy);
         break;
     case CC_OP_ADD_64:
-    case CC_OP_ADDC_64:
     case CC_OP_SUB_64:
     case CC_OP_SUBU_64:
     case CC_OP_SUBB_64:
     case CC_OP_ADD_32:
-    case CC_OP_ADDC_32:
     case CC_OP_SUB_32:
     case CC_OP_SUBU_32:
     case CC_OP_SUBB_32:
@@ -1443,30 +1439,41 @@ static DisasJumpType op_addu64(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_addc(DisasContext *s, DisasOps *o)
+/* Compute carry into cc_src. */
+static void compute_carry(DisasContext *s)
 {
-    DisasCompare cmp;
-    TCGv_i64 carry;
-
-    tcg_gen_add_i64(o->out, o->in1, o->in2);
-
-    /* The carry flag is the msb of CC, therefore the branch mask that would
-       create that comparison is 3.  Feeding the generated comparison to
-       setcond produces the carry flag that we desire.  */
-    disas_jcc(s, &cmp, 3);
-    carry = tcg_temp_new_i64();
-    if (cmp.is_64) {
-        tcg_gen_setcond_i64(cmp.cond, carry, cmp.u.s64.a, cmp.u.s64.b);
-    } else {
-        TCGv_i32 t = tcg_temp_new_i32();
-        tcg_gen_setcond_i32(cmp.cond, t, cmp.u.s32.a, cmp.u.s32.b);
-        tcg_gen_extu_i32_i64(carry, t);
-        tcg_temp_free_i32(t);
+    switch (s->cc_op) {
+    case CC_OP_ADDU:
+        /* The carry value is already in cc_src (1,0). */
+        break;
+    default:
+        gen_op_calc_cc(s);
+        /* fall through */
+    case CC_OP_STATIC:
+        /* The carry flag is the msb of CC; compute into cc_src. */
+        tcg_gen_extu_i32_i64(cc_src, cc_op);
+        tcg_gen_shri_i64(cc_src, cc_src, 1);
+        break;
     }
-    free_compare(&cmp);
+}
+
+static DisasJumpType op_addc32(DisasContext *s, DisasOps *o)
+{
+    compute_carry(s);
+    tcg_gen_add_i64(o->out, o->in1, o->in2);
+    tcg_gen_add_i64(o->out, o->out, cc_src);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_addc64(DisasContext *s, DisasOps *o)
+{
+    compute_carry(s);
+
+    TCGv_i64 zero = tcg_const_i64(0);
+    tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, zero);
+    tcg_gen_add2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
+    tcg_temp_free_i64(zero);
 
-    tcg_gen_add_i64(o->out, o->out, carry);
-    tcg_temp_free_i64(carry);
     return DISAS_NEXT;
 }
 
@@ -5217,16 +5224,6 @@ static void cout_addu64(DisasContext *s, DisasOps *o)
     gen_op_update2_cc_i64(s, CC_OP_ADDU, cc_src, o->out);
 }
 
-static void cout_addc32(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_ADDC_32, o->in1, o->in2, o->out);
-}
-
-static void cout_addc64(DisasContext *s, DisasOps *o)
-{
-    gen_op_update3_cc_i64(s, CC_OP_ADDC_64, o->in1, o->in2, o->out);
-}
-
 static void cout_cmps32(DisasContext *s, DisasOps *o)
 {
     gen_op_update2_cc_i64(s, CC_OP_LTGT_32, o->in1, o->in2);
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 5461e6aa3b..e380723dcd 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -82,10 +82,10 @@
     C(0xcc0a, ALSIH,   RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, addu32)
     C(0xcc0b, ALSIHN,  RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, 0)
 /* ADD LOGICAL WITH CARRY */
-    C(0xb998, ALCR,    RRE,   Z,   r1, r2, new, r1_32, addc, addc32)
-    C(0xb988, ALCGR,   RRE,   Z,   r1, r2, r1, 0, addc, addc64)
-    C(0xe398, ALC,     RXY_a, Z,   r1, m2_32u, new, r1_32, addc, addc32)
-    C(0xe388, ALCG,    RXY_a, Z,   r1, m2_64, r1, 0, addc, addc64)
+    C(0xb998, ALCR,    RRE,   Z,   r1_32u, r2_32u, new, r1_32, addc32, addu32)
+    C(0xb988, ALCGR,   RRE,   Z,   r1, r2, r1, 0, addc64, addu64)
+    C(0xe398, ALC,     RXY_a, Z,   r1_32u, m2_32u, new, r1_32, addc32, addu32)
+    C(0xe388, ALCG,    RXY_a, Z,   r1, m2_64, r1, 0, addc64, addu64)
 
 /* AND */
     C(0x1400, NR,      RR_a,  Z,   r1, r2, new, r1_32, and, nz32)
-- 
2.25.1


