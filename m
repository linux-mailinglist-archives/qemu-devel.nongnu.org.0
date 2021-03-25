Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3E348762
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:14:53 +0100 (CET)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGSS-0003Sn-QG
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG56-0003bs-BB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22812)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4y-0002dD-Fs
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640636; x=1648176636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=txk2LVHnaZQSu2qcyZtZZZkfa4yk1+GdGPNXwmWpg2Y=;
 b=aUrU14abM4XLDVVWqEFIqQvNH4XlYPNXo/05DWMH5Prk4AqyZynidmlO
 5kRtp5EnI4FHQkAJZvSQsPIIVGHz9WsI4zr1AtEuS6SdBjSdrzWUxKnNU
 /eXkwzPGD3xpj9z4ZS3Mz0o+k93XyP3xSiUaZ2X9Hhno8ghzHOFO3765Q A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 19:50:14 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0EAA31713; Wed, 24 Mar 2021 21:50:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] Hexagon (target/hexagon) instructions with multiple
 definitions
Date: Wed, 24 Mar 2021 21:50:05 -0500
Message-Id: <1616640610-17319-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
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

Instructions with multiple definitions require special handling
because the generator wants to create a helper, but helpers can
only return a single result.  Therefore, we must override the
generated code.

The following instructions are added
    A4_addp_c        Rdd32 = add(Rss32, Rtt32, Px4):carry
                         Add with carry
    A4_subp_c        Rdd32 = sub(Rss32, Rtt32, Px4):carry
                         Sub with carry
    A5_ACS           Rxx32,Pe4 = vacsh(Rss32, Rtt32)
                         Add compare and select elements of two vectors
    A6_vminub_RdP    Rdd32,Pe4 = vminub(Rtt32, Rss32)
                         Vector min of bytes
    F2_invsqrta      Rd32,Pe4 = sfinvsqrta(Rs32)
                         Square root approx
    F2_sfrecipa      Rd32,Pe4 = sfrecipa(Rs32, Rt32)
                         Recripocal approx

Test cases in tests/tcg/hexagon/multi_result.c
FP exception tests added to tests/tcg/hexagon/fpstuff.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c                 |  57 +++++++-
 target/hexagon/arch.h                 |   2 +
 target/hexagon/gen_tcg.h              | 107 +++++++++++++++
 target/hexagon/genptr.c               | 111 +++++++++++++++
 target/hexagon/helper.h               |   6 +
 target/hexagon/imported/alu.idef      |  44 ++++++
 target/hexagon/imported/encode_pp.def |   6 +
 target/hexagon/imported/float.idef    |  32 +++++
 target/hexagon/macros.h               |  41 ++++++
 target/hexagon/op_helper.c            | 130 ++++++++++++++++++
 tests/tcg/hexagon/Makefile.target     |   1 +
 tests/tcg/hexagon/fpstuff.c           |  97 +++++++++++++
 tests/tcg/hexagon/multi_result.c      | 249 ++++++++++++++++++++++++++++++++++
 13 files changed, 879 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/hexagon/multi_result.c

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 40b6e3d..d756dfa 100644
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
@@ -246,7 +247,7 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     int r_exp;
     int ret = 0;
     RsV = *Rs;
-    if (float32_is_infinity(RsV)) {
+    if (float32_is_any_nan(RsV)) {
         if (extract32(RsV, 22, 1) == 0) {
             float_raise(float_flag_invalid, fp_status);
         }
@@ -279,3 +280,51 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
     *adjust = PeV;
     return ret;
 }
+
+int arch_recip_lookup(int index)
+{
+    index &= 0x7f;
+    unsigned const int roundrom[128] = {
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
+
+int arch_invsqrt_lookup(int index)
+{
+    index &= 0x7f;
+    unsigned const int roundrom[128] = {
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
index 6e0b0d9..544288e 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -29,5 +29,7 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
                          int *adjust, float_status *fp_status);
 int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
                           float_status *fp_status);
+int arch_recip_lookup(int index);
+int arch_invsqrt_lookup(int index);
 
 #endif
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index a30048e..0b2c2ca 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -195,6 +195,113 @@
 #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
     do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
 
+/*
+ * Mathematical operations with more than one definition require
+ * special handling
+ */
+#define fGEN_TCG_A5_ACS(SHORTCODE) \
+    do { \
+        gen_helper_vacsh_val(RxxV, cpu_env, RxxV, RssV, RttV); \
+        gen_helper_vacsh_pred(PeV, cpu_env, RxxV, RssV, RttV); \
+    } while (0)
+
+/*
+ * Approximate reciprocal
+ * r3,p1 = sfrecipa(r0, r1)
+ */
+#define fGEN_TCG_F2_sfrecipa(SHORTCODE) \
+    do { \
+        gen_helper_sfrecipa_val(RdV, cpu_env, RsV, RtV);  \
+        gen_helper_sfrecipa_pred(PeV, cpu_env, RsV, RtV);  \
+    } while (0)
+
+/*
+ * Approximation of the reciprocal square root
+ * r1,p0 = sfinvsqrta(r0)
+ */
+#define fGEN_TCG_F2_sfinvsqrta(SHORTCODE) \
+    do { \
+        gen_helper_sfinvsqrta_val(RdV, cpu_env, RsV); \
+        gen_helper_sfinvsqrta_pred(PeV, cpu_env, RsV); \
+    } while (0)
+
+/*
+ * Add or subtract with carry.
+ * Predicate register is used as an extra input and output.
+ * r5:4 = add(r1:0, r3:2, p1):carry
+ */
+#define fGEN_TCG_A4_addp_c(SHORTCODE) \
+    do { \
+        TCGv LSB = tcg_temp_new(); \
+        TCGv_i64 LSB_i64 = tcg_temp_new_i64(); \
+        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
+        TCGv tmp = tcg_temp_new(); \
+        tcg_gen_add_i64(RddV, RssV, RttV); \
+        fLSBOLD(PxV); \
+        tcg_gen_extu_i32_i64(LSB_i64, LSB); \
+        tcg_gen_add_i64(RddV, RddV, LSB_i64); \
+        gen_carry_from_add64(tmp_i64, RssV, RttV, LSB_i64); \
+        tcg_gen_extrl_i64_i32(tmp, tmp_i64); \
+        f8BITSOF(PxV, tmp); \
+        tcg_temp_free(LSB); \
+        tcg_temp_free_i64(LSB_i64); \
+        tcg_temp_free_i64(tmp_i64); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
+/* r5:4 = sub(r1:0, r3:2, p1):carry */
+#define fGEN_TCG_A4_subp_c(SHORTCODE) \
+    do { \
+        TCGv LSB = tcg_temp_new(); \
+        TCGv_i64 LSB_i64 = tcg_temp_new_i64(); \
+        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
+        TCGv tmp = tcg_temp_new(); \
+        tcg_gen_not_i64(tmp_i64, RttV); \
+        tcg_gen_add_i64(RddV, RssV, tmp_i64); \
+        fLSBOLD(PxV); \
+        tcg_gen_extu_i32_i64(LSB_i64, LSB); \
+        tcg_gen_add_i64(RddV, RddV, LSB_i64); \
+        gen_carry_from_add64(tmp_i64, RssV, tmp_i64, LSB_i64); \
+        tcg_gen_extrl_i64_i32(tmp, tmp_i64); \
+        f8BITSOF(PxV, tmp); \
+        tcg_temp_free(LSB); \
+        tcg_temp_free_i64(LSB_i64); \
+        tcg_temp_free_i64(tmp_i64); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
+/*
+ * Compare each of the 8 unsigned bytes
+ * The minimum is placed in each byte of the destination.
+ * Each bit of the predicate is set true if the bit from the first operand
+ * is greater than the bit from the second operand.
+ * r5:4,p1 = vminub(r1:0, r3:2)
+ */
+#define fGEN_TCG_A6_vminub_RdP(SHORTCODE) \
+    do { \
+        TCGv BYTE = tcg_temp_new(); \
+        TCGv left = tcg_temp_new(); \
+        TCGv right = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        int i; \
+        tcg_gen_movi_tl(PeV, 0); \
+        tcg_gen_movi_i64(RddV, 0); \
+        for (i = 0; i < 8; i++) { \
+            fGETUBYTE(i, RttV); \
+            tcg_gen_mov_tl(left, BYTE); \
+            fGETUBYTE(i, RssV); \
+            tcg_gen_mov_tl(right, BYTE); \
+            tcg_gen_setcond_tl(TCG_COND_GT, tmp, left, right); \
+            fSETBIT(i, PeV, tmp); \
+            fMIN(tmp, left, right); \
+            fSETBYTE(i, RddV, tmp); \
+        } \
+        tcg_temp_free(BYTE); \
+        tcg_temp_free(left); \
+        tcg_temp_free(right); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
 /* Floating point */
 #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
     gen_helper_conv_sf2df(RddV, cpu_env, RsV)
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 9e9dfd5..a382664 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -268,6 +268,69 @@ static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
     }
 }
 
+static inline TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign)
+{
+    if (sign) {
+        tcg_gen_sextract_tl(result, src, N * 8, 8);
+    } else {
+        tcg_gen_extract_tl(result, src, N * 8, 8);
+    }
+    return result;
+}
+
+static inline TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
+{
+    TCGv_i64 res64 = tcg_temp_new_i64();
+    if (sign) {
+        tcg_gen_sextract_i64(res64, src, N * 8, 8);
+    } else {
+        tcg_gen_extract_i64(res64, src, N * 8, 8);
+    }
+    tcg_gen_extrl_i64_i32(result, res64);
+    tcg_temp_free_i64(res64);
+
+    return result;
+}
+
+static inline void gen_set_byte(int N, TCGv result, TCGv src)
+{
+    tcg_gen_deposit_tl(result, result, src, N * 8, 8);
+}
+
+static inline void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
+{
+    TCGv_i64 src64 = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(src64, src);
+    tcg_gen_deposit_i64(result, result, src64, N * 8, 8);
+    tcg_temp_free_i64(src64);
+}
+
+static inline TCGv gen_get_word(TCGv result, int N, TCGv_i64 src, bool sign)
+{
+    if (N == 0) {
+        tcg_gen_extrl_i64_i32(result, src);
+    } else if (N == 1) {
+        tcg_gen_extrh_i64_i32(result, src);
+    } else {
+      g_assert_not_reached();
+    }
+    return result;
+}
+
+static inline TCGv_i64 gen_get_word_i64(TCGv_i64 result, int N, TCGv_i64 src,
+                                        bool sign)
+{
+    TCGv word = tcg_temp_new();
+    gen_get_word(word, N, src, sign);
+    if (sign) {
+        tcg_gen_ext_i32_i64(result, word);
+    } else {
+        tcg_gen_extu_i32_i64(result, word);
+    }
+    tcg_temp_free(word);
+    return result;
+}
+
 static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
 {
     tcg_gen_qemu_ld32u(dest, vaddr, mem_index);
@@ -341,5 +404,53 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
+static inline TCGv_i64 gen_carry_from_add64(TCGv_i64 result, TCGv_i64 a,
+                                            TCGv_i64 b, TCGv_i64 c)
+{
+    TCGv_i64 WORD = tcg_temp_new_i64();
+    TCGv_i64 tmpa = tcg_temp_new_i64();
+    TCGv_i64 tmpb = tcg_temp_new_i64();
+    TCGv_i64 tmpc = tcg_temp_new_i64();
+    TCGv_i64 tmpx = tcg_temp_new_i64();
+
+    /*
+     * tmpa = fGETUWORD(0, a);
+     * tmpb = fGETUWORD(0, b);
+     * tmpc = tmpa + tmpb + c;
+     * tmpa = fGETUWORD(1, a);
+     * tmpb = fGETUWORD(1, b);
+     * tmpc = tmpa + tmpb + fGETUWORD(1, tmpc);
+     * result = fGETUWORD(1, tmpc);
+     * return result;
+     */
+    tcg_gen_mov_i64(tmpa, fGETUWORD(0, a));
+    tcg_gen_mov_i64(tmpb, fGETUWORD(0, b));
+    tcg_gen_add_i64(tmpc, tmpa, tmpb);
+    tcg_gen_add_i64(tmpc, tmpc, c);
+    tcg_gen_mov_i64(tmpa, fGETUWORD(1, a));
+    tcg_gen_mov_i64(tmpb, fGETUWORD(1, b));
+    tcg_gen_add_i64(tmpx, tmpa, tmpb);
+    tcg_gen_add_i64(tmpc, tmpx, fGETUWORD(1, tmpc));
+    tcg_gen_mov_i64(result, fGETUWORD(1, tmpc));
+
+    tcg_temp_free_i64(WORD);
+    tcg_temp_free_i64(tmpa);
+    tcg_temp_free_i64(tmpb);
+    tcg_temp_free_i64(tmpc);
+    tcg_temp_free_i64(tmpx);
+    return result;
+}
+
+static inline TCGv gen_8bitsof(TCGv result, TCGv value)
+{
+    TCGv zero = tcg_const_tl(0);
+    TCGv ones = tcg_const_tl(0xff);
+    tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, zero);
+    tcg_temp_free(zero);
+    tcg_temp_free(ones);
+
+    return result;
+}
+
 #include "tcg_funcs_generated.c.inc"
 #include "tcg_func_table_generated.c.inc"
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index 715c246..46c601b 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -26,6 +26,12 @@ DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
 #endif
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
+DEF_HELPER_3(sfrecipa_val, f32, env, f32, f32)
+DEF_HELPER_3(sfrecipa_pred, s32, env, f32, f32)
+DEF_HELPER_2(sfinvsqrta_val, f32, env, f32)
+DEF_HELPER_2(sfinvsqrta_pred, s32, env, f32)
+DEF_HELPER_4(vacsh_val, s64, env, s64, s64, s64)
+DEF_HELPER_4(vacsh_pred, s32, env, s64, s64, s64)
 
 /* Floating point */
 DEF_HELPER_2(conv_sf2df, f64, env, f32)
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
index 45cc529..58477ae 100644
--- a/target/hexagon/imported/alu.idef
+++ b/target/hexagon/imported/alu.idef
@@ -153,6 +153,21 @@ Q6INSN(A2_subp,"Rdd32=sub(Rtt32,Rss32)",ATTRIBS(),
 "Sub",
 { RddV=RttV-RssV;})
 
+/* 64-bit with carry */
+
+Q6INSN(A4_addp_c,"Rdd32=add(Rss32,Rtt32,Px4):carry",ATTRIBS(),"Add with Carry",
+{
+  RddV = RssV + RttV + fLSBOLD(PxV);
+  PxV = f8BITSOF(fCARRY_FROM_ADD(RssV,RttV,fLSBOLD(PxV)));
+})
+
+Q6INSN(A4_subp_c,"Rdd32=sub(Rss32,Rtt32,Px4):carry",ATTRIBS(),"Sub with Carry",
+{
+  RddV = RssV + ~RttV + fLSBOLD(PxV);
+  PxV = f8BITSOF(fCARRY_FROM_ADD(RssV,~RttV,fLSBOLD(PxV)));
+})
+
+
 /* NEG and ABS */
 
 Q6INSN(A2_negsat,"Rd32=neg(Rs32):sat",ATTRIBS(),
@@ -1240,6 +1255,35 @@ MINMAX(uw,WORD,UWORD,2)
 #undef VMINORMAX3
 
 
+Q6INSN(A5_ACS,"Rxx32,Pe4=vacsh(Rss32,Rtt32)",ATTRIBS(),
+"Add Compare and Select elements of two vectors, record the maximums and the decisions ",
+{
+        fHIDE(int i;)
+        fHIDE(int xv;)
+        fHIDE(int sv;)
+        fHIDE(int tv;)
+        for (i = 0; i < 4; i++) {
+                xv = (int) fGETHALF(i,RxxV);
+                sv = (int) fGETHALF(i,RssV);
+                tv = (int) fGETHALF(i,RttV);
+                xv = xv + tv;           //assumes 17bit datapath
+                sv = sv - tv;           //assumes 17bit datapath
+                fSETBIT(i*2,  PeV,  (xv > sv));
+                fSETBIT(i*2+1,PeV,  (xv > sv));
+                fSETHALF(i,   RxxV, fSATH(fMAX(xv,sv)));
+        }
+})
+
+Q6INSN(A6_vminub_RdP,"Rdd32,Pe4=vminub(Rtt32,Rss32)",ATTRIBS(),
+"Vector minimum of bytes, records minimum and decision vector",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBIT(i, PeV,     (fGETUBYTE(i,RttV) > fGETUBYTE(i,RssV)));
+            fSETBYTE(i,RddV,fMIN(fGETUBYTE(i,RttV),fGETUBYTE(i,RssV)));
+        }
+})
+
 /**********************************************/
 /* Vector Min/Max                             */
 /**********************************************/
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index c21cb73..514c240 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -1017,6 +1017,8 @@ MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
 
 
 
+MPY_ENC(A5_ACS,              "1010","xxxxx","0","1","0","1","ee")
+MPY_ENC(A6_vminub_RdP,       "1010","ddddd","0","1","1","1","ee")
 /*
 */
 
@@ -1028,6 +1030,7 @@ MPY_ENC(F2_sfmin,            "1011","ddddd","0","0","0","1","01")
 MPY_ENC(F2_sfmpy,            "1011","ddddd","0","0","1","0","00")
 MPY_ENC(F2_sffixupn,         "1011","ddddd","0","0","1","1","00")
 MPY_ENC(F2_sffixupd,         "1011","ddddd","0","0","1","1","01")
+MPY_ENC(F2_sfrecipa,         "1011","ddddd","1","1","1","1","ee")
 
 DEF_FIELDROW_DESC32(ICLASS_M" 1100 -------- PP------ --------","[#12] Rd=(Rs,Rt)")
 DEF_FIELD32(ICLASS_M"         1100 -------- PP------ --!-----",Mc_tH,"Rt is High") /*Rt high */
@@ -1641,6 +1644,7 @@ SH2_RR_ENC(F2_conv_sf2w,          "1011","100","-","000","ddddd")
 SH2_RR_ENC(F2_conv_sf2uw_chop,    "1011","011","-","001","ddddd")
 SH2_RR_ENC(F2_conv_sf2w_chop,     "1011","100","-","001","ddddd")
 SH2_RR_ENC(F2_sffixupr,           "1011","101","-","000","ddddd")
+SH2_RR_ENC(F2_sfinvsqrta,         "1011","111","-","0ee","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S2op"      1100 -------- PP------ --------","[#12] Rd=(Rs,#u6)")
@@ -1745,6 +1749,8 @@ SH_RRR_ENC(S4_extractp_rp,      "0001","11-","-","10-","ddddd")
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0010 -------- PP------ --------","[#2] Rdd=(Rss,Rtt,Pu)")
 SH_RRR_ENC(S2_valignrb,         "0010","0--","-","-uu","ddddd")
 SH_RRR_ENC(S2_vsplicerb,        "0010","100","-","-uu","ddddd")
+SH_RRR_ENC(A4_addp_c,           "0010","110","-","-xx","ddddd")
+SH_RRR_ENC(A4_subp_c,           "0010","111","-","-xx","ddddd")
 
 
 DEF_FIELDROW_DESC32(ICLASS_S3op" 0011 -------- PP------ --------","[#3] Rdd=(Rss,Rt)")
diff --git a/target/hexagon/imported/float.idef b/target/hexagon/imported/float.idef
index 76cecfe..3e75bc4 100644
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
@@ -162,6 +178,22 @@ Q6INSN(F2_sffixupd,"Rd32=sffixupd(Rs32,Rt32)",ATTRIBS(),
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
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 8cb211d..123c995 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -177,7 +177,11 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
 
 #define fMAX(A, B) (((A) > (B)) ? (A) : (B))
 
+#ifdef QEMU_GENERATE
+#define fMIN(DST, A, B) tcg_gen_movcond_i32(TCG_COND_LT, DST, A, B, A, B)
+#else
 #define fMIN(A, B) (((A) < (B)) ? (A) : (B))
+#endif
 
 #define fABS(A) (((A) < 0) ? (-(A)) : (A))
 #define fINSERT_BITS(REG, WIDTH, OFFSET, INVAL) \
@@ -191,7 +195,11 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
         extract64((INREG), (LOWBIT), ((HIBIT) - (LOWBIT) + 1)) : \
         0LL)
 
+#ifdef QEMU_GENERATE
+#define f8BITSOF(RES, VAL) gen_8bitsof(RES, VAL)
+#else
 #define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
+#endif
 
 #ifdef QEMU_GENERATE
 #define fLSBOLD(VAL) tcg_gen_andi_tl(LSB, (VAL), 1)
@@ -501,14 +509,33 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
     gen_store_conditional##SIZE(env, ctx, PdN, PRED, EA, SRC);
 #endif
 
+#ifdef QEMU_GENERATE
+#define GETBYTE_FUNC(X) \
+    __builtin_choose_expr(TYPE_TCGV(X), \
+        gen_get_byte, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_get_byte_i64, (void)0))
+#define fGETBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, true)
+#define fGETUBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, false)
+#else
 #define fGETBYTE(N, SRC) ((int8_t)((SRC >> ((N) * 8)) & 0xff))
 #define fGETUBYTE(N, SRC) ((uint8_t)((SRC >> ((N) * 8)) & 0xff))
+#endif
 
+#ifdef QEMU_GENERATE
+#define SETBYTE_FUNC(X) \
+    __builtin_choose_expr(TYPE_TCGV(X), \
+        gen_set_byte, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_set_byte_i64, (void)0))
+#define fSETBYTE(N, DST, VAL) SETBYTE_FUNC(DST)(N, DST, VAL)
+#else
 #define fSETBYTE(N, DST, VAL) \
     do { \
         DST = (DST & ~(0x0ffLL << ((N) * 8))) | \
         (((uint64_t)((VAL) & 0x0ffLL)) << ((N) * 8)); \
     } while (0)
+#endif
 #define fGETHALF(N, SRC) ((int16_t)((SRC >> ((N) * 16)) & 0xffff))
 #define fGETUHALF(N, SRC) ((uint16_t)((SRC >> ((N) * 16)) & 0xffff))
 #define fSETHALF(N, DST, VAL) \
@@ -519,10 +546,20 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fSETHALFw fSETHALF
 #define fSETHALFd fSETHALF
 
+#ifdef QEMU_GENERATE
+#define GETWORD_FUNC(X) \
+    __builtin_choose_expr(TYPE_TCGV(X), \
+        gen_get_word, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_get_word_i64, (void)0))
+#define fGETWORD(N, SRC)  GETWORD_FUNC(WORD)(WORD, N, SRC, true)
+#define fGETUWORD(N, SRC) GETWORD_FUNC(WORD)(WORD, N, SRC, false)
+#else
 #define fGETWORD(N, SRC) \
     ((int64_t)((int32_t)((SRC >> ((N) * 32)) & 0x0ffffffffLL)))
 #define fGETUWORD(N, SRC) \
     ((uint64_t)((uint32_t)((SRC >> ((N) * 32)) & 0x0ffffffffLL)))
+#endif
 
 #define fSETWORD(N, DST, VAL) \
     do { \
@@ -530,10 +567,14 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
               (((VAL) & 0x0ffffffffLL) << ((N) * 32)); \
     } while (0)
 
+#ifdef QEMU_GENERATE
+#define fSETBIT(N, DST, VAL) tcg_gen_deposit_tl(DST, DST, VAL, N, 1)
+#else
 #define fSETBIT(N, DST, VAL) \
     do { \
         DST = (DST & ~(1ULL << (N))) | (((uint64_t)(VAL)) << (N)); \
     } while (0)
+#endif
 
 #define fGETBIT(N, SRC) (((SRC) >> N) & 1)
 #define fSETBITS(HI, LO, DST, VAL) \
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 5bc9a93..9ea4580 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -295,6 +295,136 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
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
+ * sfrecipa, sfinvsqrta, vacsh have two results
+ *     r0,p0=sfrecipa(r1,r2)
+ *     r0,p0=sfinvsqrta(r1)
+ *     r1:0,p0=vacsh(r3:2,r5:4)
+ * Since helpers can only return a single value, we have two helpers
+ * for each of these. They each contain basically the same code (copy/pasted
+ * from the arch library), but one returns the register and the other
+ * returns the predicate.
+ */
+float32 HELPER(sfrecipa_val)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    /* int32_t PeV; Not needed to compute value */
+    float32 RdV;
+    int idx;
+    int adjust;
+    int mant;
+    int exp;
+
+    arch_fpop_start(env);
+    if (arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status)) {
+        /* PeV = adjust; Not needed to compute value */
+        idx = (RtV >> 16) & 0x7f;
+        mant = (arch_recip_lookup(idx) << 15) | 1;
+        exp = SF_BIAS - (float32_getexp(RtV) - SF_BIAS) - 1;
+        RdV = build_float32(extract32(RtV, 31, 1), exp, mant);
+    }
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(sfrecipa_pred)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int32_t PeV = 0;
+    float32 RdV;
+    int adjust;
+
+    arch_fpop_start(env);
+    if (arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status)) {
+        PeV = adjust;
+    }
+    arch_fpop_end(env);
+    return PeV;
+}
+
+float32 HELPER(sfinvsqrta_val)(CPUHexagonState *env, float32 RsV)
+{
+    /* int32_t PeV; Not needed for val version */
+    float32 RdV;
+    int idx;
+    int adjust;
+    int mant;
+    int exp;
+
+    arch_fpop_start(env);
+    if (arch_sf_invsqrt_common(&RsV, &RdV, &adjust, &env->fp_status)) {
+        /* PeV = adjust; Not needed for val version */
+        idx = (RsV >> 17) & 0x7f;
+        mant = (arch_invsqrt_lookup(idx) << 15);
+        exp = SF_BIAS - ((float32_getexp(RsV) - SF_BIAS) >> 1) - 1;
+        RdV = build_float32(extract32(RsV, 31, 1), exp, mant);
+    }
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(sfinvsqrta_pred)(CPUHexagonState *env, float32 RsV)
+{
+    int32_t PeV = 0;
+    float32 RdV;
+    int adjust;
+
+    arch_fpop_start(env);
+    if (arch_sf_invsqrt_common(&RsV, &RdV, &adjust, &env->fp_status)) {
+        PeV = adjust;
+    }
+    arch_fpop_end(env);
+    return PeV;
+}
+
+int64_t HELPER(vacsh_val)(CPUHexagonState *env,
+                           int64_t RxxV, int64_t RssV, int64_t RttV)
+{
+    int32_t PeV = 0;
+    int i;
+    int xv;
+    int sv;
+    int tv;
+    for (i = 0; i < 4; i++) {
+        xv = (int)fGETHALF(i, RxxV);
+        sv = (int)fGETHALF(i, RssV);
+        tv = (int)fGETHALF(i, RttV);
+        xv = xv + tv;
+        sv = sv - tv;
+        fSETBIT(i * 2, PeV, (xv > sv));
+        fSETBIT(i * 2 + 1, PeV, (xv > sv));
+        fSETHALF(i, RxxV, fSATH(fMAX(xv, sv)));
+    }
+    return RxxV;
+}
+
+int32_t HELPER(vacsh_pred)(CPUHexagonState *env,
+                           int64_t RxxV, int64_t RssV, int64_t RttV)
+{
+    int32_t PeV = 0;
+    int i;
+    int xv;
+    int sv;
+    int tv;
+    for (i = 0; i < 4; i++) {
+        xv = (int)fGETHALF(i, RxxV);
+        sv = (int)fGETHALF(i, RssV);
+        tv = (int)fGETHALF(i, RttV);
+        xv = xv + tv;
+        sv = sv - tv;
+        fSETBIT(i * 2, PeV, (xv > sv));
+        fSETBIT(i * 2 + 1, PeV, (xv > sv));
+        fSETHALF(i, RxxV, fSATH(fMAX(xv, sv)));
+    }
+    return PeV;
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
index 6b60f92..0dff429 100644
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
@@ -360,6 +441,20 @@ static void check_canonical_NaN(void)
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
@@ -507,7 +602,9 @@ int main()
     check_compare_exception();
     check_sfminmax();
     check_dfminmax();
+    check_recip_exception();
     check_canonical_NaN();
+    check_invsqrta();
     check_float2int_convs();
 
     puts(err ? "FAIL" : "PASS");
diff --git a/tests/tcg/hexagon/multi_result.c b/tests/tcg/hexagon/multi_result.c
new file mode 100644
index 0000000..99ae657
--- /dev/null
+++ b/tests/tcg/hexagon/multi_result.c
@@ -0,0 +1,249 @@
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
+static long long vacsh(long long Rxx, long long Rss, long long Rtt,
+                       int *pred_result)
+{
+  long long result = Rxx;
+  int predval;
+
+  asm volatile("%0,p0 = vacsh(%2, %3)\n\t"
+               "%1 = p0\n\t"
+               : "+r"(result), "=r"(predval)
+               : "r"(Rss), "r"(Rtt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+static long long vminub(long long Rtt, long long Rss,
+                        int *pred_result)
+{
+  long long result;
+  int predval;
+
+  asm volatile("%0,p0 = vminub(%2, %3)\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "=r"(predval)
+               : "r"(Rtt), "r"(Rss)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+static long long add_carry(long long Rss, long long Rtt,
+                           int pred_in, int *pred_result)
+{
+  long long result;
+  int predval = pred_in;
+
+  asm volatile("p0 = %1\n\t"
+               "%0 = add(%2, %3, p0):carry\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "+r"(predval)
+               : "r"(Rss), "r"(Rtt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+static long long sub_carry(long long Rss, long long Rtt,
+                           int pred_in, int *pred_result)
+{
+  long long result;
+  int predval = pred_in;
+
+  asm volatile("p0 = !cmp.eq(%1, #0)\n\t"
+               "%0 = sub(%2, %3, p0):carry\n\t"
+               "%1 = p0\n\t"
+               : "=r"(result), "+r"(predval)
+               : "r"(Rss), "r"(Rtt)
+               : "p0");
+  *pred_result = predval;
+  return result;
+}
+
+int err;
+
+static void check_ll(long long val, long long expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%016llx != 0x%016llx\n", val, expect);
+        err++;
+    }
+}
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
+static void test_vacsh()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = vacsh(0x0807060504030201LL,
+                  0x0102030405060708LL,
+                  0x0LL, &pred_result);
+    check_ll(res64, 0x807060505060708LL);
+    check_p(pred_result, 0xf0);
+}
+
+static void test_vminub()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = vminub(0x0807060504030201LL,
+                   0x0102030405060708LL,
+                   &pred_result);
+    check_ll(res64, 0x0102030404030201LL);
+    check_p(pred_result, 0xf0);
+
+    res64 = vminub(0x0802060405030701LL,
+                   0x0107030504060208LL,
+                   &pred_result);
+    check_ll(res64, 0x0102030404030201LL);
+    check_p(pred_result, 0xaa);
+}
+
+static void test_add_carry()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = add_carry(0x0000000000000000LL,
+                      0xffffffffffffffffLL,
+                      1, &pred_result);
+    check_ll(res64, 0x0000000000000000LL);
+    check_p(pred_result, 0xff);
+
+    res64 = add_carry(0x0000000100000000LL,
+                      0xffffffffffffffffLL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+
+    res64 = add_carry(0x0000000100000000LL,
+                      0xffffffffffffffffLL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+}
+
+static void test_sub_carry()
+{
+    long long res64;
+    int pred_result;
+
+    res64 = sub_carry(0x0000000000000000LL,
+                      0x0000000000000000LL,
+                      1, &pred_result);
+    check_ll(res64, 0x0000000000000000LL);
+    check_p(pred_result, 0xff);
+
+    res64 = sub_carry(0x0000000100000000LL,
+                      0x0000000000000000LL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+
+    res64 = sub_carry(0x0000000100000000LL,
+                      0x0000000000000000LL,
+                      0, &pred_result);
+    check_ll(res64, 0x00000000ffffffffLL);
+    check_p(pred_result, 0xff);
+}
+
+int main()
+{
+    test_sfrecipa();
+    test_sfinvsqrta();
+    test_vacsh();
+    test_vminub();
+    test_add_carry();
+    test_sub_carry();
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
-- 
2.7.4


