Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B911F410827
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:48:50 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfOL-000820-OO
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLK-000525-Gl
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:42 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLG-0006kz-JE
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id j14so1253770plx.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9mBw19ydcFw0MZKZsGTXe7n/L8er4q9+1e7zu/IzZgY=;
 b=HpondtEe5NwcfhVEu9imHmo3xr4RITbfu4Qcj/JlV8uK+TOTYdHqbDj/UUqctHcBDq
 FrzfGgObJj+QuQ3LLwgx5A/j244swJ09O/PGg9/Cu9TGySnQS87N6aWhvy8ApdyET4Br
 BI4xNDEpzGLoX6XU7Q7YivK0LcWKMiReuxuq92PpnAYPcIyXOZRKnsCDt4iRgZu7Y+lp
 s2KuJ4nYySCzbhyY5AJxbQpPnX4h7rN5W4iWz2/L1u/rLmFVql4MQ6hfdRyWOcRvorc/
 0YTI8ib+BnNu8fbhBTC+pHZNaASsK9Sbwg1Y283jYB8UsCyjGph04F/7ib/q7R5mwoPF
 Z4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9mBw19ydcFw0MZKZsGTXe7n/L8er4q9+1e7zu/IzZgY=;
 b=7fvLVkgyp7tDpuHQTuQIbEzNQl1lL+6Vq6d8Do3wlYuIa9+zW3TCdpjh4dYSudNfyM
 D6NgrtT1p7LX+e2ZtIUbDBClxkwuSPuQ3fyz0qDJ/zY7rmwT6JPi/V/qAdGntKCzd3Bk
 ZNqJwnmW+76aPoFfuOTqjGjk4r3Dmig+5RtWubMhyArBsIkNTGK1QQ/ed4CfScInGgyy
 mITI+Bfk5RWW0FbLB+jgo6I9DcG1LpJZL/ZkI0EOaanx3xRmCqrwWxEWHGCdadHrWE9g
 6pADKYl/9sBpf7WKXcM7SY6peOoK39jqi6hIodUinIj9ZdXRHvLii+MtQ1qrJtPZRb2q
 C7iQ==
X-Gm-Message-State: AOAM533mSZTkPqUlqnkwHYj0eUBgTUinwHs5l5JeaNyAA8JBFVbFRyub
 g5zLO+HRq3wVKqNZ8oJO2mhMLbjbH4jRsA==
X-Google-Smtp-Source: ABdhPJym1YMK0fYWLVJd5kjBBjS/TqC2TrG11OH2PgaUrvkGs/aJLuYH1yEVYwG6k4wsQazMk1QZ1A==
X-Received: by 2002:a17:90a:578e:: with SMTP id
 g14mr28897463pji.184.1631990736811; 
 Sat, 18 Sep 2021 11:45:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/41] linux-user/host/alpha: Populate host_signal.h
Date: Sat, 18 Sep 2021 11:44:55 -0700
Message-Id: <20210918184527.408540-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +---------------------
 2 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..b0b488e004
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,41 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ALPHA_HOST_SIGNAL_H
+#define ALPHA_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.sc_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *pc = uc->uc_mcontext.sc_pc;
+    uint32_t insn = *pc;
+
+    /* XXX: need kernel patch to get write flag faster */
+    switch (insn >> 26) {
+    case 0x0d: /* stw */
+    case 0x0e: /* stb */
+    case 0x0f: /* stq_u */
+    case 0x24: /* stf */
+    case 0x25: /* stg */
+    case 0x26: /* sts */
+    case 0x27: /* stt */
+    case 0x2c: /* stl */
+    case 0x2d: /* stq */
+    case 0x2e: /* stl_c */
+    case 0x2f: /* stq_c */
+        return true;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e9e530e2e1..b895b5c8bd 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,36 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__alpha__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                           void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uint32_t *pc = uc->uc_mcontext.sc_pc;
-    uint32_t insn = *pc;
-    int is_write = 0;
-
-    /* XXX: need kernel patch to get write flag faster */
-    switch (insn >> 26) {
-    case 0x0d: /* stw */
-    case 0x0e: /* stb */
-    case 0x0f: /* stq_u */
-    case 0x24: /* stf */
-    case 0x25: /* stg */
-    case 0x26: /* sts */
-    case 0x27: /* stt */
-    case 0x2c: /* stl */
-    case 0x2d: /* stq */
-    case 0x2e: /* stl_c */
-    case 0x2f: /* stq_c */
-        is_write = 1;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#elif defined(__sparc__)
+#if defined(__sparc__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


