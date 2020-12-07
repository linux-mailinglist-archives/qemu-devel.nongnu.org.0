Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D413F2D1EC4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:04:50 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQUr-0002yw-Tg
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMh-0004dV-30
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:23 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMf-0004Jp-AI
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:22 -0500
Received: by mail-ed1-x541.google.com with SMTP id h16so4379022edt.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LofNBqvfhJD7QMio6KgUUyNv6uzg7DeNQo+Q00jFE2I=;
 b=V9ilVV6lgZi5jEhrlvG5bq2qZJXihvu5Rap8Giuho5NcoVtx5wF8SVX7R4Ey+tF1Su
 0hoOTCMT7j1o0OMx9mW9IfkuYte9u0jH6Sl3ieuiPk3UCZYi2nO/0SDE+igNm/xf7qig
 hEnhJK5AKiXYDUUtUkcNZY5/ZCPHnxoDw+YcL4yF1ZUnGjlLKkL/sGSiMfWpyzFEhElU
 U9GKSif5LafjmunsEd34yIBvncKlWWiTRU1TGcTHicAa7LA1yfA/ld2PP9+rH4zjKmfP
 KLw4T3Nb8GyInwyRlLz4PGo5S/ArbykHuNRDyAaBb/A0QMLSrimVHtfdi3Qn/EEYn2D2
 Ko9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LofNBqvfhJD7QMio6KgUUyNv6uzg7DeNQo+Q00jFE2I=;
 b=dttyf/vhgW+AAwHBSvAf1ZsaQsVgrhkZlrWgzKjMG9pC7E5UmGGaqK15YiOPxt5GyX
 u6sDNRfFFfBlexDJNB6tiABP66FVDxTH4xorqjeO3pRl7RMo2SSp3nu7sm3MwpVNeT6m
 WXddq0w89dm3j0UFuvVbR3tqphVcMJD9xVNZ5CD+2evQM510k70d1WP//YqM5bcbL/45
 IVpU+sjqmEyu3u09IR2LxntedGlFLDEw+0B7M+haM5yHwPmphqNVYt2kSNPoXoK9/2od
 22VZiv8hUwoPeBrV8j86aFXsJbwMGOmHr+u69GgWkMzsREu6Q8502x/i7fxRUwD7RyPi
 vLAQ==
X-Gm-Message-State: AOAM5329+zVT8KJv6BhMvDE16Z2JJxkbP5FSaZJ7IOxgPnV0PzglUd5+
 JWsegh4y0Qs4tmN1AY6+7uv4T8oDCRo=
X-Google-Smtp-Source: ABdhPJwo8rv3t94SKHKrlVXonC6gHX8VzFqw2MORP0+FE3StHXSMzEuPYYvfdr6q9EXqMExEOcmGJw==
X-Received: by 2002:a05:6402:ca1:: with SMTP id
 cn1mr13404929edb.128.1607385378434; 
 Mon, 07 Dec 2020 15:56:18 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o3sm15757759edj.41.2020.12.07.15.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:56:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/mips: Extract FPU specific definitions to
 fpu_translate.h
Date: Tue,  8 Dec 2020 00:55:39 +0100
Message-Id: <20201207235539.4070364-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract FPU specific definitions that can be used by
ISA / ASE / extensions to fpu_translate.h header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu_translate.h | 71 +++++++++++++++++++++++++++++++++++++
 target/mips/translate.c     | 70 ------------------------------------
 2 files changed, 71 insertions(+), 70 deletions(-)

diff --git a/target/mips/fpu_translate.h b/target/mips/fpu_translate.h
index 430e0b77537..f45314d2ec2 100644
--- a/target/mips/fpu_translate.h
+++ b/target/mips/fpu_translate.h
@@ -12,6 +12,77 @@
 #include "exec/translator.h"
 #include "translate.h"
 
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
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index bc54eb58c70..80c9c17819f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -49,7 +49,6 @@ enum {
     OPC_SPECIAL  = (0x00 << 26),
     OPC_REGIMM   = (0x01 << 26),
     OPC_CP0      = (0x10 << 26),
-    OPC_CP1      = (0x11 << 26),
     OPC_CP2      = (0x12 << 26),
     OPC_CP3      = (0x13 << 26),
     OPC_SPECIAL2 = (0x1C << 26),
@@ -1002,75 +1001,6 @@ enum {
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


