Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0D700A99
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:45:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxM-0006mI-JB; Fri, 12 May 2023 10:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxJ-0006lN-JJ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxF-0004h9-U4
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315735514so324552785e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902468; x=1686494468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Asur4oBWLh7C1YKCBKndI9D3ErAPKyBAV+JBqkyMkBU=;
 b=Ax819hNIliVjuh/il22qMR3yZBCvRTG3LajZ7fBZNRrHgMWGJ6kzDBKup18jcZtfhD
 bWnt8jNLpvioBsFvufZTooW6A6df67oOn1WA56pTTrgqIIuVA88hc+sCeLZBQvyfG3ay
 oR0n+w3WmY4iXfDI9kiDwZafA8ymGbkQ1kJr1KIOFD7C2/zjFMOX/YD63FDpWACw/+Fn
 Wju/XBv34zsIsrkGlk6Fm2a7tcBNUCpgt2SU1xlQ2KR1NQnY0s1PGLvUPyTJRyCj7a8d
 lsRZtOJbgqDjdT6vUaSbVPm5ZgJlymE7KiI0/oet8HWFhK3TbeQusvCMwBhHFFcfPu2X
 /Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902468; x=1686494468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Asur4oBWLh7C1YKCBKndI9D3ErAPKyBAV+JBqkyMkBU=;
 b=kbNd2Iq+fDhiK3ysELaDV2yOttn5+B8wh864zFOnFbGI/H095YF7I8tFylhCVk8J9h
 kqdxrtREFOhFj55WbmKa15Lmr0XoY83yrsfFmsWDCGsji+bVt8O7FmPiwXZl+YBsQVKk
 pBViEIvD10WDPr/XhKnf7+zfVoG1PSB2PyOAQZuUEiYeOz2/ZNKYXNxSNxo35PNO66uu
 yQwkAWpm7FfDhsKLLZRYZt2R5PGH+gSRezNs4LHcWsN7+tSs4gaE9+BuCisrgMHWUBpZ
 049UkqVBPqmySkZEChLxRdzZf7bPPbqE2PShgEScWeBGHV1s7rzUlVF7kidG5lcBXt+C
 DCsw==
X-Gm-Message-State: AC+VfDzTaXM0RMDs8ViSRXJI+m4IDpU7CVcVfPadtP21byUv0Ycz1s15
 87/7USyPzVIBDX4G8dxxXJv35w==
X-Google-Smtp-Source: ACHHUZ7jOFaYurAN8lD+T3+tDznnweitlBjJAE3PZMlyCifFxYF5fZanPZOhy/cvIBFUbTsvZi5nPw==
X-Received: by 2002:a05:600c:4f45:b0:3f4:2bcf:e19 with SMTP id
 m5-20020a05600c4f4500b003f42bcf0e19mr9035797wmq.8.1683902468514; 
 Fri, 12 May 2023 07:41:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/20] target/arm: Create decodetree skeleton for A64
Date: Fri, 12 May 2023 15:40:48 +0100
Message-Id: <20230512144106.3608981-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The A64 translator uses a hand-written decoder for everything except
SVE or SME.  It's fairly well structured, but it's becoming obvious
that it's still more painful to add instructions to than the A32
translator, because putting a new instruction into the right place in
a hand-written decoder is much harder than adding new instruction
patterns to a decodetree file.

As the first step in conversion to decodetree, create the skeleton of
the decodetree decoder; where it does not handle instructions we will
fall back to the legacy decoder (which will be for everything at the
moment, since there are no patterns in a64.decode).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 20 ++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 18 +++++++++++-------
 target/arm/tcg/meson.build     |  1 +
 3 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 target/arm/tcg/a64.decode

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
new file mode 100644
index 00000000000..43321bbbb05
--- /dev/null
+++ b/target/arm/tcg/a64.decode
@@ -0,0 +1,20 @@
+# AArch64 A64 allowed instruction decoding
+#
+#  Copyright (c) 2023 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8a0ede96440..7862e9dd4e3 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -56,6 +56,13 @@ enum a64_shift_type {
     A64_SHIFT_TYPE_ROR = 3
 };
 
+/*
+ * Include the generated decoders.
+ */
+
+#include "decode-sme-fa64.c.inc"
+#include "decode-a64.c.inc"
+
 /* Table based decoder typedefs - used when the relevant bits for decode
  * are too awkwardly scattered across the instruction (eg SIMD).
  */
@@ -14100,12 +14107,6 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-/*
- * Include the generated SME FA64 decoder.
- */
-
-#include "decode-sme-fa64.c.inc"
-
 static bool trans_OK(DisasContext *s, arg_OK *a)
 {
     return true;
@@ -14444,7 +14445,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         disas_sme_fa64(s, insn);
     }
 
-    disas_a64_legacy(s, insn);
+
+    if (!disas_a64(s, insn)) {
+        disas_a64_legacy(s, insn);
+    }
 
     /*
      * After execution of most insns, btype is reset to 0.
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 4d99f6dacb3..130ed62fcd7 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -13,6 +13,7 @@ gen = [
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
+  decodetree.process('a64.decode', extra_args: ['--static-decode=disas_a64']),
 ]
 
 arm_ss.add(gen)
-- 
2.34.1


