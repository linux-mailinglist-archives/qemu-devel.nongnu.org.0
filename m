Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE820410843
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:04:42 +0200 (CEST)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfdh-0002fD-Qq
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLN-00054T-9S
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:45 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLK-0006o1-72
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:44 -0400
Received: by mail-pg1-x529.google.com with SMTP id k24so13080993pgh.8
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zyf5KeX485BwSvF4JRLk5yqw2oK9iCIE3vprdtELuiE=;
 b=RsRs+0yNifRZ4c6yWFcgL9LZADuCnd/1NcTJwpId3sEL1M9WnqO50gmTGmsAlubFs3
 z4L3aXVu0sAclPfC30TFQSZYpEgQPmtOSteMAUffh4gSvOorMHtDI/VEhGFkE1AjXcUa
 HItjcXTKgWIHFRTEV+oifWPBsZGH1X+eipn4l+yE8Topq6aHiKHEf2jW119nUv/pDihi
 AYm86cj2Y79t8l1zv5IqP77wYzPgly9iM3grP0xV1YwI49XHcbPbRw5FzNkcaiMVjA03
 ZrjnfoC7HnHsRdaZuswlSTmhxaY1XRwpJvFFJhiZ2pl7IzLKk5GHI6Uu4rFFxbYkilEg
 m+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zyf5KeX485BwSvF4JRLk5yqw2oK9iCIE3vprdtELuiE=;
 b=kpItU6m0lnNloXHRHmNPAr/0EeFsBo/Lf5P8NZmwAyBhmDR5TFX2D7CsXEbfw+tPRa
 xBo1PBrkfrL3htA3m339GB5AnQzxASxd1fDZjaNPqrN8ETVGp2uz0NMrjcqgB1OHAPPH
 Mk5DSiVeHPu2xRMP30TFjEPwPgFub/yA0BdStDg5Axc/bAewHpRO8OkHNQRgxt8ye7gF
 +KZCb+p7WeavhHhBYDtPU91TEB0D4nFDOVoiaVIoVKMMhS67blLunZPAUcmGhvRPAWif
 CAPE/J685Nrzedo+LVU3LRmVbfx8GkQBdBQ7ZaJhHgZ1fmQH6x+PTNNiF2XdCxCqhjdX
 Wo6w==
X-Gm-Message-State: AOAM533rsqQiooYy9L41XhmtD+iVSg26fLrWz5TlUSWcMy7BDW2qYyBA
 H+cN2epcVX+UL7nR5fxTl39DRmJI/+fTzQ==
X-Google-Smtp-Source: ABdhPJzmcp1IpNSvtsZI2l6mqHqeW3DtO0WLSaC6mtJdqhMTdewSm2j5I4aZC9LN/GIADRnnsMbPzw==
X-Received: by 2002:aa7:9ac2:0:b0:443:a477:6684 with SMTP id
 x2-20020aa79ac2000000b00443a4776684mr13446269pfp.25.1631990740927; 
 Sat, 18 Sep 2021 11:45:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/41] linux-user/host/mips: Populate host_signal.h
Date: Sat, 18 Sep 2021 11:45:00 -0700
Message-Id: <20210918184527.408540-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

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


