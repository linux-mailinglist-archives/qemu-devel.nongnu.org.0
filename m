Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D03708AE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:08:57 +0200 (CEST)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuz2-00064Y-RF
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuau-0008UV-F6
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:00 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuab-0000A4-0a
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q9so822090pgl.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4SeN9caAs4ApLwIeYye38SRE5dxFExcRolPRumS0f5k=;
 b=tWHfO4IL0g6TC581QNhADS4Ht95Re/H9QmAzscUrgphqCUpyl4xB64iDUhwmgGizcq
 oEoLXZpbglsi2a+KhbEETQ6l30MaKKogwo9F4qRwWKsrDe9ZsreDOoKDYDVjnAck9PSG
 UjBd5V+KENyh4L574ULhBajUvKQwiWVrONYF5UVXK6xrWh8SQwmA+ITuQejDkMczQPTS
 9YbpCNGG5UobFpi1ll+l0QqaJ7t09pLIFPsQyMIzb4MnwDdOcH4peelGcetgERiQuAT7
 g0nS9APQltTU3KbKGVK/bk/a3MNRYt1mj6Ccb1xLAnFiR8JE9JvtTo6UESNE/X/rD0bB
 ePgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4SeN9caAs4ApLwIeYye38SRE5dxFExcRolPRumS0f5k=;
 b=Xoemgf7s1hipSQ9WV3iOaJ7utHxQSpvtsPDPBTb8HBTnJho9wHtiR8wzqnyEJFdt+3
 yDIyDbjbQt+B/ep1k/wbyqE4Y5Qe77lgUlCw9FVY4lQvc33mA8Vr/GS/jhWEw9vCuHBL
 xNrS2yx0F8KASFceJbN4KqzUhvfUIoaBOhGRNh2M7vLOn47rBFWGsQvUh+TH5jyH/In5
 YUQymXdNPoBKIdSAz7aahsJmBNt02Hnc6D6ZzRkVUl0bVsADVu//GR2QiVaSAXXxlUq9
 qyW6TCZ04L3JcIPtuETsS5Toh5i7EFY+W6rLW8+atpHdX1riurVeixcWb5ixGuasHTnB
 TfEQ==
X-Gm-Message-State: AOAM530TQ8Nr+CWbfb2UJhownGfTYx/+WFWueyxdDB2K+g9xLtSEc8K3
 TB94/k+jrCIRaDU8tJdVxnSSyDb03ST0KA==
X-Google-Smtp-Source: ABdhPJyVVzj3I3Im/S8m1zxDXotktIDWmbRRqbPATvnpHg6/80AzKp86IvOE8EpHHffKhG7qe2B8iw==
X-Received: by 2002:a05:6a00:1a54:b029:278:e0f7:919d with SMTP id
 h20-20020a056a001a54b0290278e0f7919dmr11183527pfv.52.1619894619518; 
 Sat, 01 May 2021 11:43:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/31] Hexagon (target/hexagon) add F2_sfrecipa instruction
Date: Sat,  1 May 2021 11:43:15 -0700
Message-Id: <20210501184324.1338186-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Rd32,Pe4 = sfrecipa(Rs32, Rt32)
    Recripocal approx

Test cases in tests/tcg/hexagon/multi_result.c
FP exception tests added to tests/tcg/hexagon/fpstuff.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-18-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.h                 |  2 +
 target/hexagon/gen_tcg.h              | 21 +++++++
 target/hexagon/helper.h               |  1 +
 target/hexagon/arch.c                 | 26 ++++++++-
 target/hexagon/op_helper.c            | 37 ++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 82 +++++++++++++++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 68 ++++++++++++++++++++++
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/imported/float.idef    | 16 ++++++
 tests/tcg/hexagon/Makefile.target     |  1 +
 10 files changed, 252 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/hexagon/multi_result.c

diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 6e0b0d9a24..b6634e9615 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -30,4 +30,6 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
 int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
                           float_status *fp_status);
 
+extern const uint8_t recip_lookup_table[128];
+
 #endif
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index a30048ee57..428a670281 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -195,6 +195,27 @@
 #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
     do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
 
+/*
+ * Mathematical operations with more than one definition require
+ * special handling
+ */
+
+/*
+ * Approximate reciprocal
+ * r3,p1 = sfrecipa(r0, r1)
+ *
+ * The helper packs the 2 32-bit results into a 64-bit value,
+ * so unpack them into the proper results.
+ */
+#define fGEN_TCG_F2_sfrecipa(SHORTCODE) \
+    do { \
+        TCGv_i64 tmp = tcg_temp_new_i64(); \
+        gen_helper_sfrecipa(tmp, cpu_env, RsV, RtV);  \
+        tcg_gen_extrh_i64_i32(RdV, tmp); \
+        tcg_gen_extrl_i64_i32(PeV, tmp); \
+        tcg_temp_free_i64(tmp); \
+    } while (0)
+
 /* Floating point */
 #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
     gen_helper_conv_sf2df(RddV, cpu_env, RsV)
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index efe6069118..b377293dd3 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -24,6 +24,7 @@ DEF_HELPER_FLAGS_3(debug_check_store_width, TCG_CALL_NO_WG, void, env, int, int)
 DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
+DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 40b6e3d0c0..46edf45b13 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -181,12 +181,13 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
         /* or put Inf in num fixup? */
         uint8_t RsV_sign = float32_is_neg(RsV);
         uint8_t RtV_sign = float32_is_neg(RtV);
+        /* Check that RsV is NOT infinite before we overwrite it */
+        if (!float32_is_infinity(RsV)) {
+            float_raise(float_flag_divbyzero, fp_status);
+        }
         RsV = infinite_float32(RsV_sign ^ RtV_sign);
         RtV = float32_one;
         RdV = float32_one;
-        if (float32_is_infinity(RsV)) {
-            float_raise(float_flag_divbyzero, fp_status);
-        }
     } else if (float32_is_infinity(RtV)) {
         RsV = make_float32(0x80000000 & (RsV ^ RtV));
         RtV = float32_one;
@@ -279,3 +280,22 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     *adjust = PeV;
     return ret;
 }
+
+const uint8_t recip_lookup_table[128] = {
+    0x0fe, 0x0fa, 0x0f6, 0x0f2, 0x0ef, 0x0eb, 0x0e7, 0x0e4,
+    0x0e0, 0x0dd, 0x0d9, 0x0d6, 0x0d2, 0x0cf, 0x0cc, 0x0c9,
+    0x0c6, 0x0c2, 0x0bf, 0x0bc, 0x0b9, 0x0b6, 0x0b3, 0x0b1,
+    0x0ae, 0x0ab, 0x0a8, 0x0a5, 0x0a3, 0x0a0, 0x09d, 0x09b,
+    0x098, 0x096, 0x093, 0x091, 0x08e, 0x08c, 0x08a, 0x087,
+    0x085, 0x083, 0x080, 0x07e, 0x07c, 0x07a, 0x078, 0x075,
+    0x073, 0x071, 0x06f, 0x06d, 0x06b, 0x069, 0x067, 0x065,
+    0x063, 0x061, 0x05f, 0x05e, 0x05c, 0x05a, 0x058, 0x056,
+    0x054, 0x053, 0x051, 0x04f, 0x04e, 0x04c, 0x04a, 0x049,
+    0x047, 0x045, 0x044, 0x042, 0x040, 0x03f, 0x03d, 0x03c,
+    0x03a, 0x039, 0x037, 0x036, 0x034, 0x033, 0x032, 0x030,
+    0x02f, 0x02d, 0x02c, 0x02b, 0x029, 0x028, 0x027, 0x025,
+    0x024, 0x023, 0x021, 0x020, 0x01f, 0x01e, 0x01c, 0x01b,
+    0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x013, 0x012,
+    0x011, 0x00f, 0x00e, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
+    0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x000,
+};
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 33b67138ca..75861e26c4 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -289,6 +289,43 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
     return new_ptr;
 }
 
+static float32 build_float32(uint8_t sign, uint32_t exp, uint32_t mant)
+{
+    return make_float32(
+        ((sign & 1) << 31) |
+        ((exp & 0xff) << SF_MANTBITS) |
+        (mant & ((1 << SF_MANTBITS) - 1)));
+}
+
+/*
+ * sfrecipa, sfinvsqrta have two 32-bit results
+ *     r0,p0=sfrecipa(r1,r2)
+ *     r0,p0=sfinvsqrta(r1)
+ *
+ * Since helpers can only return a single value, we pack the two results
+ * into a 64-bit value.
+ */
+uint64_t HELPER(sfrecipa)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int32_t PeV = 0;
+    float32 RdV;
+    int idx;
+    int adjust;
+    int mant;
+    int exp;
+
+    arch_fpop_start(env);
+    if (arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status)) {
+        PeV = adjust;
+        idx = (RtV >> 16) & 0x7f;
+        mant = (recip_lookup_table[idx] << 15) | 1;
+        exp = SF_BIAS - (float32_getexp(RtV) - SF_BIAS) - 1;
+        RdV = build_float32(extract32(RtV, 31, 1), exp, mant);
+    }
+    arch_fpop_end(env);
+    return ((uint64_t)RdV << 32) | PeV;
+}
+
 /*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
index 6b60f92d18..8e3ba780d2 100644
--- a/tests/tcg/hexagon/fpstuff.c
+++ b/tests/tcg/hexagon/fpstuff.c
@@ -250,6 +250,87 @@ static void check_dfminmax(void)
     check_fpstatus(usr, FPINVF);
 }
 
+static void check_recip_exception(void)
+{
+    int result;
+    int usr;
+
+    /*
+     * Check that sfrecipa doesn't set status bits when
+     * a NaN with bit 22 non-zero is passed
+     */
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_NaN), "r"(SF_ANY)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_ANY), "r"(SF_NaN)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %2)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_NaN)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, 0);
+
+    /*
+     * Check that sfrecipa doesn't set status bits when
+     * a NaN with bit 22 zero is passed
+     */
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_NaN_special), "r"(SF_ANY)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, FPINVF);
+
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_ANY), "r"(SF_NaN_special)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, FPINVF);
+
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %2)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(SF_NaN_special)
+         : "r2", "p0", "usr");
+    check32(result, SF_HEX_NAN);
+    check_fpstatus(usr, FPINVF);
+
+    /*
+     * Check that sfrecipa properly sets divid-by-zero
+     */
+        asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(0x885dc960), "r"(0x80000000)
+         : "r2", "p0", "usr");
+    check32(result, 0x3f800000);
+    check_fpstatus(usr, FPDBZF);
+
+    asm (CLEAR_FPSTATUS
+         "%0,p0 = sfrecipa(%2, %3)\n\t"
+         "%1 = usr\n\t"
+         : "=r"(result), "=r"(usr) : "r"(0x7f800000), "r"(SF_ZERO)
+         : "r2", "p0", "usr");
+    check32(result, 0x3f800000);
+    check_fpstatus(usr, 0);
+}
+
 static void check_canonical_NaN(void)
 {
     int sf_result;
@@ -507,6 +588,7 @@ int main()
     check_compare_exception();
     check_sfminmax();
     check_dfminmax();
+    check_recip_exception();
     check_canonical_NaN();
     check_float2int_convs();
 
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
new file mode 100644
index 0000000000..cb7dd313d4
--- /dev/null
+++ b/tests/tcg/hexagon/multi_result.c
@@ -0,0 +1,68 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+
+static int sfrecipa(int Rs, int Rt, int *pred_result)
+{
+  int result;
+  int predval;
+
+  asm volatile("%0,p0 = sfrecipa(%2, %3)\n\t"
+               "%1 = p0\n\t"
+               : "+r"(result), "=r"(predval)
+               : "r"(Rs), "r"(Rt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+int err;
+
+static void check(int val, int expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%08x != 0x%08x\n", val, expect);
+        err++;
+    }
+}
+
+static void check_p(int val, int expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%02x != 0x%02x\n", val, expect);
+        err++;
+    }
+}
+
+static void test_sfrecipa()
+{
+    int res;
+    int pred_result;
+
+    res = sfrecipa(0x04030201, 0x05060708, &pred_result);
+    check(res, 0x59f38001);
+    check_p(pred_result, 0x00);
+}
+
+int main()
+{
+    test_sfrecipa();
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index c21cb730af..b01b4d7aa7 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1028,6 +1028,7 @@ MPY_ENC(F2_sfmin,            "1011","ddddd","0","0","0","1","01")
 MPY_ENC(F2_sfmpy,            "1011","ddddd","0","0","1","0","00")
 MPY_ENC(F2_sffixupn,         "1011","ddddd","0","0","1","1","00")
 MPY_ENC(F2_sffixupd,         "1011","ddddd","0","0","1","1","01")
+MPY_ENC(F2_sfrecipa,         "1011","ddddd","1","1","1","1","ee")
 
 DEF_FIELDROW_DESC32(ICLASS_M" 1100 -------- PP------ --------","[#12] Rd=(Rs,Rt)")
 DEF_FIELD32(ICLASS_M"         1100 -------- PP------ --!-----",Mc_tH,"Rt is High") /*Rt high */
diff --git a/target/hexagon/imported/float.idef b/target/hexagon/imported/float.idef
index 76cecfebf5..eb5415801a 100644
--- a/target/hexagon/imported/float.idef
+++ b/target/hexagon/imported/float.idef
@@ -146,6 +146,22 @@ Q6INSN(F2_sfimm_n,"Rd32=sfmake(#u10):neg",ATTRIBS(),
 })
 
 
+Q6INSN(F2_sfrecipa,"Rd32,Pe4=sfrecipa(Rs32,Rt32)",ATTRIBS(),
+"Reciprocal Approximation for Division",
+{
+    fHIDE(int idx;)
+    fHIDE(int adjust;)
+    fHIDE(int mant;)
+    fHIDE(int exp;)
+    if (fSF_RECIP_COMMON(RsV,RtV,RdV,adjust)) {
+        PeV = adjust;
+        idx = (RtV >> 16) & 0x7f;
+        mant = (fSF_RECIP_LOOKUP(idx) << 15) | 1;
+        exp = fSF_BIAS() - (fSF_GETEXP(RtV) - fSF_BIAS()) - 1;
+        RdV = fMAKESF(fGETBIT(31,RtV),exp,mant);
+    }
+})
+
 Q6INSN(F2_sffixupn,"Rd32=sffixupn(Rs32,Rt32)",ATTRIBS(),
 "Fix Up Numerator",
 {
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 616af697fe..18218ad05a 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -39,6 +39,7 @@ HEX_TESTS = first
 HEX_TESTS += misc
 HEX_TESTS += preg_alias
 HEX_TESTS += dual_stores
+HEX_TESTS += multi_result
 HEX_TESTS += mem_noshuf
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
-- 
2.25.1


