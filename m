Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED2442D4F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:58:58 +0100 (CET)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsRN-0004Ez-7j
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreK-00043d-41
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:16 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreF-0000uD-DW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t40so18450285qtc.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSOjZQ0mpw8Fmix6YmRPzs+3MA5kVCOMFIAxxXd1b/Y=;
 b=w33iOpoLEf67g/duwRKYls4tg/pix2TAuINwaqfWGQBSluRZ1ZCBl9Ni7JKMNFcudp
 DAQ+ebnegt7xHkQJvHcUJpapr9Ed8WWJ4rnyUFeplKHKGf74qpZBbkx3s8VJImqvBoal
 HQ35ZCZt52/wGgGFxfy04NdUzZJz4rcn/vgsLQhsyK3RZev0Zp5jqIkXs0lppqJUsnO3
 G/7JIoJA0f/DztCiyY3o7jTGtpPSdb1IuX9jqgj4g0NcGyRtDavF5j+E0QGpfW9qcld3
 7aCNdWg9QyUZzqT4GF5fS+03uAaTu7f4O1Cx3KPXnd9hlAebqotzXik9WEECHVObQGI8
 C87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSOjZQ0mpw8Fmix6YmRPzs+3MA5kVCOMFIAxxXd1b/Y=;
 b=Fy5uo5gsSzmFHeb55GEqMSfT9K0qqX6b2NES5RCFTXIwxr/LsWsRB8j3a59k3HQcGB
 Jotg4qzdCFyMcb36k+ILgd+UeGIPL3VFNtGCGP++5Ahr0XGHRV/KdCsbcckAl3aGdErE
 042R5GPMuAFxDHVQ59P0vUTsPO8psPJsHjyrpfwhH7gCdWo593HujAQPkM3peP7RExGO
 mcreC39+10tXmbADXiDCrLvjgGNDtNXnODe9IxFWHL884C/c4aZ/Zuufl6wRWZzNEPaE
 KQyTbjzujyes0U3bwd+bOwYBelwyf7d3/Hn1DumE9iJQ0pLalI4/aWfjTTV7VfQPpyTn
 lrog==
X-Gm-Message-State: AOAM532ncxX3hqkW0F9kKJIX4HCDaEjoezPPOwxII4hkSDt+eyCXU87R
 byF4GlIQ9/TKlFpSXg57ptUwXhUk7jBqNw==
X-Google-Smtp-Source: ABdhPJwsN2+oVMcCOnro5GiYXWVT7iqNSwBAE69dEo+fk+lVr0vxH/xMEfQg8jvZzyDGAjH4a+Xfew==
X-Received: by 2002:a05:622a:14ce:: with SMTP id
 u14mr34474787qtx.141.1635851270048; 
 Tue, 02 Nov 2021 04:07:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/60] linux-user/host/mips: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:54 -0400
Message-Id: <20211102110740.215699-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

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


