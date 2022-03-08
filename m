Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607354D0DEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:19:34 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPRl-0001Ua-FS
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3I-0006e8-An
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:16 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45970
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3G-0007xZ-5R
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:16 -0500
Received: by mail-pf1-x42c.google.com with SMTP id s8so11942744pfk.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g69qvp6bRwk8Stu7y5fbG4X7ZrzDFZHMhiKa8KOLznY=;
 b=XaznIxd4kwcnUGj3KY6DfBxuxsY7OgF9jnxI3Q/MTmBMMXDrcdSGGYc2GsFUWUYb0j
 kOT6UNK2Pqr0w8aAoe4onEnktILunarqt5/BHhz0jGMzDYkqhP8+F8nKlg4+CJoyAQdx
 Mk0iypUCwIlo2puUPgWjXAKeGfcpCvwbpeKQGZHpovS1yZbNR8m3XDFXZ5c0eCOLZSt2
 gSIpvE9uu2VdBdHxZUXyp1IAw12c7qq9TOe5eanMy7KFKqbmft4JFBQoYVAaXfggdTHB
 2GJpvt0wNP5CZ8jpJ+Q6hUP1soOiqcbXjj4Os/eJ4VCxgOsI37Ma5QMCCOkYnsH1j09A
 tu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g69qvp6bRwk8Stu7y5fbG4X7ZrzDFZHMhiKa8KOLznY=;
 b=bouAz/Cb5HirYzzn1/dJLQIpcR9irJxrnDNX4og3WB+zh8LbWMWJCxt22wgGtCytk4
 Vp61Q5NwkVKIWMlKcsXMHeeHFYd5KaqDhugHcxu4dR3vk1re5DdX/N6QWBVTjhEENl2F
 O+bjddNAWFmsgsS2jOrpQZ/lYt9pdywUeAKmZ4Sozs6j87rvDJwm+tLaIZVyVMRqbkUW
 MwcP/F8zbgX4pN3ALogH4fg/4YPf3YnXFdmYR0CT/V8o8hkTjyHkisGqGhSL/tLqnJkA
 zsltwPnl6pA5hk+jdOcpUINzBxoQof8TX3AuuJqKHvDHgYk6KXIL57XSPUbDrISom0c5
 7uDA==
X-Gm-Message-State: AOAM5303AeV/NkUlswfz05LpogqcQtnounRt+HCuFDl8onauzVflZwic
 n3yFB3xrAg37iQB+RjMfRYj71r6irgRSLQ==
X-Google-Smtp-Source: ABdhPJwFaplXBLYgHlJ5tg2Mu+PP8fxyi4FMp+4Cd8/F3r/YdUaBwT2asoufzrf70Bkmb6IQ5jpd0g==
X-Received: by 2002:aa7:9253:0:b0:4e1:53d4:c2c6 with SMTP id
 19-20020aa79253000000b004e153d4c2c6mr15951926pfp.62.1646704452813; 
 Mon, 07 Mar 2022 17:54:12 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/11] target/s390x: vxeh2: vector {load,
 store} byte reversed element
Date: Mon,  7 Mar 2022 15:53:55 -1000
Message-Id: <20220308015358.188499-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This includes VLEBR* and VSTEBR* (single element);
VLBRREP (load single element and replicate); and
VLLEBRZ (load single element and zero).

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-6-dmiller423@gmail.com>
[rth: Split out elements (plural) from element (scalar),
      Use tcg little-endian memory operations.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 85 +++++++++++++++++++++++++++++
 target/s390x/tcg/insn-data.def      | 12 ++++
 2 files changed, 97 insertions(+)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 9a82401d71..ce77578325 100644
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
@@ -1048,6 +1115,24 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
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
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index ee6e1dc9e5..b80f989002 100644
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
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE */
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
-- 
2.25.1


