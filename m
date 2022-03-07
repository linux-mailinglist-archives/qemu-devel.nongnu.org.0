Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379A4CEF52
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:08:13 +0100 (CET)
Received: from localhost ([::1]:38698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2nE-0000wh-5s
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2is-0002UQ-OP; Sun, 06 Mar 2022 21:03:42 -0500
Received: from [2607:f8b0:4864:20::f36] (port=44719
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2iq-0005ww-LQ; Sun, 06 Mar 2022 21:03:42 -0500
Received: by mail-qv1-xf36.google.com with SMTP id jr3so11009304qvb.11;
 Sun, 06 Mar 2022 18:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1Y2bDCmcXShyTNYfJ2xEuhOk5Smg5R1nDTPEyYkOD4=;
 b=BijGUeI9Nwirwgkil4CgNMiwkAJ3HQNRn0sEvtozxPLZrcqiIpFQZeAjVeStxDh68L
 /f4fKMV3ch6BseLTTdsluKrq0SIqfbgndk55skpq8MW/asrt8fC6cSQ5XtekIFY8j4va
 HsP23QO5K07HGy70FRuNattzURROxXA+/f+aYByzKKIZ/L89mKV8ZOyAocJtmDqSxMVc
 BNG9+THhKEvDuFxqpaCECNcqBsebSjtCFoJdT2Grp0USc45YxCqWHmADZwlcS8DAPJaZ
 yRNEAuwiZsg+PMG1LieyRbGcBBW7WN3pU2XfRBTCvWfIuefYfr96iOkoUoxc87FYMtIQ
 lN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1Y2bDCmcXShyTNYfJ2xEuhOk5Smg5R1nDTPEyYkOD4=;
 b=c9u4U0+eq3DtZtKEKHdD5mazS7nQSzpoZxAZ1kFdZPrMOKzQp1df9GMgBYaYyW/B+r
 QHQ/CxTNhs/ZPgKLNd3r2r89XzxRuDXjR4MZYP5FvbFRFxc5YiySgsiCueJx6rgiUxHX
 7Gsb2fBWWE43+ZSiJhmmFSMO79A5dA1jwG9RUnPBK2H6olz4JHROSDeSWeoqfxoFO3xa
 x5iUu4SF90Dc+uCmU0OWnsKXs/hBoKfU1QDLhnN+dqSFi8amcI1nhIW0LFTCGN7yFNvj
 Q7Rdy/0Jr//Bb5gWASEihUEtkvdW8T0ogXMABzBKr+snrI5olGupgPmXZvDprzO8wDr/
 QGsQ==
X-Gm-Message-State: AOAM533v3u4fG4ZTOtcANaL/IuFeOjxoOl+Q0CuZ+xIiWGnRGYO5Lwo1
 yeL/Ttxkzq22i9OKSEmLkhP2PjM1OIk/uA==
X-Google-Smtp-Source: ABdhPJwjlj0rHzuo/gIW2hfZYKgYQDvykj56cEtCbC+hAQCW539ikGOzTogI41nsJsKNeVYf4/Vggg==
X-Received: by 2002:a05:6214:1949:b0:435:7a22:ae1c with SMTP id
 q9-20020a056214194900b004357a22ae1cmr4173001qvk.31.1646618619205; 
 Sun, 06 Mar 2022 18:03:39 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:38 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] target/s390x: vxeh2: vector shift {double by bit, left,
 right {logical, arithmetic}}
Date: Sun,  6 Mar 2022 21:03:23 -0500
Message-Id: <20220307020327.3003-4-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 include/qemu/bitops.h               |  25 +++++++
 target/s390x/helper.h               |   3 +
 target/s390x/tcg/insn-data.def      |   6 +-
 target/s390x/tcg/translate_vx.c.inc | 108 ++++++++++++++++++----------
 target/s390x/tcg/vec_int_helper.c   |  58 +++++++++++++++
 5 files changed, 163 insertions(+), 37 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..72426deea0 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -445,6 +445,31 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
      */
     return ((int64_t)(value << (64 - length - start))) >> (64 - length);
 }
+/**
+ * deposit8:
+ * @value: initial value to insert bit field into
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ * @fieldval: the value to insert into the bit field
+ *
+ * Deposit @fieldval into the 8 bit @value at the bit field specified
+ * by the @start and @length parameters, and return the modified
+ * @value. Bits of @value outside the bit field are not modified.
+ * Bits of @fieldval above the least significant @length bits are
+ * ignored. The bit field must lie entirely within the 8 bit byte.
+ * It is valid to request that all 8 bits are modified (ie @length
+ * 8 and @start 0).
+ *
+ * Returns: the modified @value.
+ */
+static inline uint8_t deposit8(uint8_t value, int start, int length,
+                               uint8_t fieldval)
+{
+    uint8_t mask;
+    assert(start >= 0 && length > 0 && length <= 8 - start);
+    mask = (~0ULL >> (8 - length)) << start;
+    return (value & ~mask) | ((fieldval << start) & mask);
+}
 
 /**
  * deposit32:
diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 1e38ee2e4e..a36308d651 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -203,8 +203,11 @@ DEF_HELPER_FLAGS_3(gvec_vpopct16, TCG_CALL_NO_RWG, void, ptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_verim8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_verim16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsra, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsra_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsrl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsrl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vscbi8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vscbi16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_4(gvec_vtm, void, ptr, cptr, env, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 46add91a0e..1bfe88a4ac 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1207,12 +1207,16 @@
     F(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
 /* VECTOR SHIFT LEFT BY BYTE */
     F(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
+/* VECTOR SHIFT LEFT DOUBLE BY BIT */
+	F(0xe786, VSLD,    VRI_d, VE2, 0, 0, 0, 0, vsld, 0, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
-    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
+    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsld, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC */
     F(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
     F(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
+/* VECTOR SHIFT RIGHT DOUBLE BY BIT */
+	F(0xe787, VSRD,    VRI_d, VE2, 0, 0, 0, 0, vsrd, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL */
     F(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index db86d9b87d..60e1efdbfa 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2020,26 +2020,33 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x74) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    const bool B = 0x75 == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0,  gen_helper_gvec_vsl_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsl);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsl);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 {
-    const uint8_t i4 = get_field(s, i4) & 0xf;
-    const int left_shift = (i4 & 7) * 8;
-    const int right_shift = 64 - left_shift;
+    const uint8_t mask = (0x86 == s->fields.op2) ? 7 : 15;
+    const uint8_t mul  = (0x86 == s->fields.op2) ? 1 : 8;
+    const uint8_t i4   = get_field(s, i4);
+    const int shift = 64 - (i4 & 7) * mul;
+
+    if (i4 & ~mask) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -2053,8 +2060,8 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
         read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
         read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
     }
-    tcg_gen_extract2_i64(t0, t1, t0, right_shift);
-    tcg_gen_extract2_i64(t1, t2, t1, right_shift);
+    tcg_gen_extract2_i64(t0, t1, t0, shift);
+    tcg_gen_extract2_i64(t1, t2, t1, shift);
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
 
@@ -2064,37 +2071,66 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
+    const uint8_t i4 = get_field(s, i4);
+    const int left_shift = (i4 & 7);
+    if (i4 & ~7) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    read_vec_element_i64(t0, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
+    read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
+
+    tcg_gen_extract2_i64(t0, t1, t0, left_shift);
+    tcg_gen_extract2_i64(t1, t2, t1, left_shift);
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
 
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7e) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+{
+    const bool B = 0x7f == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_helper_gvec_vsra_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsra);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsra);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7c) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    const bool B = 0x7d == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_helper_gvec_vsrl_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsrl);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsrl);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
index 5561b3ed90..02d0a1cc94 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -540,18 +540,76 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
     s390_vec_shl(v1, v2, count);
 }
 
+void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
+                          uint32_t desc)
+{
+    uint8_t i, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i);
+
+        if (shift) {
+            v <<= shift;
+            if (i < 15) {
+                v |= extract8(s390_vec_read_element8(v2, i + 1),
+                              8 - shift, shift);
+            }
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 void HELPER(gvec_vsra)(void *v1, const void *v2, uint64_t count,
                        uint32_t desc)
 {
     s390_vec_sar(v1, v2, count);
 }
 
+void HELPER(gvec_vsra_ve2)(void *v1, const void *v2, const void *v3,
+                           uint32_t desc)
+{
+    int i;
+    uint8_t t, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i);
+        if (shift) {
+            t = i > 0 ? s390_vec_read_element8(v2, i - 1)
+                      : ((v & 0x80) ? ~0 : 0);
+            v = deposit8(v >> shift, 8 - shift, shift, t);
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 void HELPER(gvec_vsrl)(void *v1, const void *v2, uint64_t count,
                        uint32_t desc)
 {
     s390_vec_shr(v1, v2, count);
 }
 
+void HELPER(gvec_vsrl_ve2)(void *v1, const void *v2, const void *v3,
+                           uint32_t desc)
+{
+    int i;
+    uint8_t t, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i) >> shift;
+        if (shift) {
+            t = (0 == i ? 0 : s390_vec_read_element8(v2, i - 1));
+            v = deposit8(v, 8 - shift, shift, t);
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 #define DEF_VSCBI(BITS)                                                        \
 void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2, const void *v3,        \
                               uint32_t desc)                                   \
-- 
2.34.1


