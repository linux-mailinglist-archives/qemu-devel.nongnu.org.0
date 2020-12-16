Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403D2DC470
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:40:36 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZqt-0007vG-GI
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZen-0004Ub-QE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZem-0007i8-7t
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so2948320wmz.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+8pzijn52zFNvnTsp0BOKURgiDqajyPik6Q5epzma8=;
 b=IUowv9fquZB8meq7j2d0fnFjKCx3YZ6dki/fzvSGYdeBvMCjYIObPkc2mkRFItLrZK
 D2yWdWQY2mqWzjqcJpk0qF8rBFPnimRysYFdFeqh5QKcmF/tO/Kdeo22dh/qQ7hmlPma
 p0woDnO3S3SKV8vysfetQN5P+R671X4yT4v767fDrwslp3u6de3jnYE3erk5TKSkKJ/K
 xapcLYWbmT7VXePsXMNJ8uKjFsvRHEMAYBPFETXkzMHMA/qbbTH+u7MSnLE/QUxmsHy8
 HBvejJi5XKHbfSnuwO9DXOGnOeHCWY5XVEvDA5M63tqUEnNmd1GaC6B4pxzevoXHQTWr
 KS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L+8pzijn52zFNvnTsp0BOKURgiDqajyPik6Q5epzma8=;
 b=UncPbs/Iw54IyKQIa4X72ugKbENL5NOaQBTZr+uyugMym+NQYzPnY7F66bai7CNb7S
 ldp8ue4HPpDKEXLNlN4seSWcYyuy9PMtp/n9y5iTnBp9EMYZdox9UTREjjWPZCO3yaJM
 0L2gwzlthe5uMsiGTto9HUqevfQTNToQFJNbn5MKYQEvc3BcgRo3CFFOFQHxwb/PI6Or
 qnqJpOqJqQDhrCbcYr2/c5XlrWUASqcAg5Oqh6Cx8/oOc0jw41mGgb3ZF4BYniIwx0xA
 vId/3W8COqB7VT7PS3W8zA6eI0Xn+qba8B/9gCUBqltpXruONC7IX4x0hPdQEjF/eEbL
 39aQ==
X-Gm-Message-State: AOAM530dClVztiTVV56tDq1/lEXvApFNEdKHaXcTrbYNvpLd/pVx0T5P
 FX4DrNhWN12ijzjDfqfLDRaOgnHrnyM=
X-Google-Smtp-Source: ABdhPJyV1NcWKH2yZzIX19z9Lx05aHxbOTWqSHDL17DZJLBQEBX0PS8z3Tp3CXtLrgCr28S69rcYGQ==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr3750460wma.141.1608136082253; 
 Wed, 16 Dec 2020 08:28:02 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c81sm3756241wmd.6.2020.12.16.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] target/mips/mips-defs: Use ISA_MIPS32 definition to
 check Release 1
Date: Wed, 16 Dec 2020 17:27:35 +0100
Message-Id: <20201216162744.895920-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32 definition to check if the Release 1
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R1 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h |  3 +--
 target/mips/translate.c | 10 +++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ab621a750d5..2756e72a9d6 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -24,7 +24,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64        0x0000000000000080ULL
 #define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
@@ -78,7 +77,7 @@
 
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
-#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
+#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 15265485f76..12b01d4c35d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -8538,7 +8538,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
     }
 
     switch (reg) {
@@ -9264,7 +9264,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -14502,12 +14502,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #if defined(TARGET_MIPS64)
             case RR_RY_CNVT_ZEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS32);
                 check_mips_64(ctx);
                 tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
             case RR_RY_CNVT_SEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS32);
                 check_mips_64(ctx);
                 tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
@@ -27203,7 +27203,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DCLO:
     case OPC_DCLZ:
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
         check_mips_64(ctx);
         gen_cl(ctx, op1, rd, rs);
         break;
-- 
2.26.2


