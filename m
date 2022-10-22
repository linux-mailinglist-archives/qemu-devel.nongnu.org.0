Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F004A608D1B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 14:08:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omD7R-0003Bh-Qq; Sat, 22 Oct 2022 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD73-00032A-KX
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD71-0006hr-EH
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666439782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0vAuPSb2O4zVXn10PSslk9Dlo76Z34l7Wd9h8BjsKY=;
 b=BMlpp/fY5dQll7fMnMdTvFZVnwKrl9fMbJUatxGNXpkq4ytH4LmJimGnqSKDFR8BEyMGv7
 hDUZGySFqATaAYGhJpJNyHJge6Gkc7WDK5+f7UtDWF7OW1GyVqhifrS6hm0Df+s5oyClhJ
 2Za0c9UTjvxSHbF1QZ18L5KwyWiXN10=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-q91VdstgNsq5VA3-pe47NQ-1; Sat, 22 Oct 2022 07:56:20 -0400
X-MC-Unique: q91VdstgNsq5VA3-pe47NQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so5195031edb.22
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0vAuPSb2O4zVXn10PSslk9Dlo76Z34l7Wd9h8BjsKY=;
 b=udT3WDiRVOdP2mCPdbQCMnaq/6+0PhnahUUjlO42Y91AZUUBOe1cuVJhBVO5CMdYxU
 rhZFqKgDgZfdAhLGZxJkxyrcEdQ0Z4uTvO0QaGWjaaQOp5PweKJutriTCbAnhR7nUl1d
 cQm0jX2nqznwxiDLmMtrYyzYdQ+473lOuko31SyJl06FJy0+G7Zqky0zDT/65emAg2oQ
 pbcpWptAPI7WYxKSJrQ2GQF21L55iiXV/RmBbGRd8dkkT/C9DPGEaYrNP7KMDhDy/npa
 f8aIAA9Nl0rqhJDtlpxil1gdfo9sQ3DcT23wOeURq1JmX7kBOEQcJeHdtRJpHSJLD2Xj
 ks5Q==
X-Gm-Message-State: ACrzQf0ywi/HrgOFJOJV2VqosVS36bF1YUmUsj3sPulYSMTeyaKJxCEe
 aLL/ymY2CKIu1uKhvjCAZ2GnAz1f+wzDWDBkpSxjg82yUbKu1hIBGz89jB8Wch1BtUqnLGugazZ
 glDnA9JuwWOU/Z/bca91fKiHSoQbRjgtv5z/ut1He8ZlWv2JaeWUNItfVID02TEwWp34=
X-Received: by 2002:a05:6402:40d0:b0:45c:d00a:82bd with SMTP id
 z16-20020a05640240d000b0045cd00a82bdmr21698439edb.288.1666439779105; 
 Sat, 22 Oct 2022 04:56:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CQdWOh4Y3Hkph+OaMfftoiVQwaciru2wRzslaIKM9jN2qJQVIB/wjowEvBQvXd2HwKWqOBA==
X-Received: by 2002:a05:6402:40d0:b0:45c:d00a:82bd with SMTP id
 z16-20020a05640240d000b0045cd00a82bdmr21698414edb.288.1666439778622; 
 Sat, 22 Oct 2022 04:56:18 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906784700b0078d9e26db54sm12902129ejm.88.2022.10.22.04.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 04:56:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/4] target/i386: implement F16C instructions
Date: Sat, 22 Oct 2022 13:56:07 +0200
Message-Id: <20221022115608.152853-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022115608.152853-1-pbonzini@redhat.com>
References: <20221022115608.152853-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

F16C only consists of two instructions, which are a bit peculiar
nevertheless.

First, they access only the low half of an YMM or XMM register for the
packed-half operand; the exact size still depends on the VEX.L flag.
This is similar to the existing avx_movx flag, but not exactly because
avx_movx is hardcoded to affect operand 2.  To this end I added a "ph"
format name; it's possible to reuse this approach for the VPMOVSX and
VPMOVZX instructions, though that would also require adding two more
formats for the low-quarter and low-eighth of an operand.

Second, VCVTPS2PH is somewhat weird because it *stores* the result of
the instruction into memory rather than loading it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                |  5 ++---
 target/i386/cpu.h                |  3 +++
 target/i386/ops_sse.h            | 29 +++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h     |  6 ++++++
 target/i386/tcg/decode-new.c.inc |  8 ++++++++
 target/i386/tcg/decode-new.h     |  2 ++
 target/i386/tcg/emit.c.inc       | 17 ++++++++++++++++-
 tests/tcg/i386/test-avx.c        | 17 +++++++++++++++++
 tests/tcg/i386/test-avx.py       |  8 ++++++--
 9 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0ebd610faa..6292b7e12f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,13 +625,12 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND | CPUID_EXT_AVX)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER,
-          CPUID_EXT_F16C */
+          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
 
 #ifdef TARGET_X86_64
 #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index dad2b2db8d..d4bc19577a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1258,6 +1258,7 @@ typedef union ZMMReg {
     uint16_t _w_ZMMReg[512 / 16];
     uint32_t _l_ZMMReg[512 / 32];
     uint64_t _q_ZMMReg[512 / 64];
+    float16  _h_ZMMReg[512 / 16];
     float32  _s_ZMMReg[512 / 32];
     float64  _d_ZMMReg[512 / 64];
     XMMReg   _x_ZMMReg[512 / 128];
@@ -1282,6 +1283,7 @@ typedef struct BNDCSReg {
 #define ZMM_B(n) _b_ZMMReg[63 - (n)]
 #define ZMM_W(n) _w_ZMMReg[31 - (n)]
 #define ZMM_L(n) _l_ZMMReg[15 - (n)]
+#define ZMM_H(n) _h_ZMMReg[31 - (n)]
 #define ZMM_S(n) _s_ZMMReg[15 - (n)]
 #define ZMM_Q(n) _q_ZMMReg[7 - (n)]
 #define ZMM_D(n) _d_ZMMReg[7 - (n)]
@@ -1301,6 +1303,7 @@ typedef struct BNDCSReg {
 #define ZMM_B(n) _b_ZMMReg[n]
 #define ZMM_W(n) _w_ZMMReg[n]
 #define ZMM_L(n) _l_ZMMReg[n]
+#define ZMM_H(n) _h_ZMMReg[n]
 #define ZMM_S(n) _s_ZMMReg[n]
 #define ZMM_Q(n) _q_ZMMReg[n]
 #define ZMM_D(n) _d_ZMMReg[n]
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0799712f6e..33c61896ee 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -586,6 +586,35 @@ void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
+#if SHIFT >= 1
+void glue(helper_cvtph2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    int i;
+
+    for (i = 2 << SHIFT; --i >= 0; ) {
+         d->ZMM_S(i) = float16_to_float32(s->ZMM_H(i), true, &env->sse_status);
+    }
+}
+
+void glue(helper_cvtps2ph, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, int mode)
+{
+    int i;
+    FloatRoundMode prev_rounding_mode = env->sse_status.float_rounding_mode;
+    if (!(mode & (1 << 2))) {
+        set_x86_rounding_mode(mode & 3, &env->sse_status);
+    }
+
+    for (i = 0; i < 2 << SHIFT; i++) {
+        d->ZMM_H(i) = float32_to_float16(s->ZMM_S(i), true, &env->sse_status);
+    }
+    for (i >>= 2; i < 1 << SHIFT; i++) {
+        d->Q(i) = 0;
+    }
+
+    env->sse_status.float_rounding_mode = prev_rounding_mode;
+}
+#endif
+
 #if SHIFT == 1
 void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 2f1f811f9f..c4c41976c0 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -353,6 +353,12 @@ DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
+/* F16C helpers */
+#if SHIFT >= 1
+DEF_HELPER_3(glue(cvtph2ps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(cvtps2ph, SUFFIX), void, env, Reg, Reg, int)
+#endif
+
 /* AVX helpers */
 #if SHIFT >= 1
 DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 8e1eb9db42..8baee9018a 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -336,6 +336,7 @@ static const X86OpEntry opcodes_0F38_00toEF[240] = {
     [0x07] = X86_OP_ENTRY3(PHSUBSW,   V,x,  H,x,   W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
 
     [0x10] = X86_OP_ENTRY2(PBLENDVB,  V,x,         W,x,  vex4 cpuid(SSE41) avx2_256 p_66),
+    [0x13] = X86_OP_ENTRY2(VCVTPH2PS, V,x,         W,ph, vex11 cpuid(F16C) p_66),
     [0x14] = X86_OP_ENTRY2(BLENDVPS,  V,x,         W,x,  vex4 cpuid(SSE41) p_66),
     [0x15] = X86_OP_ENTRY2(BLENDVPD,  V,x,         W,x,  vex4 cpuid(SSE41) p_66),
     /* Listed incorrectly as type 4 */
@@ -525,6 +526,7 @@ static const X86OpEntry opcodes_0F3A[256] = {
     [0x15] = X86_OP_ENTRY3(PEXTRW,     E,w,  V,dq, I,b,  vex5 cpuid(SSE41) zext0 p_66),
     [0x16] = X86_OP_ENTRY3(PEXTR,      E,y,  V,dq, I,b,  vex5 cpuid(SSE41) p_66),
     [0x17] = X86_OP_ENTRY3(VEXTRACTPS, E,d,  V,dq, I,b,  vex5 cpuid(SSE41) p_66),
+    [0x1d] = X86_OP_ENTRY3(VCVTPS2PH,  W,ph, V,x,  I,b,  vex11 cpuid(F16C) p_66),
 
     [0x20] = X86_OP_ENTRY4(PINSRB,     V,dq, H,dq, E,b,  vex5 cpuid(SSE41) zext2 p_66),
     [0x21] = X86_OP_GROUP0(VINSERTPS),
@@ -1051,6 +1053,10 @@ static bool decode_op_size(DisasContext *s, X86OpEntry *e, X86OpSize size, MemOp
         *ot = s->vex_l ? MO_256 : MO_128;
         return true;
 
+    case X86_SIZE_ph: /* SSE/AVX packed half precision */
+        *ot = s->vex_l ? MO_128 : MO_64;
+        return true;
+
     case X86_SIZE_d64:  /* Default to 64-bit in 64-bit mode */
         *ot = CODE64(s) && s->dflag == MO_32 ? MO_64 : s->dflag;
         return true;
@@ -1342,6 +1348,8 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
     switch (cpuid) {
     case X86_FEAT_None:
         return true;
+    case X86_FEAT_F16C:
+        return (s->cpuid_ext_features & CPUID_EXT_F16C);
     case X86_FEAT_MOVBE:
         return (s->cpuid_ext_features & CPUID_EXT_MOVBE);
     case X86_FEAT_PCLMULQDQ:
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index f159c26850..0ef54628ee 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -92,6 +92,7 @@ typedef enum X86OpSize {
     /* Custom */
     X86_SIZE_d64,
     X86_SIZE_f64,
+    X86_SIZE_ph, /* SSE/AVX packed half precision */
 } X86OpSize;
 
 typedef enum X86CPUIDFeature {
@@ -103,6 +104,7 @@ typedef enum X86CPUIDFeature {
     X86_FEAT_AVX2,
     X86_FEAT_BMI1,
     X86_FEAT_BMI2,
+    X86_FEAT_F16C,
     X86_FEAT_MOVBE,
     X86_FEAT_PCLMULQDQ,
     X86_FEAT_SSE,
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index ebf299451d..9334f0939d 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -296,7 +296,7 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
     case X86_OP_MMX:
         break;
     case X86_OP_SSE:
-        if (!op->has_ea && (s->prefix & PREFIX_VEX) && op->ot == MO_128) {
+        if (!op->has_ea && (s->prefix & PREFIX_VEX) && op->ot <= MO_128) {
             tcg_gen_gvec_dup_imm(MO_64,
                                  offsetof(CPUX86State, xmm_regs[op->n].ZMM_X(1)),
                                  16, 16, 0);
@@ -852,6 +852,7 @@ UNARY_INT_SSE(VCVTTPD2DQ, cvttpd2dq)
 UNARY_INT_SSE(VCVTDQ2PS, cvtdq2ps)
 UNARY_INT_SSE(VCVTPS2DQ, cvtps2dq)
 UNARY_INT_SSE(VCVTTPS2DQ, cvttps2dq)
+UNARY_INT_SSE(VCVTPH2PS, cvtph2ps)
 
 
 static inline void gen_unary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
@@ -1868,6 +1869,20 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
 
+static void gen_VCVTPS2PH(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_unary_imm_fp_sse(s, env, decode,
+                      gen_helper_cvtps2ph_xmm,
+                      gen_helper_cvtps2ph_ymm);
+    /*
+     * VCVTPS2PH is the only instruction that performs an operation on a
+     * register source and then *stores* into memory.
+     */
+    if (decode->op[0].has_ea) {
+        gen_store_sse(s, decode, decode->op[0].offset);
+    }
+}
+
 static void gen_VCVTSI2Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int vec_len = vector_len(s, decode);
diff --git a/tests/tcg/i386/test-avx.c b/tests/tcg/i386/test-avx.c
index 953e2906fe..c39c0e5bce 100644
--- a/tests/tcg/i386/test-avx.c
+++ b/tests/tcg/i386/test-avx.c
@@ -28,6 +28,7 @@ typedef struct {
 } TestDef;
 
 reg_state initI;
+reg_state initF16;
 reg_state initF32;
 reg_state initF64;
 
@@ -221,6 +222,7 @@ static void run_all(void)
 
 #define ARRAY_LEN(x) (sizeof(x) / sizeof(x[0]))
 
+uint16_t val_f16[] = { 0x4000, 0xbc00, 0x44cd, 0x3a66, 0x4200, 0x7a1a, 0x4780, 0x4826 };
 float val_f32[] = {2.0, -1.0, 4.8, 0.8, 3, -42.0, 5e6, 7.5, 8.3};
 double val_f64[] = {2.0, -1.0, 4.8, 0.8, 3, -42.0, 5e6, 7.5};
 v4di val_i64[] = {
@@ -241,6 +243,12 @@ v4di indexd = {0x00000002000000efull, 0xfffffff500000010ull,
 
 v4di gather_mem[0x20];
 
+void init_f16reg(v4di *r)
+{
+    memset(r, 0, sizeof(*r));
+    memcpy(r, val_f16, sizeof(val_f16));
+}
+
 void init_f32reg(v4di *r)
 {
     static int n;
@@ -315,6 +323,15 @@ int main(int argc, char *argv[])
     printf("Int:\n");
     dump_regs(&initI);
 
+    init_all(&initF16);
+    init_f16reg(&initF16.ymm[10]);
+    init_f16reg(&initF16.ymm[11]);
+    init_f16reg(&initF16.ymm[12]);
+    init_f16reg(&initF16.mem0[1]);
+    initF16.ff = 16;
+    printf("F16:\n");
+    dump_regs(&initF16);
+
     init_all(&initF32);
     init_f32reg(&initF32.ymm[10]);
     init_f32reg(&initF32.ymm[11]);
diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index 02982329f1..ebb1d99c5e 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -9,6 +9,7 @@
 archs = [
     "SSE", "SSE2", "SSE3", "SSSE3", "SSE4_1", "SSE4_2",
     "AES", "AVX", "AVX2", "AES+AVX", "VAES+AVX",
+    "F16C",
 ]
 
 ignore = set(["FISTTP",
@@ -19,6 +20,7 @@
     'vBLENDPS': 0x0f,
     'CMP[PS][SD]': 0x07,
     'VCMP[PS][SD]': 0x1f,
+    'vCVTPS2PH': 0x7,
     'vDPPD': 0x33,
     'vDPPS': 0xff,
     'vEXTRACTPS': 0x03,
@@ -221,8 +223,10 @@ def ArgGenerator(arg, op):
 class InsnGenerator:
     def __init__(self, op, args):
         self.op = op
-        if op[-2:] in ["PS", "PD", "SS", "SD"]:
-            if op[-1] == 'S':
+        if op[-2:] in ["PH", "PS", "PD", "SS", "SD"]:
+            if op[-1] == 'H':
+                self.optype = 'F16'
+            elif op[-1] == 'S':
                 self.optype = 'F32'
             else:
                 self.optype = 'F64'
-- 
2.37.3


