Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9017C4385B9
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:09:29 +0200 (CEST)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePCi-0006WK-Mb
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuF-0007gz-9t
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuD-00065i-HM
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id d3so634461wrh.8
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDHiAkaJ1MayXxmzfFfuU1YwcKAXMhm8sLiXLX0b59w=;
 b=bZ1e+UBcAC7eng1B6TS6tCPYnCQzm929hgRmbOTFfnYHC5Bzjr2De+A+AsgGjgTbCL
 PBFuOjfFSl5Yq8oVSaWE9Sy5mLMm3GzXaSyK3G2a8D3O/7nchDI0ZJN1uNDqv9L6MK8U
 ZmWjZaj6vZQp+rjPtrE1umpFGqEOaUQRhKvPGf9JitidOSYh+5DEAlJeeALlDlM4XcES
 SqMlffCu5LTJ7IaXlHiO0wHW564phjTBhKz+YxWFVPLK7oLYvM6c/z9uk7Nc319nXO7H
 Y8W6am6+FCvVJRji75uVhdRW2B/agbFIV8sFquz7Mq7fHrabUQOHmVUtebHOrey0eQxg
 +Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qDHiAkaJ1MayXxmzfFfuU1YwcKAXMhm8sLiXLX0b59w=;
 b=5Dsz6Br0oFpBIotlTgpWOyiIVaFDt+YIA3YiY2BzznCYv4My9FbrBStkweU2LMMUsp
 o5ZyXmvTrt6yXsc6y/MEx0EttUEUgLtkGywyvIVrlv8PGbaWGI6UYGBc/zyk2uPKIszM
 pkGnPtLnr8+ujw/9fJjg2d+LBdMPYPM0IJ/9cgzrd5gACwDgG5uW5UcCzjz2YtnieUkF
 jyocQVxkGyNgoTNURGT/T6zrYOX/fhjKPW4ynU/1+srVL9r65cA2ye4PtVKpI5THlfO8
 vGk/ecQHJXNgwxzYVqrICSbmQV+vBd4Q8LgC2JhiWV3ZlhGV61QDAACYWInMyna1eAgz
 LDhA==
X-Gm-Message-State: AOAM533IqJB2TKk63c+3fokpYVrTRQIDSMxQwST5JMkE7BaooAnlUdxk
 uFpOgmm6Imtd2SWW9je+25/CmS8oBZk=
X-Google-Smtp-Source: ABdhPJxpj/9uEE2b9gny23sMxoBmadNo7ZQmtnzETbtQw53X6Fiad7p/JRLZd0HOTPQ58gtAk6RNYg==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr8046579wri.359.1635025819944; 
 Sat, 23 Oct 2021 14:50:19 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 126sm6044486wmz.28.2021.10.23.14.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/33] target/mips: Convert MSA COPY_U opcode to decodetree
Date: Sat, 23 Oct 2021 23:47:57 +0200
Message-Id: <20211023214803.522078-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
decodetree.

Since the 'n' field is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  1 +
 target/mips/tcg/msa_translate.c | 90 +++++++++++++++++++++++----------
 2 files changed, 65 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 0f1674cd318..80a06d12746 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -156,6 +156,7 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 95dcd4b5b06..e033b365fdd 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -33,7 +33,6 @@ enum {
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
@@ -139,6 +138,11 @@ static inline bool check_msa_access(DisasContext *ctx)
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
                     NULL, gen_func##_h, gen_func##_w, gen_func##_d)
 
+#define TRANS_DF_W64(NAME, trans_func, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
+                    DF_HALF, DF_WORD, \
+                    gen_func##_b, gen_func##_h, gen_func##_w, NULL)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -591,6 +595,65 @@ TRANS_MSA(SLDI,     trans_msa_elm_df, gen_helper_msa_sldi_df);
 TRANS_MSA(SPLATI,   trans_msa_elm_df, gen_helper_msa_splati_df);
 TRANS_MSA(INSVE,    trans_msa_elm_df, gen_helper_msa_insve_df);
 
+static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm *a,
+                              enum CPUMIPSMSADataFormat df_max32,
+                              enum CPUMIPSMSADataFormat df_max64,
+                              void (*gen_msa_elm_b)(TCGv_ptr, TCGv_i32,
+                                                    TCGv_i32, TCGv_i32),
+                              void (*gen_msa_elm_h)(TCGv_ptr, TCGv_i32,
+                                                    TCGv_i32, TCGv_i32),
+                              void (*gen_msa_elm_w)(TCGv_ptr, TCGv_i32,
+                                                    TCGv_i32, TCGv_i32),
+                              void (*gen_msa_elm_d)(TCGv_ptr, TCGv_i32,
+                                                    TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 twd;
+    TCGv_i32 tws;
+    TCGv_i32 tn;
+    uint32_t df, n;
+
+    if (!df_extract(df_elm, a->df, &df, &n)) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    if (df > (TARGET_LONG_BITS == 64 ? df_max64 : df_max32)) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
+    twd = tcg_const_i32(a->wd);
+    tws = tcg_const_i32(a->ws);
+    tn = tcg_constant_i32(n);
+
+    switch (a->df) {
+    case DF_BYTE:
+        gen_msa_elm_b(cpu_env, twd, tws, tn);
+        break;
+    case DF_HALF:
+        gen_msa_elm_h(cpu_env, twd, tws, tn);
+        break;
+    case DF_WORD:
+        gen_msa_elm_w(cpu_env, twd, tws, tn);
+        break;
+    case DF_DOUBLE:
+        g_assert_not_reached();
+        break;
+    }
+
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twd);
+
+    return true;
+}
+
+TRANS_DF_W64(COPY_U,    trans_msa_elm_d64, gen_helper_msa_copy_u);
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -603,7 +666,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
     case OPC_COPY_S_df:
-    case OPC_COPY_U_df:
     case OPC_INSERT_df:
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
@@ -611,11 +673,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
             gen_reserved_instruction(ctx);
             break;
         }
-        if ((MASK_MSA_ELM(ctx->opcode) == OPC_COPY_U_df) &&
-              (df == DF_WORD)) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
 #endif
         switch (MASK_MSA_ELM(ctx->opcode)) {
         case OPC_COPY_S_df:
@@ -634,25 +691,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
                 case DF_DOUBLE:
                     gen_helper_msa_copy_s_d(cpu_env, twd, tws, tn);
                     break;
-#endif
-                default:
-                    assert(0);
-                }
-            }
-            break;
-        case OPC_COPY_U_df:
-            if (likely(wd != 0)) {
-                switch (df) {
-                case DF_BYTE:
-                    gen_helper_msa_copy_u_b(cpu_env, twd, tws, tn);
-                    break;
-                case DF_HALF:
-                    gen_helper_msa_copy_u_h(cpu_env, twd, tws, tn);
-                    break;
-#if defined(TARGET_MIPS64)
-                case DF_WORD:
-                    gen_helper_msa_copy_u_w(cpu_env, twd, tws, tn);
-                    break;
 #endif
                 default:
                     assert(0);
-- 
2.31.1


