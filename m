Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0C5130F7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:10:49 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk16m-0007NF-6W
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kL-00038e-9g
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kJ-0008JA-D6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvpLQSd1A0iWDNyXXAVHqG1UTQvTJBBDvwr78h3UaRI=;
 b=PAnxLD6RN9/+cdPSxvQcr574iQSOZs5nxE1uSty3Zn1Qb1JGvSpB2SMg5cnDNIt0K9PuYa
 SZGD5INdOnrQZywaLnUBdjAYDpbN4e52rqomIrljjGiNhjxX2PwOzE2i/k7gbe5sIFw3MO
 n8to8aHVB0fZURRAYjtEOnOEnBHG+3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-RiDifrvJNbqljj_4-GDtuQ-1; Thu, 28 Apr 2022 05:47:29 -0400
X-MC-Unique: RiDifrvJNbqljj_4-GDtuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F431381078D;
 Thu, 28 Apr 2022 09:47:29 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18E9B40CFD16;
 Thu, 28 Apr 2022 09:47:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/13] target/s390x: vxeh2: Update for changes to vector
 shifts
Date: Thu, 28 Apr 2022 11:47:02 +0200
Message-Id: <20220428094708.84835-8-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
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
index 8ddbd440e2..81673ea68f 100644
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
index b44859ee16..53ab5c5eb3 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -539,18 +539,73 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
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
2.35.1


