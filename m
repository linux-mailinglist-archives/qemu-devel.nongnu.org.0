Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E539DB4E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:29:25 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDRc-0007BV-BZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4s-0004mS-IO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4o-0005kh-2a
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwzaqXDA2BcFw+EWJP7fNiRJUs+IolCyE+0WuN9T5iQ=;
 b=Qrp5XyRSsWKHpxSXjQ0v76W4fW0Lwd3EUlNrROTArU8+b6tyXXLxQxZ/B7KvE314D9VAhI
 qcf3NjAR1B62KxziKb6pE2J1YqE+l1TszU31fORb73trnFRWyYtjjwHYXzNPE9v6n7G4FM
 6sBjG/hnxT6j//imZehh5gA9AI1ZeBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-nAymMO4mNv2sqlPyrkN6lw-1; Mon, 07 Jun 2021 07:05:47 -0400
X-MC-Unique: nAymMO4mNv2sqlPyrkN6lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDEB8107ACC7;
 Mon,  7 Jun 2021 11:05:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9207D60FC2;
 Mon,  7 Jun 2021 11:05:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/26] s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
Date: Mon,  7 Jun 2021 13:03:35 +0200
Message-Id: <20210607110338.31058-24-david@redhat.com>
In-Reply-To: <20210607110338.31058-1-david@redhat.com>
References: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For IEEE functions, we can reuse the softfloat implementations. For the
other functions, implement it generically for 32bit/64bit/128bit -
carefully taking care of all weird special cases according to the tables
defined in the PoP.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |   6 +
 target/s390x/insn-data.def      |   4 +
 target/s390x/internal.h         |   9 +
 target/s390x/translate_vx.c.inc |  44 +++++
 target/s390x/vec_fpu_helper.c   | 328 ++++++++++++++++++++++++++++++++
 5 files changed, 391 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 913967ce4e..ba045f559d 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -291,6 +291,12 @@ DEF_HELPER_FLAGS_4(gvec_vflr128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmax32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmax64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmax128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmin32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmin64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfmin128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 19b02dffca..3e5594210c 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1253,6 +1253,10 @@
     F(0xe7c4, VFLL,    VRR_a, V,   0, 0, 0, 0, vfll, 0, IF_VEC)
 /* VECTOR FP LOAD ROUNDED */
     F(0xe7c5, VFLR,    VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
+/* VECTOR FP MAXIMUM */
+    F(0xe7ef, VFMAX,   VRR_c, VE,  0, 0, 0, 0, vfmax, 0, IF_VEC)
+/* VECTOR FP MINIMUM */
+    F(0xe7ee, VFMIN,   VRR_c, VE,  0, 0, 0, 0, vfmax, 0, IF_VEC)
 /* VECTOR FP MULTIPLY */
     F(0xe7e7, VFM,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
 /* VECTOR FP MULTIPLY AND ADD */
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb617..d62dfc4dc6 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -288,6 +288,15 @@ uint8_t s390_softfloat_exc_to_ieee(unsigned int exc);
 int s390_swap_bfp_rounding_mode(CPUS390XState *env, int m3);
 void s390_restore_bfp_rounding_mode(CPUS390XState *env, int old_mode);
 int float_comp_to_cc(CPUS390XState *env, int float_compare);
+
+#define DCMASK_ZERO             0x0c00
+#define DCMASK_NORMAL           0x0300
+#define DCMASK_SUBNORMAL        0x00c0
+#define DCMASK_INFINITY         0x0030
+#define DCMASK_QUIET_NAN        0x000c
+#define DCMASK_SIGNALING_NAN    0x0003
+#define DCMASK_NAN              0x000f
+#define DCMASK_NEGATIVE         0x0555
 uint16_t float32_dcmask(CPUS390XState *env, float32 f1);
 uint16_t float64_dcmask(CPUS390XState *env, float64 f1);
 uint16_t float128_dcmask(CPUS390XState *env, float128 f1);
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 200d83e783..a9d51b1f4c 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2814,6 +2814,50 @@ static DisasJumpType op_vfll(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vfmax(DisasContext *s, DisasOps *o)
+{
+    const uint8_t fpf = get_field(s, m4);
+    const uint8_t m6 = get_field(s, m6);
+    const uint8_t m5 = get_field(s, m5);
+    gen_helper_gvec_3_ptr *fn;
+
+    if (m6 == 5 || m6 == 6 || m6 == 7 || m6 > 13) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    switch (fpf) {
+    case FPF_SHORT:
+        if (s->fields.op2 == 0xef) {
+            fn = gen_helper_gvec_vfmax32;
+        } else {
+            fn = gen_helper_gvec_vfmin32;
+        }
+        break;
+    case FPF_LONG:
+        if (s->fields.op2 == 0xef) {
+            fn = gen_helper_gvec_vfmax64;
+        } else {
+            fn = gen_helper_gvec_vfmin64;
+        }
+        break;
+    case FPF_EXT:
+        if (s->fields.op2 == 0xef) {
+            fn = gen_helper_gvec_vfmax128;
+        } else {
+            fn = gen_helper_gvec_vfmin128;
+        }
+        break;
+    default:
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2), get_field(s, v3),
+                   cpu_env, deposit32(m5, 4, 4, m6), fn);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
 {
     const uint8_t m5 = get_field(s, m5);
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index dc9bcc90a7..4af6111337 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -742,3 +742,331 @@ void HELPER(gvec_vftci128)(void *v1, const void *v2, CPUS390XState *env,
         s390_vec_write_element64(v1, 1, 0);
     }
 }
+
+typedef enum S390MinMaxType {
+    S390_MINMAX_TYPE_IEEE = 0,
+    S390_MINMAX_TYPE_JAVA,
+    S390_MINMAX_TYPE_C_MACRO,
+    S390_MINMAX_TYPE_CPP,
+    S390_MINMAX_TYPE_F,
+} S390MinMaxType;
+
+typedef enum S390MinMaxRes {
+    S390_MINMAX_RES_MINMAX = 0,
+    S390_MINMAX_RES_A,
+    S390_MINMAX_RES_B,
+    S390_MINMAX_RES_SILENCE_A,
+    S390_MINMAX_RES_SILENCE_B,
+} S390MinMaxRes;
+
+static S390MinMaxRes vfmin_res(uint16_t dcmask_a, uint16_t dcmask_b,
+                               S390MinMaxType type, float_status *s)
+{
+    const bool neg_a = dcmask_a & DCMASK_NEGATIVE;
+    const bool nan_a = dcmask_a & DCMASK_NAN;
+    const bool nan_b = dcmask_b & DCMASK_NAN;
+
+    g_assert(type > S390_MINMAX_TYPE_IEEE && type <= S390_MINMAX_TYPE_F);
+
+    if (unlikely((dcmask_a | dcmask_b) & DCMASK_NAN)) {
+        const bool sig_a = dcmask_a & DCMASK_SIGNALING_NAN;
+        const bool sig_b = dcmask_b & DCMASK_SIGNALING_NAN;
+
+        if ((dcmask_a | dcmask_b) & DCMASK_SIGNALING_NAN) {
+            s->float_exception_flags |= float_flag_invalid;
+        }
+        switch (type) {
+        case S390_MINMAX_TYPE_JAVA:
+            if (sig_a) {
+                return S390_MINMAX_RES_SILENCE_A;
+            } else if (sig_b) {
+                return S390_MINMAX_RES_SILENCE_B;
+            }
+            return nan_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_F:
+            return nan_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_C_MACRO:
+            s->float_exception_flags |= float_flag_invalid;
+            return S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_CPP:
+            s->float_exception_flags |= float_flag_invalid;
+            return S390_MINMAX_RES_A;
+        default:
+            g_assert_not_reached();
+        }
+    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
+        switch (type) {
+        case S390_MINMAX_TYPE_JAVA:
+            return neg_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_C_MACRO:
+            return S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_F:
+            return !neg_a ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
+        case S390_MINMAX_TYPE_CPP:
+            return S390_MINMAX_RES_A;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return S390_MINMAX_RES_MINMAX;
+}
+
+static S390MinMaxRes vfmax_res(uint16_t dcmask_a, uint16_t dcmask_b,
+                               S390MinMaxType type, float_status *s)
+{
+    const bool neg_a = dcmask_a & DCMASK_NEGATIVE;
+    const bool nan_a = dcmask_a & DCMASK_NAN;
+    const bool nan_b = dcmask_b & DCMASK_NAN;
+
+    g_assert(type > S390_MINMAX_TYPE_IEEE && type <= S390_MINMAX_TYPE_F);
+
+    if (unlikely((dcmask_a | dcmask_b) & DCMASK_NAN)) {
+        const bool sig_a = dcmask_a & DCMASK_SIGNALING_NAN;
+        const bool sig_b = dcmask_b & DCMASK_SIGNALING_NAN;
+
+        if ((dcmask_a | dcmask_b) & DCMASK_SIGNALING_NAN) {
+            s->float_exception_flags |= float_flag_invalid;
+        }
+        switch (type) {
+        case S390_MINMAX_TYPE_JAVA:
+            if (sig_a) {
+                return S390_MINMAX_RES_SILENCE_A;
+            } else if (sig_b) {
+                return S390_MINMAX_RES_SILENCE_B;
+            }
+            return nan_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_F:
+            return nan_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_C_MACRO:
+            s->float_exception_flags |= float_flag_invalid;
+            return S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_CPP:
+            s->float_exception_flags |= float_flag_invalid;
+            return S390_MINMAX_RES_A;
+        default:
+            g_assert_not_reached();
+        }
+    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
+        switch (type) {
+        case S390_MINMAX_TYPE_JAVA:
+        case S390_MINMAX_TYPE_F:
+            return neg_a ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
+        case S390_MINMAX_TYPE_C_MACRO:
+            return S390_MINMAX_RES_B;
+        case S390_MINMAX_TYPE_CPP:
+            return S390_MINMAX_RES_A;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return S390_MINMAX_RES_MINMAX;
+}
+
+static S390MinMaxRes vfminmax_res(uint16_t dcmask_a, uint16_t dcmask_b,
+                                  S390MinMaxType type, bool is_min,
+                                  float_status *s)
+{
+    return is_min ? vfmin_res(dcmask_a, dcmask_b, type, s) :
+                    vfmax_res(dcmask_a, dcmask_b, type, s);
+}
+
+static void vfminmax32(S390Vector *v1, const S390Vector *v2,
+                       const S390Vector *v3, CPUS390XState *env,
+                       S390MinMaxType type, bool is_min, bool is_abs, bool se,
+                       uintptr_t retaddr)
+{
+    float_status *s = &env->fpu_status;
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        float32 a = s390_vec_read_float32(v2, i);
+        float32 b = s390_vec_read_float32(v3, i);
+        float32 result;
+
+        if (type != S390_MINMAX_TYPE_IEEE) {
+            S390MinMaxRes res;
+
+            if (is_abs) {
+                a = float32_abs(a);
+                b = float32_abs(b);
+            }
+
+            res = vfminmax_res(float32_dcmask(env, a), float32_dcmask(env, b),
+                               type, is_min, s);
+            switch (res) {
+            case S390_MINMAX_RES_MINMAX:
+                result = is_min ? float32_min(a, b, s) : float32_max(a, b, s);
+                break;
+            case S390_MINMAX_RES_A:
+                result = a;
+                break;
+            case S390_MINMAX_RES_B:
+                result = b;
+                break;
+            case S390_MINMAX_RES_SILENCE_A:
+                result = float32_silence_nan(a, s);
+                break;
+            case S390_MINMAX_RES_SILENCE_B:
+                result = float32_silence_nan(b, s);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        } else if (!is_abs) {
+            result = is_min ? float32_minnum(a, b, &env->fpu_status) :
+                              float32_maxnum(a, b, &env->fpu_status);
+        } else {
+            result = is_min ? float32_minnummag(a, b, &env->fpu_status) :
+                              float32_maxnummag(a, b, &env->fpu_status);
+        }
+
+        s390_vec_write_float32(&tmp, i, result);
+        vxc = check_ieee_exc(env, i, false, &vec_exc);
+        if (se || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
+static void vfminmax64(S390Vector *v1, const S390Vector *v2,
+                       const S390Vector *v3, CPUS390XState *env,
+                       S390MinMaxType type, bool is_min, bool is_abs, bool se,
+                       uintptr_t retaddr)
+{
+    float_status *s = &env->fpu_status;
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int i;
+
+    for (i = 0; i < 2; i++) {
+        float64 a = s390_vec_read_float64(v2, i);
+        float64 b = s390_vec_read_float64(v3, i);
+        float64 result;
+
+        if (type != S390_MINMAX_TYPE_IEEE) {
+            S390MinMaxRes res;
+
+            if (is_abs) {
+                a = float64_abs(a);
+                b = float64_abs(b);
+            }
+
+            res = vfminmax_res(float64_dcmask(env, a), float64_dcmask(env, b),
+                               type, is_min, s);
+            switch (res) {
+            case S390_MINMAX_RES_MINMAX:
+                result = is_min ? float64_min(a, b, s) : float64_max(a, b, s);
+                break;
+            case S390_MINMAX_RES_A:
+                result = a;
+                break;
+            case S390_MINMAX_RES_B:
+                result = b;
+                break;
+            case S390_MINMAX_RES_SILENCE_A:
+                result = float64_silence_nan(a, s);
+                break;
+            case S390_MINMAX_RES_SILENCE_B:
+                result = float64_silence_nan(b, s);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        } else if (!is_abs) {
+            result = is_min ? float64_minnum(a, b, &env->fpu_status) :
+                              float64_maxnum(a, b, &env->fpu_status);
+        } else {
+            result = is_min ? float64_minnummag(a, b, &env->fpu_status) :
+                              float64_maxnummag(a, b, &env->fpu_status);
+        }
+
+        s390_vec_write_float64(&tmp, i, result);
+        vxc = check_ieee_exc(env, i, false, &vec_exc);
+        if (se || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
+static void vfminmax128(S390Vector *v1, const S390Vector *v2,
+                        const S390Vector *v3, CPUS390XState *env,
+                        S390MinMaxType type, bool is_min, bool is_abs, bool se,
+                        uintptr_t retaddr)
+{
+    float128 a = s390_vec_read_float128(v2);
+    float128 b = s390_vec_read_float128(v3);
+    float_status *s = &env->fpu_status;
+    uint8_t vxc, vec_exc = 0;
+    float128 result;
+
+    if (type != S390_MINMAX_TYPE_IEEE) {
+        S390MinMaxRes res;
+
+        if (is_abs) {
+            a = float128_abs(a);
+            b = float128_abs(b);
+        }
+
+        res = vfminmax_res(float128_dcmask(env, a), float128_dcmask(env, b),
+                           type, is_min, s);
+        switch (res) {
+        case S390_MINMAX_RES_MINMAX:
+            result = is_min ? float128_min(a, b, s) : float128_max(a, b, s);
+            break;
+        case S390_MINMAX_RES_A:
+            result = a;
+            break;
+        case S390_MINMAX_RES_B:
+            result = b;
+            break;
+        case S390_MINMAX_RES_SILENCE_A:
+            result = float128_silence_nan(a, s);
+            break;
+        case S390_MINMAX_RES_SILENCE_B:
+            result = float128_silence_nan(b, s);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else if (!is_abs) {
+        result = is_min ? float128_minnum(a, b, &env->fpu_status) :
+                          float128_maxnum(a, b, &env->fpu_status);
+    } else {
+        result = is_min ? float128_minnummag(a, b, &env->fpu_status) :
+                          float128_maxnummag(a, b, &env->fpu_status);
+    }
+
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    s390_vec_write_float128(v1, result);
+}
+
+#define DEF_GVEC_VFMINMAX_B(NAME, IS_MIN, BITS)                                \
+void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
+                               CPUS390XState *env, uint32_t desc)              \
+{                                                                              \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+    uint8_t type = extract32(simd_data(desc), 4, 4);                           \
+    bool is_abs = false;                                                       \
+                                                                               \
+    if (type >= 8) {                                                           \
+        is_abs = true;                                                         \
+        type -= 8;                                                             \
+    }                                                                          \
+                                                                               \
+    vfminmax##BITS(v1, v2, v3, env, type, IS_MIN, is_abs, se, GETPC());        \
+}
+
+#define DEF_GVEC_VFMINMAX(NAME, IS_MIN)                                        \
+    DEF_GVEC_VFMINMAX_B(NAME, IS_MIN, 32)                                      \
+    DEF_GVEC_VFMINMAX_B(NAME, IS_MIN, 64)                                      \
+    DEF_GVEC_VFMINMAX_B(NAME, IS_MIN, 128)
+
+DEF_GVEC_VFMINMAX(vfmax, false)
+DEF_GVEC_VFMINMAX(vfmin, true)
-- 
2.31.1


