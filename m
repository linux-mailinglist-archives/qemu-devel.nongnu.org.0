Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D39350D63
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:03:47 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoYc-0005AS-9Q
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP2-0001TV-Pz
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:52 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2925)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP0-0004wA-FX
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249230; x=1648785230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sb9HQwUlnTEdf43ZvGgYaoLLM2CRu3faVQ9h1Ql8flg=;
 b=UZP8fxIiCC3B1u+KhfAAabf/UZQl0tj6h8Xx+RfY75oQYr8s3Oye7GMU
 lHtamgM1XRR8gcqLLlxvLKxFNIGiDzpY1Akpw143A9ZQ4rhlCbHAxGkq1
 u2KVHAVOZeaHNCB1yImJMldOQ3soCbv81ZHptk+7+mnBLD1fu6OIZQm43 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 073E41191; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/21] Hexagon (target/hexagon) add F2_sfinvsqrta
Date: Wed, 31 Mar 2021 22:53:25 -0500
Message-Id: <1617249213-22667-14-git-send-email-tsimpson@quicinc.com>
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

Rd32,Pe4 = sfinvsqrta(Rs32)
    Square root approx

The helper packs the 2 32-bit results into a 64-bit value,
and the fGEN_TCG override unpacks them into the proper results.

Test cases in tests/tcg/hexagon/multi_result.c
FP exception tests added to tests/tcg/hexagon/fpstuff.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c                 | 26 +++++++++++++++++++++++++-
 target/hexagon/arch.h                 |  1 +
 target/hexagon/gen_tcg.h              | 16 ++++++++++++++++
 target/hexagon/helper.h               |  1 +
 target/hexagon/imported/encode_pp.def |  1 +
 target/hexagon/imported/float.idef    | 16 ++++++++++++++++
 target/hexagon/op_helper.c            | 21 +++++++++++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 15 +++++++++++++++
 tests/tcg/hexagon/multi_result.c      | 29 +++++++++++++++++++++++++++++
 9 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 9396b93..e602a05 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -247,7 +247,7 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     int r_exp;
     int ret = 0;
     RsV = *Rs;
-    if (float32_is_infinity(RsV)) {
+    if (float32_is_any_nan(RsV)) {
         if (extract32(RsV, 22, 1) == 0) {
             float_raise(float_flag_invalid, fp_status);
         }
@@ -304,3 +304,27 @@ int arch_recip_lookup(int index)
     };
     return roundrom[index];
 };
+
+int arch_invsqrt_lookup(int index)
+{
+    index &= 0x7f;
+    const uint8_t roundrom[128] = {
+        0x069, 0x066, 0x063, 0x061, 0x05e, 0x05b, 0x059, 0x057,
+        0x054, 0x052, 0x050, 0x04d, 0x04b, 0x049, 0x047, 0x045,
+        0x043, 0x041, 0x03f, 0x03d, 0x03b, 0x039, 0x037, 0x036,
+        0x034, 0x032, 0x030, 0x02f, 0x02d, 0x02c, 0x02a, 0x028,
+        0x027, 0x025, 0x024, 0x022, 0x021, 0x01f, 0x01e, 0x01d,
+        0x01b, 0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x012,
+        0x011, 0x010, 0x00f, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
+        0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x001,
+        0x0fe, 0x0fa, 0x0f6, 0x0f3, 0x0ef, 0x0eb, 0x0e8, 0x0e4,
+        0x0e1, 0x0de, 0x0db, 0x0d7, 0x0d4, 0x0d1, 0x0ce, 0x0cb,
+        0x0c9, 0x0c6, 0x0c3, 0x0c0, 0x0be, 0x0bb, 0x0b8, 0x0b6,
+        0x0b3, 0x0b1, 0x0af, 0x0ac, 0x0aa, 0x0a8, 0x0a5, 0x0a3,
+        0x0a1, 0x09f, 0x09d, 0x09b, 0x099, 0x097, 0x095, 0x093,
+        0x091, 0x08f, 0x08d, 0x08b, 0x089, 0x087, 0x086, 0x084,
+        0x082, 0x080, 0x07f, 0x07d, 0x07b, 0x07a, 0x078, 0x077,
+        0x075, 0x074, 0x072, 0x071, 0x06f, 0x06e, 0x06c, 0x06b,
+    };
+    return roundrom[index];
+};
diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index a25d8eb..544288e 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -30,5 +30,6 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
 int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
                           float_status *fp_status);
 int arch_recip_lookup(int index);
+int arch_invsqrt_lookup(int index);
 
 #endif
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 428a670..d78e7b8 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -216,6 +216,22 @@
         tcg_temp_free_i64(tmp); \
     } while (0)
 
+/*
+ * Approximation of the reciprocal square root
+ * r1,p0 = sfinvsqrta(r0)
+ *
+ * The helper packs the 2 32-bit results into a 64-bit value,
+ * so unpack them into the proper results.
+ */
+#define fGEN_TCG_F2_sfinvsqrta(SHORTCODE) \
+    do { \
+        TCGv_i64 tmp = tcg_temp_new_i64(); \
+        gen_helper_sfinvsqrta(tmp, cpu_env, RsV); \
+        tcg_gen_extrh_i64_i32(RdV, tmp); \
+        tcg_gen_extrl_i64_i32(PeV, tmp); \
+        tcg_temp_free_i64(tmp); \
+    } while (0)
+
 /* Floating point */
 #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
     gen_helper_conv_sf2df(RddV, cpu_env, RsV)
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index 214afde..fa5da7f 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -27,6 +27,7 @@ DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
 DEF_HELPER_3(sfrecipa, i64, env, f32, f32)
+DEF_HELPER_2(sfinvsqrta, i64, env, f32)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index b01b4d7..18fe45d 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1642,6 +1642,7 @@ SH2_RR_ENC(F2_conv_sf2w,          "1011","100","-","000","ddddd")
 SH2_RR_ENC(F2_conv_sf2uw_chop,    "1011","011","-","001","ddddd")
 SH2_RR_ENC(F2_conv_sf2w_chop,     "1011","100","-","001","ddddd")
 SH2_RR_ENC(F2_sffixupr,           "1011","101","-","000","ddddd")
+SH2_RR_ENC(F2_sfinvsqrta,         "1011","111","-","0ee","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S2op"      1100 -------- PP------ --------","[#12] Rd=(Rs,#u6)")
diff --git a/target/hexagon/imported/float.idef b/target/hexagon/imported/float.idef
index eb54158..3e75bc4 100644
--- a/target/hexagon/imported/float.idef
+++ b/target/hexagon/imported/float.idef
@@ -178,6 +178,22 @@ Q6INSN(F2_sffixupd,"Rd32=sffixupd(Rs32,Rt32)",ATTRIBS(),
     RdV = RtV;
 })
 
+Q6INSN(F2_sfinvsqrta,"Rd32,Pe4=sfinvsqrta(Rs32)",ATTRIBS(),
+"Reciprocal Square Root Approximation",
+{
+    fHIDE(int idx;)
+    fHIDE(int adjust;)
+    fHIDE(int mant;)
+    fHIDE(int exp;)
+    if (fSF_INVSQRT_COMMON(RsV,RdV,adjust)) {
+        PeV = adjust;
+        idx = (RsV >> 17) & 0x7f;
+        mant = (fSF_INVSQRT_LOOKUP(idx) << 15);
+        exp = fSF_BIAS() - ((fSF_GETEXP(RsV) - fSF_BIAS()) >> 1) - 1;
+        RdV = fMAKESF(fGETBIT(31,RsV),exp,mant);
+    }
+})
+
 Q6INSN(F2_sffixupr,"Rd32=sffixupr(Rs32)",ATTRIBS(),
 "Fix Up Radicand",
 {
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index d513f1b..11a51b21 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -332,6 +332,27 @@ uint64_t HELPER(sfrecipa)(CPUHexagonState *env, float32 RsV, float32 RtV)
     return ((uint64_t)RdV << 32) | PeV;
 }
 
+uint64_t HELPER(sfinvsqrta)(CPUHexagonState *env, float32 RsV)
+{
+    int PeV = 0;
+    float32 RdV;
+    int idx;
+    int adjust;
+    int mant;
+    int exp;
+
+    arch_fpop_start(env);
+    if (arch_sf_invsqrt_common(&RsV, &RdV, &adjust, &env->fp_status)) {
+        PeV = adjust;
+        idx = (RsV >> 17) & 0x7f;
+        mant = (arch_invsqrt_lookup(idx) << 15);
+        exp = SF_BIAS - ((float32_getexp(RsV) - SF_BIAS) >> 1) - 1;
+        RdV = build_float32(extract32(RsV, 31, 1), exp, mant);
+    }
+    arch_fpop_end(env);
+    return ((uint64_t)RdV << 32) | PeV;
+}
+
 /*
  * mem_noshuf
  * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
index 8e3ba78..0dff429 100644
--- a/tests/tcg/hexagon/fpstuff.c
+++ b/tests/tcg/hexagon/fpstuff.c
@@ -441,6 +441,20 @@ static void check_canonical_NaN(void)
     check_fpstatus(usr, 0);
 }
 
+static void check_invsqrta(void)
+{
+    int result;
+    int predval;
+
+    asm volatile("%0,p0 = sfinvsqrta(%2)\n\t"
+                 "%1 = p0\n\t"
+                 : "+r"(result), "=r"(predval)
+                 : "r"(0x7f800000)
+                 : "p0");
+    check32(result, 0xff800000);
+    check32(predval, 0x0);
+}
+
 static void check_float2int_convs()
 {
     int res32;
@@ -590,6 +604,7 @@ int main()
     check_dfminmax();
     check_recip_exception();
     check_canonical_NaN();
+    check_invsqrta();
     check_float2int_convs();
 
     puts(err ? "FAIL" : "PASS");
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
index cb7dd31..67aa462 100644
--- a/tests/tcg/hexagon/multi_result.c
+++ b/tests/tcg/hexagon/multi_result.c
@@ -31,6 +31,20 @@ static int sfrecipa(int Rs, int Rt, int *pred_result)
   return result;
 }
 
+static int sfinvsqrta(int Rs, int *pred_result)
+{
+  int result;
+  int predval;
+
+  asm volatile("%0,p0 = sfinvsqrta(%2)\n\t"
+               "%1 = p0\n\t"
+               : "+r"(result), "=r"(predval)
+               : "r"(Rs)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
 int err;
 
 static void check(int val, int expect)
@@ -59,9 +73,24 @@ static void test_sfrecipa()
     check_p(pred_result, 0x00);
 }
 
+static void test_sfinvsqrta()
+{
+    int res;
+    int pred_result;
+
+    res = sfinvsqrta(0x04030201, &pred_result);
+    check(res, 0x4d330000);
+    check_p(pred_result, 0xe0);
+
+    res = sfinvsqrta(0x0, &pred_result);
+    check(res, 0x3f800000);
+    check_p(pred_result, 0x0);
+}
+
 int main()
 {
     test_sfrecipa();
+    test_sfinvsqrta();
 
     puts(err ? "FAIL" : "PASS");
     return err;
-- 
2.7.4


