Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43584D0DE8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:14:53 +0100 (CET)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPNE-0006mh-Ne
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3F-0006S6-1l
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:13 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46005
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3D-0007vt-5N
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:12 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so966441pjl.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNzI9aMOcfsxb8P+d0xcuiRoCIwW/RkDBsYD1oyUds8=;
 b=Eodjgai5jR7PQhzDIV6FiCjpz6XqrQ/6U2OyWFl53Y5BEDXiXWk64ObcHJrvn+u+za
 THaMonAevkr5pUdF+G8FQw3cjsZoY+Tcnw8opXizaQ+SXSYWX2hsc4wZVLdjT4NiYj/8
 4FQ/qzCL3PRpQfqfHANtA8KW0j7oWKn4mZh+A1TjOThEF5iTWWUPOo77NCFo2yx+Vl5g
 6M1tg12olmQnHEG1XQO+n0p9fOw+ujauqEG+4bKFa4/0deqHZF0fWq0CrbSXj3I+2A8r
 ada9KwQd3TBOdWntpko2MC0vJRUbDLVCvC66a21hJLkEW+sVbpa4PLzL6SKTLfThqusa
 u8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNzI9aMOcfsxb8P+d0xcuiRoCIwW/RkDBsYD1oyUds8=;
 b=bHBtk2WyAPrSgXPypQH0kzDXTTw+2l6aAvbh/NwDvo5pH3K7HgGZnCa3+IH6nB89bc
 wYMU92O7opScvJn358Fny6bQpjaH81u30pDLFWxwHkjF4AMtpHIeyn0A4aDwaOqNSoys
 aHsJNFes83E5fZu5ooTew9M61ffjGXoy97S5rO4eJOawnc3RQVWSnccd96KgD9vV2k+z
 YarwtJagisxyKGr8rfWhIDK1aIv8Iac2NSPUn/F2nVBHnyMbiJTYksBNc6+6LH90wu/L
 PWpXbKrQL6H4WF0oSZD8rC5F4ljUIr4YovI3qijUAVD2ZH4lrWb5AQCN+I1wteUDJi7T
 EXfQ==
X-Gm-Message-State: AOAM530nAh/DzW3oeFHYlUbsRUtMBogtpknlTEGhsB1zGOune5F+F0dq
 XoAguKS1zVxozx1n4YGhIpSWcoOjCxZx/Q==
X-Google-Smtp-Source: ABdhPJzVwnjHP24O2PFC8oNNExdj9U9W2W0icZLNhaGoCddyoUjU+Mku7iaCwIMhZ0ZEGzMSsEirkg==
X-Received: by 2002:a17:90b:33d2:b0:1bf:3b3f:cb60 with SMTP id
 lk18-20020a17090b33d200b001bf3b3fcb60mr2101544pjb.109.1646704449848; 
 Mon, 07 Mar 2022 17:54:09 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/11] target/s390x: vxeh2: vector {load,
 store} elements reversed
Date: Mon,  7 Mar 2022 15:53:53 -1000
Message-Id: <20220308015358.188499-7-richard.henderson@linaro.org>
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
Message-Id: <20220307020327.3003-5-dmiller423@gmail.com>
[rth: Use new hswap and wswap tcg expanders.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 84 +++++++++++++++++++++++++++++
 target/s390x/tcg/insn-data.def      |  4 ++
 2 files changed, 88 insertions(+)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index a5283ef2f8..ac807122a3 100644
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
-- 
2.25.1


