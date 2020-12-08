Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F22D3573
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:38:58 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkhF-0006l0-9u
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjk2-0004Nm-Gr
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:47 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjk0-0008Jr-PX
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:45 -0500
Received: by mail-ed1-x541.google.com with SMTP id c7so18976888edv.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s+Pc76VS0giYYBfSeBqYRPzwDyC7ikS6JhKYOaNfSk=;
 b=gMSNM8+rP/wUen1Ewblxic202ImVW+lIq3zfHbQvRxm8HEKVxIgjht4/m9sWn/5p1M
 J6LhMeVw+f3yaf9Z0xOqeA1AVnvplBodNNMIK5d/Voa4JlFoyrAgySWE2YO5aKGpWMve
 88kPhcOcT9WwocudpjqV9d4SUcWsp75naNdK2rHY9tcEFEgQdI8R4oUq3iw51SrZmTOD
 uCGd6e46uuR8P6Xut0muG3rpGaOcKxi1LMNyJ4g+CWH2n0uuOHjMcGTfRYdgBnJyA60d
 fY8dDH9lNtwx07y+SgGOTCnNaNzhx9ud+shI3MbR4S4EnFlMVGDFZ3nU50H8nwG92FG3
 7e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5s+Pc76VS0giYYBfSeBqYRPzwDyC7ikS6JhKYOaNfSk=;
 b=AneuvlCGaNLBkBmH4gbZOw7cPpWDbGsFkKScE3g23PY8/uG83PUe+SmURvorSF4ySW
 s/eybtyUi1i7tz/sHe5g1lgHDWoUBVK7DAVgs/i/g2WdWQzp9AurybaHZsTaCrZOqSGp
 7u+0wugB4denkSeXWkQdN8vnw5IMmGIAkSc/ERSaouVX1/shJdeBmXIxn8bfcIYllLXd
 C2RAOkHTWFLk4WY5FjeGxc0BLCFaOXIFCcMxOBLHo1VU263iUNCGDZwtIKkvdSh5ijx2
 7IVN1AOnZ133TQHF/hhPn3iRzhmC001j7V4K0BD1Uxi/rch+5qabZ4XeD6Jb78GCxRTl
 r9yQ==
X-Gm-Message-State: AOAM533jmIhhEXNfaq+5L0KJQGwNSKEwQgzGfoky6KlaxluTxnibvVI8
 t+6S4DloYjPPj5YIZJOhuk6qq5qBi18=
X-Google-Smtp-Source: ABdhPJzbSylaj2ZjzVohbJDsLTirXN2tuFc4bOyEsBOPB0aij9iiPNZuBr8hCOdD8rXr6JF8NGa0Bw==
X-Received: by 2002:a50:9310:: with SMTP id m16mr21869080eda.94.1607459863214; 
 Tue, 08 Dec 2020 12:37:43 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x15sm17889483edj.91.2020.12.08.12.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] target/mips: Convert Rel6 COP1X opcode to decodetree
Date: Tue,  8 Dec 2020 21:36:58 +0100
Message-Id: <20201208203704.243704-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
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

COP1x opcode has been removed from the Release 6.
Add a single decodetree entry for it, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode | 2 ++
 target/mips/translate.c         | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index 259bac612ab..7b12a1bff25 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -16,4 +16,6 @@
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 
+REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
+
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 788b5112a80..81ca1d45063 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28874,7 +28874,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
 
     case OPC_CP3:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         if (ctx->CP0_Config1 & (1 << CP0C1_FP)) {
             check_cp1_enabled(ctx);
             op1 = MASK_CP3(ctx->opcode);
-- 
2.26.2


