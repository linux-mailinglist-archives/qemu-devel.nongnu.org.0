Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6F2D9FB6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:59:00 +0100 (CET)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot3j-0001wJ-C7
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskS-0000Li-2R
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:39:06 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskO-0007VK-Ul
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:39:03 -0500
Received: by mail-wr1-x444.google.com with SMTP id q18so9931235wrn.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jefk5hCY2L0gsAzOu9EGNf66rlI9awBw/Q4VvUHWHU8=;
 b=KRSqAzfDqntubLnrV7+aVcM6D85jfLoU1v3jbobJLTB5GK3AYEZsr0xO95KGZ5eUpu
 uOfAlROUvUKFHg9I0ZEwe8i9Qp0pUebmfbO/ZmsI0swpyVYtfxfBAHozlXHWVLxaIUkR
 2ioe/BepV616gMyfXag+Gls7EJ3fkl5UCrmUWE7hsPHN4dbj+UsQWJ5yZnrYNlddj48e
 qh8Hggj7FFpT76phdy83AmWRdbJMsxzg4+bk3SsEaodxsQGEsiMZSFjLdr3VbyHGZu+J
 QmemRydem9eGnDIFCKmCgxRsZOj6DoSHfWagUZ+TVtIibgftPPUGA9eO5riGGjTdymQd
 MlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jefk5hCY2L0gsAzOu9EGNf66rlI9awBw/Q4VvUHWHU8=;
 b=rCLOXs+S8bQ+5bCOAJNzyRXiuEtXMg7SmSeqXH8WDzHbhg2a79kbJfQgfVdvHi6KyX
 7ww7Sz8a+drncfhA9CahVmiRfXvQy6DSuoxUsWB8l6XG3IpOfysqVP6TMX/+/BbGdh78
 LpZNHiKTbYxMya5X1MbqXLPuisbh4jlkv+IsltMhWiOegbvevgAQkEY3WvFpW3qJU2YH
 0oH+2dSNAxlKVqAPEVwsAUWk/PywvkyXA0GY4dpyuue/jxVeVU8e+4WGGvhzwVJzwFBm
 yR05sarWyDwcg5aM/yE2CTlMd4hwylhxICfa5dA58yXAqFepaPtPxnJmGPkCI1TnfG/r
 0+WA==
X-Gm-Message-State: AOAM531LbU+86i1JCCkoJp8ybQjF+Ns1wUyYSrN2TNp240xQ/KNLVFgu
 JirB+JJN/59PNskdYlZf1Hzo6Tbc3V4=
X-Google-Smtp-Source: ABdhPJx1mbrTlly834vs9hW8IPNk2JYQANfQHJCwKpzwL+rkNH34bZ9lDG+EmoX+BTQiXr+/H68p3Q==
X-Received: by 2002:adf:e48d:: with SMTP id i13mr30341474wrm.48.1607971138397; 
 Mon, 14 Dec 2020 10:38:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m81sm33713025wmf.29.2020.12.14.10.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/16] target/mips: Extract FPU specific definitions to
 translate.h
Date: Mon, 14 Dec 2020 19:37:38 +0100
Message-Id: <20201214183739.500368-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract FPU specific definitions that can be used by
ISA / ASE / extensions to translate.h header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 71 +++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 70 ----------------------------------------
 2 files changed, 71 insertions(+), 70 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index a30fbf21ff9..a9eab69249f 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -52,6 +52,77 @@ typedef struct DisasContext {
 /* MIPS major opcodes */
 #define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
 
+#define OPC_CP1 (0x11 << 26)
+
+/* Coprocessor 1 (rs field) */
+#define MASK_CP1(op)                (MASK_OP_MAJOR(op) | (op & (0x1F << 21)))
+
+/* Values for the fmt field in FP instructions */
+enum {
+    /* 0 - 15 are reserved */
+    FMT_S = 16,          /* single fp */
+    FMT_D = 17,          /* double fp */
+    FMT_E = 18,          /* extended fp */
+    FMT_Q = 19,          /* quad fp */
+    FMT_W = 20,          /* 32-bit fixed */
+    FMT_L = 21,          /* 64-bit fixed */
+    FMT_PS = 22,         /* paired single fp */
+    /* 23 - 31 are reserved */
+};
+
+enum {
+    OPC_MFC1     = (0x00 << 21) | OPC_CP1,
+    OPC_DMFC1    = (0x01 << 21) | OPC_CP1,
+    OPC_CFC1     = (0x02 << 21) | OPC_CP1,
+    OPC_MFHC1    = (0x03 << 21) | OPC_CP1,
+    OPC_MTC1     = (0x04 << 21) | OPC_CP1,
+    OPC_DMTC1    = (0x05 << 21) | OPC_CP1,
+    OPC_CTC1     = (0x06 << 21) | OPC_CP1,
+    OPC_MTHC1    = (0x07 << 21) | OPC_CP1,
+    OPC_BC1      = (0x08 << 21) | OPC_CP1, /* bc */
+    OPC_BC1ANY2  = (0x09 << 21) | OPC_CP1,
+    OPC_BC1ANY4  = (0x0A << 21) | OPC_CP1,
+    OPC_BZ_V     = (0x0B << 21) | OPC_CP1,
+    OPC_BNZ_V    = (0x0F << 21) | OPC_CP1,
+    OPC_S_FMT    = (FMT_S << 21) | OPC_CP1,
+    OPC_D_FMT    = (FMT_D << 21) | OPC_CP1,
+    OPC_E_FMT    = (FMT_E << 21) | OPC_CP1,
+    OPC_Q_FMT    = (FMT_Q << 21) | OPC_CP1,
+    OPC_W_FMT    = (FMT_W << 21) | OPC_CP1,
+    OPC_L_FMT    = (FMT_L << 21) | OPC_CP1,
+    OPC_PS_FMT   = (FMT_PS << 21) | OPC_CP1,
+    OPC_BC1EQZ   = (0x09 << 21) | OPC_CP1,
+    OPC_BC1NEZ   = (0x0D << 21) | OPC_CP1,
+    OPC_BZ_B     = (0x18 << 21) | OPC_CP1,
+    OPC_BZ_H     = (0x19 << 21) | OPC_CP1,
+    OPC_BZ_W     = (0x1A << 21) | OPC_CP1,
+    OPC_BZ_D     = (0x1B << 21) | OPC_CP1,
+    OPC_BNZ_B    = (0x1C << 21) | OPC_CP1,
+    OPC_BNZ_H    = (0x1D << 21) | OPC_CP1,
+    OPC_BNZ_W    = (0x1E << 21) | OPC_CP1,
+    OPC_BNZ_D    = (0x1F << 21) | OPC_CP1,
+};
+
+#define MASK_CP1_FUNC(op)           (MASK_CP1(op) | (op & 0x3F))
+#define MASK_BC1(op)                (MASK_CP1(op) | (op & (0x3 << 16)))
+
+enum {
+    OPC_BC1F     = (0x00 << 16) | OPC_BC1,
+    OPC_BC1T     = (0x01 << 16) | OPC_BC1,
+    OPC_BC1FL    = (0x02 << 16) | OPC_BC1,
+    OPC_BC1TL    = (0x03 << 16) | OPC_BC1,
+};
+
+enum {
+    OPC_BC1FANY2     = (0x00 << 16) | OPC_BC1ANY2,
+    OPC_BC1TANY2     = (0x01 << 16) | OPC_BC1ANY2,
+};
+
+enum {
+    OPC_BC1FANY4     = (0x00 << 16) | OPC_BC1ANY4,
+    OPC_BC1TANY4     = (0x01 << 16) | OPC_BC1ANY4,
+};
+
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
 void gen_reserved_instruction(DisasContext *ctx);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 08ed542f4d4..cc876019bf7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -43,7 +43,6 @@ enum {
     OPC_SPECIAL  = (0x00 << 26),
     OPC_REGIMM   = (0x01 << 26),
     OPC_CP0      = (0x10 << 26),
-    OPC_CP1      = (0x11 << 26),
     OPC_CP2      = (0x12 << 26),
     OPC_CP3      = (0x13 << 26),
     OPC_SPECIAL2 = (0x1C << 26),
@@ -996,75 +995,6 @@ enum {
     OPC_WAIT     = 0x20 | OPC_C0,
 };
 
-/* Coprocessor 1 (rs field) */
-#define MASK_CP1(op)                (MASK_OP_MAJOR(op) | (op & (0x1F << 21)))
-
-/* Values for the fmt field in FP instructions */
-enum {
-    /* 0 - 15 are reserved */
-    FMT_S = 16,          /* single fp */
-    FMT_D = 17,          /* double fp */
-    FMT_E = 18,          /* extended fp */
-    FMT_Q = 19,          /* quad fp */
-    FMT_W = 20,          /* 32-bit fixed */
-    FMT_L = 21,          /* 64-bit fixed */
-    FMT_PS = 22,         /* paired single fp */
-    /* 23 - 31 are reserved */
-};
-
-enum {
-    OPC_MFC1     = (0x00 << 21) | OPC_CP1,
-    OPC_DMFC1    = (0x01 << 21) | OPC_CP1,
-    OPC_CFC1     = (0x02 << 21) | OPC_CP1,
-    OPC_MFHC1    = (0x03 << 21) | OPC_CP1,
-    OPC_MTC1     = (0x04 << 21) | OPC_CP1,
-    OPC_DMTC1    = (0x05 << 21) | OPC_CP1,
-    OPC_CTC1     = (0x06 << 21) | OPC_CP1,
-    OPC_MTHC1    = (0x07 << 21) | OPC_CP1,
-    OPC_BC1      = (0x08 << 21) | OPC_CP1, /* bc */
-    OPC_BC1ANY2  = (0x09 << 21) | OPC_CP1,
-    OPC_BC1ANY4  = (0x0A << 21) | OPC_CP1,
-    OPC_BZ_V     = (0x0B << 21) | OPC_CP1,
-    OPC_BNZ_V    = (0x0F << 21) | OPC_CP1,
-    OPC_S_FMT    = (FMT_S << 21) | OPC_CP1,
-    OPC_D_FMT    = (FMT_D << 21) | OPC_CP1,
-    OPC_E_FMT    = (FMT_E << 21) | OPC_CP1,
-    OPC_Q_FMT    = (FMT_Q << 21) | OPC_CP1,
-    OPC_W_FMT    = (FMT_W << 21) | OPC_CP1,
-    OPC_L_FMT    = (FMT_L << 21) | OPC_CP1,
-    OPC_PS_FMT   = (FMT_PS << 21) | OPC_CP1,
-    OPC_BC1EQZ   = (0x09 << 21) | OPC_CP1,
-    OPC_BC1NEZ   = (0x0D << 21) | OPC_CP1,
-    OPC_BZ_B     = (0x18 << 21) | OPC_CP1,
-    OPC_BZ_H     = (0x19 << 21) | OPC_CP1,
-    OPC_BZ_W     = (0x1A << 21) | OPC_CP1,
-    OPC_BZ_D     = (0x1B << 21) | OPC_CP1,
-    OPC_BNZ_B    = (0x1C << 21) | OPC_CP1,
-    OPC_BNZ_H    = (0x1D << 21) | OPC_CP1,
-    OPC_BNZ_W    = (0x1E << 21) | OPC_CP1,
-    OPC_BNZ_D    = (0x1F << 21) | OPC_CP1,
-};
-
-#define MASK_CP1_FUNC(op)           (MASK_CP1(op) | (op & 0x3F))
-#define MASK_BC1(op)                (MASK_CP1(op) | (op & (0x3 << 16)))
-
-enum {
-    OPC_BC1F     = (0x00 << 16) | OPC_BC1,
-    OPC_BC1T     = (0x01 << 16) | OPC_BC1,
-    OPC_BC1FL    = (0x02 << 16) | OPC_BC1,
-    OPC_BC1TL    = (0x03 << 16) | OPC_BC1,
-};
-
-enum {
-    OPC_BC1FANY2     = (0x00 << 16) | OPC_BC1ANY2,
-    OPC_BC1TANY2     = (0x01 << 16) | OPC_BC1ANY2,
-};
-
-enum {
-    OPC_BC1FANY4     = (0x00 << 16) | OPC_BC1ANY4,
-    OPC_BC1TANY4     = (0x01 << 16) | OPC_BC1ANY4,
-};
-
 #define MASK_CP2(op)                (MASK_OP_MAJOR(op) | (op & (0x1F << 21)))
 
 enum {
-- 
2.26.2


