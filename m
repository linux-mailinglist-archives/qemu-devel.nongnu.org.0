Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B886C4CEF4F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:06:08 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2lC-0004xp-TK
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2ir-0002Ts-DP; Sun, 06 Mar 2022 21:03:41 -0500
Received: from [2607:f8b0:4864:20::832] (port=36534
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2ip-0005wk-No; Sun, 06 Mar 2022 21:03:41 -0500
Received: by mail-qt1-x832.google.com with SMTP id t18so1208183qtw.3;
 Sun, 06 Mar 2022 18:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8g6GCvWKm8qFCJ0tBL6Zoou3yEoi/pV064BCq+EY+E=;
 b=W99Mqo4nVtU3Ri04an6me7kP/u/7Oi6bc7gDkvvPgjYiO9Zzeda7dueK7g3Go9PATq
 4dp+/wCBIDNp/hNUAQOVs0JtgBlU5oDr+kVU1824bvreNuhRon5LeNtV/lezaMJHjVx8
 gKvEmyVmLxzH5VJRhspQFJoehR1R+dg+JMfVtbhXJlEFUxMdHaSpuPlSTVoIukaxdXec
 pBC7Zdi3LeAtdhv+76N1mgEidsjoiY6HPs9XUyAv/e6Mkvr82Y6SRTG8/oDIgbHb+r0W
 x/MiUELSyH5OYF05qAuOpsE1eQ4je85NNc5Bdrly9ZCQpFJ7ndaKLKOZYobxORrTKKA/
 GUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8g6GCvWKm8qFCJ0tBL6Zoou3yEoi/pV064BCq+EY+E=;
 b=mRjEM6cX/MNzZSu3iWjVzquFCi78338QcVgNbTOQacsa0QHiKOxtJgb6W56zis/wGo
 yFMV+2264uDJlfM+SIzBe0Ka1tCDbM55CV8xhOrHxJB6oyLxuAX0Vurm0nOnShittO0e
 QSXrf2+TKCY84YvXuj9XFdkR6T1vKMlpNdHviv8hwhtk586saKqHQJRDo7wCVo5DkV+j
 EF0dbEB8QpDV2CC/qOkdXQ8xnBoNYKQG5oz7ZzIUW36mbEgczB94fWf1p2AKD8SqTem7
 cGiBqu62hadwtZ97dlAhJhGZAYTLDyWmcU7Hu3sAeMlYAEh0ZCke6kPkp0sjLooUlyvC
 aGOw==
X-Gm-Message-State: AOAM533d6q2kIMr8W/eGvBzGeqFQWvpxiQWIWskBYsOg0UllK47sd1j/
 myGqPt/16EMPDhBmIBTncRs9B3bkkT8+Cw==
X-Google-Smtp-Source: ABdhPJz4KyGCAvPkhn5+etFj5SUoXjzSXFZyDZnI/gw2MsQpoGDVHl1BlehHzh1Ouc6HTWJrJAb2Aw==
X-Received: by 2002:a05:622a:14ca:b0:2de:904f:c1b2 with SMTP id
 u10-20020a05622a14ca00b002de904fc1b2mr7591414qtx.433.1646618618375; 
 Sun, 06 Mar 2022 18:03:38 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:38 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/s390x: vxeh2: vector string search
Date: Sun,  6 Mar 2022 21:03:22 -0500
Message-Id: <20220307020327.3003-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
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
---
 target/s390x/helper.h                |  1 +
 target/s390x/tcg/insn-data.def       |  2 +
 target/s390x/tcg/translate.c         |  3 +-
 target/s390x/tcg/translate_vx.c.inc  | 17 ++++++++
 target/s390x/tcg/vec_string_helper.c | 65 ++++++++++++++++++++++++++++
 5 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 7cbcbd7f0b..1e38ee2e4e 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -246,6 +246,7 @@ DEF_HELPER_6(gvec_vstrc_cc32, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt8, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt16, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(vstrs, void, ptr, cptr, cptr, ptr, env, i32)
 
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
index ea28e40d4f..db86d9b87d 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2497,6 +2497,23 @@ static DisasJumpType op_vstrc(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstrs(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m5);
+    const uint32_t D = get_field(s, m6);
+
+    if (es > ES_32) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
+                   get_field(s, v3), get_field(s, v4),
+                   cpu_env, (D << 16) | es, gen_helper_vstrs);
+
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
index ac315eb095..22c14c6925 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -471,3 +471,68 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
 DEF_VSTRC_CC_RT_HELPER(8)
 DEF_VSTRC_CC_RT_HELPER(16)
 DEF_VSTRC_CC_RT_HELPER(32)
+
+void HELPER(vstrs)(void *v1, const void *v2, const void *v3, void *v4,
+                   CPUS390XState *env, uint32_t desc) {
+    const bool zs = (desc >> 16);
+    const uint8_t es = desc & 16;
+    const uint8_t char_size = 1 << es;
+
+    uint32_t str_len = 0, eos = 0;
+    uint32_t i = 0, j = 0, k = 0, cc = 0;
+    uint32_t substr_len = ((uint8_t *)v4)[H1(7)] & 31;
+
+    for (i = 0; i < 16; i += char_size) {
+        if (0 == es && !((uint8_t  *)v3)[H1(i >> es)]) { break; }
+        if (1 == es && !((uint16_t *)v3)[H2(i >> es)]) { break; }
+        if (2 == es && !((uint32_t *)v3)[H4(i >> es)]) { break; }
+    }
+    if (i < substr_len) {
+        substr_len = i;
+    }
+    if (substr_len) {
+        if (zs) {
+            for (k = 0; k < 16; k += char_size) {
+                if (0 == es && !((uint8_t  *)v2)[H1(k >> es)]) { break; }
+                if (1 == es && !((uint16_t *)v2)[H2(k >> es)]) { break; }
+                if (2 == es && !((uint32_t *)v2)[H4(k >> es)]) { break; }
+            }
+            eos = (16 != k);
+            str_len = k;
+        } else {
+            str_len = 16;
+        }
+
+        for (k = 0; k < str_len; k += char_size) {
+            if (0 == es && ((uint8_t  *)v3)[H1(0)]
+                        == ((uint8_t  *)v2)[H1(k >> es)]) { break; }
+            if (1 == es && ((uint16_t *)v3)[H2(0)]
+                        == ((uint16_t *)v2)[H2(k >> es)]) { break; }
+            if (2 == es && ((uint32_t *)v3)[H4(0)]
+                        == ((uint32_t *)v2)[H4(k >> es)]) { break; }
+        }
+
+        if (k < 16 &&  (!eos || (k + substr_len) <= str_len)) {
+            if ((k + substr_len) <= 16) {
+                for (j = 0; j < substr_len; j += char_size) {
+                    if (0 == es && ((uint8_t  *)v3)[H1(j >> es)]
+                                != ((uint8_t  *)v2)[H1((k + j) >> es)]) { break; }
+                    if (1 == es && ((uint16_t *)v3)[H2(j >> es)]
+                                != ((uint16_t *)v2)[H2((k + j) >> es)]) { break; }
+                    if (2 == es && ((uint32_t *)v3)[H4(j >> es)]
+                                != ((uint32_t *)v2)[H4((k + j) >> es)]) { break; }
+                }
+            }
+            cc = (j == substr_len) ? 2 : 3;
+        } else {
+            cc = eos ? 1 : 0;
+            k = 16;
+        }
+    } else {
+        cc = 2;
+    }
+
+    ((uint64_t *)v1)[0] = ((uint64_t *)v1)[1] = 0;
+    ((uint8_t *)v1)[H1(7)] = k;
+    env->cc_op = cc;
+}
-- 
2.34.1


