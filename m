Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612EE441F68
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:37:10 +0100 (CET)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbF7-0001GQ-Gr
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb61-0003b4-FS
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:45 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5w-0000bn-3j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:45 -0400
Received: by mail-qt1-x829.google.com with SMTP id o12so5763923qtv.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gfFeCAHNmLamMmWHeLGWsNhRmIhEPobah538FbvqWFw=;
 b=vtCCfnziXGBI1fngjf/qYZBWa10hkrTPIXRCKzMbJcvjtSpESFB74w32QC+oxngB4I
 C2qovjf7IFhKNi6000ljpdo9QAuqSZA8srGq6CO8EACvuj8mGMFNLC0YcrgD/XbbdL6a
 /QdKNY9soBf8CZsy2e7D8l4ylSNE+WcGTgxI+A3H0PoMji88/FqAYlva/smCwurPHn8v
 MfN6pVwAd5lcUdBloxbUijlvNQVOHRU9dvQwJrUX6xNKFBax2PCqXaln6haGjnq66INq
 snOwrfp4jI65/UqPla+5AtF3LjV7bEaoy0P4IDm7upGG3m7dbTj6UIA55s5u/EFJC2rr
 1zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gfFeCAHNmLamMmWHeLGWsNhRmIhEPobah538FbvqWFw=;
 b=ex9MpuuudYpeDdoYBOSlzuNUmTpv7UZcC/z16V/hVK1e9da+q/DShVFhJVrzYZgT+B
 Bv8JUCbKX0nRgoJMkofU4ONkAa74jUNr8HP/PzN/p4ML+Jh8bqGF2adj9IgmBbQvUu/4
 kJKHNVTaLQ5MjpFKWlMBpY3qctDowivbBmYs+Y5nX5IeevZfhdDxa41ea8xler3k5MNt
 FfP0aGSDH19l+mxChPxWchUEdOTM6UEfmhodn6W1iX36h/UWrRIvDq+1BKEdD9K96Ap0
 pdIdufZyUCF/023tWje1UzvzloFyJAYP8DaVIXjYg+bexJneq4o7pQfgRfpYVZvDAfZC
 fIRg==
X-Gm-Message-State: AOAM530gXJogRJzmkjgoKT1ZFWjCD+NGNgOzkNyZS54I7vK/cGoTWbx2
 /3/93/xPVTy6MnqucH94sRrqWK2upuTbKw==
X-Google-Smtp-Source: ABdhPJyAemXfCtHyvfrlnFqBxK53g9HL3HPBypka0AarDoNISE1gdA9Y9kAj0WpeqcUQMB+/Sjtx5A==
X-Received: by 2002:ac8:5889:: with SMTP id t9mr5049764qta.362.1635787659114; 
 Mon, 01 Nov 2021 10:27:39 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/60] linux-user/host/mips: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:43 -0400
Message-Id: <20211101172729.23149-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/mips/host-signal.h | 63 +++++++++++++++++++++++++++++-
 accel/tcg/user-exec.c              | 52 +-----------------------
 2 files changed, 63 insertions(+), 52 deletions(-)

diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
index f4b4d65031..ef341f7c20 100644
--- a/linux-user/host/mips/host-signal.h
+++ b/linux-user/host/mips/host-signal.h
@@ -1 +1,62 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIPS_HOST_SIGNAL_H
+#define MIPS_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.pc;
+}
+
+#if defined(__misp16) || defined(__mips_micromips)
+#error "Unsupported encoding"
+#endif
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
+
+    /* Detect all store instructions at program counter. */
+    switch ((insn >> 26) & 077) {
+    case 050: /* SB */
+    case 051: /* SH */
+    case 052: /* SWL */
+    case 053: /* SW */
+    case 054: /* SDL */
+    case 055: /* SDR */
+    case 056: /* SWR */
+    case 070: /* SC */
+    case 071: /* SWC1 */
+    case 074: /* SCD */
+    case 075: /* SDC1 */
+    case 077: /* SD */
+#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
+    case 072: /* SWC2 */
+    case 076: /* SDC2 */
+#endif
+        return true;
+    case 023: /* COP1X */
+        /*
+         * Required in all versions of MIPS64 since
+         * MIPS64r1 and subsequent versions of MIPS32r2.
+         */
+        switch (insn & 077) {
+        case 010: /* SWXC1 */
+        case 011: /* SDXC1 */
+        case 015: /* SUXC1 */
+            return true;
+        }
+        break;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index f18f3b2a5c..44c83acba5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,57 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__mips__)
-
-#if defined(__misp16) || defined(__mips_micromips)
-#error "Unsupported encoding"
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uintptr_t pc = uc->uc_mcontext.pc;
-    uint32_t insn = *(uint32_t *)pc;
-    int is_write = 0;
-
-    /* Detect all store instructions at program counter. */
-    switch((insn >> 26) & 077) {
-    case 050: /* SB */
-    case 051: /* SH */
-    case 052: /* SWL */
-    case 053: /* SW */
-    case 054: /* SDL */
-    case 055: /* SDR */
-    case 056: /* SWR */
-    case 070: /* SC */
-    case 071: /* SWC1 */
-    case 074: /* SCD */
-    case 075: /* SDC1 */
-    case 077: /* SD */
-#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
-    case 072: /* SWC2 */
-    case 076: /* SDC2 */
-#endif
-        is_write = 1;
-        break;
-    case 023: /* COP1X */
-        /* Required in all versions of MIPS64 since
-           MIPS64r1 and subsequent versions of MIPS32r2. */
-        switch (insn & 077) {
-        case 010: /* SWXC1 */
-        case 011: /* SDXC1 */
-        case 015: /* SUXC1 */
-            is_write = 1;
-        }
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__riscv)
+#if defined(__riscv)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


