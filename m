Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14264CEF59
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:10:17 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2pF-0004Dc-0R
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:10:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2iu-0002WS-6h; Sun, 06 Mar 2022 21:03:44 -0500
Received: from [2607:f8b0:4864:20::f2a] (port=41838
 helo=mail-qv1-xf2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2is-0005xL-4f; Sun, 06 Mar 2022 21:03:43 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id x3so10998369qvd.8;
 Sun, 06 Mar 2022 18:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdYg7YV0XRXLBqKtd3e2w7lzFqD9/8W875Z2mTMiBZo=;
 b=kPdtyIvaN2FCapT2yIATMkNVYbBsGgq+bzWqZb9VqEwf5d8HV2QFrtlzuLkBmzJgTM
 sCBShnWM4zHoeziblnSUtUr1jbp7V0hqWxxd3d7GsnrVOzgwwrTWtZ2fFELJpiBFRpUr
 07WJnk26/J1hN43fE2Me61IwN+xqM/gM9GoJlHEn38UYSbqN5peTdFbT7nC3gyvEPSVa
 Fqu1z9S5xLHNCbU9N1ziu90E0AFi5BRNdrrr8GtIZT74veEuog07zmTjhgSS4L8n2/Fk
 A8g/BNzWP4VY2pzSwLKyyE6TliRlBfEbrLuJWGggPvY9okkIewpSo6mqgtNKZOC6zakk
 8qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdYg7YV0XRXLBqKtd3e2w7lzFqD9/8W875Z2mTMiBZo=;
 b=QqIjXXJvUKZGXg1ZxU7CjO0U4LdR8yQ4vgiL9K2rkGgGOBDE0O4Dgl5Ym2v090LEv4
 jnm7gauzJ9mlcLzR3sdAA477rlWAD73467GAzJH5a1uqSAulniiKGwatVjggFFbUjf6X
 xxoEpAP3ODv0VCX9K5CgkzCP7Xmoq5W4sAUtInyVfakLq0ljXu34Saishpb0ZminGidL
 ltTpgX6n4p24TMc0NTKD9653NaISWWVnUHx6B0tF5UnpJE/WokOZ3oxfe8IQTRLUy/y4
 BNWLKcIehLI+5YdJ8HSr2bF1WFxcj++QG91LBI5C1VsP26Jl/9lngVEXctsKHCUUdpyX
 iyeQ==
X-Gm-Message-State: AOAM530dqz4Qupf9zZ1ZsCzPQX82d5b3o2BuJ6uDUsayusP9gdmElihS
 rbIAutGKBoedJOqerzz+LZkDCGJamk30WA==
X-Google-Smtp-Source: ABdhPJxlq5eputTt5AlmFLnx5c7tcA+ABWyD6YOS86+PHIXjB3d5x9FtrP4v1ZIXsqjSRHKjrSXsEA==
X-Received: by 2002:a05:6214:202f:b0:432:4810:1b34 with SMTP id
 15-20020a056214202f00b0043248101b34mr6837136qvf.35.1646618620901; 
 Sun, 06 Mar 2022 18:03:40 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:40 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] target/s390x: vxeh2: vector {load,
 store} reversed elements [and {zero, replicate}]
Date: Sun,  6 Mar 2022 21:03:25 -0500
Message-Id: <20220307020327.3003-6-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2a.google.com
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
 target/s390x/tcg/insn-data.def      |  16 +++
 target/s390x/tcg/translate_vx.c.inc | 161 ++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 3a7f15a0b5..dc6daa6c10 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,16 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+    F(0xe601, VLEBRH,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+    F(0xe603, VLEBRF,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+    F(0xe602, VLEBRG,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE */
+    F(0xe605, VLBRREP, VRX,   VE2, la2, 0, 0, 0, vlbrrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
+    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+    F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
 /* VECTOR LOAD ELEMENT */
     E(0xe700, VLEB,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_8, IF_VEC)
     E(0xe701, VLEH,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_16, IF_VEC)
@@ -1079,6 +1089,12 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENT */
+    F(0xe609, VSTEBRH,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+    F(0xe60b, VSTEBRF,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+    F(0xe60a, VSTEBRG,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENTS */
+    F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
     E(0xe708, VSTEB,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_8, IF_VEC)
     E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index d543203e02..06c4340655 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,111 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = (1 == s->fields.op2) ? 1 : (1 ^ s->fields.op2);
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (es < ES_16 || es > ES_64 || !valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+
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
+    if (es == ES_8 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+    gen_gvec_dup_i64(es, get_field(s, v1), tmp);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vllebrz(DisasContext *s, DisasOps *o)
+{
+    const uint8_t m3 = get_field(s, m3);
+    const uint8_t es = m3 & 3;
+    const uint8_t enr = (m3 == 6) ? 0 : ((1 << (3 - es)) - 1);
+
+    TCGv_i64 tmp, zero;
+
+    if (m3 < ES_16 || (m3 > ES_64 && m3 != 6))  {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    zero = tcg_const_i64(0);
+    write_vec_element_i64(zero, get_field(s, v1), 1, ES_64);
+    write_vec_element_i64(zero, get_field(s, v1), 0, ES_64);
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+
+    write_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(zero);
+
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    uint32_t dst_idx;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    if (es >= ES_64) {
+        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+        tcg_gen_bswap64_i64(t0, t0);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
+        tcg_gen_bswap64_i64(t1, t1);
+        write_vec_element_i64(t0, get_field(s, v1), (es > ES_64) ? 1 : 0, ES_64);
+        write_vec_element_i64(t1, get_field(s, v1), (es > ES_64) ? 0 : 1, ES_64);
+    } else {
+        for (dst_idx = 0; dst_idx < NUM_VEC_ELEMENTS(es); dst_idx++) {
+            tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+            tcg_gen_bswap64_i64(t0, t0);
+            write_vec_element_i64(t0, get_field(s, v1), dst_idx, es);
+            gen_addi_and_wrap_i64(s, o->addr1, o->addr1, bytes);
+        }
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
@@ -978,6 +1083,62 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vsteb(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = (9 == s->fields.op2) ? 1 : 1 ^ (s->fields.op2 & 3);
+    const uint8_t enr = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    tmp = tcg_temp_new_i64();
+    read_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * bytes);
+    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t v1 = get_field(s, v1);
+    const uint8_t es = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    uint32_t src_idx;
+
+    if (es == ES_8 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_const_i64(16);
+    gen_helper_probe_write_access(cpu_env, o->addr1, t0);
+
+    if (es >= ES_64) {
+        read_vec_element_i64(t0, v1, (es > ES_64) ? 1 : 0, ES_64);
+        tcg_gen_bswap64_i64(t0, t0);
+        tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        read_vec_element_i64(t0, v1, (es > ES_64) ? 0 : 1, ES_64);
+        tcg_gen_bswap64_i64(t0, t0);
+        tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+    } else {
+        for (src_idx = 0; src_idx < NUM_VEC_ELEMENTS(es); src_idx++) {
+            read_vec_element_i64(t0, v1, src_idx, es);
+            tcg_gen_bswap64_i64(t0, t0);
+            tcg_gen_rotri_i64(t0, t0, 64 - 8 * bytes);
+            tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TE | es);
+            gen_addi_and_wrap_i64(s, o->addr1, o->addr1, bytes);
+        }
+    }
+
+    tcg_temp_free(t0);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
-- 
2.34.1


