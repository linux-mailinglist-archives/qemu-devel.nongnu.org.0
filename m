Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D12F6670
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:56:04 +0100 (CET)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05ul-0000Qm-Me
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NS-000443-Vf
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NR-0000c4-JY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id v184so995519wma.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tkb6QNHvd3F924cjq9ERrydV/9VY8et6DB9+/1SkbtI=;
 b=Hoy9kO1D9iWWF0TTSi90ZDJQCyGCCf0bOmEhdZ1yO8auRzIgU8dXcfLGQedwU1Qrpw
 idiJChX3dRxvFOjf2BGshQrFLhHFkyj/GkE/7RIByzWomjq8BN4vTseyHQG+9aSigrFx
 /35M4FlzF9UI0YfRoyPuVBd5Nr4hs9plmVuDA6lChph58AHYadD6lwZxdiHjvrA2B9tL
 CG69K8e0TjdWGNWq4zFRRQxwAOTPw9q5+bTe/M9Yfvz6jHgINxErz7u9z3lSXnkBPLMQ
 SpiURHHE7apVqGGP3Y039SGRaEBxQAgSc+fJlhOpHOBoxpJvlmNupn5R/0likJa+1ifM
 XpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tkb6QNHvd3F924cjq9ERrydV/9VY8et6DB9+/1SkbtI=;
 b=jFf4sQDZXC9mCOIdrBRKYMQ0oE7wcVCamB7VRa8ZE0qeBNKQQ7HEvcxO4x+N/aJvh5
 Q2+XjYz8zH0djhZ8Q8DIIbJidJ59SW+DX/wAnOuEVhZoDe6fUNhgnMniBZM10nHkW5GL
 Fdo6MQO+ziQ+19ONsRxlavdqRDCCCqS/zdGtxcacTBH1sDnsj1/4t6AXOW7wsWyGydVJ
 Rgw0HgZWBpBhYybWMWspWnIRMDApffpO4rAUUVgr9qcf0SwamDunHXFytNF0JimSYRcy
 xT6lRVAu1tTO/Dqno2r9EObFiq93CLdANzydJNvcR1mGsUMGc0xs9DTRBXO0pvlCDLHv
 W7lA==
X-Gm-Message-State: AOAM530ntjTMbQfAho2KBafkU28+j7xmkIadvMBbaan2T8A0G1QEkjYL
 xExYahKR7/U1+QRwp5BI19xIoGXpkrk=
X-Google-Smtp-Source: ABdhPJzsVRoHZIjey+b4TSTGx+9L8REIajB0h0a6h9CzJDfuBkggk+0x7VbZQ0NEscEM0IEKGKPkpg==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr4776192wmg.61.1610641295261; 
 Thu, 14 Jan 2021 08:21:35 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k10sm10127129wrq.38.2021.01.14.08.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 63/69] target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to
 decodetree
Date: Thu, 14 Jan 2021 17:20:13 +0100
Message-Id: <20210114162016.2901557-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
 target/mips/mips64r6.decode | 7 +++++++
 target/mips/translate.c     | 5 +----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/mips/mips64r6.decode b/target/mips/mips64r6.decode
index fd58ac72414..8ca352a5c19 100644
--- a/target/mips/mips64r6.decode
+++ b/target/mips/mips64r6.decode
@@ -12,6 +12,13 @@
 
 &rtype              rs rt rd sa !extern
 
+&REMOVED            !extern
+
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
 
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
+
+REMOVED             011010 ----- ----- ----------------     # LDL
+REMOVED             011011 ----- ----- ----------------     # LDR
+REMOVED             101100 ----- ----- ----------------     # SDL
+REMOVED             101101 ----- ----- ----------------     # SDR
diff --git a/target/mips/translate.c b/target/mips/translate.c
index ffe283928bd..f0438ab9bef 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28870,11 +28870,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28883,8 +28882,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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


