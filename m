Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547706F5213
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tK-0003Vi-Vc; Wed, 03 May 2023 03:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tI-0003D0-1q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tF-0005Zz-Hn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46438955e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098824; x=1685690824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9F7BY8/tjc4D0n7CVX+QbLfxfw7mD7g2+tqGYuBy0c=;
 b=L3Yr3JzdQSPrQjczXUvcuCGJk84hXr16ShAEqg40fP4mCr4/ni4I/VdtjfZyDpi7yo
 LFFl6PGqvZ+96vjP0nEVy2WpIo3quadrmJ0Cu7wCKSSPJvprtLnDk9dZDQkZlI1m1uTl
 A0oEKgS923/fF99KKZm39cTKz4XlxgEzqYv5n5ALjUQyD8mjkUc+b/eZCh16OtY2cXrI
 deMeNUY6+izWvykiHafpegBJu0L6XqQTD7YFZ4nPXGYQGD/g8nPTPvXKPKNk4OOr9/rH
 ADk8D722VFhGpiVPFK5+pkG74+Tz5BS4B089ydOMEhhVk3+AaLealIwTJwtez0u9PVC0
 kFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098824; x=1685690824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9F7BY8/tjc4D0n7CVX+QbLfxfw7mD7g2+tqGYuBy0c=;
 b=P1aqxtgfz/gCYsf6fdHbYMARlp8F0t4WGL8mL7LRaNW6ZknHgo+ggJADvx5ny9R/AI
 QCIdgj15sCogjqtvt/jd0x9QTfBoyrEyACmx7Jj46eUHYUTeL4KpafbkApjkBYJM6mTd
 7aTzRNPTrD5Uz8OGEARi4yQsNqubY4F0xu540cTgATh8ZopryJUAPhuKnnxiDzOWFD7V
 b+dQsRpAu79pmP9uIiCPeDBmoy8APdKkJKP4yyWV3Nk4BobogSL+pUFIRwfVM+v6XT0L
 5muwC4Ads4mJjgIl7qfCFCg1PyuFv9QU9CEpva79FunsDT3Cn3KKQwLajPIf9czXaTTE
 SkeA==
X-Gm-Message-State: AC+VfDxeYMZvGXfpnv19Pre9g4RzVXfDibbizY7ywdFYBZKrAhUiIWNS
 HxwQIkGF8FeEwEwSdeCw6FfKRcdWlVzKPYUpqRCCtA==
X-Google-Smtp-Source: ACHHUZ6TKpVm5HuRaJQY9q/RaG6J8KhHV0l/Lb2G5upIe+S2szjfuENZgXj/hiAd8QAnVVwJ+Azt3g==
X-Received: by 2002:a7b:c4cd:0:b0:3f1:9b77:f581 with SMTP id
 g13-20020a7bc4cd000000b003f19b77f581mr13720178wmk.33.1683098823588; 
 Wed, 03 May 2023 00:27:03 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 40/84] tcg: Split out tcg-target-reg-bits.h
Date: Wed,  3 May 2023 08:22:47 +0100
Message-Id: <20230503072331.1747057-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

Often, the only thing we need to know about the TCG host
is the register size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h                     | 12 +-----------
 tcg/aarch64/tcg-target-reg-bits.h     | 12 ++++++++++++
 tcg/arm/tcg-target-reg-bits.h         | 12 ++++++++++++
 tcg/i386/tcg-target-reg-bits.h        | 16 ++++++++++++++++
 tcg/i386/tcg-target.h                 |  2 --
 tcg/loongarch64/tcg-target-reg-bits.h | 21 +++++++++++++++++++++
 tcg/loongarch64/tcg-target.h          | 11 -----------
 tcg/mips/tcg-target-reg-bits.h        | 18 ++++++++++++++++++
 tcg/mips/tcg-target.h                 |  8 --------
 tcg/ppc/tcg-target-reg-bits.h         | 16 ++++++++++++++++
 tcg/ppc/tcg-target.h                  |  5 -----
 tcg/riscv/tcg-target-reg-bits.h       | 19 +++++++++++++++++++
 tcg/riscv/tcg-target.h                |  9 ---------
 tcg/s390x/tcg-target-reg-bits.h       | 17 +++++++++++++++++
 tcg/sparc64/tcg-target-reg-bits.h     | 12 ++++++++++++
 tcg/tci/tcg-target-reg-bits.h         | 18 ++++++++++++++++++
 tcg/tci/tcg-target.h                  |  8 --------
 tcg/s390x/tcg-target.c.inc            |  5 -----
 18 files changed, 162 insertions(+), 59 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-reg-bits.h
 create mode 100644 tcg/arm/tcg-target-reg-bits.h
 create mode 100644 tcg/i386/tcg-target-reg-bits.h
 create mode 100644 tcg/loongarch64/tcg-target-reg-bits.h
 create mode 100644 tcg/mips/tcg-target-reg-bits.h
 create mode 100644 tcg/ppc/tcg-target-reg-bits.h
 create mode 100644 tcg/riscv/tcg-target-reg-bits.h
 create mode 100644 tcg/s390x/tcg-target-reg-bits.h
 create mode 100644 tcg/sparc64/tcg-target-reg-bits.h
 create mode 100644 tcg/tci/tcg-target-reg-bits.h

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 57ea0b7d1d..0999847b84 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -32,6 +32,7 @@
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
 #include "tcg/tcg-mo.h"
+#include "tcg-target-reg-bits.h"
 #include "tcg-target.h"
 #include "tcg/tcg-cond.h"
 #include "tcg/debug-assert.h"
@@ -44,17 +45,6 @@
 #define CPU_TEMP_BUF_NLONGS 128
 #define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
-/* Default target word size to pointer size.  */
-#ifndef TCG_TARGET_REG_BITS
-# if UINTPTR_MAX == UINT32_MAX
-#  define TCG_TARGET_REG_BITS 32
-# elif UINTPTR_MAX == UINT64_MAX
-#  define TCG_TARGET_REG_BITS 64
-# else
-#  error Unknown pointer size for tcg target
-# endif
-#endif
-
 #if TCG_TARGET_REG_BITS == 32
 typedef int32_t tcg_target_long;
 typedef uint32_t tcg_target_ulong;
diff --git a/tcg/aarch64/tcg-target-reg-bits.h b/tcg/aarch64/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..3b57a1aafb
--- /dev/null
+++ b/tcg/aarch64/tcg-target-reg-bits.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2023 Linaro
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#define TCG_TARGET_REG_BITS  64
+
+#endif
diff --git a/tcg/arm/tcg-target-reg-bits.h b/tcg/arm/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..23b7730a8d
--- /dev/null
+++ b/tcg/arm/tcg-target-reg-bits.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2023 Linaro
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#define TCG_TARGET_REG_BITS  32
+
+#endif
diff --git a/tcg/i386/tcg-target-reg-bits.h b/tcg/i386/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..aa386050eb
--- /dev/null
+++ b/tcg/i386/tcg-target-reg-bits.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#ifdef __x86_64__
+# define TCG_TARGET_REG_BITS  64
+#else
+# define TCG_TARGET_REG_BITS  32
+#endif
+
+#endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 9b2ac34015..7f5b23f6ee 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -28,11 +28,9 @@
 #define TCG_TARGET_INSN_UNIT_SIZE  1
 
 #ifdef __x86_64__
-# define TCG_TARGET_REG_BITS  64
 # define TCG_TARGET_NB_REGS   32
 # define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #else
-# define TCG_TARGET_REG_BITS  32
 # define TCG_TARGET_NB_REGS   24
 # define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
 #endif
diff --git a/tcg/loongarch64/tcg-target-reg-bits.h b/tcg/loongarch64/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..51373ad70a
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-reg-bits.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+/*
+ * Loongson removed the (incomplete) 32-bit support from kernel and toolchain
+ * for the initial upstreaming of this architecture, so don't bother and just
+ * support the LP64* ABI for now.
+ */
+#if defined(__loongarch64)
+# define TCG_TARGET_REG_BITS 64
+#else
+# error unsupported LoongArch register size
+#endif
+
+#endif
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 482901ac15..26f1aab780 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -29,17 +29,6 @@
 #ifndef LOONGARCH_TCG_TARGET_H
 #define LOONGARCH_TCG_TARGET_H
 
-/*
- * Loongson removed the (incomplete) 32-bit support from kernel and toolchain
- * for the initial upstreaming of this architecture, so don't bother and just
- * support the LP64* ABI for now.
- */
-#if defined(__loongarch64)
-# define TCG_TARGET_REG_BITS 64
-#else
-# error unsupported LoongArch register size
-#endif
-
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
 
diff --git a/tcg/mips/tcg-target-reg-bits.h b/tcg/mips/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..56fe0a725e
--- /dev/null
+++ b/tcg/mips/tcg-target-reg-bits.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2008-2009 Arnaud Patard <arnaud.patard@rtp-net.org>
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#if _MIPS_SIM == _ABIO32
+# define TCG_TARGET_REG_BITS 32
+#elif _MIPS_SIM == _ABIN32 || _MIPS_SIM == _ABI64
+# define TCG_TARGET_REG_BITS 64
+#else
+# error "Unknown ABI"
+#endif
+
+#endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index e52cdf0e89..fe4414c697 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -27,14 +27,6 @@
 #ifndef MIPS_TCG_TARGET_H
 #define MIPS_TCG_TARGET_H
 
-#if _MIPS_SIM == _ABIO32
-# define TCG_TARGET_REG_BITS 32
-#elif _MIPS_SIM == _ABIN32 || _MIPS_SIM == _ABI64
-# define TCG_TARGET_REG_BITS 64
-#else
-# error "Unknown ABI"
-#endif
-
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
 
diff --git a/tcg/ppc/tcg-target-reg-bits.h b/tcg/ppc/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..0efa80e7e0
--- /dev/null
+++ b/tcg/ppc/tcg-target-reg-bits.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#ifdef _ARCH_PPC64
+# define TCG_TARGET_REG_BITS  64
+#else
+# define TCG_TARGET_REG_BITS  32
+#endif
+
+#endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 40f20b0c1a..c7552b6391 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -25,11 +25,6 @@
 #ifndef PPC_TCG_TARGET_H
 #define PPC_TCG_TARGET_H
 
-#ifdef _ARCH_PPC64
-# define TCG_TARGET_REG_BITS  64
-#else
-# define TCG_TARGET_REG_BITS  32
-#endif
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 #define TCG_TARGET_NB_REGS 64
diff --git a/tcg/riscv/tcg-target-reg-bits.h b/tcg/riscv/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..761ca0d774
--- /dev/null
+++ b/tcg/riscv/tcg-target-reg-bits.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2018 SiFive, Inc
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+/*
+ * We don't support oversize guests.
+ * Since we will only build tcg once, this in turn requires a 64-bit host.
+ */
+#if __riscv_xlen != 64
+#error "unsupported code generation mode"
+#endif
+#define TCG_TARGET_REG_BITS 64
+
+#endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ffb3d9b5b4..d23353c28e 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -25,15 +25,6 @@
 #ifndef RISCV_TCG_TARGET_H
 #define RISCV_TCG_TARGET_H
 
-/*
- * We don't support oversize guests.
- * Since we will only build tcg once, this in turn requires a 64-bit host.
- */
-#if __riscv_xlen != 64
-#error "unsupported code generation mode"
-#endif
-#define TCG_TARGET_REG_BITS 64
-
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
diff --git a/tcg/s390x/tcg-target-reg-bits.h b/tcg/s390x/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..b01414e09d
--- /dev/null
+++ b/tcg/s390x/tcg-target-reg-bits.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2009 Ulrich Hecht <uli@suse.de>
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+/* We only support generating code for 64-bit mode.  */
+#if UINTPTR_MAX == UINT64_MAX
+# define TCG_TARGET_REG_BITS 64
+#else
+# error "unsupported code generation mode"
+#endif
+
+#endif
diff --git a/tcg/sparc64/tcg-target-reg-bits.h b/tcg/sparc64/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..34a6711013
--- /dev/null
+++ b/tcg/sparc64/tcg-target-reg-bits.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2023 Linaro
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#define TCG_TARGET_REG_BITS  64
+
+#endif
diff --git a/tcg/tci/tcg-target-reg-bits.h b/tcg/tci/tcg-target-reg-bits.h
new file mode 100644
index 0000000000..dcb1a203f8
--- /dev/null
+++ b/tcg/tci/tcg-target-reg-bits.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define target-specific register size
+ * Copyright (c) 2009, 2011 Stefan Weil
+ */
+
+#ifndef TCG_TARGET_REG_BITS_H
+#define TCG_TARGET_REG_BITS_H
+
+#if UINTPTR_MAX == UINT32_MAX
+# define TCG_TARGET_REG_BITS 32
+#elif UINTPTR_MAX == UINT64_MAX
+# define TCG_TARGET_REG_BITS 64
+#else
+# error Unknown pointer size for tci target
+#endif
+
+#endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 60a6ed65ce..37ee10c959 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -44,14 +44,6 @@
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
-#if UINTPTR_MAX == UINT32_MAX
-# define TCG_TARGET_REG_BITS 32
-#elif UINTPTR_MAX == UINT64_MAX
-# define TCG_TARGET_REG_BITS 64
-#else
-# error Unknown pointer size for tci target
-#endif
-
 /* Optional instructions. */
 
 #define TCG_TARGET_HAS_bswap16_i32      1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2c6e8d1cae..666a07decc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -24,11 +24,6 @@
  * THE SOFTWARE.
  */
 
-/* We only support generating code for 64-bit mode.  */
-#if TCG_TARGET_REG_BITS != 64
-#error "unsupported code generation mode"
-#endif
-
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "elf.h"
-- 
2.34.1


