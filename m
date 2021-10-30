Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78449440ACF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:57:20 +0200 (CEST)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsbX-00011u-G1
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryP-00023D-Er
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:53 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryL-00007Z-E8
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:53 -0400
Received: by mail-pg1-x534.google.com with SMTP id b4so5941439pgh.10
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZfPkApX7GQIdrTB2+yDQhiedYg/15bSgoP00suGbdM=;
 b=lVNj91QBt9fbwdXWtMhFehMspm3tlAOws5IIR8kwc5yjEoVCwkhhOs24euZEL5YJ21
 1Qm6FlLI9Z47rVhryOOuOo3Zn5h9XTNo9owc97lsbocRwiyfrh/67sTiavfwYU/cOWBg
 qptynpSz/hdNucy5ROoyC/tX06BnojCn5lXxnpamf9UvaKtj+UTM3O/rnXaph15vB5iK
 9tRUlimYuVtZK63cwnFmjh7chvNHYkSp/NBxhS6nzHj6XXo/l9OkebkPeEPB5FMLwYYl
 Jrr55J1PVhRoyiZb2cv/JPJI5uVANLp+EJCjvCmUMu+Pq7lc9r7bIQOyJ0GF06s7/RgF
 FCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZfPkApX7GQIdrTB2+yDQhiedYg/15bSgoP00suGbdM=;
 b=cOsiWHoo+mxODEtRzorc2fDVuJVqxFZBmMfexgfG45DU+HZDxe+jvM5lgyT58IHHrC
 HMq8JvpvXwmHHdO4KWJs2Qx0KQFu/oImXi5KXNgeD+9hjMwTmtySd09pT/52OVu+29mf
 ILm9FExPlRRWznKxBzh1aImePNMFTQB3OOJi/108u8aLDBzMaTJK2UWlYM3VgPIEhY7N
 UWth1WyTChUrEi0eyxugSKTleiu0qptttih1pNrmu39I1yK2uKxeED5QAmnNnisuEX4j
 7DL5LLKPCIeU0Ib+OdQfkiBuh4BEtpU0/5cqOMVSDDbBEQxbAG/nkbmr+FnLfgCxDvEP
 r/Gg==
X-Gm-Message-State: AOAM531/4tPmvcYBLDbUdsrWzNJj0JouUWDZCNKd1uW0vmqBz9v4EEa2
 JUFu27zH6MRthA3BL1QbyH8lNT60eUvIhg==
X-Google-Smtp-Source: ABdhPJzE5HHyO5OTokrcqMgXQ16NT685oEexN441VpbIWNt8hiczpBmSPnWzd/xLkRDy5FrUi8pKNg==
X-Received: by 2002:a63:374b:: with SMTP id g11mr13326104pgn.459.1635614208110; 
 Sat, 30 Oct 2021 10:16:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/66] linux-user/host/aarch64: Populate host_signal.h
Date: Sat, 30 Oct 2021 10:15:41 -0700
Message-Id: <20211030171635.1689530-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/host-signal.h | 74 ++++++++++++++++++++-
 accel/tcg/user-exec.c                 | 94 +--------------------------
 2 files changed, 74 insertions(+), 94 deletions(-)

diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
index f4b4d65031..02a55c3372 100644
--- a/linux-user/host/aarch64/host-signal.h
+++ b/linux-user/host/aarch64/host-signal.h
@@ -1 +1,73 @@
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


