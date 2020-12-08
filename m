Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202052D35A5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:54:56 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkwh-00079v-58
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkY-0004xw-CQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:18 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkW-0008Tb-1f
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:18 -0500
Received: by mail-ed1-x542.google.com with SMTP id cw27so18981334edb.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uGmxq2xzRtTYRUJyvWqJtHGIaXfE5t1ze+OMIppltBo=;
 b=QelRjUSJV+xeneYtpREupdVGxwtYfBA/LFwifkTUNVBHNFI0LsEbD06qHdgM+lWTsw
 +Qf4RbfFCF5DJcyLy3E6di5s9aEXqKtSIBCU6Piix6451ixUlm1Yo/hTS4e8U329xpTS
 5jvhkKAPBdQTC/K6NCjb33AVdlzDSHWtjl6zmiS5kqExkxGkXY5JCPfSvPdwPFmkR2CD
 oUu5+nJQqSamggxDKhSlWQJBnwxQkcpRzS042MzqIuASWqfpoo1XQ8SEAaPeKSvM0uLK
 sPgo2SF9jsMy4z9xQnN0P0ixJ48gDiQi1jAquJ6Pu52tc/8uA5SpsYvpI8lhAlwy5OKv
 md/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uGmxq2xzRtTYRUJyvWqJtHGIaXfE5t1ze+OMIppltBo=;
 b=eqqJ0xtLF0ZNZw0bZxnmRnYf3I+u9rXa6anJLOf0O/oCGrDZ9Axg78gmF/6fQjISjE
 ZaaoXW5UKLG0iX8dzB+lSZLGVuJishtCyScMyWnDwIZ++gaCTqkusapIvvjSB3+2+7cl
 eYbj60TDS2Bmq6BRz6zZAVfBMxQLjlPCUrR/x7/AXfAMKaXil+Xe8l1QEfFk5sL82B6J
 oUxDAv8g92JE76d97cLV3DoFAK5QEIti4/7kD5DrL6W5UkebF8zgU39m4RBOFBZRUHeJ
 GCbvFYD2g2Upcet+Snk4G0oZi9C41jl+iLtYIRlEopQB57HyMzRAJPi9oGKMUxHTTjYV
 nCWA==
X-Gm-Message-State: AOAM530Tbg7VRqeACFISsjNqxbVjrWD2QrFCGze5GJwL/F426TZy8nR3
 /DNFY5Q8xkkoeMY98ehqlarxzj6Aj3A=
X-Google-Smtp-Source: ABdhPJx70D7BRNckR2uVvsAKvVCnqMqmQrZDYnko37NiuV3II0GXFmpbf7YX3krNjgke3EOycN897Q==
X-Received: by 2002:a50:e0c9:: with SMTP id j9mr26153237edl.380.1607459894258; 
 Tue, 08 Dec 2020 12:38:14 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x6sm344411edl.67.2020.12.08.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:38:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/mips: Convert Rel6 LL/SC opcodes to decodetree
Date: Tue,  8 Dec 2020 21:37:04 +0100
Message-Id: <20201208203704.243704-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
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

LL/SC opcodes have been removed from the Release 6.
Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode | 2 ++
 target/mips/translate.c         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index 3ec50704cf2..489c20aa4e9 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -31,4 +31,6 @@ REMOVED             101010 ----- ----- ----------------     # SWL
 REMOVED             101110 ----- ----- ----------------     # SWR
 
 REMOVED             101111 ----- ----- ----------------     # CACHE
+REMOVED             110000 ----- ----- ----------------     # LL
 REMOVED             110011 ----- ----- ----------------     # PREF
+REMOVED             111000 ----- ----- ----------------     # SC
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 009301c9ceb..90a6dfcd2b3 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28632,7 +28632,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         /* Fallthrough */
     case OPC_LWL:
     case OPC_LWR:
@@ -28653,7 +28652,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
          break;
     case OPC_SC:
         check_insn(ctx, ISA_MIPS2);
-         check_insn_opc_removed(ctx, ISA_MIPS32R6);
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-- 
2.26.2


