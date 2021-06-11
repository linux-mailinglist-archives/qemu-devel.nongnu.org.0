Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B93A4B85
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:58:51 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr34-0002r3-WF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqml-0002k2-T6
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:59 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmi-0002gT-Np
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:59 -0400
Received: by mail-pg1-x534.google.com with SMTP id t9so3667591pgn.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8HsYggvbdO2XX20gPsB7M9d1CYcUQ1Rbefdqb0m3BAQ=;
 b=WgpGzuPGbGWB9yCqw8OF/kAfulQuoAP69/26JjEdl9iUcocP2v7Nv3I4egLVtN4oD/
 2ZY6VMMdC1HGTFxfLmNVUBLVz6sE7rWYsULgApMZbv1iTUAh5sksdA1XcOB6iIfYC5JF
 10qRfDx9EXwEJhmoGDDG96PVd2oHiNjkt425DVTsrWQ1fzLKrFfQFix352yPTAqQ05dy
 1ecEN4A28RfECorTcOLZxsgDWxStraJyQ3CZxFOLT3RJoaQuDadQSQGuB0eaueIJlN8o
 yzNXbYXQEfOvalbtmwE/CTmvxEjjKU8WMhme9FdVNYqiN0dGET1I1GfMKdhH+jtVHu2D
 QgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8HsYggvbdO2XX20gPsB7M9d1CYcUQ1Rbefdqb0m3BAQ=;
 b=CsCUd2a/NKhwLowYhSB3F8e98wxrKPxOuTzmRhiNaGNm1JSoXPFOZqhbVbS3GciAcS
 gtA8NRO5B0pzwne69Gv6AeOAzgzCC9Ep9XN8WyiguVwENqQa0C/dXhc4BmKYJBOE8RXF
 qImTNo3d6grtljs6yW2thMrPnIUQeKR/GpLRkSRexJzDKO8y46VMVVDcYiQ4z673r6Qo
 Kh9x/EQZyq3SiquY+8HZJzhLxm/ZGiBkaBBY+scVfxeSdZc8nnss2giEvtyc5ubk7yNc
 xSP5No4vCeVqV8nDFnnH+s9foobOC7+BKpZtXXZ9LWdPPrU6QQbG96vUYJTJgR4PAsRD
 DSGg==
X-Gm-Message-State: AOAM5333KlI61jktiQvBrc422tWeaLfxR5dop5IO4zyWdhuq0CSV1ako
 yhpLxUOErjZdzBclkkXhsTPKaVbCSvud/g==
X-Google-Smtp-Source: ABdhPJys7eXKwTYuHTHXIHH1yI54aUCz32DQ9q6V65Jg6ulDQoSYMK247pwbKWBkSYFkb0vdOiXDaw==
X-Received: by 2002:a62:78d4:0:b029:2ea:ba:234c with SMTP id
 t203-20020a6278d40000b02902ea00ba234cmr10615690pfc.53.1623454915220; 
 Fri, 11 Jun 2021 16:41:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/34] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
Date: Fri, 11 Jun 2021 16:41:26 -0700
Message-Id: <20210611234144.653682-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the ifdef ladder and move each define into the
appropriate header file.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
 tcg/region.c             | 33 +++++----------------------------
 10 files changed, 23 insertions(+), 28 deletions(-)

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
index d6222ba2db..57fd0c0c74 100644
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
index 57069a38ff..13087aa0c9 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -401,37 +401,14 @@ static size_t tcg_n_regions(unsigned max_cpus)
 /*
  * Minimum size of the code gen buffer.  This number is randomly chosen,
  * but not so small that we can't have a fair number of TB's live.
+ *
+ * Maximum size, MAX_CODE_GEN_BUFFER_SIZE, is defined in tcg-target.h.
+ * Unless otherwise indicated, this is constrained by the range of
+ * direct branches on the host cpu, as used by the TCG implementation
+ * of goto_tb.
  */
 #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
 
-/*
- * Maximum size of the code gen buffer we'd like to use.  Unless otherwise
- * indicated, this is constrained by the range of direct branches on the
- * host cpu, as used by the TCG implementation of goto_tb.
- */
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
-  /*
-   * We have a 256MB branch region, but leave room to make sure the
-   * main executable is also within that region.
-   */
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


