Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E62DC18C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:48:53 +0100 (CET)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXAi-0005Cx-12
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX65-0000ch-Ox
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5o-0005Ov-WF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id r7so23238440wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qkEnDMdHWRU31cSJg9p2IUmb01k7KNSi4LqckJbiYc=;
 b=KMsq2FYO+4z+v/DnwOmTSLJu07PtTm7D8g6PEVlcA7WxzDRAw93IeeN+AUqDOJmqcA
 MXMfSj1VtkYvxPNOqBGJmoaAQe9BZe2gi6WFz93ARLxoV9lIXskAQ0F09r1MVj14zwps
 SRXGSE1sXGhfyd5RpWgn0DQJU7kp4cgm8PIhWYgIRVECh47cUuUj1vkLYf6RCTnRmv5U
 TGWzHRuSSwxnUI2HJ7n5fl+S636c//373wSzfDicz38T+HOZ5iqI13MKo3YdR8RZMdxK
 ArA4lARro+f9qWqbIA/H7I2Dosd+1I+AVBm33IT/YeyKxHqKBx+RZ+Q82rGLgl2e6e0D
 +xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+qkEnDMdHWRU31cSJg9p2IUmb01k7KNSi4LqckJbiYc=;
 b=qMt8fM8GEkfDTHgYE5kUAGtCRzyG75naRbf8T9smoLHcK6/H7VyAPb303htux1yHh7
 Pc5u971JDrlQ4dG9CtYX6861Kf/LZbm2NdQ0fF8xVa3UF1Bxvq7swkbVjqcNnfNH3m/r
 LrwpONK8SCiBaGwOAbHLxhRBYb7qYfuztfTvoXImSMXPa7tV25KuWeCEGFgYp+uKZgAc
 OGF7guCApe4vQSMO7wlX3/Z3c4LTkdl/+/e8F5CBnVYLb8NWCWuvSbxsrIo6Ba9RKgp2
 8286iaIsggeTOuRU/QxFAyk9FvYcN602JiBzbT80OuWZ+KGOoyWinDgkFwKDf5R1kBuj
 JSBA==
X-Gm-Message-State: AOAM5314FNvQCeTMDoETCkx3pMMHb39CyXYnNcXfFFy39px5SwEnawUq
 OlJy3RFCXSgi6JlvujMrw2P1VWejwXQ=
X-Google-Smtp-Source: ABdhPJxcBJU9P/OhWpbSiiegkLCRBGV8w1zn5WCmA94jBL0JJyrp/jiJhXILv1ZqIymtjw7n9lc1zA==
X-Received: by 2002:adf:fd05:: with SMTP id e5mr38919269wrr.225.1608126225781; 
 Wed, 16 Dec 2020 05:43:45 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h13sm3163733wrm.28.2020.12.16.05.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] target/mips/mips-defs: Use ISA_MIPS32R2 definition to
 check Release 2
Date: Wed, 16 Dec 2020 14:43:20 +0100
Message-Id: <20201216134328.851840-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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

Use the single ISA_MIPS32R2 definition to check if the Release 2
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R2 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 3 +--
 linux-user/mips/cpu_loop.c | 1 -
 target/mips/translate.c    | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 2756e72a9d6..9cfa4c346bf 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -24,7 +24,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -81,7 +80,7 @@
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b58dbeb83d1..a2aa8167210 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -386,7 +386,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS64R2 ||
                               env->insn_flags & ISA_MIPS32R6 ||
                               env->insn_flags & ISA_MIPS64R6;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8c0ecfa17e1..0923dfdf451 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28212,7 +28212,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DINSM:
     case OPC_DINSU:
     case OPC_DINS:
-        check_insn(ctx, ISA_MIPS64R2);
+        check_insn(ctx, ISA_MIPS32R2);
         check_mips_64(ctx);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
@@ -28232,7 +28232,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS64R2);
+            check_insn(ctx, ISA_MIPS32R2);
             check_mips_64(ctx);
             op2 = MASK_DBSHFL(ctx->opcode);
             gen_bshfl(ctx, op2, rt, rd);
-- 
2.26.2


