Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D422F6611
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:38:01 +0100 (CET)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05dI-00022E-8P
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NN-00042A-Cl
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NL-0000YN-OT
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 91so6396939wrj.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Doq/pcZOVuGb2dEzEOJraoiA6l0J+QqBjHM4CMC0Yk=;
 b=cl9DJTY5d7Cje9sIlTA8Khf8s+LfIDiC9r+kX08Z3dcHrjk7X6WGNsp2ezysAGd7QZ
 YdE5wZXZcXjNneaUswBXYhqfmQJByv20YFZwn+x22gjebZll4+4mdjpiDnjajUkDT/n1
 Utby3QU0vEGjwJJxtmpG9NLwwZ4ww6DxD9ZwGpKjZUiZbC5gkmwPLVqS4KxiH9Db8XcS
 DfalIrz/Z1h8Xlao+CWQHDUulghtWpkyQA4Wr/cgsuPBTld2js3H9sHy5GnB1nhk0UTu
 7zyNKrP4bLGIsysBcWUnTkcrzWdToeC3QGxvtWktKCvyxfbj+pwAcP942Gw2v5d41XA4
 +cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+Doq/pcZOVuGb2dEzEOJraoiA6l0J+QqBjHM4CMC0Yk=;
 b=M7XD1PH6nYNcSfz/QsVIKEmR7X//sxd6HpOZlHaHCcWMcXWiNLu3wbL62eeGRAluvi
 iorIU7y1+o9R9770IkDIdTVhQ8KSLHLRHZBWJMyhACcF/8Q+WNDtxKXBVosChhCxOSs3
 1H/7uaGG9n0Gu79SmuX4yTYP996CFIV5VL7nArGtR79pywmfozqrlMmX6naab6lRrFi/
 6p2Rap7P471yyyAaqhCQc/AjS2pbXZ1O5KUuRjK13c0fiAGfbKXAdM4XluVPuu6oYQXa
 FIedc93hLI/UJsFzZF6KPuPquclQwYtlCQP7tppkIC/Mmvw55VG343ceTRsgwxvk9K0V
 iuhQ==
X-Gm-Message-State: AOAM532XEWEcF9M1gw9Fo+Si6OmoecL5nYzWjYxFtlE99QNdkrlAbHqd
 kYQOf4dhkaQ96Lfr9VLC1fVmrNhuclM=
X-Google-Smtp-Source: ABdhPJyC5V7LBZfcoOHLz5E/hIbfdZu+6HFMHWmnNp/p4PS/Y1TJdBdUe/ssVi+waieT4w5Jb7EapQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr8919808wrm.260.1610641290385; 
 Thu, 14 Jan 2021 08:21:30 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g184sm9524669wma.16.2021.01.14.08.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 58/69] target/mips: Convert Rel6 Special2 opcode to
 decodetree
Date: Thu, 14 Jan 2021 17:20:12 +0100
Message-Id: <20210114162016.2901557-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

Special2 opcode have been removed from the Release 6.

Add a single decodetree entry for all the opcode class,
triggering Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-7-f4bug@amsat.org>
---
 target/mips/mips32r6.decode  | 2 ++
 target/mips/rel6_translate.c | 7 +++++++
 target/mips/translate.c      | 2 --
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index d71a65f32cb..dd7faf75ab8 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -15,3 +15,5 @@
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
+REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
index da70ff9662b..139a7524eea 100644
--- a/target/mips/rel6_translate.c
+++ b/target/mips/rel6_translate.c
@@ -18,6 +18,13 @@
 #include "decode-mips32r6.c.inc"
 #include "decode-mips64r6.c.inc"
 
+bool trans_REMOVED(DisasContext *ctx, arg_REMOVED *a)
+{
+    gen_reserved_instruction(ctx);
+
+    return true;
+}
+
 static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
 {
     return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index e3bb1e83efe..2f23ce4a363 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -27136,8 +27136,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     int rs, rt, rd;
     uint32_t op1;
 
-    check_insn_opc_removed(ctx, ISA_MIPS_R6);
-
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
-- 
2.26.2


