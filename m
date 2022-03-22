Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6404E3542
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:08:25 +0100 (CET)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS4W-0002zT-8X
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:08:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007pp-Ao; Mon, 21 Mar 2022 20:05:11 -0400
Received: from [2607:f8b0:4864:20::834] (port=37607
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1G-0007I1-9l; Mon, 21 Mar 2022 20:05:05 -0400
Received: by mail-qt1-x834.google.com with SMTP id t19so2387075qtc.4;
 Mon, 21 Mar 2022 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/GQ8FvNYLm1fOKSnKsYAEezojvG5B51ZIHJE+t/9hR0=;
 b=AlMJSLzmqODKfQqPb27clQhIaWkTtau1frUuqFLEAZWdaLTmpFM9yGPthxaVif0MBx
 SmRZogCEjf2mf4Vnafw3/Jn/3DvZ1Xfesy/piDjXxtPLMYHMfagQ8OdXX3evCZShUhNr
 qc4EWviwZ+GdqiPJH3WK2lAkunQVZVEmcNV0IGeaArrXhit00JuZVAdwcmnEVI0hdOzy
 f0pU5p61coUXYUudo1BtSOAdaM7i5akKNxr9vkMu/Uaz0ZnmOmmrU7NLzlMjC1FZyH8x
 kfmBcrGSRpyAcK+QQdVudvDFs0UlGx5UfdF0jqiJ3q5Hb82Ylkl2Bvdb0GtUoUf6zkhn
 Z5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/GQ8FvNYLm1fOKSnKsYAEezojvG5B51ZIHJE+t/9hR0=;
 b=0vVjnSaLW+dOZiNFjayUA1oagKVKjCiTQxBay0e+DGBV9PZKsXjuVcO55L8DVW05IV
 Nw4bjyNDNJbkeFbRY5qlEaNTkORZALbRhldKmqiwfyjma14AvDexnZpUkppp6k90ulKc
 AeBkoGGo0ENR87uaxQZ1Dm3nXxmnIQq0oqNlt/LUiSHiMqa2XcetkHi+yJt4E4KJis9n
 E3vwGOIHlQj6/LgNoiwR3h+et8SGGCf6yBmwppq3p3FaHoaQVTKY59TR+TBYnukRwoBT
 9q03fFsLVBOOA/Trxvc97QcN/qIhPI/mCbY0JO6hMRTde7dGJKVEmmo/7dScNX/kAc8a
 ejgg==
X-Gm-Message-State: AOAM530Ok/gMeEMxqosjD9WJv8DRQB5+OD6Hkyp5MTXP6KfJwqQYnRBk
 meO5bM7jKjUJomoa5EnIVKN+yvnlxJa5vQ==
X-Google-Smtp-Source: ABdhPJy7OGHvqX4u1tdHNkj1MCjIwDQ7s18s68RMRS6asBc61qGw4B0d2zgt0b9SUJQXuHRCoWON+g==
X-Received: by 2002:a05:622a:1996:b0:2e0:ffd3:a2d5 with SMTP id
 u22-20020a05622a199600b002e0ffd3a2d5mr18132367qtc.390.1647907498501; 
 Mon, 21 Mar 2022 17:04:58 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:58 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 05/11] target/s390x: vxeh2: vector shift double by bit
Date: Mon, 21 Mar 2022 20:04:35 -0400
Message-Id: <20220322000441.26495-6-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x834.google.com
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
 target/s390x/tcg/insn-data.def      |  6 +++-
 target/s390x/tcg/translate_vx.c.inc | 55 +++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index f487a64abf..98a31a557d 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1207,12 +1207,16 @@
     E(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, 0, IF_VEC)
 /* VECTOR SHIFT LEFT BY BYTE */
     E(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, 1, IF_VEC)
+/* VECTOR SHIFT LEFT DOUBLE BY BIT */
+    E(0xe786, VSLD,    VRI_d, VE2, 0, 0, 0, 0, vsld, 0, 0, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
-    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
+    E(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsld, 0, 1, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC */
     E(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
     E(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, 1, IF_VEC)
+/* VECTOR SHIFT RIGHT DOUBLE BY BIT */
+    F(0xe787, VSRD,    VRI_d, VE2, 0, 0, 0, 0, vsrd, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL */
     E(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index fd53ddafef..bb997de794 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2056,14 +2056,23 @@ static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
                             gen_helper_gvec_vsrl_ve2);
 }
 
-static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 {
-    const uint8_t i4 = get_field(s, i4) & 0xf;
-    const int left_shift = (i4 & 7) * 8;
-    const int right_shift = 64 - left_shift;
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    const bool byte = s->insn->data;
+    const uint8_t mask = byte ? 15 : 7;
+    const uint8_t mul  = byte ?  8 : 1;
+    const uint8_t i4   = get_field(s, i4);
+    const int right_shift = 64 - (i4 & 7) * mul;
+    TCGv_i64 t0, t1, t2;
+
+    if (i4 & ~mask) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
 
     if ((i4 & 8) == 0) {
         read_vec_element_i64(t0, get_field(s, v2), 0, ES_64);
@@ -2074,8 +2083,40 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
         read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
         read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
     }
+
     tcg_gen_extract2_i64(t0, t1, t0, right_shift);
     tcg_gen_extract2_i64(t1, t2, t1, right_shift);
+
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
+{
+    const uint8_t i4 = get_field(s, i4);
+    TCGv_i64 t0, t1, t2;
+
+    if (i4 & ~7) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    read_vec_element_i64(t0, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
+    read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
+
+    tcg_gen_extract2_i64(t0, t1, t0, i4);
+    tcg_gen_extract2_i64(t1, t2, t1, i4);
+
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
 
-- 
2.34.1


