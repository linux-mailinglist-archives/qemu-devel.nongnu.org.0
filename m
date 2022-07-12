Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB4F572823
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:59:21 +0200 (CEST)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMyW-0005pQ-9c
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtK-0005XF-Hy
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:53:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtI-0007BV-Tg
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:53:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f2so12811689wrr.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZeKd30uXDD2u7caEAZvAgkfkGAizPt8kDexSBBg7D0=;
 b=PPzu0lXO2AG0qi+mIwXWA3W8tyOQhdjdUvdHMH2u1Y4GilSW6aa2E+FJ7EPMuo9mWb
 Qi9FFq1+Q1sVYkqouv2fINoF7iPIaaCljJ2OUYocU/e543t84yn+q/ETVCnX149wBM0e
 adXdIgeulFT2g2iZw0K+n7/u72gPWtro1VS/5Ddhfz9SO1YAoYm12mJwrDYS+0mV640W
 T6x/+hSr7K7UVn9KHtSNmFjMSY3bigoqvNjP4JxtKUVH19WzW4+wVyBMJYDPFzooJLB0
 W3kReDdljZu7IukD7hUWtsnLzEk3OJcBeEy7Xm2mzcWrM7aIo7EdRaEonT5rfugOBSff
 Mn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gZeKd30uXDD2u7caEAZvAgkfkGAizPt8kDexSBBg7D0=;
 b=n6gjdYVCaJgCi7thmGbjPeQhrhYyNycz7brU73qwI73tOiFLpZagfcVF92ujaR6/rT
 1aVKJAL2/xFKfFTQZ1J3L4lhRZEkrhcSz3XPLbsbGjtbo83aV3tsj/qH08X6FtEwRHBK
 9JVG4M2NvhYZ9vVhLaU4PNjtWwkiDYKGFPy9XLU7LVTL5n0RPn7rDqs3dmo7pKh0Oawo
 TeKmqsCJyaUcbElysGMYbqU3bhhnoZplH85asyeYEr+dp4yYWGJ0M3y/wsyA7zm3BeoF
 NoHtBvH3rNskEDAA2H1dRP+H6S6FkT6d2UAsKUzKEqQlXMFc6SB/LZdang9znUkRaV14
 ofMg==
X-Gm-Message-State: AJIora9nLYeA7cPesjNUrsCKozzFH3cyqjBWqo947yLgsVYF/XX+pqNi
 Lmb0N1x97VCyhEJKNuKVENF6Ty1yFTRLjYLM
X-Google-Smtp-Source: AGRyM1t+vOQ/CZrIpnwvG95imFM/tUoD5xlklrDOmssRwoo5prSvmOdvgfTE1fPRA4eH1WkHcOPnAg==
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr10268492wry.97.1657659235286; 
 Tue, 12 Jul 2022 13:53:55 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o38-20020a05600c512600b003a2e2e965absm54548wms.20.2022.07.12.13.53.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:53:54 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/12] target/mips: introduce decodetree structure for Cavium
 Octeon extension
Date: Tue, 12 Jul 2022 22:53:36 +0200
Message-Id: <20220712205347.58372-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds decodetree for Cavium Octeon extension and
an instruction set extension flag for using it in CPU models.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165572672162.167724.13656301229517693806.stgit@pasha-ThinkPad-X280>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h            |  1 +
 target/mips/tcg/meson.build        |  2 ++
 target/mips/tcg/octeon.decode      |  6 ++++++
 target/mips/tcg/octeon_translate.c | 16 ++++++++++++++++
 target/mips/tcg/translate.c        |  5 +++++
 target/mips/tcg/translate.h        |  1 +
 6 files changed, 31 insertions(+)
 create mode 100644 target/mips/tcg/octeon.decode
 create mode 100644 target/mips/tcg/octeon_translate.c

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 0a12d982a7..a6cebe0265 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -42,6 +42,7 @@
 #define INSN_LOONGSON2E   0x0000040000000000ULL
 #define INSN_LOONGSON2F   0x0000080000000000ULL
 #define INSN_LOONGSON3A   0x0000100000000000ULL
+#define INSN_OCTEON       0x0000200000000000ULL
 /*
  *   bits 52-63: vendor-specific ASEs
  */
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 98003779ae..7ee969ec8f 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -3,6 +3,7 @@ gen = [
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
   decodetree.process('vr54xx.decode', extra_args: '--decode=decode_ext_vr54xx'),
+  decodetree.process('octeon.decode', extra_args: '--decode=decode_ext_octeon'),
 ]
 
 mips_ss.add(gen)
@@ -24,6 +25,7 @@ mips_ss.add(files(
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
+  'octeon_translate.c',
 ), if_false: files(
   'mxu_translate.c',
 ))
diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
new file mode 100644
index 0000000000..b21c735a6c
--- /dev/null
+++ b/target/mips/tcg/octeon.decode
@@ -0,0 +1,6 @@
+# Octeon Architecture Module instruction set
+#
+# Copyright (C) 2022 Pavel Dovgalyuk
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
new file mode 100644
index 0000000000..8b5eb1a823
--- /dev/null
+++ b/target/mips/tcg/octeon_translate.c
@@ -0,0 +1,16 @@
+/*
+ * Octeon-specific instructions translation routines
+ *
+ *  Copyright (c) 2022 Pavel Dovgalyuk
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/helper-gen.h"
+#include "translate.h"
+
+/* Include the auto-generated decoder.  */
+#include "decode-octeon.c.inc"
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index d9d7692765..1f6a779808 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15955,6 +15955,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, INSN_VR54XX) && decode_ext_vr54xx(ctx, ctx->opcode)) {
         return;
     }
+#if defined(TARGET_MIPS64)
+    if (cpu_supports_isa(env, INSN_OCTEON) && decode_ext_octeon(ctx, ctx->opcode)) {
+        return;
+    }
+#endif
 
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 9997fe2f3c..55053226ae 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -215,6 +215,7 @@ bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
 bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 #if defined(TARGET_MIPS64)
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
+bool decode_ext_octeon(DisasContext *ctx, uint32_t insn);
 #endif
 bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
 
-- 
2.36.1


