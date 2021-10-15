Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1D42E79F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:18:46 +0200 (CEST)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEg9-0004KQ-I7
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYp-00074t-2x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYm-0000Er-Sr
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso816314pjw.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SO98PYe76zHX1Te4ncmpUAjeZt6T0p/6OYCNnl9Too8=;
 b=YCqH71h74W+K/9on5xmPVBhVU6m+9TcSOsE+rSQptbYv2HYlOpa2Q2lAhiduBnr0BW
 x3+tV6bs5ZDm1R7SlVb2uirg7Qd1RmYVnmMCwYAmjJvwN+qeiE3Ap6ymx73f44yPWs8P
 LuZkmisP/TMWCU/yDSfM+hzMFm81dXTpwGtkQcdWfjPn44sImVTkvm/4Q6j01naZaGkt
 mkddgPZWRu6IVdDynYLUQsFiXleF4ys1v6y3LVq9sbUCT+YhB6fKzxKABnhymN7wfT3j
 BKhQCjmpRT1ESA3Eqmnbb8JJl8AmfwtESSnUpqHvOpNAI8AbMu0nD83TLhUU+2F0C7ES
 4uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SO98PYe76zHX1Te4ncmpUAjeZt6T0p/6OYCNnl9Too8=;
 b=JkT6TeoVBfWU5BetVSOmrVRxW+RXHDj0RXwnvBRopWzfKewKduXK3Ot+Yl25RLZLGE
 4ZEe6hx6KCgV4RrfnhweVq6kzyAmT1GR+BRZw60E6Zo7LBS8D0mn4AvkWFBlsadaBLl+
 zwwdYtFjxmDI0hKORPAKLZ6xWN7k4EfSZiwd/KTuSrcQBWzzXxpeuNcIVSZesW4q4OVJ
 2gAw0AVxtgKISdD7GK3L1+6GfeAE8VsVHwH9wHaWc3QKNnXWVG0zx0hJ8cIAC4Q6qvax
 /AsILYJ7p3yL8g3a+w9nqC+9KbNHGGXaJu5tSzDbTRuvShzNPJz2Gqc/4zOKX+XiHSBl
 Tssg==
X-Gm-Message-State: AOAM532B1jJr1PD0rNmenR0eqhTD9tafggeqv7ha3+2gpvwRPIuQ197p
 XnzjmRG5PrIDSPek71Q+bUCpbpuyYo77Tg==
X-Google-Smtp-Source: ABdhPJxj2fP7/RlGTM8ddTWcPeUeV12K94juUIk9I9n0DC4K4AMGCJUeD00piqKqLO8NYZgpksTUOw==
X-Received: by 2002:a17:902:ed0b:b0:13f:4318:491a with SMTP id
 b11-20020a170902ed0b00b0013f4318491amr8984469pld.4.1634271067411; 
 Thu, 14 Oct 2021 21:11:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/67] linux-user/host/mips: Populate host_signal.h
Date: Thu, 14 Oct 2021 21:10:00 -0700
Message-Id: <20211015041053.2769193-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/mips/host-signal.h | 62 +++++++++++++++++++++++++++++-
 accel/tcg/user-exec.c              | 52 +------------------------
 2 files changed, 62 insertions(+), 52 deletions(-)

diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
index f4b4d65031..9c83e51130 100644
--- a/linux-user/host/mips/host-signal.h
+++ b/linux-user/host/mips/host-signal.h
@@ -1 +1,61 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
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
index bfd964b578..287f03dac5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,57 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


