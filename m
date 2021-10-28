Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1B43F205
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:44:52 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDCd-0007mg-Hg
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfj-0000yb-S7
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfh-0006su-SY
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id s13so5305183wrb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3WoFzcJuskRl91cx6kKYe1wu9HhEUBldCKR/nLtMSAA=;
 b=as+0xg7y0NTcf/4qbuk9p6qO6/qnhYdDBZl/J/Q7BPg5suz60VFzhRrkcuhP4jtlVt
 4K1PYN4837JUEgPk91DOUdvDrHoVkPQXvvUINkKzEHYhqINoAnhpK78wh8zEd6fCzJne
 FkC7mgwd89CiEeO/gapbu2ZU0is3xOH2c2WShOKJDO47UpEzgbzNE30JNFn1eaJRnMEg
 AeowLT/SjA9xBglpQ0EnVpkApxCCOjuWs+CxwaER8/ktVfZsDKFmHeRPAUkd6RaNowJe
 EN9wZ0kN1ZMo2fnLMMdsZt73Rb+AHBgfeDmk6yU6tsl4dXKpXiP/+m2bcxWPAzylUtum
 C/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3WoFzcJuskRl91cx6kKYe1wu9HhEUBldCKR/nLtMSAA=;
 b=BGHTIMHuW+aErcrQ5HGl9nruBDT1BwNfG23saQuliMoVWDiqMzOs2e7ukqZSEyQOWp
 Z1ipMe+dnc5K6JzqOogDWp/Vnxj4miMlkfuwP80m1fwcvItBiwLQjaLyYvHsyojksDsh
 l5AlXgxr8oMxa8spJFWqo0i9xKOc3HiCSKgRX2jo8cnt2CEyrbsKQVVLChzjtUC1XcWe
 mH+lMw+kJ4XAqwc7XcSQSlkfx4ov1ebYq/iB14yzZj1NLYLIr/hy+ZXeK2Cw6TQgzNXL
 nclwWr2JLg33BUSqPyLFBwroa54UNpJQD8qbZdSiqSSD5fboOF9e7qqLXeOhnWxetvWV
 CZRQ==
X-Gm-Message-State: AOAM5338JJEQtJCA1OkBvRBtwtBsuA54fJqF5Y16ibPaXTgasGpqA2Jq
 4WPeSOCLVjWssjDagK4VHm1ENNfPqD8=
X-Google-Smtp-Source: ABdhPJy6+sa64o86siDAj6EAZPAeX7n9uH4Hkvy6jy2oER1laCPIIL2hMlRZgXawfxq22Z5F3v7CTw==
X-Received: by 2002:a05:6000:18ce:: with SMTP id
 w14mr8905298wrq.230.1635455448266; 
 Thu, 28 Oct 2021 14:10:48 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m34sm2627378wms.25.2021.10.28.14.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/32] target/mips: Convert MSA COPY_U opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:36 +0200
Message-Id: <20211028210843.2120802-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
decodetree.

Since the 'n' field is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Add NULL_IF_TARGET_MIPS32() macro, use array of 4 functions
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
index af73b385019..eca38557769 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -48,7 +48,6 @@ enum {
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
@@ -590,6 +589,46 @@ TRANS(SLDI,   trans_msa_elm, gen_helper_msa_sldi_df);
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
@@ -602,7 +641,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
     case OPC_COPY_S_df:
-    case OPC_COPY_U_df:
     case OPC_INSERT_df:
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
@@ -610,11 +648,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
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
@@ -633,25 +666,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
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


