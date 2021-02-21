Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA0320B01
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:42:25 +0100 (CET)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpwG-0005eR-JW
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppN-0006It-Og
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppM-0002Yg-0V
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:17 -0500
Received: by mail-wm1-x333.google.com with SMTP id l13so2516252wmg.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQuLPLB77gZv1TslkqbImF1RKczoOzqyp5dpx+bERaM=;
 b=DOjfbkJJrIA/aBmmkSMNqv6kxCXvTDfmYroKMSIGk3Mf2fxYcwP8ajVKmJFw6LRvWW
 FnY5tCYE4d8kdKOs1qlHH8oTvHA/f3/GBVTszNzmkKYa7s1lK10OepaDPvo1fZ2PGqwv
 tw057k0UOAqvD3CB33WmIvc37je69G4eAjAQo+ZjSBabYK+DvLagB6iSgCuantc9+Xit
 gDExgaVDkMIeklvD3iyMy/xpk5Iv6sC962WHZxmWgLnjW3CN+p3VgGHoT9LFnHLg0hNi
 VXK/ws3vZWba1MyZ2xzdQUp1TuJjFFj0xEJ9t5IQRV6DYhg17LXTar0835f/6lBvAbX3
 MchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EQuLPLB77gZv1TslkqbImF1RKczoOzqyp5dpx+bERaM=;
 b=YEYTE/Ucs40/YOCSPy7vcKNuJ41/jH8lh0whTjlFfRAn69VgvE/XYCMOWmMJb2EOgQ
 Dlv2gwu7HbjxC2N5N0rJBk2oHmQTherEYsDlVF+PHQ71BFNLqlWKZVynHEu5qu9PGIKo
 ppx0UniIRrEPclLKb9EyoHOTGx8oymlGllIb85NnqOGQ4q5nhN9lrmXpQyjjPZFmuX6h
 AgkDGsxA5inc4Pn9pBpvLp5lquh15utAXwTx5pGJYnvYRl04mTgXR1o5WqKj2DOEOYL8
 2EBTjXqECq8uv7mqm8vawF2LRxpg8aAesGuQ9l71KPamSXhxOD42VjQGdEL0psqvkShI
 oOYw==
X-Gm-Message-State: AOAM533/9UjCOnmNTY3+EUKKIlg2q+4AVpk54crYBuUWflmoCnAyY5Ss
 BU06UgDXuVt1SYtDpNZeHAO8619G9uQ=
X-Google-Smtp-Source: ABdhPJzic8LozV321AXCHc/j5v7RfZ1nrGUsZz4yTwK1dhEy9FDaLy5cej+FqjinR9249MQrj+f8PQ==
X-Received: by 2002:a7b:cd0d:: with SMTP id f13mr1956200wmj.74.1613918114401; 
 Sun, 21 Feb 2021 06:35:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm27293866wro.15.2021.02.21.06.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/43] target/mips: fetch code with translator_ld
Date: Sun, 21 Feb 2021 15:33:57 +0100
Message-Id: <20210221143432.2468220-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commits ae82adc8e29..7f93879e444, use the
translator_ld*() API introduced in commit 409c1a0bf0f
to fetch the code on the MIPS target.

Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210125105818.2707067-1-f4bug@amsat.org>
---
 target/mips/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5cf1742a8b..a6e835809aa 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -26,7 +26,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "hw/semihosting/semihost.h"
@@ -13911,7 +13911,7 @@ static void decode_i64_mips16(DisasContext *ctx,
 
 static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
 {
-    int extend = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    int extend = translator_lduw(env, ctx->base.pc_next + 2);
     int op, rx, ry, funct, sa;
     int16_t imm, offset;
 
@@ -14161,7 +14161,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         /* No delay slot, so just process as a normal instruction */
         break;
     case M16_OPC_JAL:
-        offset = cpu_lduw_code(env, ctx->base.pc_next + 2);
+        offset = translator_lduw(env, ctx->base.pc_next + 2);
         offset = (((ctx->opcode & 0x1f) << 21)
                   | ((ctx->opcode >> 5) & 0x1f) << 16
                   | offset) << 2;
@@ -16295,7 +16295,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
     uint32_t op, minor, minor2, mips32_op;
     uint32_t cond, fmt, cc;
 
-    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = (ctx->opcode >> 21) & 0x1f;
@@ -21350,7 +21350,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
     int offset;
     int imm;
 
-    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = extract32(ctx->opcode, 21, 5);
@@ -21469,7 +21469,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_P48I:
         {
-            insn = cpu_lduw_code(env, ctx->base.pc_next + 4);
+            insn = translator_lduw(env, ctx->base.pc_next + 4);
             target_long addr_off = extract32(ctx->opcode, 0, 16) | insn << 16;
             switch (extract32(ctx->opcode, 16, 5)) {
             case NM_LI48:
@@ -29087,17 +29087,17 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
     if (ctx->insn_flags & ISA_NANOMIPS32) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_nanomips_opc(env, ctx);
     } else if (!(ctx->hflags & MIPS_HFLAG_M16)) {
-        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_ldl(env, ctx->base.pc_next);
         insn_bytes = 4;
         decode_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MICROMIPS) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_micromips_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MIPS16) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_mips16_opc(env, ctx);
     } else {
         gen_reserved_instruction(ctx);
-- 
2.26.2


