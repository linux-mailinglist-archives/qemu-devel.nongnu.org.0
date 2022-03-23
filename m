Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCAD4E53DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:02:04 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1Yp-0004LO-NY
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:02:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uf-0007MZ-JE; Wed, 23 Mar 2022 09:57:45 -0400
Received: from [2607:f8b0:4864:20::832] (port=43671
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ud-0000vO-Kk; Wed, 23 Mar 2022 09:57:45 -0400
Received: by mail-qt1-x832.google.com with SMTP id t7so1155380qta.10;
 Wed, 23 Mar 2022 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g22ZbnLGNBWz8ohjgjbKVLoKWblSXilWuXqbwj+R9Zo=;
 b=g/2G/y3lAg/v6YBpmLNd23SBoC4TOX9N0x8sYOLTPjajVI9JBeQDap+EgJyGDs/awY
 PlwuSVZyVc6lq6wxEF2IEajy8h1LJkv+9TmQYrDvcF5G4QxpaXSGMD1V/EMXa+NeHTbz
 +HKSRkfNlKzLgUCuotuv0Vbl56FMJr18o8mewok76pJAGV9T+0If72qUiNuH+FOuwE+X
 vHX0MOZOQFuJJtHeFxTJ1iv4Xe/xaKgAxioaiRU+4jG8OYLR8NDxTVJm5HXnff4+dgs5
 wjsqGM8gZYX21RdA/zPqKLkikN035dsTIzBN8yyiJVaQiC7CHg/nCGKMh9xCjPkXPvBD
 z+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g22ZbnLGNBWz8ohjgjbKVLoKWblSXilWuXqbwj+R9Zo=;
 b=ZjHA3X4eTKDohqry6z6yoYuMoCcGgkE8782I0cSaSZFPIymVuZlu0HiMVpU6L6gLIj
 hK6nWq3R3yK7njfMWzFDKVUanXsmn97D+t4EbgbyniQvu1jJB5/lZ5Eiq5FEsB1dhfO7
 +WfOHNNUw3TuOpQTBTM2tsw9lTlQOU1JXQmh0wQG/tHps4FvvWEwdu6oP/yjNp5G2rLP
 XxShSrVr6sTNUl+T6c4+lLOcF4WAOa9nuc7i5O+v/idc2ewQGwEjjbjG5xjxnT4RztWT
 G93TmlDbW/P6e5wzxdFmwkRPagBXjKLugXgnbu6kDkIO8VHHICJpUDaEY4Vzu7x+D1WU
 G9Tw==
X-Gm-Message-State: AOAM531AR/zeaMuGwJUWOh2z0LNOKTKJGmlfhvKkJCzzkvVw2CGCdsYA
 KZBpu7G6WqByDANmk8Q6XCwJwE01XF/P8w==
X-Google-Smtp-Source: ABdhPJzEuGrXCbvnoVQeSke3dN5o48isQ9iCmOOsdIvbROPbhQr0kO5Ja/D3kFwIVTW865/Q46/Lzw==
X-Received: by 2002:ac8:5982:0:b0:2e0:68f4:87ef with SMTP id
 e2-20020ac85982000000b002e068f487efmr24781592qte.253.1648043862223; 
 Wed, 23 Mar 2022 06:57:42 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:41 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 03/11] target/s390x: vxeh2: vector string search
Date: Wed, 23 Mar 2022 09:57:14 -0400
Message-Id: <20220323135722.1623-4-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x832.google.com
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
Reviewed-by: David Hildenbrand <david@redhat.com>
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


