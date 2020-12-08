Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981C2D3578
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:42:03 +0100 (CET)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkkE-0001FC-G8
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkT-0004ng-LW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:13 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkR-0008QM-6B
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:12 -0500
Received: by mail-ej1-x643.google.com with SMTP id a16so26546774ejj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RX7vZR6NmEoSxmyjaPaQ8kLGatYp3mbCez7jAhGtSPk=;
 b=KrhVvzw5GZmr0NvJdaGuhbYl5CwAwoFnxe3iFmxw1EDRZdR7neubAUypRhFvgCjHTT
 0rJN8hFmk4OTBNmYDrf0Ll3OIOspPvWreAOZzOiSOf5D5y477QOvMv/ShjTylQb6/QkT
 xAprVbJ4yEy5N86cPboV3YA/AGfI2R2qluenL8PsyHbchWRSPfzwGAMILiywooNQYRBm
 vx5H2f2VE+r8zOd9QzoqvXTwimkO1U68HaMajSDJ0ywlCm0IqWmJ6mpFudZV993sQwGX
 o2QIOEPPKGZvX9/GaQY5QoBqkBsREdqw2Q1bfZ/8ar2hp3D03YBbbZ23ZjVoyJv8it9K
 UnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RX7vZR6NmEoSxmyjaPaQ8kLGatYp3mbCez7jAhGtSPk=;
 b=HMq+divLu56dovjY6opCpE8KN4qYwY98AB9cdWeAaQA8Z3NonSYVvQDlDQMt/3L1dJ
 FIi3UF4OntfqlUhyfkLMU+boBIl4qOBXXRGwwIRgCjjh/9qwP++ISSQ+WG8Ta7myxIUI
 tYoCTubTutUicyXobr5jFV4dgYnc4+BQSJJrMl0Mw5y+RSSQ7egVYVHJPgk/IufjdIht
 g8F4GK551Cy6hQ9s1M+QiotipNM2V079mp1FgJz9rTPfH4ss57Y9Dsx2heFQ5dh92xdO
 +zs6UyMdk+1Ef8PNvt2nTDbiJ7Ll+Rkx5pcX2/0Tq3D2q+HFDhE3Etjhrlvu4Fyiyp9v
 /Tlw==
X-Gm-Message-State: AOAM530FUSOTNU2SnBGNf7TNmto/X/x73vj7nWKG7i1r4LCWISVgWfnE
 DsmSqzd7BbPZIOMWRwgPHaaUTGmsP3E=
X-Google-Smtp-Source: ABdhPJxtteNaPyGqVvf7sPNrv9mnhdrN9AEXbFGZB/FfhVzYcDaDx8vuK6/lw689zkgQVbkxvJgmag==
X-Received: by 2002:a17:907:28d4:: with SMTP id
 en20mr25079744ejc.196.1607459889128; 
 Tue, 08 Dec 2020 12:38:09 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m7sm17411451eji.118.2020.12.08.12.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:38:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/13] target/mips: Convert Rel6 LLD/SCD opcodes to decodetree
Date: Tue,  8 Dec 2020 21:37:03 +0100
Message-Id: <20201208203704.243704-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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

LLD/SCD opcodes have been removed from the Release 6.
Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips64r6.decode | 3 +++
 target/mips/translate.c         | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/isa-mips64r6.decode b/target/mips/isa-mips64r6.decode
index 8c3fc5dae9c..609b8958d25 100644
--- a/target/mips/isa-mips64r6.decode
+++ b/target/mips/isa-mips64r6.decode
@@ -21,3 +21,6 @@ REMOVED             011010 ----- ----- ----------------     # LDL
 REMOVED             011011 ----- ----- ----------------     # LDR
 REMOVED             101100 ----- ----- ----------------     # SDL
 REMOVED             101101 ----- ----- ----------------     # SDR
+
+REMOVED             110100 ----- ----- ----------------     # LLD
+REMOVED             111100 ----- ----- ----------------     # SCD
diff --git a/target/mips/translate.c b/target/mips/translate.c
index aeba8efeb17..009301c9ceb 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28918,7 +28918,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         /* fall through */
     case OPC_LDL:
     case OPC_LDR:
@@ -28936,7 +28935,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         gen_st(ctx, op, rt, rs, imm);
         break;
     case OPC_SCD:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         check_insn(ctx, ISA_MIPS3);
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
-- 
2.26.2


