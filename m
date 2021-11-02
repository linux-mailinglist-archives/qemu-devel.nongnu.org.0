Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8461442C83
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:27:47 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrxD-0005h6-2m
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0003je-Qf
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdt-0000sh-Nc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:54 -0400
Received: by mail-qt1-x82b.google.com with SMTP id v22so828099qtk.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKF5pmiX/o7unekmxiUMsGTx/xn7CVdGNA9mcaJJAdI=;
 b=fJYaGTfWKRoKshDBkdO7LuC6mxMyaIBSyJn3ip1eM9u6QlKUtITGJrow+EpbsqwAWF
 +oyZg5jjAk+NcAToWjnN02ZECyNDaA+JBnjE9hpX/LSmtV64zQHtfBLNSt4PwcF0PSM9
 HCvhl9plKAZVo+T5TWZui6Vm1NoI6NgLTrwkMw2YubyWcx1VFi+q7RoVuHL+sPrlwAw1
 nZrgsZW2HZQXgAN1LYyXRGPtsQP4ANhWgc2wXa8d01PMBOmCQWZuBP6BOuyjgtpaTBBl
 z/QbHmpj0sfoKs88WOzRrpiUStAF1fZpfKSer8gI3mt6ybJC4gGvb93aeGcE7vFdBYsC
 kVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKF5pmiX/o7unekmxiUMsGTx/xn7CVdGNA9mcaJJAdI=;
 b=f2O0IjtmYZgfayU9cVkrfgZx0868kAQV3laFFqVUBr9cHx8B5KlHq/IcmwKZ+NkWQq
 /dwL2ymyhL9QcaKwtOTgaxqZS81FhPZ3nNswDi++rq2tab0BJIuvakrvlAu7L5FZ6XrE
 6N8k3tPM52i7X+/RkW112UdTvAtwa7zKcVLfmSeSje9ho9jaN2KHSJtU9PPoExrecUoc
 /3Oq5pI4FAp6e1SPAd94sbOqHCsQNOKOGaGAW5gMGf3r3nb7uh8omnZhooHodSkO/jzI
 JodsLross8ahm29Qy5gzPWK1g7YTI5vH9x+tqrOMDLqJE+Ixubo3TBkjSAckxoVQdQRN
 6e6g==
X-Gm-Message-State: AOAM530VxFUckx8mMDDIIm1Ulj2Jz/1M4P6jyLBx6hE0breQkQvjJaYV
 cyWEQ0vTssCopoh20S6ZO80Ua457NN1H0g==
X-Google-Smtp-Source: ABdhPJxGGQgngz+bYOhJn1qipR6BhE6m8lkO+ACv0HO7+4341C3ttBPWgpLc1Rz4mJweSDYRcJo8hA==
X-Received: by 2002:a05:622a:c3:: with SMTP id
 p3mr37708175qtw.161.1635851268819; 
 Tue, 02 Nov 2021 04:07:48 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/60] linux-user/host/aarch64: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:52 -0400
Message-Id: <20211102110740.215699-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/host-signal.h | 75 ++++++++++++++++++++-
 accel/tcg/user-exec.c                 | 94 +--------------------------
 2 files changed, 75 insertions(+), 94 deletions(-)

diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
index f4b4d65031..0c0b08383a 100644
--- a/linux-user/host/aarch64/host-signal.h
+++ b/linux-user/host/aarch64/host-signal.h
@@ -1 +1,74 @@
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
+#ifndef AARCH64_HOST_SIGNAL_H
+#define AARCH64_HOST_SIGNAL_H
+
+/* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
+#ifndef ESR_MAGIC
+#define ESR_MAGIC 0x45535201
+struct esr_context {
+    struct _aarch64_ctx head;
+    uint64_t esr;
+};
+#endif
+
+static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
+{
+    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
+}
+
+static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
+{
+    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
+}
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    struct _aarch64_ctx *hdr;
+    uint32_t insn;
+
+    /* Find the esr_context, which has the WnR bit in it */
+    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
+        if (hdr->magic == ESR_MAGIC) {
+            struct esr_context const *ec = (struct esr_context const *)hdr;
+            uint64_t esr = ec->esr;
+
+            /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit */
+            return extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
+        }
+    }
+
+    /*
+     * Fall back to parsing instructions; will only be needed
+     * for really ancient (pre-3.16) kernels.
+     */
+    insn = *(uint32_t *)host_signal_pc(uc);
+
+    return (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
+        || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
+        || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
+        || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
+        || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
+        || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
+        || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
+        /* Ignore bits 10, 11 & 21, controlling indexing.  */
+        || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
+        || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
+        /* Ignore bits 23 & 24, controlling indexing.  */
+        || (insn & 0x3a400000) == 0x28000000; /* C3.3.7,14-16 */
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fabc8855a9..5cdbfab35b 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,99 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__aarch64__)
-
-#if defined(__NetBSD__)
-
-#include <ucontext.h>
-#include <sys/siginfo.h>
-
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
-{
-    ucontext_t *uc = puc;
-    siginfo_t *si = pinfo;
-    unsigned long pc;
-    int is_write;
-    uint32_t esr;
-
-    pc = uc->uc_mcontext.__gregs[_REG_PC];
-    esr = si->si_trap;
-
-    /*
-     * siginfo_t::si_trap is the ESR value, for data aborts ESR.EC
-     * is 0b10010x: then bit 6 is the WnR bit
-     */
-    is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
-    return handle_cpu_signal(pc, si, is_write, &uc->uc_sigmask);
-}
-
-#else
-
-#ifndef ESR_MAGIC
-/* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
-#define ESR_MAGIC 0x45535201
-struct esr_context {
-    struct _aarch64_ctx head;
-    uint64_t esr;
-};
-#endif
-
-static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
-{
-    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
-}
-
-static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
-{
-    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
-}
-
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uintptr_t pc = uc->uc_mcontext.pc;
-    bool is_write;
-    struct _aarch64_ctx *hdr;
-    struct esr_context const *esrctx = NULL;
-
-    /* Find the esr_context, which has the WnR bit in it */
-    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
-        if (hdr->magic == ESR_MAGIC) {
-            esrctx = (struct esr_context const *)hdr;
-            break;
-        }
-    }
-
-    if (esrctx) {
-        /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit */
-        uint64_t esr = esrctx->esr;
-        is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
-    } else {
-        /*
-         * Fall back to parsing instructions; will only be needed
-         * for really ancient (pre-3.16) kernels.
-         */
-        uint32_t insn = *(uint32_t *)pc;
-
-        is_write = ((insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
-                    || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
-                    || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
-                    || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
-                    || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
-                    || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
-                    || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
-                    /* Ignore bits 10, 11 & 21, controlling indexing.  */
-                    || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
-                    || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
-                    /* Ignore bits 23 & 24, controlling indexing.  */
-                    || (insn & 0x3a400000) == 0x28000000); /* C3.3.7,14-16 */
-    }
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#endif
-
-#elif defined(__s390__)
+#if defined(__s390__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


