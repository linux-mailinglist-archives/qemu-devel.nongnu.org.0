Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387602EE96B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:00:45 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeGq-0001Wk-72
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlX-0005UL-JO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:23 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlW-0006dy-0J
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so7147819wrc.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ADeLjBIuNm8Db2lkSUMCJRDAVngCOHiUxA4Y6spWn0I=;
 b=DsPiUBFgZubvxf2GePgfLlQAvIsVAdsSz4Pr9D3xFLnGnAV6kscnE/yLi/H5oybGLJ
 lf6RlFYc8SoacNkGAukiY77zsn/ei6qXWVMzAh0raYVJ+BZGXSc3gX+fw1NAah1cI+zw
 8PgNNKqAdzIlWOklbEDv9+ZAVUtEE4XqP6XZUxNg7IYik2MvFnSkGbKXZH2iCmoneHUa
 wUTrY0iosyh0IdFd1OolVkHkDYyuWJHnSG47p28Wsmkh7VI+05X3pkbvPLTWqeme9Ypg
 IddKtUBE2yWH2SK57efV4dnc4mdZxos5u/NcrMP1Z8oJkPnAuAvXAt7NCZK8CIzc4U2w
 CjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ADeLjBIuNm8Db2lkSUMCJRDAVngCOHiUxA4Y6spWn0I=;
 b=BF/RdIGY6YBTj+kTThU89vB59Hhl1kOZRxSK34cy6Qv2Spd8jSbDdAtl1lraSYfOqg
 INfRZA+c8Nje0tSInH5DgLClO/G6vbzX4jT+AbJen6WOFGqmltlNIBRXvWbD2cGVWCk1
 +0Gfxl5lCV0fDo/xhP1D8EcigFN9SHiwr4UwLUvudPIYZsa9+Xx+3w4m5wxEHP6El4QP
 Bu+abcC8S9flxoWmq+4k+VXq3cLIJgJitgyHuzU78dJ2dE9GZN9Lex0ae/0P8HXlW1c8
 AvbMQuQIgOGzS7RysJhe6+IHNSzOG7WxshGf+vwaojtafF4yrM5A3LWkUy3g7ffdgWa3
 ATQA==
X-Gm-Message-State: AOAM532kije+hAahjmY7LwlmL7FKAXWybJzMeFOmhTlS2xFhKUfZbMlJ
 LzYs35Oi9VYI6KOV1W45c5AnTZVpCik=
X-Google-Smtp-Source: ABdhPJwmwG+IOuURAtgZfJZeyY0mGhHbK6Zox4gOBAU8vjb6V2st3D0j0ccmQnWMvuf9SjqNPgJ4VQ==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr667739wrw.157.1610058500527; 
 Thu, 07 Jan 2021 14:28:20 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m17sm11788101wrn.0.2021.01.07.14.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 63/66] target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to
 decodetree
Date: Thu,  7 Jan 2021 23:22:50 +0100
Message-Id: <20210107222253.20382-64-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

LDL/LDR/SDL/SDR opcodes have been removed from the Release 6.

Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-12-f4bug@amsat.org>
---
 target/mips/mips64r6.decode | 6 ++++++
 target/mips/translate.c     | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/mips/mips64r6.decode b/target/mips/mips64r6.decode
index e812224341e..8c3fc5dae9c 100644
--- a/target/mips/mips64r6.decode
+++ b/target/mips/mips64r6.decode
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
index 73efbd24585..f46d7c5f80b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28871,11 +28871,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
+        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         /* fall through */
     case OPC_LDL:
     case OPC_LDR:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
-        /* fall through */
     case OPC_LWU:
     case OPC_LD:
         check_insn(ctx, ISA_MIPS3);
@@ -28884,8 +28883,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_SDL:
     case OPC_SDR:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
-        /* fall through */
     case OPC_SD:
         check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
-- 
2.26.2


