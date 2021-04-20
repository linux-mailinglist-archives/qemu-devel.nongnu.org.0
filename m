Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4136605E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:42:27 +0200 (CEST)
Received: from localhost ([::1]:54756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwGQ-000790-VB
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9d-0002ek-E9
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9b-00028E-TR
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e7so29926428wrs.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4PT5Y6ov+2VF6b9NVW6HMDZLzrmuqv0s6fxsfwWds0M=;
 b=te1x1VsaDHdYsoReH6cMGlN0FJqfawxBOSse8FozIpwViTCWIsV6uFSltHhWr3kIld
 mEWCh97+HDig0YWrORnxEnuTAelZFOnldyC/ZENUCpOkpaxIN8X2toI7UotqMoHmRVuq
 AxMGFbdN5pP6o0bNClFiGvuhL7er2NdUOT3VRxDwutyaQb1BlYS3qxdfV/VpPQiIBkmv
 KnDnRmeYOS39827PMVBfdXp6i1tFf+DiPoM4H8xX2s5UFqs4wbRnGVM/R7wYtawh0KYn
 RKm04sOj7RWWqtd6rzBG2MwQVuHYATyxztgXIDxpJwulyd+GhK7Y4L2hYwaUeHSG649J
 iduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4PT5Y6ov+2VF6b9NVW6HMDZLzrmuqv0s6fxsfwWds0M=;
 b=T8vHCFSbMdzzmq2AEVnHu9rfQMGFxVZYqlh4E0x0wuQfq3XTswshjFH4d5TpNdCb4L
 cjImsZg7r6abVxelUmsIoVidFcXSUV+aWT3Yrm1Zx2kXT2RmIF0iD1nXKwBYplKOj3va
 /104A3vFrclDg4bdu8RGbn3i/VAKj0BwfY3OFt/ZyYPPPl+OV7erSR8a/6GFolHcV95g
 7wnNHcHGWJztBGNQNMJ75M2HsE0P9giUsprSJCmr2ODUNI2dbX8g1QmruiLwmGi3Utwa
 DDvGlaC6xaP5l6YjZfnOSQrpmphC9n0SyyXvvswDn5mVhf6SOw8fW+KBb8CCmPR2H6/8
 sjVQ==
X-Gm-Message-State: AOAM531bpMJAgJ3/cqI7EufHjjufkCvaQaZbdECygiqrBHg2HOvOhGsh
 C04suOIR5qND5PZ6P6TgGpEw7esRVNqRlg==
X-Google-Smtp-Source: ABdhPJxuE9V5fiIJa11MOKycx2t46NqSY7pv99tVLwmpG/pp/YTdiGaLq1VRxX48zGfmSKjVZztFMg==
X-Received: by 2002:adf:de08:: with SMTP id b8mr21935320wrm.279.1618947319361; 
 Tue, 20 Apr 2021 12:35:19 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s8sm28872403wrn.97.2021.04.20.12.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:35:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/5] target/mips: Restrict EVA opcodes to system emulation
Date: Tue, 20 Apr 2021 21:34:53 +0200
Message-Id: <20210420193453.1913810-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420193453.1913810-1-f4bug@amsat.org>
References: <20210420193453.1913810-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Enhanced Virtual Address (EVA) instructions are restricted
to Kernel execution mode, thus not available on user emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I'd rather not use such #ifdef'ry again.
TODO: have the compiler elide this code.

 target/mips/translate.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index dfa26569077..77115721a97 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -15245,8 +15245,11 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
     uint16_t insn;
     int rt, rs, rd, rr;
     int16_t imm;
-    uint32_t op, minor, minor2, mips32_op;
+    uint32_t op, minor, mips32_op;
     uint32_t cond, fmt, cc;
+#ifndef CONFIG_USER_ONLY
+    uint32_t minor2;
+#endif /* !CONFIG_USER_ONLY */
 
     insn = translator_lduw(env, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
@@ -16205,6 +16208,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_st_cond(ctx, rt, rs, offset, MO_TEQ, false);
             break;
 #endif
+#ifndef CONFIG_USER_ONLY
         case LD_EVA:
             if (!ctx->eva) {
                 MIPS_INVAL("pool32c ld-eva");
@@ -16294,6 +16298,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 goto do_st_lr;
             };
             break;
+#endif /* !CONFIG_USER_ONLY */
         case PREF:
             /* Treat as no-op */
             if ((ctx->insn_flags & ISA_MIPS_R6) && (rt >= 24)) {
@@ -24486,16 +24491,18 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
     uint32_t op1, op2;
-    int16_t imm;
 
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
     sa = (ctx->opcode >> 6) & 0x1f;
-    imm = sextract32(ctx->opcode, 7, 9);
 
     op1 = MASK_SPECIAL3(ctx->opcode);
 
+#ifndef CONFIG_USER_ONLY
+    int16_t imm;
+
+    imm = sextract32(ctx->opcode, 7, 9);
     /*
      * EVA loads and stores overlap Loongson 2E instructions decoded by
      * decode_opc_special3_legacy(), so be careful to allow their decoding when
@@ -24537,6 +24544,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             return;
         }
     }
+#endif /* !CONFIG_USER_ONLY */
 
     switch (op1) {
     case OPC_EXT:
-- 
2.26.3


