Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA2612D85
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGq2-00075X-61; Sun, 30 Oct 2022 18:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpz-0006qX-En
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpx-0008Bd-L0
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id 5so6234793wmo.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78GzyGFEMH2M2sCxvMXcou2KqVZiNLCYi4vOv1w4erk=;
 b=a8tjl+YqIWKQq4+Nrey+B3AtZZozXOYPyOXmT7HKBcHf92oUlYhsJHj3UK18J8pXhs
 PAO76hjb7wuFP8iUhlT+E9Pzn6LJEeC7mn7C7a9a0C2AHAyWQ4GWoksakeSkEenpou26
 q5n8ZYdWLedML1VoFLlVgISJDFNfpGV3xPaT90wJG1pw0z5tFK5YfLpxtyxqISMXAv84
 prBb503/RE3Jbw8lv1arbaVQNlsQTyqPGk3nCNsoGKL97D90Vij4CWxIOri+GHgKCTNe
 DivTiB6kfDjW4eQ/A3LjAaxaP/vxj2j0KlIhfCrrCA96OsV1vIO5RyWkKCMsXtAnJjeN
 a3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78GzyGFEMH2M2sCxvMXcou2KqVZiNLCYi4vOv1w4erk=;
 b=QI3cwiURD1JRbnNVHM8kQz1q0IqewfFa17+KmSWJL6lyaaFXTzIhjm/HKVBeTgAv8b
 tRQ6FvX5e26Y0aY1tALqKWh/buWMexDZtDvu5CIOjmi+fg0LtnYtdXOdHGse55STf4Hi
 WayO6eQdl2FNe3emCba1nSWPlw7U0yH+FpOpn8E61IXaJtE6XZ+6U/0UJCiqVSh+RrVF
 4sX7IB5nzN5jR4gGZSwDay7h7tNn2NHPBQ31SwnpI2Fwu7th+xHGXO72/pGP57i4k1GN
 I1LMujq5Yh4ZdlHo5RZDMIILgNnGPKwRkSzKjv0wj30VhW7kNFZfBhZiOF9c01bBKZo0
 6goA==
X-Gm-Message-State: ACrzQf3Mw5SmhobBMOqjsxwhdYcSctC1XemK7WU4wwSXJUGxYCR+wukH
 FZ/rFq/z+ga2ukpI9xgK10ntJmFY8LSV7w==
X-Google-Smtp-Source: AMsMyM5bKHiBAWC2nOoCRoQ+bkbVYSy3XuaEJGP6LA5FbbP4fGTyoXXMdlaJa8rnUdEuEyV0CP5Buw==
X-Received: by 2002:a05:600c:4ed2:b0:3c6:c1ff:222 with SMTP id
 g18-20020a05600c4ed200b003c6c1ff0222mr5955721wmq.163.1667169084104; 
 Sun, 30 Oct 2022 15:31:24 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003cf55844453sm5736540wmp.22.2022.10.30.15.31.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/55] disas/nanomips: Move typedefs etc to nanomips.cpp
Date: Sun, 30 Oct 2022 23:28:10 +0100
Message-Id: <20221030222841.42377-25-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

The following is moved from the nanomips.h to nanomips.cpp file:
- #include line
- typedefs
- enums
- definition of the Pool struct.
Header file nanomips.h will be deleted to be consistent with the rest of
the disas/ code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-11-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 57 +++++++++++++++++++++++++++++++++++++++++++++-
 disas/nanomips.h   | 57 ----------------------------------------------
 2 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 0d67462e5d..7d09fd1a69 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -36,7 +36,62 @@
 #include <stdio.h>
 #include <stdarg.h>
 
-#include "nanomips.h"
+#include <string>
+
+typedef int64_t int64;
+typedef uint64_t uint64;
+typedef uint32_t uint32;
+typedef uint16_t uint16;
+typedef uint64_t img_address;
+
+enum TABLE_ENTRY_TYPE {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+};
+
+enum TABLE_ATTRIBUTE_TYPE {
+    MIPS64_    = 0x00000001,
+    XNP_       = 0x00000002,
+    XMMS_      = 0x00000004,
+    EVA_       = 0x00000008,
+    DSP_       = 0x00000010,
+    MT_        = 0x00000020,
+    EJTAG_     = 0x00000040,
+    TLBINV_    = 0x00000080,
+    CP0_       = 0x00000100,
+    CP1_       = 0x00000200,
+    CP2_       = 0x00000400,
+    UDI_       = 0x00000800,
+    MCU_       = 0x00001000,
+    VZ_        = 0x00002000,
+    TLB_       = 0x00004000,
+    MVH_       = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+};
+
+typedef struct Dis_info {
+  img_address m_pc;
+} Dis_info;
+
+typedef bool (*conditional_function)(uint64 instruction);
+typedef std::string (*disassembly_function)(uint64 instruction,
+                                            Dis_info *info);
+
+typedef struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    const struct Pool    *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+} Pool;
 
 #define IMGASSERTONCE(test)
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 47b44af751..0fd7299900 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -23,61 +23,4 @@
 #ifndef DISAS_NANOMIPS_H
 #define DISAS_NANOMIPS_H
 
-#include <string>
-
-typedef int64_t int64;
-typedef uint64_t uint64;
-typedef uint32_t uint32;
-typedef uint16_t uint16;
-typedef uint64_t img_address;
-
-enum TABLE_ENTRY_TYPE {
-    instruction,
-    call_instruction,
-    branch_instruction,
-    return_instruction,
-    reserved_block,
-    pool,
-};
-
-enum TABLE_ATTRIBUTE_TYPE {
-    MIPS64_    = 0x00000001,
-    XNP_       = 0x00000002,
-    XMMS_      = 0x00000004,
-    EVA_       = 0x00000008,
-    DSP_       = 0x00000010,
-    MT_        = 0x00000020,
-    EJTAG_     = 0x00000040,
-    TLBINV_    = 0x00000080,
-    CP0_       = 0x00000100,
-    CP1_       = 0x00000200,
-    CP2_       = 0x00000400,
-    UDI_       = 0x00000800,
-    MCU_       = 0x00001000,
-    VZ_        = 0x00002000,
-    TLB_       = 0x00004000,
-    MVH_       = 0x00008000,
-    ALL_ATTRIBUTES = 0xffffffffull,
-};
-
-typedef struct Dis_info {
-  img_address m_pc;
-} Dis_info;
-
-typedef bool (*conditional_function)(uint64 instruction);
-typedef std::string (*disassembly_function)(uint64 instruction,
-                                            Dis_info *info);
-
-typedef struct Pool {
-    TABLE_ENTRY_TYPE     type;
-    const struct Pool    *next_table;
-    int                  next_table_size;
-    int                  instructions_size;
-    uint64               mask;
-    uint64               value;
-    disassembly_function disassembly;
-    conditional_function condition;
-    uint64               attributes;
-} Pool;
-
 #endif
-- 
2.37.3


