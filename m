Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B966344301B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:16:58 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuav-000250-Tt
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5z-0003Vy-Jm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5x-0006EZ-J9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d24so2823046wra.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FTos3rUD6fh/en8KLJV4G7L5LRqhFG+pDtfRWiJ4eE=;
 b=ctT36Ei1sKj8ERU9fl0kgbstOmU5U8rquWzVyy1s+u1GlKAv+7cC8ayTYYCGkC51vp
 Jm7TpQ0ZaSgLWZlNakEVoruIW8/+Y2hdqata0z5Jc/5zRfqmViVEsLIwQA5YyXSSiaj4
 Wt6Zmj5A7+fLjhnBnEZc3+Gr/DyN7WzQWCJNmIhMfxhC1sUskhqYWzwWXboECJ/htq2A
 ZNOprvibizMVStEtu9c9kG3p7M9S5KxZBgaK1pT5PWdYNSvuYE2mk/usaUNrD3Py3cYd
 E88vh6BBf67mKGiJ1SS4OF+uRKlbYLX+HFfL4IdT8r1ulYRtq3whKI2UY0a93W8K7IVO
 5Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+FTos3rUD6fh/en8KLJV4G7L5LRqhFG+pDtfRWiJ4eE=;
 b=ZpRdMqVf3lipJijCAcWi8PSaoP95O3VSjjMnDLK+fhG7JHMB5cVP8HD8KmJMbNKFxQ
 Y6g7aOYVLS92PBgUeXbYHKcHUYvm94bxyHtoET7vYVQxemlxhcSr4A9uslduXx99HV2D
 n2LzGeF8BWFMTUYydcHc3yrtXX4R4iMBwUSmTTFKz6XMAXF/7gCNustNb5v/sBelmOU8
 0WlHCBDYWceuuCe0hd2XnnPNp8f5wbLbNMJmZoUZG35QDGKP9byNLxANCb12+3A+enVL
 98GjttrC/QVA/bT1ckL/yUt52EtMLKSD7h/nM+GXVU3tWBrQpIjAjiv8iSSvuKk5Qqy3
 LdKQ==
X-Gm-Message-State: AOAM532F/K92kfhToCZz3bFKga5GuOPjn+fdbJDFKOHZsZ6WPvwBAorl
 afyDKB3lPNPuLCfNvfLEm6k9ZQwy3eo=
X-Google-Smtp-Source: ABdhPJxYZ4rbaHcILzyWlE9KPQBwWGWiRKoO2wyI8Bh+kB5SFzpBeW1pnZlg6mZzO2YIMXHeq7hQhg==
X-Received: by 2002:adf:a143:: with SMTP id r3mr47198040wrr.8.1635860696069;
 Tue, 02 Nov 2021 06:44:56 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o1sm9829205wrn.63.2021.11.02.06.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/41] target/mips: Convert MSA COPY_U opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:27 +0100
Message-Id: <20211102134240.3036524-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
decodetree.

Since the 'n' field is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211028210843.2120802-26-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  1 +
 target/mips/tcg/msa_translate.c | 66 ++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index bf014524eed..0e166a4e61d 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -167,6 +167,7 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 14e0a8879c4..4c560aa1e16 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -48,7 +48,6 @@ enum {
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
@@ -592,6 +591,46 @@ TRANS(SLDI,   trans_msa_elm, gen_helper_msa_sldi_df);
 TRANS(SPLATI, trans_msa_elm, gen_helper_msa_splati_df);
 TRANS(INSVE,  trans_msa_elm, gen_helper_msa_insve_df);
 
+static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
+                             gen_helper_piii * const gen_msa_elm[4])
+{
+    if (a->df < 0 || !gen_msa_elm[a->df]) {
+        return false;
+    }
+
+    if (check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
+    gen_msa_elm[a->df](cpu_env,
+                       tcg_constant_i32(a->wd),
+                       tcg_constant_i32(a->ws),
+                       tcg_constant_i32(a->n));
+
+    return true;
+}
+
+#if defined(TARGET_MIPS64)
+#define NULL_IF_MIPS32(function) function
+#else
+#define NULL_IF_MIPS32(function) NULL
+#endif
+
+static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
+{
+    static gen_helper_piii * const gen_msa_copy_u[4] = {
+        gen_helper_msa_copy_u_b, gen_helper_msa_copy_u_h,
+        NULL_IF_MIPS32(gen_helper_msa_copy_u_w), NULL
+    };
+
+    return trans_msa_elm_fn(ctx, a, gen_msa_copy_u);
+}
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -604,7 +643,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
     case OPC_COPY_S_df:
-    case OPC_COPY_U_df:
     case OPC_INSERT_df:
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
@@ -612,11 +650,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
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
@@ -635,25 +668,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
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


