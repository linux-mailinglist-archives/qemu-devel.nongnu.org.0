Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90144E3544
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:11:45 +0100 (CET)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS7l-0007kw-1G
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:11:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007ps-Cq; Mon, 21 Mar 2022 20:05:11 -0400
Received: from [2607:f8b0:4864:20::82b] (port=34728
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1G-0007Hr-KN; Mon, 21 Mar 2022 20:05:06 -0400
Received: by mail-qt1-x82b.google.com with SMTP id c4so13318380qtx.1;
 Mon, 21 Mar 2022 17:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHsEjdStblGb0hF+fr0jJABmrXsajONYM3yRQPLHxiI=;
 b=ccLZ6bQkj1hZHbGlnWFpqy4RN43Pxy1ZWabfnetuX2MbOgp4+TdsYUJIZhAQJMz0GO
 JJWbeSds5JiRjo2oSWea4nF9019++mI7amlhBBJFUs2Wy054VKdlTlLDJjcGPzbAWzHl
 TDV9jjOpEuHGpAYcitZgTCf3Qj5GbBw5KygHdjpRguR/SAZEFNCQOlamlTsxBeK3tA6x
 YgJQ+FGzyVAxJXWUeE3m4C/K7tLAGUox8jElqssJbkNE+muP+zbRTtmNGn42sYX6ouFh
 RknJe0XlvmUJq4DEQWpyH9rLQD5YSxlY69dYf4v4xkzyJRYrjDwfgpFKR+V0jQ4Tyb92
 UTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHsEjdStblGb0hF+fr0jJABmrXsajONYM3yRQPLHxiI=;
 b=KI4sumuW7YGVOH4qXfUT/UfIQMoUFMo8dc1SKiZsQj0YCTwnizUn+c/66aGUXbECZj
 35X1Fs4BkHTy/GdKt3LsQTLV+2aT5VAI9VGN57BxCTaMwaPGYM36KsW6QW9LbMZFLLGR
 slqb/7iBOHMvn1De5CrVdSPweEhaMlXjDajqmgz5RkloWRctBgZtAsSK6GhQ+SAd5Bl4
 Uj14lXMsuEOoCBfCODaPFNGpKSypcuQQ/M/4DnoOAm7CHtSPCV72iEtMkHRAa4BD45uE
 ftyhe7mAkx/0CeRZenZX5F/w6VNmDInE0Ka5IG246R9PGz45Ou5JOsmOpLLF81mnM5vr
 5V2g==
X-Gm-Message-State: AOAM5319jBDC7MLlQVL6cSefU7ZreU5KT6Zu8TfOpkc1QUH9bPojpDxZ
 UVQHpOVOu6T6Tf53Dea6u7TXQjwrTO2Sjw==
X-Google-Smtp-Source: ABdhPJwwP98vkQwWFoaxuvYA08utf83WZH5Y0Tsmk5KyJYuH+I8ZYzW/w6t3AS5Ft9I4rjrRrrx/ig==
X-Received: by 2002:ac8:5b8f:0:b0:2e2:72c:9af0 with SMTP id
 a15-20020ac85b8f000000b002e2072c9af0mr11112931qta.498.1647907496811; 
 Mon, 21 Mar 2022 17:04:56 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:56 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 03/11] target/s390x: vxeh2: vector string search
Date: Mon, 21 Mar 2022 20:04:33 -0400
Message-Id: <20220322000441.26495-4-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x82b.google.com
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
index 904b51542f..d9ac29573d 100644
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
index ea28e40d4f..29e4dd78a8 100644
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
index ac315eb095..00135865c0 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -471,3 +471,102 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
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
2.34.1


