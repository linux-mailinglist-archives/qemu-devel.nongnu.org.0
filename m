Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D717A3023FB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:59:20 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zaZ-0000rB-Vx
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3zZg-00008U-MC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:58:24 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3zZf-0002OW-3h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:58:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d2so11152503edz.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVLd9SEatVayGs/dkKOOi0UqvIE17Oocj65I1xB5+CU=;
 b=fZAYFE7gbjNMzz5EJBN9WdGDfPYo3KzSnyw9fOccinEMAtMF4eg6O7gbN2fvzdUYBB
 twu0wEs8Jl0VgApMvRYd/u5R9OGFmXUpaXzo/yuN+pm+7nyZhJnrl1yRcNNEQH7cfilY
 TVdiAYSotqtY8DyMaz5ybpS/dSVlJp8f2d7AKkMWySnrqoScH/652xuttGz3wZG3Layh
 BKG3l7F+C7bBPYDECzD2S77VtllWkjtLQsluvJFwsVBIa2QWB0teNQPksolSHcuR2VN4
 A9i5MhGZElK/zDTReVQz6DkYXDWMZKyADXVl3QbFTR28HZr/hqZoSI8FAr54hWKBrE1L
 6bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lVLd9SEatVayGs/dkKOOi0UqvIE17Oocj65I1xB5+CU=;
 b=BlXrGO5qY+mju7WuRzZaKmkmnJ5fJkmDzQuOMpnx/+paVlbEW4Dxs0m95PN0p12345
 Uew83nhuM493arxm7ciJU7apdXkq3Qq6b5ANCjcw/sjjsjdFT/ddhjmLy+nDD4dIzdQQ
 4AWqLm071jTOP7WEk6ieh4dpMPhQoYhAZ30y91yYRqrVu0eT7wx5p4KD3tC1wBVWWIdN
 tvvbb7XqWIprSyWtDqzjnZg3jKaf9AP//hHrRtbTSdIJmZZLMVyHhfsxHqXuczd3OPx4
 kHlZu0KHFx7n8eUVuml8tvDdQsE7Jh+StyzI1hS7gwvitNU0MnJjLBtxHz15PtmwynCZ
 ZSVA==
X-Gm-Message-State: AOAM532aCWfXFi3jhV7/ZtROGxu4QNvu+/AWqfU+/hu8AthIIiMyEOIR
 pigO6o1f4ciHNF7NZvEzQQ1iUMhXJbg=
X-Google-Smtp-Source: ABdhPJxBu3J6xw3MaUip2G5nDQ4BLLmkN9fE/x7KD/qqnfcscCN7gdmNZp33Tog63axi2NArfVH0HA==
X-Received: by 2002:aa7:d94b:: with SMTP id l11mr319039eds.1.1611572301209;
 Mon, 25 Jan 2021 02:58:21 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p16sm8171485ejz.103.2021.01.25.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 02:58:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips: fetch code with translator_ld
Date: Mon, 25 Jan 2021 11:58:18 +0100
Message-Id: <20210125105818.2707067-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commits ae82adc8e29..7f93879e444, use the
translator_ld*() API introduced in commit 409c1a0bf0f
to fetch the code on the MIPS target.

Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Restrict to translator path =)
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


