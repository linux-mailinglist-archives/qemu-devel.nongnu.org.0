Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD184E3546
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:11:49 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS7o-00080H-M2
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:11:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1R-0007r6-3a; Mon, 21 Mar 2022 20:05:14 -0400
Received: from [2607:f8b0:4864:20::830] (port=34733
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007IO-NE; Mon, 21 Mar 2022 20:05:12 -0400
Received: by mail-qt1-x830.google.com with SMTP id c4so13318467qtx.1;
 Mon, 21 Mar 2022 17:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uGeYx42z3WTaEuGqqv50st94PnNprs6iod9i7KVdtcY=;
 b=H5B/j4zirUzK5/c0sLCChULYR36OPtHLE1gUVfGeZvYGWeBPWdH7Z6gDE/HCjLQ0K9
 C2DvunP8r7NopP52NVxbGIBQvoATNxe/nn3IXRT9iNwvH/9yQbW3RR8lkLtGo5PcMcDm
 /O15zGkpu3u6Q+udC2SgRbkwDeirgjQ9U6h1qydmxgm8TbyrzjDsd5yzuj5hRSE5PO8c
 ZgWRMA7tIUyd1oqCyEIH0lUjTq9d5KfgRHE6KZHHeoUYzZm+PgqM91S+Vas4PnDqc3l3
 o2vVZFXkFjEb+mlz5O3ltDbEnOkr20S0JFOqRYXDby6bUzj5ZBowkGWCi1kdjNfW+Z3M
 Jw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uGeYx42z3WTaEuGqqv50st94PnNprs6iod9i7KVdtcY=;
 b=Ev2OpUftlnDOD5RFw/VIkTfjHcnBj0n486nTzhv68TlKtwmUJtprxuKF36p5rPCeWb
 zQB1IiPStXn05EkRGwUjgJBRpcyNWhYHuPkgepe9FOfXtH61IygQ7BfJPjiwv3LHYu/A
 sTqIbBN1jAhf3djm4cwF/CUZiFIoFfmfXvdmjgLKL5sXma3BZWi1/EL9tm1WU/PPNGcx
 xKXcmfLMJ5Em3O589kQl1k1HMFfyamJDpaPLZBK+f6GePuqOQ8p73joc+Dbjec2+YPeb
 rLExetsoeaIvrNQRUfnTpfC/RcrTyNWX9mCeQaA7h7TGqm1tHG5mX2jixtdTN9L7NjdX
 ZVZg==
X-Gm-Message-State: AOAM530e0xtCA6HXXuOwadQZVH0eKW6Au8YVHdF9I+fRhxXHKnFuMXvo
 wQ1R4wJlm8yhkJdSqACQ5SlOq0cQbZM8GQ==
X-Google-Smtp-Source: ABdhPJyCi/uft839if2Qeac92tG8O6o3SmtgMq5tM7e4zEbMP1sL1XklWrfUWjyS5lYxJpseiLg9cg==
X-Received: by 2002:ac8:5b92:0:b0:2e1:e454:7fd7 with SMTP id
 a18-20020ac85b92000000b002e1e4547fd7mr18132041qta.667.1647907501031; 
 Mon, 21 Mar 2022 17:05:01 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:05:00 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 08/11] target/s390x: vxeh2: vector {load,
 store} byte reversed element
Date: Mon, 21 Mar 2022 20:04:38 -0400
Message-Id: <20220322000441.26495-9-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x830.google.com
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
index 284ee4362c..ecf7f87c6c 100644
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
@@ -1055,6 +1122,24 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
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


