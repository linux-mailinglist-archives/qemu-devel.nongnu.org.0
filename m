Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4582EE98E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:04:50 +0100 (CET)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeKn-0006Oo-OI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdl3-00058P-AU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:53 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdl1-0006We-OA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:53 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y23so6842035wmi.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBRHf7wGs+dAQiqYFO87nWhgnylXmMhIKDrVpD+hV3A=;
 b=TfT4Z7pCtA5i/83DuHy+/X+0UCcP0xTOxo+I1mwEVwU+M20l6yIhDRkCEtsgku1mxg
 OTOHuJ1CSA2oI5iR4UItCm9Zq98N5ObcfAq/NeHOYHG1iOPXOhuR7aZONkGGyD/CWJCx
 lx/G28pauWvxempWaqg+vHX4fU7vMVobraeTcTA64+Fq+SYhp5da6zTmspmNxODUKM/h
 RCiuhDKko1A8a91re0MyhOerfAAILo67RVVXiKlLuRAJMGHfDk9EADcdIOAIhItLWj8v
 fTbieEJaxsTqcBHjhHiy33o+dIC1vo2Gk/hWylF01ybzxMyb16EvMw8lN/2NC59kiA0Z
 hriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YBRHf7wGs+dAQiqYFO87nWhgnylXmMhIKDrVpD+hV3A=;
 b=GBK2fUfHD81ONTzzLiJ0QuOIptBiPgdFhejy8aaN4YZlc1oc/G4rA+vQaLIWU5o7Ko
 ysOea14THJriNP8hyrPaCLZLEEOFTHjVvaqKbTNcCLMiH5eWQUyprSbYSLYCZlO+OsiS
 3FdHQX9+3+Majt8j0ELX1E+mFAtNSrJS02Y1OOEbvYLn+6kv8rRekYUFGr5/LuthLWdw
 cMWSFeOrsPAj0FY6RWtLVifMCHfmc7QCbVffDrRiXPKWE4HaklWzmMjOH+NQEhP9if1i
 tbJ2GsnTbZXcZ9cys33fd0suHzAWmKKNyJoBAmqTwDd35oMlXyvOQTnusaM20pjUmbl0
 SJSw==
X-Gm-Message-State: AOAM533EXqNFT5w96SSaRChsCjJffV8vIl93wueSaUEndlduuIF1B4pb
 Qp3vpWCWT6LL/NCF/+4Pq5fRmXEJQSI=
X-Google-Smtp-Source: ABdhPJy7oJ7BB8Xzb76xkAfOU8XnrPlDmrZ+GsFRHxXmMlUkKT7gC+Vy/DlK/QSONpgwK84Dr/EfGg==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr495077wmf.95.1610058470286;
 Thu, 07 Jan 2021 14:27:50 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id q15sm9908485wrw.75.2021.01.07.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/66] target/mips: Remove now unreachable LSA/DLSA opcodes code
Date: Thu,  7 Jan 2021 23:22:44 +0100
Message-Id: <20210107222253.20382-58-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we switched to decodetree-generated processing,
we can remove this now unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-6-f4bug@amsat.org>
---
 target/mips/translate.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cd34b06faae..f4481afb8de 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -280,9 +280,6 @@ enum {
     R6_OPC_DCLZ     = 0x12 | OPC_SPECIAL,
     R6_OPC_DCLO     = 0x13 | OPC_SPECIAL,
     R6_OPC_SDBBP    = 0x0e | OPC_SPECIAL,
-
-    OPC_LSA  = 0x05 | OPC_SPECIAL,
-    OPC_DLSA = 0x15 | OPC_SPECIAL,
 };
 
 /* Multiplication variants of the vr54xx. */
@@ -24319,9 +24316,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
-    case OPC_LSA:
-        gen_LSA(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
-        break;
     case OPC_MULT:
     case OPC_MULTU:
     case OPC_DIV:
@@ -24372,10 +24366,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DLSA:
-        check_mips_64(ctx);
-        gen_DLSA(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
-        break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
         if (rt == 0 && sa == 1) {
@@ -24637,18 +24627,14 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         check_insn(ctx, ISA_MIPS2);
         gen_trap(ctx, op1, rs, rt, -1);
         break;
-    case OPC_LSA: /* OPC_PMON */
-        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        } else {
-            /* Pmon entry point, also R4010 selsl */
+    case OPC_PMON:
+        /* Pmon entry point, also R4010 selsl */
 #ifdef MIPS_STRICT_STANDARD
-            MIPS_INVAL("PMON / selsl");
-            gen_reserved_instruction(ctx);
+        MIPS_INVAL("PMON / selsl");
+        gen_reserved_instruction(ctx);
 #else
-            gen_helper_0e0i(pmon, sa);
+        gen_helper_0e0i(pmon, sa);
 #endif
-        }
         break;
     case OPC_SYSCALL:
         generate_exception_end(ctx, EXCP_SYSCALL);
@@ -24739,11 +24725,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
-    case OPC_DLSA:
-        if ((ctx->insn_flags & ISA_MIPS_R6) || ase_msa_available(env)) {
-            decode_opc_special_r6(env, ctx);
-        }
-        break;
 #endif
     default:
         if (ctx->insn_flags & ISA_MIPS_R6) {
-- 
2.26.2


