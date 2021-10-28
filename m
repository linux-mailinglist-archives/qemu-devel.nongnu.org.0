Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414E43F1F0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:38:07 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgD66-0002RI-E5
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCf3-0000bR-Dz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCez-00064U-CM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id d13so12446927wrf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECbu2OWYpxAy/Uu1aJZrUN/DIdS6s0KNCHcs2IG9E3g=;
 b=LWVolVLn1ebNFhBaN+fzSP1vEfqxjtaPbvGsEbsh/pB1zop+urN9+0WHlYZCEEGkfo
 C6RtlZUirsj4GEZzk7OIG9n/uYWkqw+GNL2fFm8YVDGkIltb7/kfvI6dxg85w/VjZqZL
 lpIyEOxFgswdpFn6X7Cpx8st+foyYYS2vT5eETAazx+iELvd5gf/+G5BZGpN0UFrSZMm
 3FPPV4TDzcJ4hY8ZGl0/50bsNY04cfokzcY0aJ/vsQCw9/RgNHZtlLedrGkouTyb4Jh/
 DHybvSz5AmnYQcbrGLbAgpKmhfFhbSRCupv4iH0g9V0ynyEGOtTmGhU+0qJhOqIctFf6
 IS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ECbu2OWYpxAy/Uu1aJZrUN/DIdS6s0KNCHcs2IG9E3g=;
 b=lsxIgZysejTg3oPb7XhFk1NVkBUCxkfkKnK8JW/hQwG8mgJbuSB5LzFsqrda6cXNgq
 r2aDiIxHVtBVVGK3z3EMoo+FY9VlMqLu0yMpVDHC/AG88+aJCSHm8Jcct54PycpS4SFm
 rymzfyvOa2RJjI3dPT/tYk34vvfn9fYj6mMrhXSUwEVPqGDBeQ/CIPeSjsADGX0VgICg
 m0B+fyByuAy7mUrHQ40HXd7FduaVLrFzJ0JGfd4Y+g5DjEgFCaARtA33p6uxjq7h/Cjw
 HiIqRVJcV+FruKKKyt0aYBo2QDB8qU3G/cSQc7t52TCHrlaZZscpmUub7gysZ9ri2Q2d
 IugQ==
X-Gm-Message-State: AOAM533/luXwE/C8DjsxVXVt0CzxnrQjNEGHqoCs2Z1eZGzzS4MGUgmp
 2VwBfGmEC1OvJTda4DFouxhDFt2tYN8=
X-Google-Smtp-Source: ABdhPJwOPuUdoMl4H7dtAm92vf7dwSltU0/pKn+fmxH+HLfNp7BQzvl1fd5uJEecxtsgQJYYnaActg==
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr8804435wrc.257.1635455403599; 
 Thu, 28 Oct 2021 14:10:03 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n8sm2998426wrp.95.2021.10.28.14.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/32] target/mips: Convert MSA 2R instruction format to
 decodetree
Date: Thu, 28 Oct 2021 23:08:27 +0200
Message-Id: <20211028210843.2120802-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

Convert 2-register operations to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211027180730.1551932-17-f4bug@amsat.org>
---
v3:
- Call check_msa_enabled in trans_X()
---
 target/mips/tcg/msa.decode      |  3 ++
 target/mips/tcg/msa_translate.c | 89 ++++++---------------------------
 2 files changed, 18 insertions(+), 74 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index bcbc573deec..b6ac80560f6 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -84,6 +84,9 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
   FILL              011110 11000000 .. ..... .....  011110  @2r
+  PCNT              011110 11000001 .. ..... .....  011110  @2r
+  NLOC              011110 11000010 .. ..... .....  011110  @2r
+  NLZC              011110 11000011 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1894d779196..f0077f7e54c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -58,13 +58,6 @@ enum {
     OPC_BMZ_V       = (0x05 << 21) | OPC_MSA_VEC,
     OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
 
-    OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
-
-    /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
-    OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
-    OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
-
     /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
     OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
     OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
@@ -298,6 +291,7 @@ static inline bool check_msa_enabled(DisasContext *ctx)
 }
 
 typedef void gen_helper_piv(TCGv_ptr, TCGv_i32, TCGv);
+typedef void gen_helper_pii(TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
@@ -310,6 +304,9 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_iv(NAME, trans_func, gen_func) \
     TRANS_DF_x(iv, NAME, trans_func, gen_func)
 
+#define TRANS_DF_ii(NAME, trans_func, gen_func) \
+    TRANS_DF_x(ii, NAME, trans_func, gen_func)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -1833,75 +1830,22 @@ static void gen_msa_3rf(DisasContext *ctx)
     tcg_temp_free_i32(twt);
 }
 
-static void gen_msa_2r(DisasContext *ctx)
+static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
+                         gen_helper_pii *gen_msa_2r)
 {
-#define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
-                            (op & (0x7 << 18)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    uint8_t df = (ctx->opcode >> 16) & 0x3;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-
-    switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_NLOC_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_nloc_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_nloc_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_nloc_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_nloc_d(cpu_env, twd, tws);
-            break;
-        }
-        break;
-    case OPC_NLZC_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_nlzc_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_nlzc_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_nlzc_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_nlzc_d(cpu_env, twd, tws);
-            break;
-        }
-        break;
-    case OPC_PCNT_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_pcnt_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_pcnt_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_pcnt_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_pcnt_d(cpu_env, twd, tws);
-            break;
-        }
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
+    gen_msa_2r(cpu_env, tcg_constant_i32(a->wd), tcg_constant_i32(a->ws));
+
+    return true;
 }
 
+TRANS_DF_ii(PCNT, trans_msa_2r, gen_helper_msa_pcnt);
+TRANS_DF_ii(NLOC, trans_msa_2r, gen_helper_msa_nloc);
+TRANS_DF_ii(NLZC, trans_msa_2r, gen_helper_msa_nlzc);
+
 static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
 {
     if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
@@ -2008,9 +1952,6 @@ static void gen_msa_vec(DisasContext *ctx)
     case OPC_BSEL_V:
         gen_msa_vec_v(ctx);
         break;
-    case OPC_MSA_2R:
-        gen_msa_2r(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


