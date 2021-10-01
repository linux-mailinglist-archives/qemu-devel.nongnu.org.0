Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2841F377
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:44:36 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMaJ-00052l-Rd
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM51-0004uQ-Ok
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:15 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4s-00053a-Gg
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:15 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id cv2so5984132qvb.5
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsF7+ye4ZFBKtVDH6YOEuxIjbYiQw3V/Xwn+HbNdAZw=;
 b=xcfH53GOYY/XORKDdh+TaaHqHwMOqUSCuZauYC7JY3M5tlPDcLCyaFPeXCoZ6x6Rs9
 PykvbQXZUuYAEuH5LVxO98mIkZzOP7cpv0QtLZnAiU21qRs4kL9kEzPQjV7NGNpDE3VF
 CpcvR27GD9KpDgda9mk4LG+s+7+spyHmyGV5e9jnlXXRNbNQ6x+gB+ZNM0EBdRBq0OWO
 MmX3Gr6E2LCf3W63ZRpE+juHrxZqZ8/S85xh/KpKY3dxl3+03cf3IzPr0O5WzFOAf8dD
 MVMKtmxdrl5PGIlYv3X8+R03ag3uXzmDJx0COIrU90s3sqvmxbn/dnwL+/FcN7lw90Iz
 wXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsF7+ye4ZFBKtVDH6YOEuxIjbYiQw3V/Xwn+HbNdAZw=;
 b=kIyLii/R/svAgtUfdayFY0TcV3xGZfIj8AnGRUWe6itsdyep7bCWXVBvnNc+dzwKZJ
 Ir4sOyT0P+WUYZR6ONeLPI+C1I/Cg0RQWNLe2kBmg0RAjaskFb0ygL5KgMyPAf3YqU1o
 xLyokZx9s76Z8/hS4nyalbvxPPRJHECkozUj3Oq4dxuVgdZb4PkUMoWzSVm2a3yjvaX1
 JI0kEXuDV60y4o2iBVnQ/WsUBQCryOEn3hGsz3YEE1qGnSN3ULCMLXcMcFyJ7g725+91
 YiQ84LPhmE34m8ELr3Y/5DADH8NGg+ddV8AcfV5aJcQ3Pr0NAjNNaL2dhwPpx1cxi6dM
 0rug==
X-Gm-Message-State: AOAM531+CtXebfkZaT5wvkWjnxXLU3l8WNK7zjlpCSs3S6uUCzJCGdlT
 A/vxen+YCCBJlTzeqhm9d6jF+/k22r7RZg==
X-Google-Smtp-Source: ABdhPJy11oCutXUkgvMQACrDN8OT8L1vVHdqzT+7NK3PL8E+mStqh4eJMI/0Ci+XS/7TdmQXGI98Ng==
X-Received: by 2002:a05:6214:921:: with SMTP id
 dk1mr3533735qvb.31.1633108325460; 
 Fri, 01 Oct 2021 10:12:05 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/41] linux-user/host/mips: Populate host_signal.h
Date: Fri,  1 Oct 2021 13:11:24 -0400
Message-Id: <20211001171151.1739472-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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
index 0810b71ba0..42d1ad189b 100644
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


