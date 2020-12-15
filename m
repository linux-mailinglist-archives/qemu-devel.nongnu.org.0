Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855A2DB6DC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:05:12 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJNX-0002kN-Dg
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGj-0002ht-8K
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:09 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGh-0003Xr-Pm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:09 -0500
Received: by mail-ej1-x641.google.com with SMTP id 6so15405972ejz.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBR/KP1XMbhrcgssotJd4G/2avIMrBZMV7G4WmoiWo8=;
 b=YrR0Z5DqkFBEJMEr1NVzef+bcwtTkoahx68HU/I9evKCqeSbblFgtzi4VwkRteuGlB
 alrA8YVrKnFX+Qmh04SBwbi4UktTCu8JTa5GIZoLuSqedrTqamgZjvge9k/ZMuj6RZv9
 0RmgIsSUZFdr60RFQPWxo20uMyRah+OAv4Hg0lBOEJrNCJXPTkVex4JsV7Td9l1UrgH8
 18sLjhIGG44a2+kwmIh29I3kxxH6eUDWLFp+NT3KAxoazrkdaDiEpHpw4+vvcikbRRB9
 Hpab1AIgsyW6ZGURc5Qrd31/2aT5JgQyU4ESaIVP0R1q+at+GxzUWO0g1NhFgG7SS0xd
 o/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eBR/KP1XMbhrcgssotJd4G/2avIMrBZMV7G4WmoiWo8=;
 b=XwddoDqWW2SWelDaFR3Ou/t2XHltKf/JY1dXwWILc6dlwOXuF0YZ+obNOquE0rcB+/
 /dyZn/yUddiz8TKAGovJOwSnYptVkTRICsQBSlCQvCpNxfs/jgdcYpEK+uxTOl/stdXl
 0dlYFQqXISh+0t5QZoGqfySolWbhJEY/MP5W7w4oeD1978fLxW+AIJSbo9b2JFOclWMI
 g6LrQnxz8D+LgwHC0GOEgZNYn5ntLTZF6R2w7QzT1tgWhWaOXhJECzILUqZIyuQI3DXk
 pZqcfvy5pg1Z/2pkVmlgqKZAfzmfZmKAJoOU1FOIFo65lB5ovjUfaj96anzzLTGEocb2
 uGTA==
X-Gm-Message-State: AOAM533099TkIoNJ9HQnls2dwJL4xnQPhYhQW1M4tpTEfSzPoCqPc+pa
 Bxvrg7jOzTZurIYIfex+Vwc=
X-Google-Smtp-Source: ABdhPJw8ylReeQsh/8yN74nzFbXTfd16F9/1BaCqotQgh4xKhIEOL+x+fifCJ+4D13ea5/hOaaDSYg==
X-Received: by 2002:a17:906:4a4f:: with SMTP id
 a15mr29198657ejv.541.1608073085939; 
 Tue, 15 Dec 2020 14:58:05 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o33sm19828818edd.50.2020.12.15.14.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/mips/translate: Extract decode_opc_legacy()
 from decode_opc()
Date: Tue, 15 Dec 2020 23:57:34 +0100
Message-Id: <20201215225757.764263-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we will slowly move to decodetree generated decoders,
extract the legacy decoding from decode_opc(), so new
decoders are added in decode_opc() while old code is
removed from decode_opc_legacy().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cc876019bf7..5c62b32c6ae 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -30518,30 +30518,13 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 
 }
 
-static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
+static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
     int32_t offset;
     int rs, rt, rd, sa;
     uint32_t op, op1;
     int16_t imm;
 
-    /* make sure instructions are on a word boundary */
-    if (ctx->base.pc_next & 0x3) {
-        env->CP0_BadVAddr = ctx->base.pc_next;
-        generate_exception_err(ctx, EXCP_AdEL, EXCP_INST_NOTAVAIL);
-        return;
-    }
-
-    /* Handle blikely not taken case */
-    if ((ctx->hflags & MIPS_HFLAG_BMASK_BASE) == MIPS_HFLAG_BL) {
-        TCGLabel *l1 = gen_new_label();
-
-        tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
-        tcg_gen_movi_i32(hflags, ctx->hflags & ~MIPS_HFLAG_BMASK);
-        gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
-        gen_set_label(l1);
-    }
-
     op = MASK_OP_MAJOR(ctx->opcode);
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
@@ -31269,8 +31252,32 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("major opcode");
+        return false;
+    }
+    return true;
+}
+
+static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
+{
+    /* make sure instructions are on a word boundary */
+    if (ctx->base.pc_next & 0x3) {
+        env->CP0_BadVAddr = ctx->base.pc_next;
+        generate_exception_err(ctx, EXCP_AdEL, EXCP_INST_NOTAVAIL);
+        return;
+    }
+
+    /* Handle blikely not taken case */
+    if ((ctx->hflags & MIPS_HFLAG_BMASK_BASE) == MIPS_HFLAG_BL) {
+        TCGLabel *l1 = gen_new_label();
+
+        tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
+        tcg_gen_movi_i32(hflags, ctx->hflags & ~MIPS_HFLAG_BMASK);
+        gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
+        gen_set_label(l1);
+    }
+
+    if (!decode_opc_legacy(env, ctx)) {
         gen_reserved_instruction(ctx);
-        break;
     }
 }
 
-- 
2.26.2


