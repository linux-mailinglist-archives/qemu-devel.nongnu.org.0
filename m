Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B26731B1E3
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:20:43 +0100 (CET)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM0g-0003Ur-2w
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgw-0007Yu-4u
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgu-0004Jx-Gj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id n6so6081268wrv.8
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ctqh0opI3wSs6g5030R5tpAWxCcfc3trhfuQ734e1Oo=;
 b=psKzm07w/zS7J946H0mss95a1nqk4eZ1GZCf7d1xANT4vGCkhSU9Hl+m8XBwNqdJYu
 fBGOsIjFS+me66ElagUD0OsMHs/jMaFwkjqTiKi6IFDKnCYR7SgR+J4cd9f3dDoRANWt
 MSLWvP/DqVO94ZGiIE1C6ims3HKVPIEvJaXrynFvoimerQSpoa3HaOJRaAxYXF9AD4wE
 2MV7mKSWRfHnd4wpEBh6eLHA2PR7v8/Y/LWmVnGKrl9d7HjXKKXtv/xSmPGashKr5d+D
 zLRo+HZwKkNkWH2qVQHoC3rOhxkRJrzb0QHwnfeQau02eMFY19NK5AUucDXhblv2gnBC
 mnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ctqh0opI3wSs6g5030R5tpAWxCcfc3trhfuQ734e1Oo=;
 b=XJb9QSFEAbX31RdiFjj/tdEGrRwAipOWXCV88EUeKOtx43TBfclBI60vpHI6M/j5FI
 WK6gF4JPNj4S/7qd9U9mXzv4RkqOV6+iq56uiyh+kO6sx7BYlLc0p0skvxfhQDhS6YXX
 UOSP11I6c7+YsTmhrcAyV8HP//mYj+zuZ6c+twnPu0jT4kNTyaXqlCajL2BY5XLc++Pp
 qO0YUfYc4xu0saVssofEdeejskRu1jblZ43rmm3CErJSMs0Yv7tSxeUYRQWwrH4vbHSx
 5X2uY/enNXWY6REJ2/Aeh/ynVIWUdutATE9Wc5KIEszMRhgj6dXcr9Y29ChEHAIMNLJs
 VlXQ==
X-Gm-Message-State: AOAM532unq46aMLgrSIjrgJRBM7uPVdzS3YZ6KCodYAxbkPbmqDl9LnP
 3+k0ALJ84AoMa5eqtbJoLfMklWGCeMo=
X-Google-Smtp-Source: ABdhPJyg6sBGnQEqLmn0qq4Hlkiiho3KwA9GqAXPQ8fUS4phc/tM/BtAHaTlp4hKD6E0agveKMB9NA==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr14973825wrg.171.1613325614996; 
 Sun, 14 Feb 2021 10:00:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r124sm22213789wmr.16.2021.02.14.10.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/42] target/mips/tx79: Move PCPYLD / PCPYUD opcodes to
 decodetree
Date: Sun, 14 Feb 2021 18:58:42 +0100
Message-Id: <20210214175912.732946-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move PCPYLD (Parallel Copy Lower Doubleword) and PCPYUD
(Parallel Copy Upper Doubleword) to decodetree. Remove
unnecessary code / comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  6 +++
 target/mips/translate.c      | 84 ------------------------------------
 target/mips/tx79_translate.c | 46 ++++++++++++++++++++
 3 files changed, 52 insertions(+), 84 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 7af35458b0a..0f748b53a64 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,6 +17,7 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &rtype sa=0
 @rt_rd          ...... ..... rt:5  rd:5  ..... ......   &rtype rs=0 sa=0
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
@@ -28,6 +29,11 @@ MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
 
+# MMI2
+
+PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
+
 # MMI3
 
+PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/translate.c b/target/mips/translate.c
index b81a66ed373..cf5a6a83ae5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24733,84 +24733,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
  *                     PEXTUW
  */
 
-/*
- *  PCPYLD rd, rs, rt
- *
- *    Parallel Copy Lower Doubleword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |   rs    |   rt    |   rd    | PCPYLD  |    MMI2   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyld(DisasContext *ctx)
-{
-    uint32_t rs, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    rs = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (rd == 0) {
-        /* nop */
-    } else {
-        if (rs == 0) {
-            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-        } else {
-            tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr[rs]);
-        }
-        if (rt == 0) {
-            tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        } else {
-            if (rd != rt) {
-                tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr[rt]);
-            }
-        }
-    }
-}
-
-/*
- *  PCPYUD rd, rs, rt
- *
- *    Parallel Copy Upper Doubleword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |   rs    |   rt    |   rd    | PCPYUD  |    MMI3   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyud(DisasContext *ctx)
-{
-    uint32_t rs, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    rs = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (rd == 0) {
-        /* nop */
-    } else {
-        if (rs == 0) {
-            tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        } else {
-            tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr_hi[rs]);
-        }
-        if (rt == 0) {
-            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-        } else {
-            if (rd != rt) {
-                tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt]);
-            }
-        }
-    }
-}
-
 #endif
 
 
@@ -27859,9 +27781,6 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_2_PROT3W:    /* TODO: MMI_OPC_2_PROT3W */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI2 */
         break;
-    case MMI_OPC_2_PCPYLD:
-        gen_mmi_pcpyld(ctx);
-        break;
     default:
         MIPS_INVAL("TX79 MMI class MMI2");
         gen_reserved_instruction(ctx);
@@ -27887,9 +27806,6 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
-    case MMI_OPC_3_PCPYUD:
-        gen_mmi_pcpyud(ctx);
-        break;
     default:
         MIPS_INVAL("TX79 MMI class MMI3");
         gen_reserved_instruction(ctx);
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index d58b4fcd7b3..de09bb0d314 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -71,3 +71,49 @@ static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Copy Lower Doubleword */
+static bool trans_PCPYLD(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (a->rs == 0) {
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+    } else {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr[a->rs]);
+    }
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+    } else if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
+    }
+
+    return true;
+}
+
+/* Parallel Copy Upper Doubleword */
+static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (a->rs == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+    } else {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr_hi[a->rs]);
+    }
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+    } else if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt]);
+    }
+
+    return true;
+}
-- 
2.26.2


