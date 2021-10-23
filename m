Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C44385A3
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:58:18 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP1t-0002qD-Lw
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOts-00078b-Mq
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtq-0005rR-NK
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k7so181957wrd.13
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPvSWraAlK7Nph4ty/Vbsk19Tc0DzeKGebIhAV3dvYU=;
 b=EirtFh+ic9zODrrAjfdgoFlsvaXSvFoALvFg/Hh9R5Qhm0EHSrmKEjmDQN11Bi6w2Q
 8XtDc5Wu8YxZjzLGddLGlg/b6egLHNl5IiNcq1GOg5/lqsMafEwrFZYYUrOEzNEyepQb
 l6dKGgx7qKGOZL8X/9T+j1x/edFbTWS96AIcTYmYxjrdGpq2+N5enKShAo96MkMZcRs4
 HEPwJg4ZYrRfiNgKkzcW2rX1XEH9p7UdBvOPv+5HDzbcam/BLBpObFLiSZbtCAuL575p
 XA7mXesTMF3p3TZ1x29HBYO4xD9P7SOfHkRQlGw8XdVnctNyPU80V52QtQp9FtalEf0O
 Fe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sPvSWraAlK7Nph4ty/Vbsk19Tc0DzeKGebIhAV3dvYU=;
 b=bAS/5m4gMbiTSA2PwC+iMz00uJB/YW6lES2nd+zZHwUWqdYEPZ5s44gDGSuQJNX00Q
 3dhb9ScG0Jv0K9krI3/VjbGkF6zgUt6/VySNdVgtOxrX5H4C7OaEpUqs+BwMbdybFOOn
 0gxoK70wZUv8n1+w4lo/AsyyKtVvrsv0udhOPkXXSGv2VqSqzXtE9Qxap5vfWgQ6yEYo
 9e4ub0wXp5/ZZJdaLRXkJkK7iR7uQ7z5sng0uoQVuNJuYP2Zp84X3Pa9y1Pn8BAA9bar
 6wMRa/kHRGnK6UOgFsnJOVTD+qL12ZO+EnhGdlgQ6+d9b8/xzmVD/krO+hVl488Xt4Fi
 glNw==
X-Gm-Message-State: AOAM5301VkU0NO25f260PeDcv3HTfi+S/2x8Af/wZuTLPMcdRA5QhVus
 sgrtjU/O+Fs7JEQr9Pl/COFYL2EBV/c=
X-Google-Smtp-Source: ABdhPJwbgrvGfwIHcZOZp109liCaJrw9YaBgOf4XJA09GOGM32tLWxdZtCi3S4uiUaovdFwuWDmn/g==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr10997199wri.92.1635025797098; 
 Sat, 23 Oct 2021 14:49:57 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 w14sm2381838wmi.37.2021.10.23.14.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 2/4)
Date: Sat, 23 Oct 2021 23:47:53 +0200
Message-Id: <20211023214803.522078-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  11 ++
 target/mips/tcg/msa_translate.c | 213 +++++++++-----------------------
 2 files changed, 66 insertions(+), 158 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index ca0fd568560..4a9cf85fa7a 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -80,10 +80,21 @@ BNZ                 010001 111 .. ..... ................    @bz
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
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 0c7055c68bd..e1da532e5c9 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -44,13 +44,11 @@ enum {
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
@@ -58,7 +56,6 @@ enum {
     OPC_ADDS_S_df   = (0x2 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUS_U_df = (0x2 << 23) | OPC_MSA_3R_11,
     OPC_MSUBV_df    = (0x2 << 23) | OPC_MSA_3R_12,
-    OPC_DPADD_S_df  = (0x2 << 23) | OPC_MSA_3R_13,
     OPC_PCKEV_df    = (0x2 << 23) | OPC_MSA_3R_14,
     OPC_SRLR_df     = (0x2 << 23) | OPC_MSA_3R_15,
     OPC_BCLR_df     = (0x3 << 23) | OPC_MSA_3R_0D,
@@ -66,7 +63,6 @@ enum {
     OPC_CLT_U_df    = (0x3 << 23) | OPC_MSA_3R_0F,
     OPC_ADDS_U_df   = (0x3 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUU_S_df = (0x3 << 23) | OPC_MSA_3R_11,
-    OPC_DPADD_U_df  = (0x3 << 23) | OPC_MSA_3R_13,
     OPC_PCKOD_df    = (0x3 << 23) | OPC_MSA_3R_14,
     OPC_BSET_df     = (0x4 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_S_df    = (0x4 << 23) | OPC_MSA_3R_0E,
@@ -74,30 +70,24 @@ enum {
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
@@ -209,6 +199,10 @@ static inline bool check_msa_access(DisasContext *ctx)
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
                     gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)
 
+#define TRANS_DF_B(NAME, trans_func, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
+                    NULL, gen_func##_h, gen_func##_w, gen_func##_d)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -484,10 +478,61 @@ static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
+                         void (*gen_msa_3r_b)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32),
+                         void (*gen_msa_3r_h)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32),
+                         void (*gen_msa_3r_w)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32),
+                         void (*gen_msa_3r_d)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 twt = tcg_const_i32(a->wt);
+
+    switch (a->df) {
+    case DF_BYTE:
+        if (gen_msa_3r_b == NULL) {
+            gen_reserved_instruction(ctx);
+        } else {
+            gen_msa_3r_b(cpu_env, twd, tws, twt);
+        }
+        break;
+    case DF_HALF:
+        gen_msa_3r_h(cpu_env, twd, tws, twt);
+        break;
+    case DF_WORD:
+        gen_msa_3r_w(cpu_env, twd, tws, twt);
+        break;
+    case DF_DOUBLE:
+        gen_msa_3r_d(cpu_env, twd, tws, twt);
+        break;
+    }
+
+    tcg_temp_free_i32(twt);
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twd);
+
+    return true;
+}
+
+TRANS_DF_B(DOTP_S,      trans_msa_3r,    gen_helper_msa_dotp_s);
+TRANS_DF_B(DOTP_U,      trans_msa_3r,    gen_helper_msa_dotp_u);
+TRANS_DF_B(DPADD_S,     trans_msa_3r,    gen_helper_msa_dpadd_s);
+TRANS_DF_B(DPADD_U,     trans_msa_3r,    gen_helper_msa_dpadd_u);
+TRANS_DF_B(DPSUB_S,     trans_msa_3r,    gen_helper_msa_dpsub_s);
+TRANS_DF_B(DPSUB_U,     trans_msa_3r,    gen_helper_msa_dpsub_u);
+
 TRANS_MSA(SLD,          trans_msa_3r_df, gen_helper_msa_sld_df);
 TRANS_MSA(SPLAT,        trans_msa_3r_df, gen_helper_msa_splat_df);
 
 TRANS_MSA(VSHF,         trans_msa_3r_df, gen_helper_msa_vshf_df);
+TRANS_DF_B(HADD_S,      trans_msa_3r,    gen_helper_msa_hadd_s);
+TRANS_DF_B(HADD_U,      trans_msa_3r,    gen_helper_msa_hadd_u);
+TRANS_DF_B(HSUB_S,      trans_msa_3r,    gen_helper_msa_hsub_s);
+TRANS_DF_B(HSUB_U,      trans_msa_3r,    gen_helper_msa_hsub_u);
 
 static void gen_msa_3r(DisasContext *ctx)
 {
@@ -1303,154 +1348,6 @@ static void gen_msa_3r(DisasContext *ctx)
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


