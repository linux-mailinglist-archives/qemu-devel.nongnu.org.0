Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C04D0DC4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:00:34 +0100 (CET)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP9N-0007bK-Vy
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:00:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3C-0006GD-7f
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:10 -0500
Received: from [2607:f8b0:4864:20::1031] (port=37692
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3A-0007u7-8N
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso884843pjj.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIkDrKPjIFQDWf/u9lIIkn47c2ajCrHecdrKXw/wTUs=;
 b=XMtOxnxCfoAL6ctEmMoUTRHa92xlDq0Tg8ZrK64FoRC/5kUa8JMs/Ml9qXkSKYp9+C
 uDQkU/cFGq31ClH2Tl6vDsjFFsv8MI86MeVtjdaWEw2qANdhUgUZG1MVhD92X5aMQs9r
 LGuKrXvI13Pupr5+3kVBE191snMLP90gLgsS88V2Q+Jy8KRnJbxWGf4iH/CmoLvVZaDZ
 i4LZbKxmV7me3rMsg8FLnkMKyzXWrZ1qr1znSqND7S96rdsm64OeMAFY8gIYRFwscTdz
 J59gpPLcI0T5sW2DKuhKDXKLDfVKNXJGXF+5Z2NcDb+s5fu+MpM4Ss6reVyvffCfMpVh
 FBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIkDrKPjIFQDWf/u9lIIkn47c2ajCrHecdrKXw/wTUs=;
 b=S+MXyEkJgXXzp//wfQksm7NzzXnmHsJWSlOxMyHzheOvrhuvzVYly+d3RucXJIujcE
 QN0N2dXzlnvE9Y+rG/z6rTbtVDsS+HDGc4I8ZBxhxDc5A/dRBFbmvGuOrspHUSxUHMSk
 VEn44/zVqzhzGVZAdEpYt91SeX77HARbXk0yvx4VximBXj7LaPw3ZRKvKoX3AYAjUYF1
 Mkw6pY8EWE87NiW1z6ulFBhWiG4PiFIDExV2VSIopkL5IXYq7KagrfxFKQQYhet8cIns
 LCAkvXYairUjztesQjLx6C3nC2u3UC3Tl6SBFrpgyo1tg63gfv3QXp02pAALnei8AzJu
 EaUA==
X-Gm-Message-State: AOAM531DnAvyFO5Iuvf70UzciCElnBGXVyXC/SpYyOx+UhK+48T6itT2
 6ZVPY6goxJvEHd29mAGK01eKQWNiK25y5g==
X-Google-Smtp-Source: ABdhPJy7nN40LFO/tN7tDtBkx7FSXCIHR4iCWqKhLa+PTcULJ1fIC7MrO2GoJg4DAXyQRbyVcJSqyg==
X-Received: by 2002:a17:902:8ec7:b0:14a:c442:8ca2 with SMTP id
 x7-20020a1709028ec700b0014ac4428ca2mr15334745plo.12.1646704446989; 
 Mon, 07 Mar 2022 17:54:06 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/11] target/s390x: vxeh2: Update for changes to vector
 shifts
Date: Mon,  7 Mar 2022 15:53:51 -1000
Message-Id: <20220308015358.188499-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Prior to vector enhancements 2, the shift count was supposed to be equal
for each byte lest the result be unpredictable, which allowed us to assume
that the shift count was the same, and optimize accordingly.

With vector enhancements 2, the shift count is allowed to be different
for each byte, and we must cope with that.

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-4-dmiller423@gmail.com>
[rth: Split out of larger patch; simplify shift/merge code.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h               |  3 ++
 target/s390x/tcg/vec_int_helper.c   | 58 ++++++++++++++++++++++
 target/s390x/tcg/translate_vx.c.inc | 77 ++++++++++++-----------------
 target/s390x/tcg/insn-data.def      | 12 ++---
 4 files changed, 99 insertions(+), 51 deletions(-)

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
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
index 5561b3ed90..a881d5d267 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -540,18 +540,76 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
     s390_vec_shl(v1, v2, count);
 }
 
+void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
+                          uint32_t desc)
+{
+    S390Vector tmp;
+    uint32_t sh, e0, e1 = 0;
+
+    for (int i = 15; i >= 0; --i, e1 = e0 << 24) {
+        e0 = s390_vec_read_element8(v2, i);
+        sh = s390_vec_read_element8(v3, i) & 7;
+
+        s390_vec_write_element8(&tmp, i, rol32(e0 | e1, sh));
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
+    uint32_t sh, e0, e1;
+    int i = 0;
+
+    e0 = s390_vec_read_element8(v2, 0);
+    e1 = -(e0 >> 7) << 8;
+
+    for (;;) {
+        sh = s390_vec_read_element8(v3, i) & 7;
+
+        s390_vec_write_element8(&tmp, i, (e0 | e1) >> sh);
+
+        if (++i >= 16) {
+            break;
+        }
+
+        e1 = e0 << 8;
+        e0 = s390_vec_read_element8(v2, i);
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
+    for (int i = 0; i < 16; ++i, e1 = e0 << 8) {
+        e0 = s390_vec_read_element8(v2, i);
+        sh = s390_vec_read_element8(v3, i) & 7;
+
+        s390_vec_write_element8(&tmp, i, (e0 | e1) >> sh);
+    }
+
+    *(S390Vector *)v1 = tmp;
+}
+
 #define DEF_VSCBI(BITS)                                                        \
 void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2, const void *v3,        \
                               uint32_t desc)                                   \
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index d514e8b218..967f6213d8 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2018,21 +2018,42 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType gen_vsh_bit_byte(DisasContext *s, DisasOps *o,
+                                      gen_helper_gvec_2i *gen,
+                                      gen_helper_gvec_3 *gen_ve2)
+{
+    bool byte = s->insn->data;
+
+    if (!byte && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_ve2);
+    } else {
+        TCGv_i64 shift = tcg_temp_new_i64();
+
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, byte ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2), shift, 0, gen);
+        tcg_temp_free_i64(shift);
+    }
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
+    return gen_vsh_bit_byte(s, o, gen_helper_gvec_vsl,
+                            gen_helper_gvec_vsl_ve2);
+}
 
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x74) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
-    } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+{
+    return gen_vsh_bit_byte(s, o, gen_helper_gvec_vsra,
+                            gen_helper_gvec_vsra_ve2);
+}
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsl);
-    tcg_temp_free_i64(shift);
-    return DISAS_NEXT;
+static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
+{
+    return gen_vsh_bit_byte(s, o, gen_helper_gvec_vsrl,
+                            gen_helper_gvec_vsrl_ve2);
 }
 
 static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
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
-- 
2.25.1


