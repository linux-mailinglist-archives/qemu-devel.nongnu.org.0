Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB633A841
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:35:33 +0100 (CET)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYOa-0006P8-86
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH5-00069j-Qn
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:48 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH2-0008Eh-PK
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:46 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id cx5so6872619qvb.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTdpZA//9mM13rTDthBtwAtIDEdfj+iL3ziTKOJ9PhY=;
 b=U/oMvNQObUmc4BNyK+I42l5cKnXwmFQY1qu62hmCiMTfFjmfvfnfHVIE+2DrEOifZH
 qbYG0WtAI79f3n1hASrDhwRhQCbk+DFgLZlTLvA9ZaKwfarU890OgNcnPRphAu9vXlkm
 gU3sPTgDAg753rHSi6QReMhx90e413XYqn0nqs/tmpFbEOMdp8l1WPV8C1JEGdhN6J7U
 1YaYZoewX/hETJomDhYTr3gZi/F1nyr2lg+IS6D4nvNTyGAyUtDvg/ir76Uq1gq/Igek
 tA11bRu4Cd/Gq4ZEAACRR0vGzzTLVcRFDefTBsrNGcnzfQ0W6Oh1BApFy2L+7OK+2yFw
 lVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTdpZA//9mM13rTDthBtwAtIDEdfj+iL3ziTKOJ9PhY=;
 b=DAov+meqiFHUTIERzY0UgJdUvtsz2N9k2g5zeESF9qXuW5J1JuBP7ov4+8fJ1C5yYp
 3iCzGVA5magZuFeN/auwTJmILw1IpjOOzQ/0Vej+fjUysiUnZ1ufmYuF68Y3WyqHcuyS
 ctKe5q61WA7uu8WPTrRlg8VeXiF7qlIwaOlM9cQKFuiufv17/idp6tCX8AG2GM37PXku
 MQZO1eyTUgWiIrBe3HtV2OckovTq/oGLDlteZWMlgUrCmKzvOxA1kL77mpsLUa2SuG/I
 IjOnNZ7WFXeg5aqWKO8GWKt60ovzduZwrkTQm+XCOkRHC9B0oFNOpFzHfzDCZ9cD+1Qt
 h4bA==
X-Gm-Message-State: AOAM533GQiFsoF4ZfL7WiY46WLu4/79hTeebYsISuIc6N+aUytSJbxYL
 VgXF5W/twYEuK1r7cxf6dMtB+HI+9bJkWBsd
X-Google-Smtp-Source: ABdhPJwOnk0j0fA5AuDm7eUdFZLshdjzNWyFbmfDnRlYiVw+G+vvCbbLFzUFLOZjYwkhdfqEWT1gUg==
X-Received: by 2002:a05:6214:20ed:: with SMTP id
 13mr7947461qvk.34.1615757263895; 
 Sun, 14 Mar 2021 14:27:43 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/29] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
Date: Sun, 14 Mar 2021 15:27:10 -0600
Message-Id: <20210314212724.1917075-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
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
index 9c0021a26f..03cf527cb4 100644
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
index e3fbf6a7e7..ae22308290 100644
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


