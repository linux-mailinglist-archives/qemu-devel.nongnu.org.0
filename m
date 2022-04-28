Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B55130E8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:09:32 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk15X-0006Ic-4m
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kF-00037Z-Cp
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kC-0008Hp-UW
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OU+lVbzYZDaortErPaSsIcCEyyHvbBLwrEPDjWpALw=;
 b=AoVzgQisgElRpkm2/oiuJbWBcEcDYtV/QhqUv15fVrcF9X+BLEQ6GoViGmkRmMLJI9IgIJ
 SKyhnWDjTeCm3SlYYqIa7u6zHCcYXaIXbg+AaBKPOrnzTKNYuscaSCIgVLFf2pnOfRgkPm
 G2H8rZVqAhWOs7ZRfSTckjvQCeJPFfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-dD0PDARAMxm2ouydfXc5iA-1; Thu, 28 Apr 2022 05:47:27 -0400
X-MC-Unique: dD0PDARAMxm2ouydfXc5iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD8F0811E81;
 Thu, 28 Apr 2022 09:47:26 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F78540CFD16;
 Thu, 28 Apr 2022 09:47:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/13] target/s390x: vxeh2: vector string search
Date: Thu, 28 Apr 2022 11:47:01 +0200
Message-Id: <20220428094708.84835-7-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
 target/s390x/helper.h                |  6 ++
 target/s390x/tcg/insn-data.def       |  2 +
 target/s390x/tcg/translate.c         |  3 +-
 target/s390x/tcg/translate_vx.c.inc  | 25 +++++++
 target/s390x/tcg/vec_string_helper.c | 99 ++++++++++++++++++++++++++++
 5 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 7cbcbd7f0b..7412130883 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -246,6 +246,12 @@ DEF_HELPER_6(gvec_vstrc_cc32, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt8, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt16, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_8, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_16, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_32, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_zs8, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_zs16, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(gvec_vstrs_zs32, void, ptr, cptr, cptr, cptr, env, i32)
 
 /* === Vector Floating-Point Instructions */
 DEF_HELPER_FLAGS_5(gvec_vfa32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 6c8a8b229f..46add91a0e 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1246,6 +1246,8 @@
     F(0xe75c, VISTR,   VRR_a, V,   0, 0, 0, 0, vistr, 0, IF_VEC)
 /* VECTOR STRING RANGE COMPARE */
     F(0xe78a, VSTRC,   VRR_d, V,   0, 0, 0, 0, vstrc, 0, IF_VEC)
+/* VECTOR STRING SEARCH */
+    F(0xe78b, VSTRS,   VRR_d, VE2, 0, 0, 0, 0, vstrs, 0, IF_VEC)
 
 /* === Vector Floating-Point Instructions */
 
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8f092dab95..b40cb84bae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6222,7 +6222,8 @@ enum DisasInsnEnum {
 #define FAC_PCI         S390_FEAT_ZPCI /* z/PCI facility */
 #define FAC_AIS         S390_FEAT_ADAPTER_INT_SUPPRESSION
 #define FAC_V           S390_FEAT_VECTOR /* vector facility */
-#define FAC_VE          S390_FEAT_VECTOR_ENH /* vector enhancements facility 1 */
+#define FAC_VE          S390_FEAT_VECTOR_ENH  /* vector enhancements facility 1 */
+#define FAC_VE2         S390_FEAT_VECTOR_ENH2 /* vector enhancements facility 2 */
 #define FAC_MIE2        S390_FEAT_MISC_INSTRUCTION_EXT2 /* miscellaneous-instruction-extensions facility 2 */
 #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
 
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index be9407d1ed..8ddbd440e2 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2497,6 +2497,31 @@ static DisasJumpType op_vstrc(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstrs(DisasContext *s, DisasOps *o)
+{
+    typedef void (*helper_vstrs)(TCGv_ptr, TCGv_ptr, TCGv_ptr,
+                                 TCGv_ptr, TCGv_ptr, TCGv_i32);
+    static const helper_vstrs fns[3][2] = {
+        { gen_helper_gvec_vstrs_8, gen_helper_gvec_vstrs_zs8 },
+        { gen_helper_gvec_vstrs_16, gen_helper_gvec_vstrs_zs16 },
+        { gen_helper_gvec_vstrs_32, gen_helper_gvec_vstrs_zs32 },
+    };
+    const uint8_t es = get_field(s, m5);
+    const uint8_t m6 = get_field(s, m6);
+    const bool zs = extract32(m6, 1, 1);
+
+    if (es > ES_32 || m6 & ~2) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
+                   get_field(s, v3), get_field(s, v4),
+                   cpu_env, 0, fns[es][zs]);
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
index f8b54bba4a..9b85becdfb 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -470,3 +470,102 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
 DEF_VSTRC_CC_RT_HELPER(8)
 DEF_VSTRC_CC_RT_HELPER(16)
 DEF_VSTRC_CC_RT_HELPER(32)
+
+static int vstrs(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                 const S390Vector *v4, uint8_t es, bool zs)
+{
+    int substr_elen, substr_0, str_elen, i, j, k, cc;
+    int nelem = 16 >> es;
+    bool eos = false;
+
+    substr_elen = s390_vec_read_element8(v4, 7) >> es;
+
+    /* If ZS, bound substr length by min(nelem, strlen(v3)). */
+    if (zs) {
+        substr_elen = MIN(substr_elen, nelem);
+        for (i = 0; i < substr_elen; i++) {
+            if (s390_vec_read_element(v3, i, es) == 0) {
+                substr_elen = i;
+                break;
+            }
+        }
+    }
+
+    if (substr_elen == 0) {
+        cc = 2; /* full match for degenerate case of empty substr */
+        k = 0;
+        goto done;
+    }
+
+    /* If ZS, look for eos in the searched string. */
+    if (zs) {
+        for (k = 0; k < nelem; k++) {
+            if (s390_vec_read_element(v2, k, es) == 0) {
+                eos = true;
+                break;
+            }
+        }
+        str_elen = k;
+    } else {
+        str_elen = nelem;
+    }
+
+    substr_0 = s390_vec_read_element(v3, 0, es);
+
+    for (k = 0; ; k++) {
+        for (; k < str_elen; k++) {
+            if (s390_vec_read_element(v2, k, es) == substr_0) {
+                break;
+            }
+        }
+
+        /* If we reached the end of the string, no match. */
+        if (k == str_elen) {
+            cc = eos; /* no match (with or without zero char) */
+            goto done;
+        }
+
+        /* If the substring is only one char, match. */
+        if (substr_elen == 1) {
+            cc = 2; /* full match */
+            goto done;
+        }
+
+        /* If the match begins at the last char, we have a partial match. */
+        if (k == str_elen - 1) {
+            cc = 3; /* partial match */
+            goto done;
+        }
+
+        i = MIN(nelem, k + substr_elen);
+        for (j = k + 1; j < i; j++) {
+            uint32_t e2 = s390_vec_read_element(v2, j, es);
+            uint32_t e3 = s390_vec_read_element(v3, j - k, es);
+            if (e2 != e3) {
+                break;
+            }
+        }
+        if (j == i) {
+            /* Matched up until "end". */
+            cc = i - k == substr_elen ? 2 : 3; /* full or partial match */
+            goto done;
+        }
+    }
+
+ done:
+    s390_vec_write_element64(v1, 0, k << es);
+    s390_vec_write_element64(v1, 1, 0);
+    return cc;
+}
+
+#define DEF_VSTRS_HELPER(BITS)                                             \
+void QEMU_FLATTEN HELPER(gvec_vstrs_##BITS)(void *v1, const void *v2,      \
+    const void *v3, const void *v4, CPUS390XState *env, uint32_t desc)     \
+    { env->cc_op = vstrs(v1, v2, v3, v4, MO_##BITS, false); }              \
+void QEMU_FLATTEN HELPER(gvec_vstrs_zs##BITS)(void *v1, const void *v2,    \
+    const void *v3, const void *v4, CPUS390XState *env, uint32_t desc)     \
+    { env->cc_op = vstrs(v1, v2, v3, v4, MO_##BITS, true); }
+
+DEF_VSTRS_HELPER(8)
+DEF_VSTRS_HELPER(16)
+DEF_VSTRS_HELPER(32)
-- 
2.35.1


