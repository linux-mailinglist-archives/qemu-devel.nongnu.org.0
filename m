Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A006C0E68
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTd-0003nG-8R; Mon, 20 Mar 2023 06:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTV-0003lu-84
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:47 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0000DT-5a
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so8785922wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQQ9Zc32wwItU8j6zmcNnZIlm2bwTe3Yk6vCRGc6p3Q=;
 b=d1iz4ZyAc9VSuuaxtQaloQ/xZJNQISLg/wykWtreue2m4SCzoHNAaCsxZK0R/Mc/uT
 xMkSNEN1N++4Wn0poarLrbG7AJrkZ6sO5IWxRjh5i/DREBhkf3drpLojYoVZpxo+GdPL
 ZgQ02AzfSjnaoJEB0KNF/oXPZR/guCgnhBWX6oVvhVqBzeRW31oSuVAfRlxKjU8V8//z
 y4iwgcysGfSuDgRrzR0IO3BrcLawQVVPdEC9SBr+h6tjebtqDOVdCguOJ9p3twU+LpuF
 +CMMirpoRQz+FvC4+2oRbsMFM2VFw+PrBC7nJ+SxVkNxCp0A0O0qbwX+2HthPdHV1BG6
 FYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQQ9Zc32wwItU8j6zmcNnZIlm2bwTe3Yk6vCRGc6p3Q=;
 b=KGyziOE621E6lVulxZmB82Q+ybfxiOOj1dCdr0jwvJGgSGpZGK2Z6nqffStuaWtRzN
 f7NnP1m5WFY6D5mQPMrRI85wYlH9GONd3dYpMYbp1Sx5xE1E89Ivd5Ar11a0nrxo11iU
 3zNm2GKP6F65EvZr6QOU70/8IGY0m42p/JS8u6E9j4ngSPf+XHWnYW6SzlU4QFcPW182
 b4w5jqKYf2Y4tWi5q+YsHJKc2vVZ4/T3ZFXeK8rfWz096A6DHVEgN2QmgRV46goDSvar
 eYvSYAxqR8bsZ9P6FjUFcpJcayz0QFExexjWuR0LukRhODMVUcY5kzc0gNYkGOm1GTmg
 zshg==
X-Gm-Message-State: AO0yUKUobwzKWCmUn1DeHAnLCtbJCxvhJard9voeBSvWFjqovWkS3dcA
 MGejTIQfQP1Fd51YCCKG3Ll9MJ6otoxtwFjvCOY=
X-Google-Smtp-Source: AK7set/fMdHrDiGBA2gu+vv2w9mh2USEnFR7VbP8c2zzpPLDiEEascDw3vQ3sQsPK+XPA5Y0qx+4/g==
X-Received: by 2002:a05:600c:2215:b0:3ed:f5f3:5e64 with SMTP id
 z21-20020a05600c221500b003edf5f35e64mr2209147wml.16.1679307040233; 
 Mon, 20 Mar 2023 03:10:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003eda745f35esm7319581wmq.34.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 745291FFBE;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 06/10] includes: move irq definitions out of cpu-all.h
Date: Mon, 20 Mar 2023 10:10:31 +0000
Message-Id: <20230320101035.2214196-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These are common across all versions of the system so it would help if
we could use them for common code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/cpu-all.h | 52 +-------------------------
 include/exec/cpu-irq.h | 83 ++++++++++++++++++++++++++++++++++++++++++
 include/exec/poison.h  | 13 -------
 3 files changed, 84 insertions(+), 64 deletions(-)
 create mode 100644 include/exec/cpu-irq.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2eb1176538..6b8085cf19 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -297,57 +297,7 @@ void *page_get_target_data(target_ulong address)
 
 CPUArchState *cpu_copy(CPUArchState *env);
 
-/* Flags for use in ENV->INTERRUPT_PENDING.
-
-   The numbers assigned here are non-sequential in order to preserve
-   binary compatibility with the vmstate dump.  Bit 0 (0x0001) was
-   previously used for CPU_INTERRUPT_EXIT, and is cleared when loading
-   the vmstate dump.  */
-
-/* External hardware interrupt pending.  This is typically used for
-   interrupts from devices.  */
-#define CPU_INTERRUPT_HARD        0x0002
-
-/* Exit the current TB.  This is typically used when some system-level device
-   makes some change to the memory mapping.  E.g. the a20 line change.  */
-#define CPU_INTERRUPT_EXITTB      0x0004
-
-/* Halt the CPU.  */
-#define CPU_INTERRUPT_HALT        0x0020
-
-/* Debug event pending.  */
-#define CPU_INTERRUPT_DEBUG       0x0080
-
-/* Reset signal.  */
-#define CPU_INTERRUPT_RESET       0x0400
-
-/* Several target-specific external hardware interrupts.  Each target/cpu.h
-   should define proper names based on these defines.  */
-#define CPU_INTERRUPT_TGT_EXT_0   0x0008
-#define CPU_INTERRUPT_TGT_EXT_1   0x0010
-#define CPU_INTERRUPT_TGT_EXT_2   0x0040
-#define CPU_INTERRUPT_TGT_EXT_3   0x0200
-#define CPU_INTERRUPT_TGT_EXT_4   0x1000
-
-/* Several target-specific internal interrupts.  These differ from the
-   preceding target-specific interrupts in that they are intended to
-   originate from within the cpu itself, typically in response to some
-   instruction being executed.  These, therefore, are not masked while
-   single-stepping within the debugger.  */
-#define CPU_INTERRUPT_TGT_INT_0   0x0100
-#define CPU_INTERRUPT_TGT_INT_1   0x0800
-#define CPU_INTERRUPT_TGT_INT_2   0x2000
-
-/* First unused bit: 0x4000.  */
-
-/* The set of all bits that should be masked when single-stepping.  */
-#define CPU_INTERRUPT_SSTEP_MASK \
-    (CPU_INTERRUPT_HARD          \
-     | CPU_INTERRUPT_TGT_EXT_0   \
-     | CPU_INTERRUPT_TGT_EXT_1   \
-     | CPU_INTERRUPT_TGT_EXT_2   \
-     | CPU_INTERRUPT_TGT_EXT_3   \
-     | CPU_INTERRUPT_TGT_EXT_4)
+#include "exec/cpu-irq.h"
 
 #ifdef CONFIG_USER_ONLY
 
diff --git a/include/exec/cpu-irq.h b/include/exec/cpu-irq.h
new file mode 100644
index 0000000000..58bd98d812
--- /dev/null
+++ b/include/exec/cpu-irq.h
@@ -0,0 +1,83 @@
+/*
+ * Internal execution defines for qemu irqs
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef EXEC_CPU_IRQ_H
+#define EXEC_CPU_IRQ_H
+
+/*
+ * Flags for use in ENV->INTERRUPT_PENDING.
+ *
+ * The numbers assigned here are non-sequential in order to preserve
+ * binary compatibility with the vmstate dump.  Bit 0 (0x0001) was
+ * previously used for CPU_INTERRUPT_EXIT, and is cleared when loading
+ * the vmstate dump.
+ */
+
+/*
+ * External hardware interrupt pending.  This is typically used for
+ * interrupts from devices.
+ */
+#define CPU_INTERRUPT_HARD        0x0002
+
+/*
+ * Exit the current TB.  This is typically used when some system-level device
+ * makes some change to the memory mapping.  E.g. the a20 line change.
+ */
+#define CPU_INTERRUPT_EXITTB      0x0004
+
+/* Halt the CPU.  */
+#define CPU_INTERRUPT_HALT        0x0020
+
+/* Debug event pending.  */
+#define CPU_INTERRUPT_DEBUG       0x0080
+
+/* Reset signal.  */
+#define CPU_INTERRUPT_RESET       0x0400
+
+/* Several target-specific external hardware interrupts.  Each target/cpu.h
+   should define proper names based on these defines.  */
+#define CPU_INTERRUPT_TGT_EXT_0   0x0008
+#define CPU_INTERRUPT_TGT_EXT_1   0x0010
+#define CPU_INTERRUPT_TGT_EXT_2   0x0040
+#define CPU_INTERRUPT_TGT_EXT_3   0x0200
+#define CPU_INTERRUPT_TGT_EXT_4   0x1000
+
+/*
+ * Several target-specific internal interrupts. These differ from the
+ * preceding target-specific interrupts in that they are intended to
+ * originate from within the cpu itself, typically in response to some
+ * instruction being executed. These, therefore, are not masked while
+ * single-stepping within the debugger.
+ */
+#define CPU_INTERRUPT_TGT_INT_0   0x0100
+#define CPU_INTERRUPT_TGT_INT_1   0x0800
+#define CPU_INTERRUPT_TGT_INT_2   0x2000
+
+/* First unused bit: 0x4000.  */
+
+/* The set of all bits that should be masked when single-stepping.  */
+#define CPU_INTERRUPT_SSTEP_MASK \
+    (CPU_INTERRUPT_HARD          \
+     | CPU_INTERRUPT_TGT_EXT_0   \
+     | CPU_INTERRUPT_TGT_EXT_1   \
+     | CPU_INTERRUPT_TGT_EXT_2   \
+     | CPU_INTERRUPT_TGT_EXT_3   \
+     | CPU_INTERRUPT_TGT_EXT_4)
+
+#endif /* EXEC_CPU_IRQ_H */
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 140daa4a85..a0ab1d7d46 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -52,19 +52,6 @@
 #pragma GCC poison TARGET_PAGE_BITS
 #pragma GCC poison TARGET_PAGE_ALIGN
 
-#pragma GCC poison CPU_INTERRUPT_HARD
-#pragma GCC poison CPU_INTERRUPT_EXITTB
-#pragma GCC poison CPU_INTERRUPT_HALT
-#pragma GCC poison CPU_INTERRUPT_DEBUG
-#pragma GCC poison CPU_INTERRUPT_TGT_EXT_0
-#pragma GCC poison CPU_INTERRUPT_TGT_EXT_1
-#pragma GCC poison CPU_INTERRUPT_TGT_EXT_2
-#pragma GCC poison CPU_INTERRUPT_TGT_EXT_3
-#pragma GCC poison CPU_INTERRUPT_TGT_EXT_4
-#pragma GCC poison CPU_INTERRUPT_TGT_INT_0
-#pragma GCC poison CPU_INTERRUPT_TGT_INT_1
-#pragma GCC poison CPU_INTERRUPT_TGT_INT_2
-
 #pragma GCC poison CONFIG_ALPHA_DIS
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
-- 
2.39.2


