Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E75B51EB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:29:09 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWNw-0002ky-SF
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1E-0000wZ-Qs
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW17-0007LG-1l
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GW2XheR4o4W6ufiiIloxx0V0HDwPwXTU2rDqcPVe0eA=;
 b=MtD8+k9ZFqEFNY0jREDIztSOrqs+Db/A6pOvXKXkCWcGwZ0Cwgol01zml4eENfuHMJDilt
 m3Qj+WJW0/Q3OAjLl7qTB36TVryf2D7Xzfd/p2qG9WriN+LH4jlCVEhBcO55YmrZSOpDKm
 Tn5fZp3ZVIg0CMP+WzpwKL7cl4hnqGc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-Xfph4AaZPSSknvfiLmeDHg-1; Sun, 11 Sep 2022 19:05:31 -0400
X-MC-Unique: Xfph4AaZPSSknvfiLmeDHg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z2-20020a056402274200b004516734e755so2469572edd.3
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GW2XheR4o4W6ufiiIloxx0V0HDwPwXTU2rDqcPVe0eA=;
 b=OdM3YRTtffTv1fA6hjV3XjFiF0difeRi4iXHG6PMGM5qEhN/8n7yQNiEIsnRBM5SjI
 b2zmKREC7Z6SKtw/U+H6NGqVr1euLtzgJrmKL495i11l4WEenGnumUyhtNy7LkTGUELd
 cOIc640ZLAOPmq9WvzzXl5qQb9DWEG9rGuSXz8+xfU90dGRHZSytPSvkt8onUeCPdfgo
 mlqgPaTSJWmZDDO6Myb10ghItOn9mHh8ffg3etXceCu4JnxZyzdzmzp80gD+wy1O/eCX
 7x3LQyxSmvBQ8Re76w8rQeqxXPCZiKBn7DX+JtF9R5ycYd6TIcmKngrx7NR1xqzxJy54
 fqfw==
X-Gm-Message-State: ACgBeo13F3taulddP1tvGRL/pl4o+btzAJwPAuCsSrkvR15pfRzpL8Bx
 ySnH7cs9DYps5N3/ZIsouOb+Zp27EYB0THWmD7605LXrzPXmdl3Mh+SSzVQbolZToBHNvdbtgiT
 I66oh6B7RfMiXYOCeJdlQ+w5fI2M44U73Li5fI5611jhxJiJ98ZsEutPKOi0QJXCRqe4=
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id
 dd7-20020a1709069b8700b0073317952855mr16785118ejc.156.1662937529836; 
 Sun, 11 Sep 2022 16:05:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6EwMzJuufccI18w0T5Jo3qrX20KFW8EKkG1+w8tUdiP2MwPIuY6nXk4xv7XiEU4y69PZWnfg==
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id
 dd7-20020a1709069b8700b0073317952855mr16785100ejc.156.1662937529423; 
 Sun, 11 Sep 2022 16:05:29 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a056402101a00b0044792480994sm4612566edu.68.2022.09.11.16.05.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/37] target/i386: reimplement 0x0f 0x50-0x5f, add AVX
Date: Mon, 12 Sep 2022 01:04:02 +0200
Message-Id: <20220911230418.340941-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are mostly floating-point SSE operations.  The odd ones out
are MOVMSK and CVTxx2yy, the others are straightforward.

Unary operations are a bit special in AVX because they have 2 operands
for PD/PS operands (VEX.vvvv must be 1111b), and 3 operands for SD/SS.
They are handled using X86_OP_GROUP3 for compactness.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  32 ++++++
 target/i386/tcg/emit.c.inc       | 175 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   2 +-
 3 files changed, 208 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 59f5637583..5a94e05d71 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -243,7 +243,30 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = opcodes_0F3A[*b];
 }
 
+static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
+        entry->op1 = X86_TYPE_None;
+        entry->s1 = X86_SIZE_None;
+    }
+    switch (*b) {
+    case 0x51: entry->gen = gen_VSQRT; break;
+    case 0x52: entry->gen = gen_VRSQRT; break;
+    case 0x53: entry->gen = gen_VRCP; break;
+    case 0x5A: entry->gen = gen_VCVTfp2fp; break;
+    }
+}
+
 static const X86OpEntry opcodes_0F[256] = {
+    [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
+    [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
+    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
+    [0x54] = X86_OP_ENTRY3(VAND,       V,x, H,x, W,x,  vex4 p_00_66),
+    [0x55] = X86_OP_ENTRY3(VANDN,      V,x, H,x, W,x,  vex4 p_00_66),
+    [0x56] = X86_OP_ENTRY3(VOR,        V,x, H,x, W,x,  vex4 p_00_66),
+    [0x57] = X86_OP_ENTRY3(VXOR,       V,x, H,x, W,x,  vex4 p_00_66),
+
     [0x60] = X86_OP_ENTRY3(PUNPCKLBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x61] = X86_OP_ENTRY3(PUNPCKLWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x62] = X86_OP_ENTRY3(PUNPCKLDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
@@ -256,6 +279,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
+    [0x58] = X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x59] = X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex3 p_00_66_f3_f2),
+    [0x5b] = X86_OP_ENTRY2(VCVTps_dq,  V,x, W,x,      vex2 p_00_66_f3),
+    [0x5c] = X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5d] = X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5e] = X86_OP_ENTRY3(VDIV,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5f] = X86_OP_ENTRY3(VMAX,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+
     [0x68] = X86_OP_ENTRY3(PUNPCKHBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x69] = X86_OP_ENTRY3(PUNPCKHWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x6a] = X86_OP_ENTRY3(PUNPCKHDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 1ba7a45668..5feb50efdb 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -246,6 +246,140 @@ static void gen_store_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
     }
 }
 
+static inline int sse_prefix(DisasContext *s)
+{
+    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        return s->prefix & PREFIX_REPZ ? 0xf3 : 0xf2;
+    } else {
+        return s->prefix & PREFIX_DATA ? 0x66 : 0x00;
+    }
+}
+
+/*
+ * 00 = v*ps Vps, Hps, Wpd
+ * 66 = v*pd Vpd, Hpd, Wps
+ * f3 = v*ss Vss, Hss, Wps
+ * f2 = v*sd Vsd, Hsd, Wps
+ */
+static inline void gen_unary_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                              SSEFunc_0_epp pd_xmm, SSEFunc_0_epp ps_xmm,
+                              SSEFunc_0_epp pd_ymm, SSEFunc_0_epp ps_ymm,
+                              SSEFunc_0_eppp sd, SSEFunc_0_eppp ss)
+{
+    if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) != 0) {
+        SSEFunc_0_eppp fn = s->prefix & PREFIX_REPZ ? ss : sd;
+        if (!fn) {
+            gen_illegal_opcode(s);
+            return;
+        }
+        fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    } else {
+        SSEFunc_0_epp ps, pd, fn;
+        ps = s->vex_l ? ps_ymm : ps_xmm;
+        pd = s->vex_l ? pd_ymm : pd_xmm;
+        fn = s->prefix & PREFIX_DATA ? pd : ps;
+        if (!fn) {
+            gen_illegal_opcode(s);
+            return;
+        }
+        fn(cpu_env, s->ptr0, s->ptr2);
+    }
+}
+#define UNARY_FP_SSE(uname, lname)                                                 \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_fp_sse(s, env, decode,                                               \
+                     gen_helper_##lname##pd_xmm,                                   \
+                     gen_helper_##lname##ps_xmm,                                   \
+                     gen_helper_##lname##pd_ymm,                                   \
+                     gen_helper_##lname##ps_ymm,                                   \
+                     gen_helper_##lname##sd,                                       \
+                     gen_helper_##lname##ss);                                      \
+}
+UNARY_FP_SSE(VSQRT, sqrt)
+
+/*
+ * 00 = v*ps Vps, Hps, Wpd
+ * 66 = v*pd Vpd, Hpd, Wps
+ * f3 = v*ss Vss, Hss, Wps
+ * f2 = v*sd Vsd, Hsd, Wps
+ */
+static inline void gen_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                              SSEFunc_0_eppp pd_xmm, SSEFunc_0_eppp ps_xmm,
+                              SSEFunc_0_eppp pd_ymm, SSEFunc_0_eppp ps_ymm,
+                              SSEFunc_0_eppp sd, SSEFunc_0_eppp ss)
+{
+    SSEFunc_0_eppp ps, pd, fn;
+    if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) != 0) {
+        fn = s->prefix & PREFIX_REPZ ? ss : sd;
+    } else {
+        ps = s->vex_l ? ps_ymm : ps_xmm;
+        pd = s->vex_l ? pd_ymm : pd_xmm;
+        fn = s->prefix & PREFIX_DATA ? pd : ps;
+    }
+    if (fn) {
+        fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    } else {
+        gen_illegal_opcode(s);
+    }
+}
+#define FP_SSE(uname, lname)                                                       \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_fp_sse(s, env, decode,                                                     \
+               gen_helper_##lname##pd_xmm,                                         \
+               gen_helper_##lname##ps_xmm,                                         \
+               gen_helper_##lname##pd_ymm,                                         \
+               gen_helper_##lname##ps_ymm,                                         \
+               gen_helper_##lname##sd,                                             \
+               gen_helper_##lname##ss);                                            \
+}
+FP_SSE(VADD, add)
+FP_SSE(VMUL, mul)
+FP_SSE(VSUB, sub)
+FP_SSE(VMIN, min)
+FP_SSE(VDIV, div)
+FP_SSE(VMAX, max)
+
+/*
+ * 00 = v*ps Vps, Wpd
+ * f3 = v*ss Vss, Wps
+ */
+static inline void gen_unary_fp32_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                      SSEFunc_0_epp ps_xmm,
+                                      SSEFunc_0_epp ps_ymm,
+                                      SSEFunc_0_eppp ss)
+{
+    if ((s->prefix & (PREFIX_DATA | PREFIX_REPNZ)) != 0) {
+        goto illegal_op;
+    } else if (s->prefix & PREFIX_REPZ) {
+        if (!ss) {
+            goto illegal_op;
+        }
+        ss(cpu_env, s->ptr0, s->ptr1, s->ptr2);
+    } else {
+        SSEFunc_0_epp fn = s->vex_l ? ps_ymm : ps_xmm;
+        if (!fn) {
+            goto illegal_op;
+        }
+        fn(cpu_env, s->ptr0, s->ptr2);
+    }
+    return;
+
+illegal_op:
+    gen_illegal_opcode(s);
+}
+#define UNARY_FP32_SSE(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_fp32_sse(s, env, decode,                                             \
+                       gen_helper_##lname##ps_xmm,                                 \
+                       gen_helper_##lname##ps_ymm,                                 \
+                       gen_helper_##lname##ss);                                    \
+}
+UNARY_FP32_SSE(VRSQRT, rsqrt)
+UNARY_FP32_SSE(VRCP, rcp)
+
 /*
  * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
  * 66 = vp* Vx, Hx, Wx
@@ -517,6 +651,16 @@ static void gen_MOVDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_store_sse(s, env, decode, decode->op[2].offset);
 }
 
+static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    typeof(gen_helper_movmskps_ymm) *ps, *pd, *fn;
+    ps = s->vex_l ? gen_helper_movmskps_ymm : gen_helper_movmskps_xmm;
+    pd = s->vex_l ? gen_helper_movmskpd_ymm : gen_helper_movmskpd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(s->tmp2_i32, cpu_env, s->ptr2);
+    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -733,3 +877,34 @@ static void gen_SHRX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
     tcg_gen_shr_tl(s->T0, s->T0, s->T1);
 }
+
+#define gen_VAND   gen_PAND
+#define gen_VANDN  gen_PANDN
+
+static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_unary_fp_sse(s, env, decode,
+                     gen_helper_cvtpd2ps_xmm, gen_helper_cvtps2pd_xmm,
+                     gen_helper_cvtpd2ps_ymm, gen_helper_cvtps2pd_ymm,
+                     gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
+}
+
+static void gen_VCVTps_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn = NULL;
+    switch (sse_prefix(s)) {
+    case 0x00:
+        fn = s->vex_l ? gen_helper_cvtdq2ps_ymm : gen_helper_cvtdq2ps_xmm;
+        break;
+    case 0x66:
+        fn = s->vex_l ? gen_helper_cvtps2dq_ymm : gen_helper_cvtps2dq_xmm;
+        break;
+    case 0xf3:
+        fn = s->vex_l ? gen_helper_cvttps2dq_ymm : gen_helper_cvttps2dq_xmm;
+        break;
+    }
+    fn(cpu_env, s->ptr0, s->ptr2);
+}
+
+#define gen_VOR   gen_POR
+#define gen_VXOR  gen_PXOR
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 11c17258eb..8ef419dd59 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4667,7 +4667,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            ((b >= 0x160 && b <= 0x16f) ||
+            ((b >= 0x150 && b <= 0x16f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             return disas_insn_new(s, cpu, b + 0x100);
         }
-- 
2.37.2



