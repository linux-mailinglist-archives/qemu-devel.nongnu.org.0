Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88B350D66
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:03:57 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoYm-0005Xt-QM
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP9-0001iK-Ay
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:54:02 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2906)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP5-0004rm-I1
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249235; x=1648785235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xYUFnxmKmHOAsZzYjwOnVfl+LHx/88iRTv4+GxBYrE=;
 b=M1mhRmXORAaZgGK0sgltgw9nA+trcn5GMReGtnU3w/XSf4e+FjxEyL0y
 z0WusUS3FWU86vaP3PR7R5CtUa64QW5zBQwY3dDnpR/1m7CuiAPpFUBHZ
 Kc/hp2w0G8mS6iP7Avm1fyccyuTXwJnb6Zfym3oxXsGfTSI5L4o1ytBIy I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 07E121713; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa instruction
Date: Wed, 31 Mar 2021 22:53:24 -0500
Message-Id: <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rd32,Pe4 = sfrecipa(Rs32, Rt32)
    Recripocal approx

Test cases in tests/tcg/hexagon/multi_result.c
FP exception tests added to tests/tcg/hexagon/fpstuff.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c                 | 31 +++++++++++--
 target/hexagon/arch.h                 |  1 +
 target/hexagon/gen_tcg.h              | 21 +++++++++
 target/hexagon/helper.h               |  1 +
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/imported/float.idef    | 16 +++++++
 target/hexagon/op_helper.c            | 37 ++++++++++++++++
 tests/tcg/hexagon/Makefile.target     |  1 +
 tests/tcg/hexagon/fpstuff.c           | 82 +++++++++++++++++++++++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 68 +++++++++++++++++++++++++++++
 10 files changed, 256 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/hexagon/multi_result.c

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 40b6e3d..9396b93 100644
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
@@ -279,3 +280,27 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     *adjust = PeV;
     return ret;
 }
+
+int arch_recip_lookup(int index)
+{
+    index &= 0x7f;
+    const uint8_t roundrom[128] = {
+        0x0fe, 0x0fa, 0x0f6, 0x0f2, 0x0ef, 0x0eb, 0x0e7, 0x0e4,
+        0x0e0, 0x0dd, 0x0d9, 0x0d6, 0x0d2, 0x0cf, 0x0cc, 0x0c9,
+        0x0c6, 0x0c2, 0x0bf, 0x0bc, 0x0b9, 0x0b6, 0x0b3, 0x0b1,
+        0x0ae, 0x0ab, 0x0a8, 0x0a5, 0x0a3, 0x0a0, 0x09d, 0x09b,
+        0x098, 0x096, 0x093, 0x091, 0x08e, 0x08c, 0x08a, 0x087,
+        0x085, 0x083, 0x080, 0x07e, 0x07c, 0x07a, 0x078, 0x075,
+        0x073, 0x071, 0x06f, 0x06d, 0x06b, 0x069, 0x067, 0x065,
+        0x063, 0x061, 0x05f, 0x05e, 0x05c, 0x05a, 0x058, 0x056,
+        0x054, 0x053, 0x051, 0x04f, 0x04e, 0x04c, 0x04a, 0x049,
+        0x047, 0x045, 0x044, 0x042, 0x040, 0x03f, 0x03d, 0x03c,
+        0x03a, 0x039, 0x037, 0x036, 0x034, 0x033, 0x032, 0x030,
+        0x02f, 0x02d, 0x02c, 0x02b, 0x029, 0x028, 0x027, 0x025,
+        0x024, 0x023, 0x021, 0x020, 0x01f, 0x01e, 0x01c, 0x01b,
+        0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x013, 0x012,
+        0x011, 0x00f, 0x00e, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
+        0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x000,
+    };
+    return roundrom[index];
+};
diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 6e0b0d9..a25d8eb 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -29,5 +29,6 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
                          int *adjust, float_status *fp_status);
 int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
                           float_status *fp_status);
+int arch_recip_lookup(int index);
 
 #endif
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index a30048e..428a670 100644
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
index 715c246..214afde 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -26,6 +26,7 @@ DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 #endif
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
+DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index c21cb73..b01b4d7 100644
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
index 76cecfe..eb54158 100644
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
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index b70c5d6..d513f1b 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -295,6 +295,43 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
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
+        mant = (arch_recip_lookup(idx) << 15) | 1;
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
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 616af69..18218ad 100644
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
diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
index 6b60f92..8e3ba78 100644
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
index 0000000..cb7dd31
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
-- 
2.7.4


