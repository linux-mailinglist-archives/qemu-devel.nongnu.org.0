Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EC370FB7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:21:22 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLOr-0001kw-73
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMa-0008KZ-Sq
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMY-0002wp-QK
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id md17so2066041pjb.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3t8lsfbGKLoXDpmvXxZMx3IVfaXvb/XOOzS5SgrqqOU=;
 b=HUa+FaKAFFxqX+O2mMAhOcsqO1Gz6jdcySkRVN1/mn0qmjh50ze0TadHbLHBgPivWX
 bRFOWrom5wbTZIM7aU+USC5dLduHgMUmby2sFE3Z1Xhq9ayFQnjFFggQIZHaw0wxwmZc
 rL1QiB3LzGMGVZ2BcjUTv2/yAgBxYpMw2bRHKmMu21DVKeK19MjKVxkd+hOdyiDgVKc8
 73McT3XTZKuQjfe1UYnnslSjo8UNLj0aRY2vh1Y0ASSryHP/GngJWNiF2omreZpa9uMf
 hje9m3Yt/ynWDtKsVP0Sbx9Hw/sfjIN0tWIHb6Un2Tg9hjSmQv6ttak6uiVnPChUGVdF
 kmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3t8lsfbGKLoXDpmvXxZMx3IVfaXvb/XOOzS5SgrqqOU=;
 b=dvfp1tFbb8eM8PnsaCLsNw7BLUKonW6Z0g+Ff+OC+y+UYPz3Opm6TV6AGCZI3BKlQp
 TspUONA31C05LQscbI1Mut6sFbYy/n2a1mz3Hn2d4bf7amz7o4pTp8Zaq9jHvOfCQnHE
 QAKNW5dOn9ZMoutYd2O5sM0vH5dx5hz5JIN8qaLBCgijSyX3xIbEIPgA+dN4bhl5pQ9t
 pDk5Qd4bX7UqL6NIzwHxYFRct+j1SvVHdDx/MOxuUAmkoEECQpxtVmXoy6vD4ZznYLtM
 axb513d+Gf5+k6R4/UF7DnToifp0OoBkzH5cLgPldRgZt6ttNJMz5X+IEIVyttgRVBvK
 glCQ==
X-Gm-Message-State: AOAM532EU+p52CpJKzNXtMWabn1BaTW9vl28nzLqYwYrpxGRR3K/3Vqa
 OSbsAJtz6uCqgrnOiY0xw0vW1ELjwAZvcQ==
X-Google-Smtp-Source: ABdhPJyMKR4kr3ik6arM8XScpUpm+BDSaviWMHfYLj4BLMXgPyZHynnBe5b98JYq8ILS+IZ5NvkPuw==
X-Received: by 2002:a17:902:ea8b:b029:ed:3b25:15f7 with SMTP id
 x11-20020a170902ea8bb02900ed3b2515f7mr17288709plb.62.1619997537453; 
 Sun, 02 May 2021 16:18:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/28] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
Date: Sun,  2 May 2021 16:18:31 -0700
Message-Id: <20210502231844.1977630-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the ifdef ladder and move each define into the
appropriate header file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain comment about M_C_G_B_S constraint (balaton)
---
 tcg/aarch64/tcg-target.h |  1 +
 tcg/arm/tcg-target.h     |  1 +
 tcg/i386/tcg-target.h    |  2 ++
 tcg/mips/tcg-target.h    |  6 ++++++
 tcg/ppc/tcg-target.h     |  2 ++
 tcg/riscv/tcg-target.h   |  1 +
 tcg/s390/tcg-target.h    |  3 +++
 tcg/sparc/tcg-target.h   |  1 +
 tcg/tci/tcg-target.h     |  1 +
 tcg/region.c             | 35 +++++++++--------------------------
 10 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 5ec30dba25..ef55f7c185 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,6 +15,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
+#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..b9a85d0f83 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -60,6 +60,7 @@ extern int arm_arch;
 #undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
 
 typedef enum {
     TCG_REG_R0 = 0,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b693d3692d..ac10066c3e 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -31,9 +31,11 @@
 #ifdef __x86_64__
 # define TCG_TARGET_REG_BITS  64
 # define TCG_TARGET_NB_REGS   32
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #else
 # define TCG_TARGET_REG_BITS  32
 # define TCG_TARGET_NB_REGS   24
+# define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
 #endif
 
 typedef enum {
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c2c32fb38f..e81e824cab 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -39,6 +39,12 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define TCG_TARGET_NB_REGS 32
 
+/*
+ * We have a 256MB branch region, but leave room to make sure the
+ * main executable is also within that region.
+ */
+#define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
+
 typedef enum {
     TCG_REG_ZERO = 0,
     TCG_REG_AT,
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d1339afc66..c13ed5640a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -27,8 +27,10 @@
 
 #ifdef _ARCH_PPC64
 # define TCG_TARGET_REG_BITS  64
+# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #else
 # define TCG_TARGET_REG_BITS  32
+# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
 #endif
 
 #define TCG_TARGET_NB_REGS 64
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 727c8df418..87ea94666b 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -34,6 +34,7 @@
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
 #define TCG_TARGET_NB_REGS 32
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_ZERO,
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 641464eea4..b04b72b7eb 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -28,6 +28,9 @@
 #define TCG_TARGET_INSN_UNIT_SIZE 2
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
 
+/* We have a +- 4GB range on the branches; leave some slop.  */
+#define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
+
 typedef enum TCGReg {
     TCG_REG_R0 = 0,
     TCG_REG_R1,
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index f66f5d07dc..86bb9a2d39 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -30,6 +30,7 @@
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
 #define TCG_TARGET_NB_REGS 32
+#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 
 typedef enum {
     TCG_REG_G0 = 0,
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 52af6d8bc5..d0b5f3fa64 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -43,6 +43,7 @@
 #define TCG_TARGET_INTERPRETER 1
 #define TCG_TARGET_INSN_UNIT_SIZE 1
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 #if UINTPTR_MAX == UINT32_MAX
 # define TCG_TARGET_REG_BITS 32
diff --git a/tcg/region.c b/tcg/region.c
index 142b27276b..9a1e039824 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -398,34 +398,17 @@ static size_t tcg_n_regions(unsigned max_cpus)
 #endif
 }
 
-/* Minimum size of the code gen buffer.  This number is randomly chosen,
-   but not so small that we can't have a fair number of TB's live.  */
+/*
+ * Minimum size of the code gen buffer.  This number is randomly chosen,
+ * but not so small that we can't have a fair number of TB's live.
+ *
+ * Maximum size, MAX_CODE_GEN_BUFFER_SIZE, is defined in tcg-target.h.
+ * Unless otherwise indicated, this is constrained by the range of
+ * direct branches on the host cpu, as used by the TCG implementation
+ * of goto_tb.
+ */
 #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
 
-/* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
-   indicated, this is constrained by the range of direct branches on the
-   host cpu, as used by the TCG implementation of goto_tb.  */
-#if defined(__x86_64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__sparc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__powerpc64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__powerpc__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
-#elif defined(__aarch64__)
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#elif defined(__s390x__)
-  /* We have a +- 4GB range on the branches; leave some slop.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
-#elif defined(__mips__)
-  /* We have a 256MB branch region, but leave room to make sure the
-     main executable is also within that region.  */
-# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
-#else
-# define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
-#endif
-
 #if TCG_TARGET_REG_BITS == 32
 #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
 #ifdef CONFIG_USER_ONLY
-- 
2.25.1


