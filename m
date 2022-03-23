Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3F4E53EA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:04:21 +0100 (CET)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1b2-00081h-Lm
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:04:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Um-0007WG-Ia; Wed, 23 Mar 2022 09:57:52 -0400
Received: from [2607:f8b0:4864:20::f30] (port=36553
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uj-0000wm-0l; Wed, 23 Mar 2022 09:57:51 -0400
Received: by mail-qv1-xf30.google.com with SMTP id kc20so1244925qvb.3;
 Wed, 23 Mar 2022 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bw4y2Y3zTMXWRApI3mQMDrboc18J6hAVyliFuHK7eCA=;
 b=EjLtl0Xhf+7cSG5UtlQG/rAmMGZsXxYhllRkqkfxxwO0exfTLrhbTbevf3ICPPViza
 x+S18pM9TgYyU5xn7PwgWBB/MSJ1L8/19Ki3ExYQCDzzYQbxdISYTWCrKFJv7Alkl18V
 ZnyBx+TeMafzumIE7cXvZWBwS5E/IuX67CWsMmvldrzyHIy9OuaPIToGFXe609WdOCAm
 5bLGxWR9KRC3FkoUhioW9zA6MJ34IKti0/rFMJKZLy6rHzDS7I0KrZezf6DVMZnxizWk
 wwHxJ2FzajuIFGCatZfZVL+RIn47QmlO+L5Xr1PIWCBWJSGL8B5dCSWqOEoJwHEnSN2R
 r3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bw4y2Y3zTMXWRApI3mQMDrboc18J6hAVyliFuHK7eCA=;
 b=htRa5KFlg2db92MNadPsFKgDMRoizVikveB6rdLPo0NmpUtF4vCBU4cFLF/Couoy/q
 n2QwW0+7lkejmNzOx8jgksfTiQX0rpSxPIWiUFemQKCy+cOxdfXzUlw3NzTL/1bH94hR
 cll96vcZW6yVyxP4La7OPeEhjy7wM8WHOZFboVvZ2sg/ECBxNNaUQexlwDraIzaVp19d
 WKh4FgSIq3u4BnWFJ4QJobEv4eqCs4wsfIsgW6mjPpZLY3YBhfC+uNFNQfTlbxaKCb0B
 kn9qpSelejbNa2l9jxwE3Yy/am0fQ0+hd4QL3EMpTIpidf4FJt5wb5WaVzWDr+zCYd35
 cg9w==
X-Gm-Message-State: AOAM533P3OdlLqOVAtuloKc7AJBG81OSHkZ/Ks41UsAzajOFxDF1B+T+
 dT5/cLh1vlF3+9Nw/b/T+kERsOlc6o9A+A==
X-Google-Smtp-Source: ABdhPJwlGFLkRw8RWV23QM0AgYqd7D8wVlw20QRyrhD8NZkyQ9z41XVvyLHo+Oj+Akg1bCKjoLS49w==
X-Received: by 2002:a05:6214:5008:b0:441:547c:e75e with SMTP id
 jo8-20020a056214500800b00441547ce75emr4519880qvb.128.1648043867429; 
 Wed, 23 Mar 2022 06:57:47 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:47 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 08/11] target/s390x: vxeh2: vector {load,
 store} byte reversed element
Date: Wed, 23 Mar 2022 09:57:19 -0400
Message-Id: <20220323135722.1623-9-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf30.google.com
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
 target/s390x/tcg/insn-data.def      | 12 ++++
 target/s390x/tcg/translate_vx.c.inc | 85 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index ee6e1dc9e5..5e448bb2c4 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,14 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT */
+    E(0xe601, VLEBRH,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_16, IF_VEC)
+    E(0xe603, VLEBRF,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_32, IF_VEC)
+    E(0xe602, VLEBRG,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, ES_64, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE */
+    F(0xe605, VLBRREP, VRX,   VE2, la2, 0, 0, 0, vlbrrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
+    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
 /* VECTOR LOAD BYTE REVERSED ELEMENTS */
     F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
 /* VECTOR LOAD ELEMENT */
@@ -1081,6 +1089,10 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENT */
+    E(0xe609, VSTEBRH,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_16, IF_VEC)
+    E(0xe60b, VSTEBRF,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_32, IF_VEC)
+    E(0xe60a, VSTEBRG,  VRX,   VE2, la2, 0, 0, 0, vstebr, 0, ES_64, IF_VEC)
 /* VECTOR STORE BYTE REVERSED ELEMENTS */
     F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index c0b4a5b9ed..e57d0395db 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,73 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = s->insn->data;
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    write_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlbrrep(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    gen_gvec_dup_i64(es, get_field(s, v1), tmp);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vllebrz(DisasContext *s, DisasOps *o)
+{
+    const uint8_t m3 = get_field(s, m3);
+    TCGv_i64 tmp;
+    int es, lshift;
+
+    switch (m3) {
+    case ES_16:
+    case ES_32:
+    case ES_64:
+        es = m3;
+        lshift = 0;
+        break;
+    case 6:
+        es = ES_32;
+        lshift = 32;
+        break;
+    default:
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    tcg_gen_shli_i64(tmp, tmp, lshift);
+
+    write_vec_element_i64(tmp, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(tcg_constant_i64(0), get_field(s, v1), 1, ES_64);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m3);
@@ -1054,6 +1121,24 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = s->insn->data;
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    read_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_LE | es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m3);
-- 
2.34.1


