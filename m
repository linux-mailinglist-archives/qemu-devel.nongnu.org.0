Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF843D16A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:08:45 +0200 (CEST)
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoI0-0002uX-W4
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMr-0006Al-Fi
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMn-0004qY-Cq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d3so5593021wrh.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnJ7lxQHoEU7HEUczsJI2BkznSNicr9VZoz+wFH7RLw=;
 b=Kb0nPQryKUJVuhlWfWsigJwFLa0HfN0aWNIcQ8P7t8SB+Eeo+pwEDXARw9IrkZ0pQE
 ATcFog+9WMjSvLRwpwp8sAMJD78pzOz8n9Jk6mXt1u1v5vDhaWRUghQlGx/rBT1JDRjp
 xVcOmOCcGEMvQcF6aj2MqCLcQu1wqyXUueLp7urPmMX2yRBf944yKoXUCU4FJgXJP8CY
 FOXXXZ+6F7e1PzcGpn4i+WrhvI+qc++las0YnI/VD8OBCkZY8AQgbthrt985SF87HDtx
 uFddRhWYuF6eResi1G+nAc7rx8WRVzL4bilayD+7CopKCNQhBfxtJn/DbC6AjfB9sb/U
 i/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tnJ7lxQHoEU7HEUczsJI2BkznSNicr9VZoz+wFH7RLw=;
 b=DOCq9/QgMQT9CQRfKxAhxmWvOCZ0R9fc704vIo0VU6cR+7nxxOGXkrEqr5P/xzl5c6
 x8DCp6s+Q+DMMY2rwTzCLsF4M0xuekaaG+TnEipIQ7hKZQVwwY7hx/xUMq//YKIYn0ek
 uYMse2QO9f9zrFXOQzZa7JMYfi07lgIeMswPeJBUkgh0s48l9USLqgzIM9gQ9PkmxXiK
 vFcH7EQN5pW3GGPy34tFWEyaVHnywvw6/RhoCa+cAW+cl6EludtVdUnbJTmJKwij1z5N
 EVkHPPXVGBx3YgMA+7UMtMq37zn3p/cBbn+Xolzebwa0o48KTbT4mpB5+0EkE5aGD0HY
 +qTA==
X-Gm-Message-State: AOAM5304EqmiAvVxB99qKiwhvweb4XPylmUAz0AF55lbE+w2po0wif/+
 nxxe5kvr5OxwY5m8DXDhaV2/+nzhi+4=
X-Google-Smtp-Source: ABdhPJwFGOkm5+ifULVK3JgR1gxsiLLzVB0hWe73DmCer43xP3J6Xg/8pxLWOCRaUYedYroMzaqNAA==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr24204307wrz.284.1635358174156; 
 Wed, 27 Oct 2021 11:09:34 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y8sm580611wrq.77.2021.10.27.11.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/32] target/mips: Convert MSA COPY_S and INSERT opcodes
 to decodetree
Date: Wed, 27 Oct 2021 20:07:24 +0200
Message-Id: <20211027180730.1551932-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index 4e1d3caadc5..7c309526444 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -165,7 +165,9 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
+  INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index a2d7bbe912f..2ed637f16da 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -36,9 +36,7 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -604,98 +602,31 @@ static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
     return trans_msa_elm_d64(ctx, a, gen_msa_copy_u);
 }
 
-static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
+static bool trans_COPY_S(DisasContext *ctx, arg_msa_elm_df *a)
 {
-#define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    static gen_helper_piii * const gen_msa_copy_s[4] = {
+        gen_helper_msa_copy_s_b, gen_helper_msa_copy_s_h,
+        gen_helper_msa_copy_s_w, NULL_IF_TARGET_MIPS32(gen_helper_msa_copy_s_d)
+    };
 
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tn  = tcg_const_i32(n);
+    return trans_msa_elm_d64(ctx, a, gen_msa_copy_s);
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
+        gen_helper_msa_insert_w, NULL_IF_TARGET_MIPS32(gen_helper_msa_insert_d)
+    };
+
+    return trans_msa_elm_d64(ctx, a, gen_msa_insert);
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
@@ -703,8 +634,6 @@ static void gen_msa_elm(DisasContext *ctx)
         gen_reserved_instruction(ctx);
         return;
     }
-
-    gen_msa_elm_df(ctx, df, n);
 }
 
 static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
-- 
2.31.1


