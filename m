Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33214E3550
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:18:34 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWSEL-0006VZ-P2
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:18:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1R-0007r3-2O; Mon, 21 Mar 2022 20:05:14 -0400
Received: from [2607:f8b0:4864:20::829] (port=42948
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1L-0007ID-25; Mon, 21 Mar 2022 20:05:10 -0400
Received: by mail-qt1-x829.google.com with SMTP id v19so5191218qtw.9;
 Mon, 21 Mar 2022 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAsrJdH5wVxsvwaUl1sx59FAbfmf8Xp9Oz5I4KZ1vWo=;
 b=BmL6Am0+KsSesRyjfdt+H2teo3Yv8QTqMmGb9yjcOT1/T5GAfEeZ41nageHQz42l3H
 O+3/ZDFeNcvbIQChoDyfS1RiXm1W+ou7hFjnEOpS5CRlJAq51KtRisHioB8WuEL6JMed
 1lzFBBRheWsIGWqiu8NH3KlKvX0TtlzOEWjMAvUtpRsMXuj4cQQoleHZ+8I4CCK1zHZP
 RXgNnD7aAuYtXVJMM1C6muQZNlLj1mJlnqTf8F+g1jrji2PfiCLDddSOd046wO/jEWFT
 A507yO/5rsKte5F3eattg1BPK34EPoTkKfV3y/4IU8vZ5L6yAoca0jlB4uiTmrZmf4fP
 ufFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAsrJdH5wVxsvwaUl1sx59FAbfmf8Xp9Oz5I4KZ1vWo=;
 b=zJUqyG8ToJWIwGvi4vVbJ/JYhELOpXBP5ibQvF4015MyuMWQ0MRjsQ2h20EtVDNv+z
 4uCUlQ1piVdLW7dqIZjCc2omaf6vFRM/19a5j2L/p/poksZwfwD1EVIf1MnWB3Cnc0ia
 advqvcpKknbzp541rAtGaUcC+Z+LkKn+UcGYPWsJM5Zx5A0quAriKQggzMRoHCfCYo3h
 uPhabMln1T8bxh7FPxnTnoxqHfiYIvSc7wjvjMs/ghpr8V6gZ+6uzs4H4zsp5eQdMLba
 tZPqH7EDAv2ow1X4GqiQU5KYtaHf63kcYw816dSF3bRAceX8t+xYcwYJo3RxEkl4q/ah
 LDkA==
X-Gm-Message-State: AOAM531QQFh0OOv2dd+lFDwf/nVVioth7v91x8GTAa+QTSbb34682zaR
 WFax5uNNUooildMF+4W0d9vy+WTykiZb0A==
X-Google-Smtp-Source: ABdhPJzc1dqrL018fTDYyWGTFoBPbIp7VSZZld8ItpGVkurWQvsfDWfG5/60JQFOuDW6X382qmzD1A==
X-Received: by 2002:ac8:7d56:0:b0:2e0:6591:2bbb with SMTP id
 h22-20020ac87d56000000b002e065912bbbmr17966639qtb.505.1647907499350; 
 Mon, 21 Mar 2022 17:04:59 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:59 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 06/11] target/s390x: vxeh2: vector {load,
 store} elements reversed
Date: Mon, 21 Mar 2022 20:04:36 -0400
Message-Id: <20220322000441.26495-7-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x829.google.com
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
 target/s390x/tcg/insn-data.def      |  4 ++
 target/s390x/tcg/translate_vx.c.inc | 84 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 98a31a557d..b524541a7d 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1037,6 +1037,8 @@
     E(0xe741, VLEIH,   VRI_a, V,   0, 0, 0, 0, vlei, 0, ES_16, IF_VEC)
     E(0xe743, VLEIF,   VRI_a, V,   0, 0, 0, 0, vlei, 0, ES_32, IF_VEC)
     E(0xe742, VLEIG,   VRI_a, V,   0, 0, 0, 0, vlei, 0, ES_64, IF_VEC)
+/* VECTOR LOAD ELEMENTS REVERSED */
+    F(0xe607, VLER,    VRX,   VE2, la2, 0, 0, 0, vler, 0, IF_VEC)
 /* VECTOR LOAD GR FROM VR ELEMENT */
     F(0xe721, VLGV,    VRS_c, V,   la2, 0, r1, 0, vlgv, 0, IF_VEC)
 /* VECTOR LOAD LOGICAL ELEMENT AND ZERO */
@@ -1082,6 +1084,8 @@
     E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)
     E(0xe70b, VSTEF,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_32, IF_VEC)
     E(0xe70a, VSTEG,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_64, IF_VEC)
+/* VECTOR STORE ELEMENTS REVERSED */
+    F(0xe60f, VSTER,   VRX,   VE2, la2, 0, 0, 0, vster, 0, IF_VEC)
 /* VECTOR STORE MULTIPLE */
     F(0xe73e, VSTM,    VRS_a, V,   la2, 0, 0, 0, vstm, 0, IF_VEC)
 /* VECTOR STORE WITH LENGTH */
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index bb997de794..0bef1200e3 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -492,6 +492,46 @@ static DisasJumpType op_vlei(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vler(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    /* Begin with the two doublewords swapped... */
+    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+
+    /* ... then swap smaller elements within the doublewords as required. */
+    switch (es) {
+    case MO_16:
+        tcg_gen_hswap_i64(t1, t1);
+        tcg_gen_hswap_i64(t0, t0);
+        break;
+    case MO_32:
+        tcg_gen_wswap_i64(t1, t1);
+        tcg_gen_wswap_i64(t0, t0);
+        break;
+    case MO_64:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vlgv(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m4);
@@ -976,6 +1016,50 @@ static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vster(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1;
+
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    /* Probe write access before actually modifying memory */
+    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
+
+    /* Begin with the two doublewords swapped... */
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    read_vec_element_i64(t1,  get_field(s, v1), 0, ES_64);
+    read_vec_element_i64(t0,  get_field(s, v1), 1, ES_64);
+
+    /* ... then swap smaller elements within the doublewords as required. */
+    switch (es) {
+    case MO_16:
+        tcg_gen_hswap_i64(t1, t1);
+        tcg_gen_hswap_i64(t0, t0);
+        break;
+    case MO_32:
+        tcg_gen_wswap_i64(t1, t1);
+        tcg_gen_wswap_i64(t0, t0);
+        break;
+    case MO_64:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vstm(DisasContext *s, DisasOps *o)
 {
     const uint8_t v3 = get_field(s, v3);
-- 
2.34.1


