Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3743F19E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:25:57 +0200 (CEST)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCuK-0002Ce-Iz
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfR-0000o1-Pp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfO-0006cb-9Y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id b71so6247729wmd.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTAmNY7NZhNpHGjDgOnthftRgO/nCeAXtymwqGHAT1o=;
 b=ffA2pc/IYwL5LwaEa6+/JhfLnd16wdqegHJ1HCuGJOnRa26zMfwptSVrhmTrP5Gbla
 MQDHock+UndzkMbpgnG21w5+j81G5YnpD7fwAYjaimtV3aWjlCfCJtoQIgIe20ZxfHGh
 A3Yz0qZ9LTeWUl5bqGuJaNDaiiJvcKYk8E/OIZqZcNWBp1Kq7qh57SVQf2A7eWccv8tC
 H7utAHIa6w7XQ9o8akf6DBi2httsaHV4I5YAKArHDT6F+qG6RSqQ7J3F1EzlTGOkvSw2
 J2O0EmDhZozwpN21Nbh1uB0ovcsx6Fvy28RayiIapqE533WAzq6vFP2Eoo6uHhDeBTYW
 e1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mTAmNY7NZhNpHGjDgOnthftRgO/nCeAXtymwqGHAT1o=;
 b=XVSc4z3ZazdIEqp9w+U+ShPMOPYItdpCHcZFOWj1xS9pU6QVtT3wPkc75EEqTjri9A
 mDy5sivdmgZX7wU8qzy2jd9B3aNHjlaeqa3aepwMwCJLvZrilcjvsQbfDxtuUsJ+uXRk
 mYn1u3wRo8KioXi1/F+blPMg1DwY71p7C/CwJb9l68kHjZANRXApAp6dlbEtKE+RGte8
 u3YQuDttETm86gBQbMZAUUPVUZAOdSibXZDjzKNfMkVJs0h0lLz4jendPcwef2o/dzDX
 swkY5sPxab3RQKwN2cJXQHhLNLou2YotLHHehV1DmWeO4POmSRI1XXm1YlIQ5VY3EjDG
 g3KA==
X-Gm-Message-State: AOAM531yg97kPps9rZZTQa3reYLIwZvrV1xWbU220DuIrVv8wtPiZZvr
 kqbQExEVcKbUMjPJKSxl37MYFZd8c6g=
X-Google-Smtp-Source: ABdhPJypukrQi7qn/zs17VaKy+MTiDg3Yj9ey8s8ldQg/LD1htL3lUUtME0tGYA1X5sys7Vsttv8dw==
X-Received: by 2002:a05:600c:5113:: with SMTP id
 o19mr14765330wms.104.1635455428000; 
 Thu, 28 Oct 2021 14:10:28 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm4652090wmg.14.2021.10.28.14.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 2/4)
Date: Thu, 28 Oct 2021 23:08:32 +0200
Message-Id: <20211028210843.2120802-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Per the Encoding of Operation Field for 3R Instruction Format'
(Table 3.25), these instructions are not defined for the BYTE
format. Therefore the TRANS_DF_iii_b() macro returns 'false'
in that case, because no such instruction is decoded.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Remove TRANS_MSA(), call check_msa_enabled in trans_X()
---
 target/mips/tcg/msa.decode      |  11 ++
 target/mips/tcg/msa_translate.c | 182 +++++---------------------------
 2 files changed, 35 insertions(+), 158 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 4b14acce26f..0e2f474cde6 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -89,10 +89,21 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  DOTP_S            011110 000.. ..... ..... .....  010011  @3r
+  DOTP_U            011110 001.. ..... ..... .....  010011  @3r
+  DPADD_S           011110 010.. ..... ..... .....  010011  @3r
+  DPADD_U           011110 011.. ..... ..... .....  010011  @3r
+  DPSUB_S           011110 100.. ..... ..... .....  010011  @3r
+  DPSUB_U           011110 101.. ..... ..... .....  010011  @3r
+
   SLD               011110 000 .. ..... ..... ..... 010100  @3r
   SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
 
   VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+  HADD_S            011110 100.. ..... ..... .....  010101  @3r
+  HADD_U            011110 101.. ..... ..... .....  010101  @3r
+  HSUB_S            011110 110.. ..... ..... .....  010101  @3r
+  HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 6738a2b8cd7..b65474261f0 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -57,13 +57,11 @@ enum {
     OPC_ADD_A_df    = (0x0 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
-    OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
-    OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -71,7 +69,6 @@ enum {
     OPC_ADDS_S_df   = (0x2 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUS_U_df = (0x2 << 23) | OPC_MSA_3R_11,
     OPC_MSUBV_df    = (0x2 << 23) | OPC_MSA_3R_12,
-    OPC_DPADD_S_df  = (0x2 << 23) | OPC_MSA_3R_13,
     OPC_PCKEV_df    = (0x2 << 23) | OPC_MSA_3R_14,
     OPC_SRLR_df     = (0x2 << 23) | OPC_MSA_3R_15,
     OPC_BCLR_df     = (0x3 << 23) | OPC_MSA_3R_0D,
@@ -79,7 +76,6 @@ enum {
     OPC_CLT_U_df    = (0x3 << 23) | OPC_MSA_3R_0F,
     OPC_ADDS_U_df   = (0x3 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUU_S_df = (0x3 << 23) | OPC_MSA_3R_11,
-    OPC_DPADD_U_df  = (0x3 << 23) | OPC_MSA_3R_13,
     OPC_PCKOD_df    = (0x3 << 23) | OPC_MSA_3R_14,
     OPC_BSET_df     = (0x4 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_S_df    = (0x4 << 23) | OPC_MSA_3R_0E,
@@ -87,30 +83,24 @@ enum {
     OPC_AVE_S_df    = (0x4 << 23) | OPC_MSA_3R_10,
     OPC_ASUB_S_df   = (0x4 << 23) | OPC_MSA_3R_11,
     OPC_DIV_S_df    = (0x4 << 23) | OPC_MSA_3R_12,
-    OPC_DPSUB_S_df  = (0x4 << 23) | OPC_MSA_3R_13,
     OPC_ILVL_df     = (0x4 << 23) | OPC_MSA_3R_14,
-    OPC_HADD_S_df   = (0x4 << 23) | OPC_MSA_3R_15,
     OPC_BNEG_df     = (0x5 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_U_df    = (0x5 << 23) | OPC_MSA_3R_0E,
     OPC_CLE_U_df    = (0x5 << 23) | OPC_MSA_3R_0F,
     OPC_AVE_U_df    = (0x5 << 23) | OPC_MSA_3R_10,
     OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
     OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
-    OPC_DPSUB_U_df  = (0x5 << 23) | OPC_MSA_3R_13,
     OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
-    OPC_HADD_U_df   = (0x5 << 23) | OPC_MSA_3R_15,
     OPC_BINSL_df    = (0x6 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
     OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
     OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
-    OPC_HSUB_S_df   = (0x6 << 23) | OPC_MSA_3R_15,
     OPC_BINSR_df    = (0x7 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
     OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
     OPC_ILVOD_df    = (0x7 << 23) | OPC_MSA_3R_14,
-    OPC_HSUB_U_df   = (0x7 << 23) | OPC_MSA_3R_15,
 
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
@@ -253,6 +243,15 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_ii(NAME, trans_func, gen_func) \
     TRANS_DF_x(ii, NAME, trans_func, gen_func)
 
+#define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
+    static gen_helper_piii * const NAME##_tab[4] = { \
+        NULL, gen_func##_h, gen_func##_w, gen_func##_d \
+    }; \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { \
+        return trans_func(ctx, a, NAME##_tab[a->df]); \
+    }
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -480,6 +479,10 @@ static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
 static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
                          gen_helper_piii *gen_msa_3r)
 {
+    if (!gen_msa_3r) {
+        return false;
+    }
+
     if (!check_msa_enabled(ctx)) {
         return true;
     }
@@ -500,10 +503,21 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,   gen_helper_msa_dotp_s);
+TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,   gen_helper_msa_dotp_u);
+TRANS_DF_iii_b(DPADD_S, trans_msa_3r,   gen_helper_msa_dpadd_s);
+TRANS_DF_iii_b(DPADD_U, trans_msa_3r,   gen_helper_msa_dpadd_u);
+TRANS_DF_iii_b(DPSUB_S, trans_msa_3r,   gen_helper_msa_dpsub_s);
+TRANS_DF_iii_b(DPSUB_U, trans_msa_3r,   gen_helper_msa_dpsub_u);
+
 TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);
 TRANS(SPLAT,            trans_msa_3rf,  gen_helper_msa_splat_df);
 
 TRANS(VSHF,             trans_msa_3rf,  gen_helper_msa_vshf_df);
+TRANS_DF_iii_b(HADD_S,  trans_msa_3r,   gen_helper_msa_hadd_s);
+TRANS_DF_iii_b(HADD_U,  trans_msa_3r,   gen_helper_msa_hadd_u);
+TRANS_DF_iii_b(HSUB_S,  trans_msa_3r,   gen_helper_msa_hsub_s);
+TRANS_DF_iii_b(HSUB_U,  trans_msa_3r,   gen_helper_msa_hsub_u);
 
 static void gen_msa_3r(DisasContext *ctx)
 {
@@ -1319,154 +1333,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-
-    case OPC_DOTP_S_df:
-    case OPC_DOTP_U_df:
-    case OPC_DPADD_S_df:
-    case OPC_DPADD_U_df:
-    case OPC_DPSUB_S_df:
-    case OPC_HADD_S_df:
-    case OPC_DPSUB_U_df:
-    case OPC_HADD_U_df:
-    case OPC_HSUB_S_df:
-    case OPC_HSUB_U_df:
-        if (df == DF_BYTE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-        switch (MASK_MSA_3R(ctx->opcode)) {
-        case OPC_HADD_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hadd_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hadd_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hadd_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HADD_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hadd_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hadd_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hadd_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HSUB_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hsub_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hsub_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hsub_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HSUB_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hsub_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hsub_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hsub_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DOTP_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dotp_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dotp_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dotp_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DOTP_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dotp_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dotp_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dotp_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPADD_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpadd_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpadd_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpadd_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPADD_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpadd_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpadd_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpadd_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPSUB_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpsub_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpsub_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpsub_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPSUB_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpsub_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpsub_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpsub_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


