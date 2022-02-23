Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C424C1EB0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:37:28 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0GF-0007X0-Mr
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0Ab-000670-0j; Wed, 23 Feb 2022 17:31:37 -0500
Received: from [2607:f8b0:4864:20::f31] (port=36441
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0AX-00014c-Pn; Wed, 23 Feb 2022 17:31:36 -0500
Received: by mail-qv1-xf31.google.com with SMTP id w7so704465qvr.3;
 Wed, 23 Feb 2022 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVRWVIfAhWc3cJYY5OV4FaVI4qHhAw/RxlICL7cEFBY=;
 b=T2qfMy4qXMUXSqlBYFcUAi7jj+nsIdkF9Hmfec6GEouszP7ijENyVHZlB/yVQ3WsQf
 gjQwwyIbaDbWVoSbzdop/+CId00LWjFHc6oJ2/iKihXdaqnhOK0pNVPw+lf5MTw2LzLM
 4lnqDI0nyRAZeTWQMSMrqqqB/ARPzjE7SlsD3keIS6BlKWM/JB4LSKOUss1dufKJKZ6b
 iSDwC0XwVJjRRxGxA5Na43ojvDuogTD9jI0EwwYFc5um1HoNdh1IzQcTOUMkEN1McV7M
 aMAMSB58EhGDBjXTea0TweANCDxA4ooV7aHO1sXzYZPvXI0UdRV1mgj7ZFAC22bKJq2I
 kcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVRWVIfAhWc3cJYY5OV4FaVI4qHhAw/RxlICL7cEFBY=;
 b=6O7laSfI3XfOVFvbu69ZBmdnk9SXJ5JXtjK0OT87bXmxLB7RsyRb5NopdKo901HfUI
 997nlJ2Dnx6ntClxethiRK+eLnRT6uuKLWacmwlpUMoWVP9EW04XuMyc8TPvIfPgoQ1+
 jZg9NFX+6LeSfyZw0Zv1brdzpJXsDmVcd0oqoO7H8/p0CV1KuLC0rIuabmfIlAh2xQ+I
 VAmcU5kfG1F1NiYaANJIsqpvdQ32bTV/qVFcMImnJnNJtinc1clt0gA6Fp4chiJfE5FK
 CSrNKgY4tbgkCbzCmPIlN8fOu9YeLs9OlxfA9Yp+7MvdMHA6sgPLRmucG+t4ogWclQqJ
 1Ujw==
X-Gm-Message-State: AOAM533wsWXTvRQ67ScPZfZzNAxWcan6oF6kGYf9mS72FFiov1/zYaNH
 owRB7+Ls1LqIl8nPGfWAwuQkVK9LiCkzwCdTT+M=
X-Google-Smtp-Source: ABdhPJyeArqk2oRvo1wVvp6UxFo1nlGezBvmGwMg14zLLXcy8k8E1CjVMcfUxkZaCxKhvkNe2o+qBQ==
X-Received: by 2002:a05:622a:2d3:b0:2d1:2ab4:c3da with SMTP id
 a19-20020a05622a02d300b002d12ab4c3damr1933461qtx.434.1645655492176; 
 Wed, 23 Feb 2022 14:31:32 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 o18sm618968qtv.26.2022.02.23.14.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:31 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Date: Wed, 23 Feb 2022 17:31:14 -0500
Message-Id: <20220223223117.66660-2-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223223117.66660-1-dmiller423@gmail.com>
References: <20220223223117.66660-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf31.google.com
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

resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
implements:
AND WITH COMPLEMENT   (NCRK, NCGRK)
NAND                  (NNRK, NNGRK)
NOT EXCLUSIVE OR      (NXRK, NXGRK)
NOR                   (NORK, NOGRK)
OR WITH COMPLEMENT    (OCRK, OCGRK)
SELECT                (SELR, SELGR)
SELECT HIGH           (SELFHR)
MOVE RIGHT TO LEFT    (MVCRL)
POPULATION COUNT      (POPCNT)

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 target/s390x/gen-features.c    |  1 +
 target/s390x/helper.h          |  1 +
 target/s390x/tcg/insn-data.def | 30 +++++++++++++++--
 target/s390x/tcg/mem_helper.c  | 20 ++++++++++++
 target/s390x/tcg/translate.c   | 60 ++++++++++++++++++++++++++++++++--
 5 files changed, 107 insertions(+), 5 deletions(-)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 7cb1a6ec10..a3f30f69d9 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -740,6 +740,7 @@ static uint16_t qemu_LATEST[] = {
 
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 271b081e8c..69f69cf718 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -4,6 +4,7 @@ DEF_HELPER_FLAGS_4(nc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(oc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(xc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvc, TCG_CALL_NO_WG, void, env, i32, i64, i64)
+DEF_HELPER_FLAGS_4(mvcrl, TCG_CALL_NO_WG, void, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvcin, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 1c3e115712..35e55d454e 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -105,6 +105,9 @@
     D(0xa507, NILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, andi, 0, 0x1000)
     D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB)
     D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB)
+/* AND WITH COMPLEMENT */
+    C(0xb9f5, NCRK,    RRF_a, MIE3, r2, r3, new, r1_32, andc, nz32)
+    C(0xb9e5, NCGRK,   RRF_a, MIE3, r2, r3, r1, 0, andc, nz64)
 
 /* BRANCH AND LINK */
     C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)
@@ -640,6 +643,8 @@
     C(0xeb8e, MVCLU,   RSY_a, E2,  0, a2, 0, 0, mvclu, 0)
 /* MOVE NUMERICS */
     C(0xd100, MVN,     SS_a,  Z,   la1, a2, 0, 0, mvn, 0)
+/* MOVE RIGHT TO LEFT */
+    C(0xe50a, MVCRL,   SSE,  MIE3, la1, a2, 0, 0, mvcrl, 0)
 /* MOVE PAGE */
     C(0xb254, MVPG,    RRE,   Z,   0, 0, 0, 0, mvpg, 0)
 /* MOVE STRING */
@@ -707,6 +712,16 @@
     F(0xed0f, MSEB,    RXF,   Z,   e1, m2_32u, new, e1, mseb, 0, IF_BFP)
     F(0xed1f, MSDB,    RXF,   Z,   f1, m2_64, new, f1, msdb, 0, IF_BFP)
 
+/* NAND */
+    C(0xb974, NNRK,    RRF_a, MIE3, r2, r3, new, r1_32, nand, nz32)
+    C(0xb964, NNGRK,   RRF_a, MIE3, r2, r3, r1, 0, nand, nz64)
+/* NOR */
+    C(0xb976, NORK,    RRF_a, MIE3, r2, r3, new, r1_32, nor, nz32)
+    C(0xb966, NOGRK,   RRF_a, MIE3, r2, r3, r1, 0, nor, nz64)
+/* NOT EXCLUSIVE OR */
+    C(0xb977, NXRK,    RRF_a, MIE3, r2, r3, new, r1_32, nxor, nz32)
+    C(0xb967, NXGRK,   RRF_a, MIE3, r2, r3, r1, 0, nxor, nz64)
+
 /* OR */
     C(0x1600, OR,      RR_a,  Z,   r1, r2, new, r1_32, or, nz32)
     C(0xb9f6, ORK,     RRF_a, DO,  r2, r3, new, r1_32, or, nz32)
@@ -725,6 +740,9 @@
     D(0xa50b, OILL,    RI_a,  Z,   r1_o, i2_16u, r1, 0, ori, 0, 0x1000)
     D(0x9600, OI,      SI,    Z,   la1, i2_8u, new, 0, oi, nz64, MO_UB)
     D(0xeb56, OIY,     SIY,   LD,  la1, i2_8u, new, 0, oi, nz64, MO_UB)
+/* OR WITH COMPLEMENT */
+    C(0xb975, OCRK,    RRF_a, MIE3, r2, r3, new, r1_32, orc, nz32)
+    C(0xb965, OCGRK,   RRF_a, MIE3, r2, r3, r1, 0, orc, nz64)
 
 /* PACK */
     /* Really format SS_b, but we pack both lengths into one argument
@@ -735,6 +753,9 @@
 /* PACK UNICODE */
     C(0xe100, PKU,     SS_f,  E2,  la1, a2, 0, 0, pku, 0)
 
+/* POPULATION COUNT */
+    C(0xb9e1, POPCNT,  RRF_c, PC,  0, r2_o, r1, 0, popcnt, nz64)
+
 /* PREFETCH */
     /* Implemented as nops of course.  */
     C(0xe336, PFD,     RXY_b, GIE, 0, 0, 0, 0, 0, 0)
@@ -743,9 +764,6 @@
     /* Implemented as nop of course.  */
     C(0xb2e8, PPA,     RRF_c, PPA, 0, 0, 0, 0, 0, 0)
 
-/* POPULATION COUNT */
-    C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
-
 /* ROTATE LEFT SINGLE LOGICAL */
     C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
     C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
@@ -765,6 +783,12 @@
 /* SEARCH STRING UNICODE */
     C(0xb9be, SRSTU,   RRE,   ETF3, 0, 0, 0, 0, srstu, 0)
 
+/* SELECT */
+    C(0xb9f0, SELR,    RRF_a, MIE3, r3, r2, new, r1_32, loc, 0)
+    C(0xb9e3, SELGR,   RRF_a, MIE3, r3, r2, r1, 0, loc, 0)
+/* SELECT HIGH */
+    C(0xb9c0, SELFHR,  RRF_a, MIE3, r3_sr32, r2_sr32, new, r1_32h, loc, 0)
+
 /* SET ACCESS */
     C(0xb24e, SAR,     RRE,   Z,   0, r2_o, 0, 0, sar, 0)
 /* SET ADDRESSING MODE */
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 406578d105..ed1a77ebe8 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -546,6 +546,26 @@ void HELPER(mvc)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     do_helper_mvc(env, l, dest, src, GETPC());
 }
 
+/* move right to left */
+void HELPER(mvcrl)(CPUS390XState *env, uint64_t l, uint64_t dest, uint64_t src)
+{
+    const int mmu_idx = cpu_mmu_index(env, false);
+    const uint64_t ra = GETPC();
+    S390Access srca, desta;
+    int32_t i;
+
+    /* MVCRL always copies one more byte than specified - maximum is 256 */
+    l++;
+
+    srca = access_prepare(env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
+    desta = access_prepare(env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+
+    for (i = l - 1; i >= 0; i--) {
+        uint8_t byte = access_get_byte(env, &srca, i, ra);
+        access_set_byte(env, &desta, i, byte, ra);
+    }
+}
+
 /* move inverse  */
 void HELPER(mvcin)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
 {
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46dea73357..92faa1b65f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1498,6 +1498,36 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_andc(DisasContext *s, DisasOps *o)
+{
+    tcg_gen_andc_i64(o->out, o->in1, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_orc(DisasContext *s, DisasOps *o)
+{
+    tcg_gen_orc_i64(o->out, o->in1, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_nand(DisasContext *s, DisasOps *o)
+{
+    tcg_gen_nand_i64(o->out, o->in1, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_nor(DisasContext *s, DisasOps *o)
+{
+    tcg_gen_nor_i64(o->out, o->in1, o->in2);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_nxor(DisasContext *s, DisasOps *o)
+{
+    tcg_gen_eqv_i64(o->out, o->in1, o->in2);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_ni(DisasContext *s, DisasOps *o)
 {
     o->in1 = tcg_temp_new_i64();
@@ -2958,7 +2988,13 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
 {
     DisasCompare c;
 
-    disas_jcc(s, &c, get_field(s, m3));
+    if (have_field(s, m3)) {
+        /* LOAD * ON CONDITION */
+        disas_jcc(s, &c, get_field(s, m3));
+    } else {
+        /* SELECT */
+        disas_jcc(s, &c, get_field(s, m4));
+    }
 
     if (c.is_64) {
         tcg_gen_movcond_i64(c.cond, o->out, c.u.s64.a, c.u.s64.b,
@@ -3358,6 +3394,12 @@ static DisasJumpType op_mvc(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_mvcrl(DisasContext *s, DisasOps *o)
+{
+    gen_helper_mvcrl(cpu_env, regs[0], o->addr1, o->in2);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_mvcin(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 l = tcg_const_i32(get_field(s, l1));
@@ -3744,7 +3786,13 @@ static DisasJumpType op_pku(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_popcnt(DisasContext *s, DisasOps *o)
 {
-    gen_helper_popcnt(o->out, o->in2);
+    const uint8_t m3 = get_field(s, m3);
+
+    if ((m3 & 8) && s390_has_feat(S390_FEAT_MISC_INSTRUCTION_EXT3)) {
+        tcg_gen_ctpop_i64(o->out, o->in2);
+    } else {
+        gen_helper_popcnt(o->out, o->in2);
+    }
     return DISAS_NEXT;
 }
 
@@ -5668,6 +5716,13 @@ static void in1_r3_D32(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in1_r3_D32 SPEC_r3_even
 
+static void in1_r3_sr32(DisasContext *s, DisasOps *o)
+{
+    o->in1 = tcg_temp_new_i64();
+    tcg_gen_shri_i64(o->in1, regs[get_field(s, r3)], 32);
+}
+#define SPEC_in1_r3_sr32 0
+
 static void in1_e1(DisasContext *s, DisasOps *o)
 {
     o->in1 = load_freg32_i64(get_field(s, r1));
@@ -6170,6 +6225,7 @@ enum DisasInsnEnum {
 #define FAC_V           S390_FEAT_VECTOR /* vector facility */
 #define FAC_VE          S390_FEAT_VECTOR_ENH /* vector enhancements facility 1 */
 #define FAC_MIE2        S390_FEAT_MISC_INSTRUCTION_EXT2 /* miscellaneous-instruction-extensions facility 2 */
+#define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
 
 static const DisasInsn insn_info[] = {
 #include "insn-data.def"
-- 
2.32.0


