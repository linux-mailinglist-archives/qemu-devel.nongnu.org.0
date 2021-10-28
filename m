Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734443F216
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:54:32 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDLz-0003yl-90
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfo-0000zR-PR
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfm-0007Hl-Ns
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id b12so8029930wrh.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1u16jqp/grWHf6l/aKv3M1I8IsSO7Ogfjdh+VwPxkA8=;
 b=BZwa5faZH+sAl9Ps2VayAKVXwQPY7mkrJpOxhSifo8KUWG/WDKO8hvAQPjvAJN0gRq
 6A9nOxMrZEjSuZrurzOzYoQj7ShCIqhPmw72MmmaetFMughKTlqFTKf9kYaCmmrtYKny
 wbkijj3DiPmTUXiwW0oQcjuEDKS+wrg4gEa7lXmn/I23dkKD3LKf8sXnop6Vsnp2bwpI
 HOAVax0Zu17nBumj/GCW7ZJLoQvIcW5gmVJ1s+jHZsrXYZ5zEbmFiDjKRhr5OygiWOBT
 vIdXPbDdcUbr6v/7lKXo74EMaxG4Ao6dAi4LLs0FeA8iKFGaTr27zHdJgxB87GtuV1Z1
 XzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1u16jqp/grWHf6l/aKv3M1I8IsSO7Ogfjdh+VwPxkA8=;
 b=k93O3Xscz/Hx8Pwh8xDz4UG0q+bWNVeYRj/RZG22CbYYQ/kexfzOMN0GM+JCO/P4cB
 6OnVlkxuyJK5IXgzBqgIlbOp73J6wLXFYvB+PAvrWqXV1chyVUMN0XIRRKjXByTVEDJk
 Cx4u0a9cGplwB1pAdZXDSuhhqsfcok6sWELUeF5imffXRjvPdhqufjs2ZngBFauC7KLx
 hyWKlqXXMtit7j/eBYmNv9OXS1Ck5VcW1JCn2o0zK6ZwrXx3oSL8gmGULpRfOgKpKW6J
 ewmXqvz+ggcEGRQ8BPI9eYoWtShBNPUHVpt0qsnPdLlBXlMXj6xQ6b/YAgVLzvyhU0dU
 sEnA==
X-Gm-Message-State: AOAM533DN77Ecb4WwqistUz7ShM7X7+Enn5LIvVOR51jak7zPAq/oPTl
 AFWuNEsFKHKP/6BeNgGFtN9VhDpchh8=
X-Google-Smtp-Source: ABdhPJzvVT5IJRU06Xz6oJ1jcS5mMCy2HKXLZJntkMkm2XpiBYpzxEy7+s3fBap+8rIWWAS0JpJuaA==
X-Received: by 2002:adf:fd11:: with SMTP id e17mr8720353wrr.74.1635455453207; 
 Thu, 28 Oct 2021 14:10:53 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l5sm4025724wru.24.2021.10.28.14.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/32] target/mips: Convert MSA COPY_S and INSERT opcodes
 to decodetree
Date: Thu, 28 Oct 2021 23:08:37 +0200
Message-Id: <20211028210843.2120802-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the COPY_S (Element Copy to GPR Signed) opcode
and INSERT (GPR Insert Element) opcode to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |   2 +
 target/mips/tcg/msa_translate.c | 103 +++++---------------------------
 2 files changed, 18 insertions(+), 87 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 0e166a4e61d..9aac6808fc5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -167,7 +167,9 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
+  INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index eca38557769..e10dd5e6ef8 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -46,9 +46,7 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -629,98 +627,31 @@ static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
     return trans_msa_elm_fn(ctx, a, gen_msa_copy_u);
 }
 
-static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
+static bool trans_COPY_S(DisasContext *ctx, arg_msa_elm_df *a)
 {
-#define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    static gen_helper_piii * const gen_msa_copy_s[4] = {
+        gen_helper_msa_copy_s_b, gen_helper_msa_copy_s_h,
+        gen_helper_msa_copy_s_w, NULL_IF_MIPS32(gen_helper_msa_copy_s_d)
+    };
 
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tn  = tcg_const_i32(n);
+    return trans_msa_elm_fn(ctx, a, gen_msa_copy_s);
+}
 
-    switch (MASK_MSA_ELM(ctx->opcode)) {
-    case OPC_COPY_S_df:
-    case OPC_INSERT_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        switch (MASK_MSA_ELM(ctx->opcode)) {
-        case OPC_COPY_S_df:
-            if (likely(wd != 0)) {
-                switch (df) {
-                case DF_BYTE:
-                    gen_helper_msa_copy_s_b(cpu_env, twd, tws, tn);
-                    break;
-                case DF_HALF:
-                    gen_helper_msa_copy_s_h(cpu_env, twd, tws, tn);
-                    break;
-                case DF_WORD:
-                    gen_helper_msa_copy_s_w(cpu_env, twd, tws, tn);
-                    break;
-#if defined(TARGET_MIPS64)
-                case DF_DOUBLE:
-                    gen_helper_msa_copy_s_d(cpu_env, twd, tws, tn);
-                    break;
-#endif
-                default:
-                    assert(0);
-                }
-            }
-            break;
-        case OPC_INSERT_df:
-            switch (df) {
-            case DF_BYTE:
-                gen_helper_msa_insert_b(cpu_env, twd, tws, tn);
-                break;
-            case DF_HALF:
-                gen_helper_msa_insert_h(cpu_env, twd, tws, tn);
-                break;
-            case DF_WORD:
-                gen_helper_msa_insert_w(cpu_env, twd, tws, tn);
-                break;
-#if defined(TARGET_MIPS64)
-            case DF_DOUBLE:
-                gen_helper_msa_insert_d(cpu_env, twd, tws, tn);
-                break;
-#endif
-            default:
-                assert(0);
-            }
-            break;
-        }
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-    }
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(tn);
+static bool trans_INSERT(DisasContext *ctx, arg_msa_elm_df *a)
+{
+    static gen_helper_piii * const gen_msa_insert[4] = {
+        gen_helper_msa_insert_b, gen_helper_msa_insert_h,
+        gen_helper_msa_insert_w, NULL_IF_MIPS32(gen_helper_msa_insert_d)
+    };
+
+    return trans_msa_elm_fn(ctx, a, gen_msa_insert);
 }
 
 static void gen_msa_elm(DisasContext *ctx)
 {
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-    uint32_t df = 0, n = 0;
 
-    if ((dfn & 0x30) == 0x00) {
-        n = dfn & 0x0f;
-        df = DF_BYTE;
-    } else if ((dfn & 0x38) == 0x20) {
-        n = dfn & 0x07;
-        df = DF_HALF;
-    } else if ((dfn & 0x3c) == 0x30) {
-        n = dfn & 0x03;
-        df = DF_WORD;
-    } else if ((dfn & 0x3e) == 0x38) {
-        n = dfn & 0x01;
-        df = DF_DOUBLE;
-    } else if (dfn == 0x3E) {
+    if (dfn == 0x3E) {
         /* CTCMSA, CFCMSA, MOVE.V */
         gen_msa_elm_3e(ctx);
         return;
@@ -728,8 +659,6 @@ static void gen_msa_elm(DisasContext *ctx)
         gen_reserved_instruction(ctx);
         return;
     }
-
-    gen_msa_elm_df(ctx, df, n);
 }
 
 TRANS(FCAF,     trans_msa_3rf, gen_helper_msa_fcaf_df);
-- 
2.31.1


