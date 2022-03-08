Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF114D0DE7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:12:45 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPLA-00050F-5V
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3A-0006B2-PT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:08 -0500
Received: from [2607:f8b0:4864:20::102d] (port=55158
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP38-0007sw-QU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id b8so15748085pjb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDkABqIBPeYpg9kxXDjVZpJ986dx2Kmaj4E006oxpws=;
 b=VzhhisMUa4I7mhf6PnkNk1LAGbjSYA2mABFRJHJcrkl7CoN4ME6KUntQyTrhBKAjCb
 ATneXwx3kJD5SaPS4lN2/mk72QmG5Tr4i1a9GKbBEl65nlAQTrAee6JDJF/igPloMOlw
 O5OB3LOT4hvs1e476z91R5cc5HhObire/H2KIm3jwTo8Af9KLBoxqfajHo5Gaw+Pnysf
 PJ7lYhI43W92JgQlRHmFEsofl9xv3XmASuDJqvZw7nDoyklhSykS5nZix9IYOfFcPjHY
 CmuXaw8tKQ64n+ZYTRWVn8ckXp2bXCpATFv5r6UGZixu3R398C4ZUEocwBmjGDamctQ3
 qCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDkABqIBPeYpg9kxXDjVZpJ986dx2Kmaj4E006oxpws=;
 b=52eY89tcjEsnQ3oyjOwZ8XR9rmp3y4Fwg/hn9AjUns1Us4VXlc6UmduIR/fU7aXEEb
 iCVMAPVyj7QpePQGmrINFUB31+FsxcDXTTB6n2tRzozaWOp9zTZl69DUTL+mm12rCOgz
 ho3HiMlQ5lhyHa7BWgqazr54mwlGx+citwFcv5H+gYv0woPi3BN6Yocm9FK1MOOL1+lD
 FwAzeZRIyaWdcAiArnyCtLx+afX5WXcU71DJLPwAyAaVOMxrdYQpyUBAAAljQix2FpA5
 8LTqvTsA8CgFztXbKqaECHLOXvhpZd5UuqWYk6y5Mipajpy92DtBqWmGM1shEeehm5NT
 SrKg==
X-Gm-Message-State: AOAM533DdJ/w078uSpMmV8wXWCh9K8tq9YQrcHj63wB5L2l/fvnIo5o8
 jo2OpMZOy7rXExPCRN0lwRy8iL/k9UhTfg==
X-Google-Smtp-Source: ABdhPJwTgjx0hwxOdXfxDEl8M0+KafxN28LNpMjM9pt1Z0wtsdMmnItKQ1vDMj308pZHMlHSD51J7Q==
X-Received: by 2002:a17:90b:3807:b0:1bf:6c8e:f9b7 with SMTP id
 mq7-20020a17090b380700b001bf6c8ef9b7mr2106123pjb.16.1646704445414; 
 Mon, 07 Mar 2022 17:54:05 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/11] target/s390x: vxeh2: vector string search
Date: Mon,  7 Mar 2022 15:53:50 -1000
Message-Id: <20220308015358.188499-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-3-dmiller423@gmail.com>
[rth: Rewrite helpers; fix validation of m6.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

The substring search was incorrect, in that it didn't properly
restart the search when a match failed.  Split the helper into
multiple, so that the memory accesses can be optimized.
---
 target/s390x/helper.h                |   6 ++
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/vec_string_helper.c | 101 +++++++++++++++++++++++++++
 target/s390x/tcg/translate_vx.c.inc  |  26 +++++++
 target/s390x/tcg/insn-data.def       |   2 +
 5 files changed, 137 insertions(+), 1 deletion(-)

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
 
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
index ac315eb095..6c0476ecc1 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -471,3 +471,104 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
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
+        int i;
+        for (i = 0; i < nelem; i++) {
+            if (s390_vec_read_element(v3, i, es) == 0) {
+                break;
+            }
+        }
+        if (i < substr_elen) {
+            substr_elen = i;
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
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index ea28e40d4f..d514e8b218 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2497,6 +2497,32 @@ static DisasJumpType op_vstrc(DisasContext *s, DisasOps *o)
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
+
+    const uint8_t m5 = get_field(s, m5);
+    const uint8_t m6 = get_field(s, m6);
+    bool zs = m6 & 2;
+
+    if (m5 > ES_32 || m6 & ~2) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
+                   get_field(s, v3), get_field(s, v4),
+                   cpu_env, 0, fns[m5][zs]);
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
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
 
-- 
2.25.1


