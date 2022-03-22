Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECD4E3545
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:11:46 +0100 (CET)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS7l-0007nR-58
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:11:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1O-0007qv-KJ; Mon, 21 Mar 2022 20:05:14 -0400
Received: from [2607:f8b0:4864:20::82e] (port=39564
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1J-0007Hx-Vj; Mon, 21 Mar 2022 20:05:10 -0400
Received: by mail-qt1-x82e.google.com with SMTP id bp39so1574884qtb.6;
 Mon, 21 Mar 2022 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ys+39EveOz/PBNHNI2BHRS6As6dw5RA06pHTn4MihlY=;
 b=SAq2nmSXkZ7IWolYAoyuT0Q2nuP54o/MUgAiu9tIb7LZ70IJloCwu71JHELJEIkxGa
 ekuNLVS2UE9e6hilj/1XNdJI4hjGiT5ta+55qvd/8nJmgEswfEov7e6M2OOpN2oKYtYl
 7xGh7P2BivJClINe1s24kXDVOQ84/0sdpHZk/xErmVk9hLvZMMumrJYHr7ZBsx3gvcMo
 KoDjU2KDZoZA59rU29Qpbg5NsbPpYHu79v86sr/XUUVs+SiBwQgVE330s5Cw2t79st0N
 7G267DR2tbfwm/BTU53cez5WWyK3IrNPCF0at0ml+L9YXu0XVoHtk27jFjIGhocYOvte
 Ijzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ys+39EveOz/PBNHNI2BHRS6As6dw5RA06pHTn4MihlY=;
 b=1HrNZJtmnVBHLBEHDD5JTfvp++TxmubOk8I+Gu3/umtLMFm7Njfo0u4c+wpCwfVjaZ
 TN8y3gunamQGMt+2MYBk9sh350JAzC0RkMKvR/dBz3xEOh3vL+Q+yP9mHShfG6yjAz1X
 7PfFOb7JpDJsQ79Ky6W0hA5I+MvdkVtaHaeV7zW1GkUf5+nJ6Vo2FXORQzT8yL4MxQEV
 2yPTk1i/j18U2VZrii6hmyKK/AgUGvtdhscbus/Z/F3UBe1GW3FVsVyoeM4a32L3Mc2F
 zuAFgFB14q/ywVN4A8X79Rw/9HNnpb3k1NfJJFNytEX4SfNbaSQpCyq5/bcpD4FRSntM
 jgjw==
X-Gm-Message-State: AOAM531fUH+CsRd8hBlDaiM1ky9inCgQjvpkEe7PQ5ngn4LGED63MCgo
 Uq3wrikYN50XQR/1TOcSp2tXEPI/PEEJeA==
X-Google-Smtp-Source: ABdhPJz+RnL7JHaMJ22p0Gv3vHiK4Mdg11M95aWlK9FWc4pbKU7GsJhzrXmyUtORPzRkzbaElw9L1Q==
X-Received: by 2002:a05:622a:118d:b0:2e0:75f2:39f8 with SMTP id
 m13-20020a05622a118d00b002e075f239f8mr18505279qtk.125.1647907497653; 
 Mon, 21 Mar 2022 17:04:57 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:57 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 04/11] target/s390x: vxeh2: Update for changes to vector
 shifts
Date: Mon, 21 Mar 2022 20:04:34 -0400
Message-Id: <20220322000441.26495-5-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x82e.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h               |  3 ++
 target/s390x/tcg/insn-data.def      | 12 ++---
 target/s390x/tcg/translate_vx.c.inc | 75 ++++++++++++-----------------
 target/s390x/tcg/vec_int_helper.c   | 55 +++++++++++++++++++++
 4 files changed, 95 insertions(+), 50 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 7412130883..bf33d86f74 100644
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
index 46add91a0e..f487a64abf 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1204,19 +1204,19 @@
     F(0xe778, VESRLV,  VRR_c, V,   0, 0, 0, 0, vesv, 0, IF_VEC)
     F(0xe738, VESRL,   VRS_a, V,   la2, 0, 0, 0, ves, 0, IF_VEC)
 /* VECTOR SHIFT LEFT */
-    F(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
+    E(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, 0, IF_VEC)
 /* VECTOR SHIFT LEFT BY BYTE */
-    F(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
+    E(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, 1, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
     F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC */
-    F(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
+    E(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
-    F(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
+    E(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, 1, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL */
-    F(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, IF_VEC)
+    E(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */
-    F(0xe77d, VSRLB,   VRR_c, V,   0, 0, 0, 0, vsrl, 0, IF_VEC)
+    E(0xe77d, VSRLB,   VRR_c, V,   0, 0, 0, 0, vsrl, 0, 1, IF_VEC)
 /* VECTOR SUBTRACT */
     F(0xe7f7, VS,      VRR_c, V,   0, 0, 0, 0, vs, 0, IF_VEC)
 /* VECTOR SUBTRACT COMPUTE BORROW INDICATION */
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 29e4dd78a8..fd53ddafef 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2018,23 +2018,44 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
+static DisasJumpType gen_vsh_by_byte(DisasContext *s, DisasOps *o,
+                                      gen_helper_gvec_2i *gen,
+                                      gen_helper_gvec_3 *gen_ve2)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
+    bool byte = s->insn->data;
 
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x74) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    if (!byte && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsl);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, byte ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2), shift, 0, gen);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
+{
+    return gen_vsh_by_byte(s, o, gen_helper_gvec_vsl,
+                            gen_helper_gvec_vsl_ve2);
+}
+
+static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+{
+    return gen_vsh_by_byte(s, o, gen_helper_gvec_vsra,
+                            gen_helper_gvec_vsra_ve2);
+}
+
+static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
+{
+    return gen_vsh_by_byte(s, o, gen_helper_gvec_vsrl,
+                            gen_helper_gvec_vsrl_ve2);
+}
+
 static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
 {
     const uint8_t i4 = get_field(s, i4) & 0xf;
@@ -2064,40 +2085,6 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
-{
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7e) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
-    } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
-
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsra);
-    tcg_temp_free_i64(shift);
-    return DISAS_NEXT;
-}
-
-static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
-{
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7c) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
-    } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
-
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsrl);
-    tcg_temp_free_i64(shift);
-    return DISAS_NEXT;
-}
-
 static DisasJumpType op_vs(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m4);
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
index 5561b3ed90..4b6358c67c 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -540,18 +540,73 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
     s390_vec_shl(v1, v2, count);
 }
 
+void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
+                          uint32_t desc)
+{
+    S390Vector tmp;
+    uint32_t sh, e0, e1 = 0;
+    int i;
+
+    for (i = 15; i >= 0; --i, e1 = e0) {
+        e0 = s390_vec_read_element8(v2, i);
+        sh = s390_vec_read_element8(v3, i) & 7;
+
+        s390_vec_write_element8(&tmp, i, rol32(e0 | (e1 << 24), sh));
+    }
+
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
+    S390Vector tmp;
+    uint32_t sh, e0, e1 = 0;
+    int i = 0;
+
+    /* Byte 0 is special only. */
+    e0 = (int32_t)(int8_t)s390_vec_read_element8(v2, i);
+    sh = s390_vec_read_element8(v3, i) & 7;
+    s390_vec_write_element8(&tmp, i, e0 >> sh);
+
+    e1 = e0;
+    for (i = 1; i < 16; ++i, e1 = e0) {
+        e0 = s390_vec_read_element8(v2, i);
+        sh = s390_vec_read_element8(v3, i) & 7;
+        s390_vec_write_element8(&tmp, i, (e0 | e1 << 8) >> sh);
+    }
+
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
+    S390Vector tmp;
+    uint32_t sh, e0, e1 = 0;
+
+    for (int i = 0; i < 16; ++i, e1 = e0) {
+        e0 = s390_vec_read_element8(v2, i);
+        sh = s390_vec_read_element8(v3, i) & 7;
+
+        s390_vec_write_element8(&tmp, i, (e0 | (e1 << 8)) >> sh);
+    }
+
+    *(S390Vector *)v1 = tmp;
+}
+
 #define DEF_VSCBI(BITS)                                                        \
 void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2, const void *v3,        \
                               uint32_t desc)                                   \
-- 
2.34.1


