Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AB2D35B5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:02:41 +0100 (CET)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kml4B-00059G-Ub
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkN-0004j4-7I
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:07 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkL-0008PE-PE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:07 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so26455726ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1k4PcQljQCh2DE9iUcnW2jkPRc+bb/o9XTSTkfgV9ik=;
 b=rEe0j+mHascWJHV81ahNxSrjSaOo6r9HobqLDIZBML7I5TDdk4mgV2vfZ5hCaPlaBm
 TEb9rmXcOQBO/fk+L9ig9C45geG4DCCLhz50J3jYNo7WAgA6iofFBhuTOKbE5g9gxq9f
 svGgODT7RsJly7e5VGAgOwTf/aJHDVT6uZC+JczzeiBfGN8DCCN7ll2l9bfcRcaTwwRa
 k3VvqUyOEvgp10TmjSGYZcNpVxaOfbBfs02VIEvEjRqqp1Qjc/CwiJRq8kEPUrGvarOb
 o15o6LtEynlHnuFEiG6/GLanB0chD+c+yX7Obng7AI5ppAauB0/6kNTBXvAEEest21Ql
 sSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1k4PcQljQCh2DE9iUcnW2jkPRc+bb/o9XTSTkfgV9ik=;
 b=sgr548VSq5LeJh3QEoZlXzXTU4V6h4oSNsKJh5BGAjZAtJjJqkI238PyaSvjkSs6pv
 t8n9ymg79EZ2xXa93iwOaQCJ8W4NhMSKRB3IGqMb6mgLmdnEdZY9E9pLC0VAHp7obGsf
 5qf7MmQaZg1yY5FvCssnseUUA5/hPIFMto/J/UMj6baxvNllECHvrnECOyQWFK/RhnU+
 Oy8+EHL0p+0u/Dj6eNPvnFCYqhbsGdfGgbVeEkSSghhwZvrRUFEL7P/iM/HYiXQYM6RI
 VedKM7a3mkzzb+6JdcIDM6AG/pyTlNH1zBjJCuDl6Myuc++DV8Yn2Q9eZb6d76zHU5ko
 Iqaw==
X-Gm-Message-State: AOAM533KZ/n40OxBRRO0GxRxrRD/onWmUJ2ZPWyqUeSZQ9oZI1RmEZ6H
 66FDcJeWRQrkSysxM6dwgaWzjACSBJo=
X-Google-Smtp-Source: ABdhPJzBcXz9ip5vjQq810uRM8Fo20Voc4grUCoOG7daHdBkjI2IUBCV5LLaIp2lZMzFqAKQmvpVVg==
X-Received: by 2002:a17:906:b306:: with SMTP id
 n6mr24140705ejz.473.1607459883998; 
 Tue, 08 Dec 2020 12:38:03 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u3sm16446589eje.33.2020.12.08.12.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:38:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to
 decodetree
Date: Tue,  8 Dec 2020 21:37:02 +0100
Message-Id: <20201208203704.243704-12-f4bug@amsat.org>
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

LDL/LDR/SDL/SDR opcodes have been removed from the Release 6.
Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips64r6.decode | 6 ++++++
 target/mips/translate.c         | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/mips/isa-mips64r6.decode b/target/mips/isa-mips64r6.decode
index e812224341e..8c3fc5dae9c 100644
--- a/target/mips/isa-mips64r6.decode
+++ b/target/mips/isa-mips64r6.decode
@@ -10,8 +10,14 @@
 #       (Document Number: MD00087-2B-MIPS64BIS-AFP-6.06)
 #
 
+&REMOVED            !extern
 &lsa                rd rt rs sa !extern
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
 
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
+
+REMOVED             011010 ----- ----- ----------------     # LDL
+REMOVED             011011 ----- ----- ----------------     # LDR
+REMOVED             101100 ----- ----- ----------------     # SDL
+REMOVED             101101 ----- ----- ----------------     # SDR
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 962522b0e02..aeba8efeb17 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28918,11 +28918,10 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
+        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         /* fall through */
     case OPC_LDL:
     case OPC_LDR:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
-        /* fall through */
     case OPC_LWU:
     case OPC_LD:
         check_insn(ctx, ISA_MIPS3);
@@ -28931,8 +28930,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_SDL:
     case OPC_SDR:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
-        /* fall through */
     case OPC_SD:
         check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
-- 
2.26.2


