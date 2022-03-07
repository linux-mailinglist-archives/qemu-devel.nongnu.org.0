Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689584CEF53
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:08:29 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2nR-000150-4N
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2it-0002WM-K1; Sun, 06 Mar 2022 21:03:44 -0500
Received: from [2607:f8b0:4864:20::834] (port=40561
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2ir-0005x7-D1; Sun, 06 Mar 2022 21:03:42 -0500
Received: by mail-qt1-x834.google.com with SMTP id t28so12129575qtc.7;
 Sun, 06 Mar 2022 18:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUSh5DD7+MNCpicyFIHfPbvTGacl1BCT4NmDWW+6Irc=;
 b=NyeSIZSws1Kjiny2/7CKKCYKxLyGDo6lBB4Ih5L+Q5iJ1e2Ttl422R2y51AlmwVl3Y
 YPBoB+XPpOi2HfhN4dgdhlLiO5GMCFm3s0NxUu0etXkbxWQ2L1iVq8nXXuPnMAfmTeOr
 Tvv7HwQg1ecIduUfTE2xhmbt52UwZEpAuVPqTyeuI/Rfstl/pYGQMOCvJaxt95HZvnpe
 3TD6hhhN+OACMphGw0fymqQiF+N6a3jjf+DP5Te2xLTdUFXchIY5LM79Psjum0U5/Q7W
 cgYEW+3JmNI1BuFGvEFklj1B9V4vS/N16QCjIKKiZhRWZ/wVPxqUHX6yiedY2NJwZTsZ
 pgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUSh5DD7+MNCpicyFIHfPbvTGacl1BCT4NmDWW+6Irc=;
 b=hIYKbeMeYk076ASO/+YY/HxmScNtsJ6tGCqGlLaTwZi7ke4bPRtw53V66VNkVbcxum
 KlOoAl3xGe11J2oSzm6d95An1A+G1zuVa0YiZcbKQ4Bb7XKETNUGhpycgzbdyl936Pi4
 JraK7px+8VXB2qTxGzFHs5aomIeNna+7W0QA2wXOpI79mj4OdMwH+8lUxiA4ymqpIly3
 P0tD/EM9JNiAiPiaj/dO2iYVpJ2F/DGilh9dWdYbou/efOnknYlFWNxchPSraoIslzjz
 zQ5aeQ2Vxlopwgd87OMToGlUh5+NgICQB1JqJN0LlOnmm9x7BfkwULYdd+/Dek+0xANR
 WK9Q==
X-Gm-Message-State: AOAM533VD7dnPoFH5bOdEbZQwjucMn/SQjeKs1OaEtLF/QA2WNnkwQai
 z/Klu45jq8VmKNFcEocI+imCc1rf9ZCvEQ==
X-Google-Smtp-Source: ABdhPJwk5t6OEU4v7xY8NlESlGTeALPIJBSuE4iL9kn1YTvzT2IYcauhgd2S5j+l50zJ5KYCH5z8lQ==
X-Received: by 2002:ac8:5f06:0:b0:2d4:52af:8d7b with SMTP id
 x6-20020ac85f06000000b002d452af8d7bmr7735272qta.510.1646618620062; 
 Sun, 06 Mar 2022 18:03:40 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:39 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] target/s390x: vxeh2: vector {load,
 store} elements reversed
Date: Sun,  6 Mar 2022 21:03:24 -0500
Message-Id: <20220307020327.3003-5-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
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
---
 target/s390x/helper.h               |  4 ++-
 target/s390x/tcg/insn-data.def      |  4 +++
 target/s390x/tcg/translate_vx.c.inc | 39 +++++++++++++++++++++++++++++
 target/s390x/tcg/vec.h              | 24 ++++++++++++++++++
 target/s390x/tcg/vec_helper.c       | 31 +++++++++++++++++++++++
 5 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index a36308d651..933921a87c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -129,6 +129,9 @@ DEF_HELPER_FLAGS_3(probe_write_access, TCG_CALL_NO_WG, void, env, i64, i64)
 /* === Vector Support Instructions === */
 DEF_HELPER_FLAGS_4(gvec_vbperm, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(vll, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
+DEF_HELPER_FLAGS_4(vler, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
+DEF_HELPER_FLAGS_4(vster, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
+DEF_HELPER_FLAGS_4(vstl, TCG_CALL_NO_WG, void, env, cptr, i64, i64)
 DEF_HELPER_FLAGS_4(gvec_vpk16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vpk32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vpk64, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
@@ -145,7 +148,6 @@ DEF_HELPER_5(gvec_vpkls_cc16, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vpkls_cc32, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vpkls_cc64, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vperm, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, cptr, i32)
-DEF_HELPER_FLAGS_4(vstl, TCG_CALL_NO_WG, void, env, cptr, i64, i64)
 
 /* === Vector Integer Instructions === */
 DEF_HELPER_FLAGS_4(gvec_vavg8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 1bfe88a4ac..3a7f15a0b5 100644
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
index 60e1efdbfa..d543203e02 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -492,6 +492,26 @@ static DisasJumpType op_vlei(DisasContext *s, DisasOps *o)
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
+    TCGv_ptr a0 = tcg_temp_new_ptr();
+    TCGv_i64 tes = tcg_const_i64(es & 0xf);
+
+    tcg_gen_addi_ptr(a0, cpu_env, vec_full_reg_offset(get_field(s, v1)));
+    gen_helper_vler(cpu_env, a0, o->addr1, tes);
+
+    tcg_temp_free_i64(tes);
+    tcg_temp_free_ptr(a0);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vlgv(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = get_field(s, m4);
@@ -976,6 +996,25 @@ static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vster(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    TCGv_ptr a0 = tcg_temp_new_ptr();
+    TCGv_i64 tes = tcg_const_i64(es);
+
+    tcg_gen_addi_ptr(a0, cpu_env, vec_full_reg_offset(get_field(s, v1)));
+    gen_helper_vster(cpu_env, a0, o->addr1, tes);
+
+    tcg_temp_free_i64(tes);
+    tcg_temp_free_ptr(a0);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vstm(DisasContext *s, DisasOps *o)
 {
     const uint8_t v3 = get_field(s, v3);
diff --git a/target/s390x/tcg/vec.h b/target/s390x/tcg/vec.h
index a6e361869b..5ea0446e4b 100644
--- a/target/s390x/tcg/vec.h
+++ b/target/s390x/tcg/vec.h
@@ -138,4 +138,28 @@ static inline void s390_vec_write_element(S390Vector *v, uint8_t enr,
     }
 }
 
+static inline void s390_vec_reverse(uint64_t *vdst, uint64_t *vsrc, uint8_t es)
+{
+    const uint64_t l = vsrc[0], h = vsrc[1];
+
+    switch (es) {
+    case MO_8:
+        vdst[1] = bswap64(l);
+        vdst[0] = bswap64(h);
+        break;
+    case MO_16:
+        vdst[1] = hswap64(l);
+        vdst[0] = hswap64(h);
+        break;
+    case MO_32:
+        vdst[1] = wswap64(l);
+        vdst[0] = wswap64(h);
+        break;
+    case MO_64:
+        vdst[1] = l;
+        vdst[0] = h;
+        break;
+    }
+}
+
 #endif /* S390X_VEC_H */
diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..96b488b6e0 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -212,3 +212,34 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         *(S390Vector *)v1 = tmp;
     }
 }
+
+void HELPER(vler)(CPUS390XState *env, void *v1, uint64_t addr, uint64_t es)
+{
+    uint64_t t0, t1;
+    t0 = cpu_ldq_data_ra(env, addr, GETPC());
+    addr = wrap_address(env, addr + 8);
+    t1 = cpu_ldq_data_ra(env, addr, GETPC());
+
+    if (MO_64 == es) {
+        s390_vec_write_element64(v1, 1, t0);
+        s390_vec_write_element64(v1, 0, t1);
+    } else {
+        S390Vector tmp = {};
+        s390_vec_write_element64(&tmp, 0, t0);
+        s390_vec_write_element64(&tmp, 1, t1);
+        s390_vec_reverse(v1, &tmp, (uint8_t)es);
+    }
+}
+
+void HELPER(vster)(CPUS390XState *env, void *v1, uint64_t addr, uint64_t es)
+{
+    S390Vector tmp = {};
+    /* Probe write access before actually modifying memory */
+    probe_write_access(env, addr, 16, GETPC());
+
+    s390_vec_reverse(&tmp, v1, (uint8_t)es);
+
+    cpu_stq_data_ra(env, addr, tmp.doubleword[0], GETPC());
+    addr = wrap_address(env, addr + 8);
+    cpu_stq_data_ra(env, addr, tmp.doubleword[1], GETPC());
+}
-- 
2.34.1


