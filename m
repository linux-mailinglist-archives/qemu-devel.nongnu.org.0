Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916F2EE928
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:49:23 +0100 (CET)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe5q-00028c-Bd
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdj4-0001aJ-DN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdj2-0005kK-MX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so7119049wrc.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5/OHDIsfN90nSudp26zMHLuKLIpMGo4pYHfXrBeq+Y=;
 b=c+RtxgvWMGPC4oJziyXh6e/afUtmeW7vFEIHlOzTEZZAg1xkTQm6hHzewLTNkw4mpm
 MFFwtfdor0S1lwwpCd4mBjsgutk94+5+349QBaj8qooa1AgFqCzTlXyD93dMHG+5kdaT
 n0mWHOeYAKy7HpCYRXu52eFr5dwWFFtmhWFL+d+SScvCuIqkGlHLCUP1OXYm85a3uXR9
 1xfXamn6wLoEF9rny5ItVqBI2E9nP74gCXl171987E8/82VCSoJ0LxANsOwM6nBRUnQk
 N7lEbo/ShMFmU7tvuDabe81sXYS7EQojRV1rf7xyP1x05XXhqDOf5+O2gQA2waXK+FGx
 dNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M5/OHDIsfN90nSudp26zMHLuKLIpMGo4pYHfXrBeq+Y=;
 b=VRRssKc2j9SsQNOHnE/k4nBwUaDCvxwinQo/IAqi7cWih2dMQ3FmSNiLB3Cz9mMpSu
 0iCgvGKHhv8FD8rgQ51LvYttXSPW5ANTeC5hxmXUCAH3gJrkkhMUATBGpsXivZOYxCss
 QZlXz+4WN3XE4YaOBKG2CFMyY3SI/UCFe1MkDIXQNeDg7lJgO7DCbQr0AFJqAgYMUaV/
 sMHthgXUvq/xsT8X+ghA52JKqYOmSorxnYv2+yJ/IO43iBAvCPNnDD5me0fqM93XiE8H
 C+RaR+CCkfqp2Qg9FbbnAbV1of2H6LeNxLvy1bKcRc5Gy2ZuS5F98NLu0VBZqJrt8pNI
 Perg==
X-Gm-Message-State: AOAM531/z17kSgxkCDftxnKCLNrSZaXXYRKoz7oOAvYTxRWIlu+Hkzvp
 m6sY07v0t6rxCGDNkpj9+q7MnAOYS6g=
X-Google-Smtp-Source: ABdhPJy4mm0Ii5NGwleCxYIQNeng+A7yjLBn+FieY6iend0fQ9dqJVNukJWP7vcnXWJCCPP9dpT+oA==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr641108wrc.89.1610058347060;
 Thu, 07 Jan 2021 14:25:47 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i9sm10794305wrs.70.2021.01.07.14.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/66] target/mips: Extract FPU specific definitions to
 translate.h
Date: Thu,  7 Jan 2021 23:22:20 +0100
Message-Id: <20210107222253.20382-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Extract FPU specific definitions that can be used by
ISA / ASE / extensions to translate.h header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-16-f4bug@amsat.org>
---
 target/mips/translate.h | 71 +++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 70 ----------------------------------------
 2 files changed, 71 insertions(+), 70 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 4c30a328e4b..c70bca998fb 100644
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
 void generate_exception(DisasContext *ctx, int excp);
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 610fba61de4..39b57794b36 100644
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


