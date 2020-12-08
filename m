Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93632D3586
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:49:35 +0100 (CET)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkrW-0007tp-TT
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkC-0004b3-EQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:56 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkB-0008MO-0t
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:56 -0500
Received: by mail-ed1-x543.google.com with SMTP id dk8so16107425edb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlFjvECHfYONeGG1DJEI60MK1sieFoR6zYz7WG0U29k=;
 b=H4kIOBkxdEcBrao0pDtEFNW7Vtqj/Tf2pDzep2KuzyibDrmRC3Um8NRqNEAKKtkY4a
 lf1NA5braxxGX2j1Cgf3yqMATGZsA7fNw6b26Et7+QbmmQJh1Kt0QOexA3UPgupl6j0P
 wszcDI1g4QCuwba5p6krxHYWXSz1sIl3Ft9ZdXo7VI9xVQLzzLWZqm2xmaPQpZ+HMKOt
 LhaXOhNsnjWhGXcvgOJcGNjwUubY7X/CKbBTIClcJtuFlMXrZ1jLU4JpW6Pa0wLhOKBU
 eP2k/IZYpoA2rKpPzDueKTfKXRH7Ia96PC8rx7jW26JUyfgHEkP4+vH5C7zk+XzBQGkE
 /xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SlFjvECHfYONeGG1DJEI60MK1sieFoR6zYz7WG0U29k=;
 b=YyiQwBFg8FCKoUfSw8bfScxIvI7hScNx3osBEHyWyXY2Qtf6DkTZTYu8UqXx82UkeV
 LNGKrNL6hmSkKNNBnhni2lwmcm2jr0T9UH3N1q/XKRlok/51DwHQ/NZt2PEMtLu+aZTV
 p/TcvEJ+5Ngr2jT2E6C9s/uTZpLs+jinoqR9CNycJGX5b/f8IGKX36PJTKxWI4MrBFJa
 +CcegZRPSgFdEbxdrmLCyVumkpbBvoTaT2oRwBXKxaYKkZi0qD/PeeNj7L2hj1Gr4gwb
 0HUrSW3KKE5fxuSiqwhOrcn98meI7q4Pw4uRHCk+ckacTm3+41IYYIvcoyAJL8bPselk
 CUYw==
X-Gm-Message-State: AOAM533PJvQsRmNvu98+Yxv4QswwXKGVeaUkz/SHltTSTqf9Xc3/s0J5
 2sqZyEhHQ47ngmL2emraYnQW7B1vM54=
X-Google-Smtp-Source: ABdhPJwwx577N23c7DE8BfEco72P9/KXXJCwGdHNUEmQZVSJ3RN+ni63kxpmDLwE9/RWstmm7OkU6w==
X-Received: by 2002:a05:6402:1a2f:: with SMTP id
 be15mr26330175edb.209.1607459873555; 
 Tue, 08 Dec 2020 12:37:53 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a20sm18394661edr.70.2020.12.08.12.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/13] target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes to
 decodetree
Date: Tue,  8 Dec 2020 21:37:00 +0100
Message-Id: <20201208203704.243704-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
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

LWL/LWR/SWL/SWR opcodes have been removed from the Release 6.
Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode | 5 +++++
 target/mips/translate.c         | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index e3b3934539a..89a0085fafd 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -20,5 +20,10 @@ REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
 
+REMOVED             100010 ----- ----- ----------------     # LWL
+REMOVED             100110 ----- ----- ----------------     # LWR
+REMOVED             101010 ----- ----- ----------------     # SWL
+REMOVED             101110 ----- ----- ----------------     # SWR
+
 REMOVED             101111 ----- ----- ----------------     # CACHE
 REMOVED             110011 ----- ----- ----------------     # PREF
diff --git a/target/mips/translate.c b/target/mips/translate.c
index ba1b2360c50..3d627d049bd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28636,11 +28636,10 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
+        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         /* Fallthrough */
     case OPC_LWL:
     case OPC_LWR:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
-         /* Fallthrough */
     case OPC_LB:
     case OPC_LH:
     case OPC_LW:
@@ -28651,8 +28650,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
          break;
     case OPC_SWL:
     case OPC_SWR:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
-        /* fall through */
     case OPC_SB:
     case OPC_SH:
     case OPC_SW:
-- 
2.26.2


