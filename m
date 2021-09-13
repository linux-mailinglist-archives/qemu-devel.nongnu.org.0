Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7882D409F7F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:11:50 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuB3-0001bo-Hn
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5X-00020J-2O
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5S-0007S7-KN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:06 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n4so6782498plh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Zrc3XZ8w46E8d+W832DPrqrMLN8KgFdqW+sL6n38uY=;
 b=fmCtFKO9VKuUpwA/acCd7jtsu2jgvgu+/ZE9ghX8PJtPrXKI5y8e4Y0edetOonbWAq
 2cAeXysLwws3oDQdtMztx2iCrsfabUxh2Avxty3IjGV48WUCSjJ1rqQfokH7uXVnHF7k
 z14GfxD78/5N/Jc8zGc04KGQunp1TMPB7WrzH3kcNlUiWh+463Od7MfKil9rnTn9OxIX
 870U5kfknGhQANhk3PhVTpGGnEB8narNhROCFPw1pwXgTpt+zTGov5AM11EeztaAF+D2
 PzaPc0Nd+7NV9pp8NwAwNeGH++5Z2hKYNpxYIaHK+fXCh9mm0idhNra7i5bWE2xyiWLx
 IoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Zrc3XZ8w46E8d+W832DPrqrMLN8KgFdqW+sL6n38uY=;
 b=Hqy/rPvGR2zM6SNeGaKWcPOoaivxQzH4UtPv5MBuN+RvRaYTRG/dSQVkHkIA1r58Qm
 Nf3pc3jMAgGEdZYuFLzqsW8J569mCk5zVyAAIwKSJQVlLqw1nU1ebwmoGwo40XWUnZif
 YaJZ/XaMz5a19cB1o9I5AchnF6Dh7owDpOJSl0Ed9z4t9kPGXvA7fAhMaiSoEha1hm/p
 eMRr9in2ZG80cHDEZUy2467PmDqnmRbXXRw2LzeYXyj21eLuulZtIJZ/Y/mgaW2SU6FX
 dbbqjuI62MH7tpRl8Z3eEGDk89yBhHXcTxeP/mz9fL9RkX3jpYHzY37dxnWnIkJZ93qJ
 suRA==
X-Gm-Message-State: AOAM531rR9u7Y3r/AxzdSvqufJWo0OYf4qU/f4Cykh9E/dS4veAk64b6
 yl0j0r4LwJPam3heRS1F0pEWNSYLHIA8wA==
X-Google-Smtp-Source: ABdhPJw0hIY6rtSuSv+N78s9BzQSWEql63KEUH/nL0S0qeSZrNt34RDsN9/me6hvjXAlOZ9a5uhmNA==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr1844135pjb.1.1631570760696; 
 Mon, 13 Sep 2021 15:06:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/7] linux-user: Reorg cpu_signal_handler
Date: Mon, 13 Sep 2021 15:05:52 -0700
Message-Id: <20210913220552.604064-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out two functions into linux-user/host/arch/host-signal.h.
Since linux-user requires a linux host, drop all of the BSD and
Solaris ifdefs.  These should be recreated under bsd-user/ when
the current blanks there are filled.

Fold the remnants of handle_cpu_signal into host_signal_handler.

Drop the call to cc->tcg_ops->tlb_fill.  This was simply an indirect
method to raise SIGSEGV; it is far easier to pass the host siginfo_t
along to the guest.  This fixes all of the guest cpu_loop code that
currently fails to properly fill in SEGV_MAPERR vs SEGV_ACCERR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h               |  12 -
 linux-user/host/aarch64/host-signal.h |  73 +++
 linux-user/host/alpha/host-signal.h   |  41 ++
 linux-user/host/arm/host-signal.h     |  30 ++
 linux-user/host/i386/host-signal.h    |  24 +
 linux-user/host/mips/host-signal.h    |  61 +++
 linux-user/host/ppc/host-signal.h     |  24 +
 linux-user/host/ppc64/host-signal.h   |   1 +
 linux-user/host/riscv32/host-signal.h |  57 +++
 linux-user/host/riscv64/host-signal.h |   1 +
 linux-user/host/s390/host-signal.h    |  92 ++++
 linux-user/host/s390x/host-signal.h   |   1 +
 linux-user/host/sparc/host-signal.h   |  53 ++
 linux-user/host/sparc64/host-signal.h |   1 +
 linux-user/host/x86_64/host-signal.h  |  24 +
 accel/tcg/user-exec.c                 | 712 --------------------------
 linux-user/signal.c                   |  93 ++--
 17 files changed, 543 insertions(+), 757 deletions(-)
 create mode 100644 linux-user/host/aarch64/host-signal.h
 create mode 100644 linux-user/host/alpha/host-signal.h
 create mode 100644 linux-user/host/arm/host-signal.h
 create mode 100644 linux-user/host/i386/host-signal.h
 create mode 100644 linux-user/host/mips/host-signal.h
 create mode 100644 linux-user/host/ppc/host-signal.h
 create mode 100644 linux-user/host/ppc64/host-signal.h
 create mode 100644 linux-user/host/riscv32/host-signal.h
 create mode 100644 linux-user/host/riscv64/host-signal.h
 create mode 100644 linux-user/host/s390/host-signal.h
 create mode 100644 linux-user/host/s390x/host-signal.h
 create mode 100644 linux-user/host/sparc/host-signal.h
 create mode 100644 linux-user/host/sparc64/host-signal.h
 create mode 100644 linux-user/host/x86_64/host-signal.h

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f582d3e688..addcec6381 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -683,18 +683,6 @@ uintptr_t adjust_signal_pc(uintptr_t pc);
 bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
                                  uintptr_t host_pc, uintptr_t host_addr);
 
-/**
- * cpu_signal_handler
- * @signum: host signal number
- * @pinfo: host siginfo_t
- * @puc: host ucontext_t
- *
- * To be called from the SIGBUS and SIGSEGV signal handler to inform the
- * virtual cpu of exceptions.  Returns true if the signal was handled by
- * the virtual CPU.
- */
-int cpu_signal_handler(int signum, void *pinfo, void *puc);
-
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
new file mode 100644
index 0000000000..818da17a21
--- /dev/null
+++ b/linux-user/host/aarch64/host-signal.h
@@ -0,0 +1,73 @@
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
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    struct _aarch64_ctx *hdr;
+    uint32_t insn;
+
+    /* Find the esr_context, which has the WnR bit in it */
+    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
+        if (hdr->magic == ESR_MAGIC) {
+            struct esr_context const *esrctx = (struct esr_context const *)hdr;
+            uint64_t esr = esrctx->esr;
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
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..eaf83added
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
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
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
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
new file mode 100644
index 0000000000..ae6bcde6c1
--- /dev/null
+++ b/linux-user/host/arm/host-signal.h
@@ -0,0 +1,30 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ARM_HOST_SIGNAL_H
+#define ARM_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[R15];
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc,
+                                      uintptr_t pc)
+{
+    /*
+     * In the FSR, bit 11 is WnR, assuming a v6 or
+     * later processor.  On v5 we will always report
+     * this as a read, which will fail later.
+     */
+    uint32_t fsr = uc->uc_mcontext.error_code;
+    return extract32(fsr, 11, 1);
+}
+
+#endif
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
new file mode 100644
index 0000000000..a8ca5e4a89
--- /dev/null
+++ b/linux-user/host/i386/host-signal.h
@@ -0,0 +1,24 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef I386_HOST_SIGNAL_H
+#define I386_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_EIP];
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
+        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
+}
+
+#endif
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
new file mode 100644
index 0000000000..815bbd61fa
--- /dev/null
+++ b/linux-user/host/mips/host-signal.h
@@ -0,0 +1,61 @@
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
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *insn = *(uint32_t *)host_signal_pc(uc);
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
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
new file mode 100644
index 0000000000..b8dce622b4
--- /dev/null
+++ b/linux-user/host/ppc/host-signal.h
@@ -0,0 +1,24 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_HOST_SIGNAL_H
+#define PPC_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.regs->nip;
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.regs->trap != 0x400
+        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
+}
+
+#endif
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/host/ppc64/host-signal.h
new file mode 100644
index 0000000000..a353c22a90
--- /dev/null
+++ b/linux-user/host/ppc64/host-signal.h
@@ -0,0 +1 @@
+#include "../ppc/host-signal.h"
diff --git a/linux-user/host/riscv32/host-signal.h b/linux-user/host/riscv32/host-signal.h
new file mode 100644
index 0000000000..f877412f96
--- /dev/null
+++ b/linux-user/host/riscv32/host-signal.h
@@ -0,0 +1,57 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV_HOST_SIGNAL_H
+#define RISCV_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[REG_PC];
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * Detect store by reading the instruction at the program counter.
+     * Do not read more than 16 bits, because we have not yet determined
+     * the size of the instruction.
+     */
+    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
+    uint16_t insn = pinsn[0];
+
+    /* 16-bit instructions */
+    switch (insn & 0xe003) {
+    case 0xa000: /* c.fsd */
+    case 0xc000: /* c.sw */
+    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
+    case 0xa002: /* c.fsdsp */
+    case 0xc002: /* c.swsp */
+    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
+        return true;
+    }
+
+    /* 32-bit instructions, major opcodes */
+    switch (insn & 0x7f) {
+    case 0x23: /* store */
+    case 0x27: /* store-fp */
+        return true;
+    case 0x2f: /* amo */
+        /*
+         * The AMO function code is in bits 25-31, unread as yet.
+         * The AMO functions are LR (read), SC (write), and the
+         * rest are all read-modify-write.
+         */
+        insn = pinsn[1];
+        return (insn >> 11) != 2; /* LR */
+    }
+
+    return false;
+}
+
+#endif
diff --git a/linux-user/host/riscv64/host-signal.h b/linux-user/host/riscv64/host-signal.h
new file mode 100644
index 0000000000..6e27f725ab
--- /dev/null
+++ b/linux-user/host/riscv64/host-signal.h
@@ -0,0 +1 @@
+#include "../riscv32/host-signal.h"
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
new file mode 100644
index 0000000000..8d34b32b9f
--- /dev/null
+++ b/linux-user/host/s390/host-signal.h
@@ -0,0 +1,92 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef S390_HOST_SIGNAL_H
+#define S390_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.psw.addr;
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
+
+    /*
+     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
+     * of the normal 2 arguments.  The 4th argument contains the "Translation-
+     * Exception Identification for DAT Exceptions" from the hardware (aka
+     * "int_parm_long"), which does in fact contain the is_write value.
+     * The rt signal handler, as far as I can tell, does not give this value
+     * at all.  Not that we could get to it from here even if it were.
+     * So fall back to parsing instructions.  Treat read-modify-write ones as
+     * writes, which is not fully correct, but for tracking self-modifying code
+     * this is better than treating them as reads.  Checking si_addr page flags
+     * might be a viable improvement, albeit a racy one.
+     */
+    /* ??? This is not even close to complete.  */
+    switch (pinsn[0] >> 8) {
+    case 0x50: /* ST */
+    case 0x42: /* STC */
+    case 0x40: /* STH */
+    case 0xba: /* CS */
+    case 0xbb: /* CDS */
+        return true;
+    case 0xc4: /* RIL format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0xf: /* STRL */
+        case 0xb: /* STGRL */
+        case 0x7: /* STHRL */
+            return true;
+        }
+        break;
+    case 0xc8: /* SSF format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x2: /* CSST */
+            return true;
+        }
+        break;
+    case 0xe3: /* RXY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x50: /* STY */
+        case 0x24: /* STG */
+        case 0x72: /* STCY */
+        case 0x70: /* STHY */
+        case 0x8e: /* STPQ */
+        case 0x3f: /* STRVH */
+        case 0x3e: /* STRV */
+        case 0x2f: /* STRVG */
+            return true;
+        }
+        break;
+    case 0xeb: /* RSY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x14: /* CSY */
+        case 0x30: /* CSG */
+        case 0x31: /* CDSY */
+        case 0x3e: /* CDSG */
+        case 0xe4: /* LANG */
+        case 0xe6: /* LAOG */
+        case 0xe7: /* LAXG */
+        case 0xe8: /* LAAG */
+        case 0xea: /* LAALG */
+        case 0xf4: /* LAN */
+        case 0xf6: /* LAO */
+        case 0xf7: /* LAX */
+        case 0xfa: /* LAAL */
+        case 0xf8: /* LAA */
+            return true;
+        }
+        break;
+    }
+    return false;
+}
+
+#endif
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/host/s390x/host-signal.h
new file mode 100644
index 0000000000..0e83f9358d
--- /dev/null
+++ b/linux-user/host/s390x/host-signal.h
@@ -0,0 +1 @@
+#include "../s390/host-signal.h"
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
new file mode 100644
index 0000000000..47d3b1512e
--- /dev/null
+++ b/linux-user/host/sparc/host-signal.h
@@ -0,0 +1,53 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SPARC_HOST_SIGNAL_H
+#define SPARC_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+#ifdef __arch64__
+    return uc->uc_mcontext.mc_gregs[MC_PC];
+#else
+    return uc->uc_mcontext.gregs[REG_PC];
+#endif
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
+
+    if ((insn >> 30) == 3) {
+        switch ((insn >> 19) & 0x3f) {
+        case 0x05: /* stb */
+        case 0x15: /* stba */
+        case 0x06: /* sth */
+        case 0x16: /* stha */
+        case 0x04: /* st */
+        case 0x14: /* sta */
+        case 0x07: /* std */
+        case 0x17: /* stda */
+        case 0x0e: /* stx */
+        case 0x1e: /* stxa */
+        case 0x24: /* stf */
+        case 0x34: /* stfa */
+        case 0x27: /* stdf */
+        case 0x37: /* stdfa */
+        case 0x26: /* stqf */
+        case 0x36: /* stqfa */
+        case 0x25: /* stfsr */
+        case 0x3c: /* casa */
+        case 0x3e: /* casxa */
+            return true;
+        }
+    }
+    return false;
+}
+
+#endif
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/host/sparc64/host-signal.h
new file mode 100644
index 0000000000..1191fe2d40
--- /dev/null
+++ b/linux-user/host/sparc64/host-signal.h
@@ -0,0 +1 @@
+#include "../sparc/host-signal.h"
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/host-signal.h
new file mode 100644
index 0000000000..d5fb3e4484
--- /dev/null
+++ b/linux-user/host/x86_64/host-signal.h
@@ -0,0 +1,24 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef X86_64_HOST_SIGNAL_H
+#define X86_64_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_RIP];
+}
+
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
+        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ad6b4f6abf..39635cbea2 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -29,23 +29,8 @@
 #include "trace/trace-root.h"
 #include "trace/mem.h"
 
-#undef EAX
-#undef ECX
-#undef EDX
-#undef EBX
-#undef ESP
-#undef EBP
-#undef ESI
-#undef EDI
-#undef EIP
-#ifdef __linux__
-#include <sys/ucontext.h>
-#endif
-
 __thread uintptr_t helper_retaddr;
 
-//#define DEBUG_SIGNAL
-
 /**
  * adjust_signal_pc:
  * @pc: raw pc from the host signal ucontext_t.
@@ -154,69 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
-/* 'pc' is the host PC at which the exception was raised. 'address' is
-   the effective address of the memory exception. 'is_write' is 1 if a
-   write caused the exception and otherwise 0'. 'old_set' is the
-   signal set which should be restored */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
-{
-    CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
-    MMUAccessType access_type;
-
-    if (is_write) {
-        access_type = MMU_DATA_STORE;
-    } else if (helper_retaddr == 1) {
-        access_type = MMU_INST_FETCH;
-    } else {
-        access_type = MMU_DATA_LOAD;
-    }
-    pc = adjust_signal_pc(pc);
-
-    /* For synchronous signals we expect to be coming from the vCPU
-     * thread (so current_cpu should be valid) and either from running
-     * code or during translation which can fault as we cross pages.
-     *
-     * If neither is true then something has gone wrong and we should
-     * abort rather than try and restart the vCPU execution.
-     */
-    if (!cpu || !cpu->running) {
-        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
-               PRIxPTR "\n",  __func__, pc);
-        abort();
-    }
-
-#if defined(DEBUG_SIGNAL)
-    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, address, is_write, *(unsigned long *)old_set);
-#endif
-
-    /* XXX: locking issue */
-    if (is_write &&
-        info->si_signo == SIGSEGV &&
-        info->si_code == SEGV_ACCERR &&
-        handle_sigsegv_accerr_write(cpu, old_set, pc, address)) {
-        return 1;
-    }
-
-    /* Convert forcefully to guest address space, invalid addresses
-       are still valid segv ones */
-    address = h2g_nocheck(address);
-
-    /*
-     * There is no way the target can handle this other than raising
-     * an exception.  Undo signal and retaddr state prior to longjmp.
-     */
-    sigprocmask(SIG_SETMASK, old_set, NULL);
-
-    cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-                          MMU_USER_IDX, false, pc);
-    g_assert_not_reached();
-}
-
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
@@ -275,640 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__i386__)
-
-#if defined(__NetBSD__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
-#define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
-#define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define EIP_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_eip))
-#define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
-#define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#elif defined(__OpenBSD__)
-#include <machine/trap.h>
-#define EIP_sig(context)     ((context)->sc_eip)
-#define TRAP_sig(context)    ((context)->sc_trapno)
-#define ERROR_sig(context)   ((context)->sc_err)
-#define MASK_sig(context)    ((context)->sc_mask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#else
-#define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
-#define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
-#define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      0xe
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
-    ucontext_t *uc = puc;
-#elif defined(__OpenBSD__)
-    struct sigcontext *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    int trapno;
-
-#ifndef REG_EIP
-/* for glibc 2.1 */
-#define REG_EIP    EIP
-#define REG_ERR    ERR
-#define REG_TRAPNO TRAPNO
-#endif
-    pc = EIP_sig(uc);
-    trapno = TRAP_sig(uc);
-    return handle_cpu_signal(pc, info,
-                             trapno == PAGE_FAULT_TRAP ?
-                             (ERROR_sig(uc) >> 1) & 1 : 0,
-                             &MASK_sig(uc));
-}
-
-#elif defined(__x86_64__)
-
-#ifdef __NetBSD__
-#include <machine/trap.h>
-#define PC_sig(context)       _UC_MACHINE_PC(context)
-#define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
-#define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#elif defined(__OpenBSD__)
-#include <machine/trap.h>
-#define PC_sig(context)       ((context)->sc_rip)
-#define TRAP_sig(context)     ((context)->sc_trapno)
-#define ERROR_sig(context)    ((context)->sc_err)
-#define MASK_sig(context)     ((context)->sc_mask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define PC_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_rip))
-#define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
-#define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#else
-#define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
-#define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
-#define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       0xe
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    unsigned long pc;
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
-    ucontext_t *uc = puc;
-#elif defined(__OpenBSD__)
-    struct sigcontext *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-
-    pc = PC_sig(uc);
-    return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
-                             (ERROR_sig(uc) >> 1) & 1 : 0,
-                             &MASK_sig(uc));
-}
-
-#elif defined(_ARCH_PPC)
-
-/***********************************************************************
- * signal context platform-specific definitions
- * From Wine
- */
-#ifdef linux
-/* All Registers access - only for local access */
-#define REG_sig(reg_name, context)              \
-    ((context)->uc_mcontext.regs->reg_name)
-/* Gpr Registers access  */
-#define GPR_sig(reg_num, context)              REG_sig(gpr[reg_num], context)
-/* Program counter */
-#define IAR_sig(context)                       REG_sig(nip, context)
-/* Machine State Register (Supervisor) */
-#define MSR_sig(context)                       REG_sig(msr, context)
-/* Count register */
-#define CTR_sig(context)                       REG_sig(ctr, context)
-/* User's integer exception register */
-#define XER_sig(context)                       REG_sig(xer, context)
-/* Link register */
-#define LR_sig(context)                        REG_sig(link, context)
-/* Condition register */
-#define CR_sig(context)                        REG_sig(ccr, context)
-
-/* Float Registers access  */
-#define FLOAT_sig(reg_num, context)                                     \
-    (((double *)((char *)((context)->uc_mcontext.regs + 48 * 4)))[reg_num])
-#define FPSCR_sig(context) \
-    (*(int *)((char *)((context)->uc_mcontext.regs + (48 + 32 * 2) * 4)))
-/* Exception Registers access */
-#define DAR_sig(context)                       REG_sig(dar, context)
-#define DSISR_sig(context)                     REG_sig(dsisr, context)
-#define TRAP_sig(context)                      REG_sig(trap, context)
-#endif /* linux */
-
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-#include <ucontext.h>
-#define IAR_sig(context)               ((context)->uc_mcontext.mc_srr0)
-#define MSR_sig(context)               ((context)->uc_mcontext.mc_srr1)
-#define CTR_sig(context)               ((context)->uc_mcontext.mc_ctr)
-#define XER_sig(context)               ((context)->uc_mcontext.mc_xer)
-#define LR_sig(context)                ((context)->uc_mcontext.mc_lr)
-#define CR_sig(context)                ((context)->uc_mcontext.mc_cr)
-/* Exception Registers access */
-#define DAR_sig(context)               ((context)->uc_mcontext.mc_dar)
-#define DSISR_sig(context)             ((context)->uc_mcontext.mc_dsisr)
-#define TRAP_sig(context)              ((context)->uc_mcontext.mc_exc)
-#endif /* __FreeBSD__|| __FreeBSD_kernel__ */
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-    ucontext_t *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    int is_write;
-
-    pc = IAR_sig(uc);
-    is_write = 0;
-#if 0
-    /* ppc 4xx case */
-    if (DSISR_sig(uc) & 0x00800000) {
-        is_write = 1;
-    }
-#else
-    if (TRAP_sig(uc) != 0x400 && (DSISR_sig(uc) & 0x02000000)) {
-        is_write = 1;
-    }
-#endif
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__alpha__)
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
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    int is_write;
-    uint32_t insn;
-#if !defined(__arch64__) || defined(CONFIG_SOLARIS)
-    uint32_t *regs = (uint32_t *)(info + 1);
-    void *sigmask = (regs + 20);
-    /* XXX: is there a standard glibc define ? */
-    unsigned long pc = regs[1];
-#else
-#ifdef __linux__
-    struct sigcontext *sc = puc;
-    unsigned long pc = sc->sigc_regs.tpc;
-    void *sigmask = (void *)sc->sigc_mask;
-#elif defined(__OpenBSD__)
-    struct sigcontext *uc = puc;
-    unsigned long pc = uc->sc_pc;
-    void *sigmask = (void *)(long)uc->sc_mask;
-#elif defined(__NetBSD__)
-    ucontext_t *uc = puc;
-    unsigned long pc = _UC_MACHINE_PC(uc);
-    void *sigmask = (void *)&uc->uc_sigmask;
-#endif
-#endif
-
-    /* XXX: need kernel patch to get write flag faster */
-    is_write = 0;
-    insn = *(uint32_t *)pc;
-    if ((insn >> 30) == 3) {
-        switch ((insn >> 19) & 0x3f) {
-        case 0x05: /* stb */
-        case 0x15: /* stba */
-        case 0x06: /* sth */
-        case 0x16: /* stha */
-        case 0x04: /* st */
-        case 0x14: /* sta */
-        case 0x07: /* std */
-        case 0x17: /* stda */
-        case 0x0e: /* stx */
-        case 0x1e: /* stxa */
-        case 0x24: /* stf */
-        case 0x34: /* stfa */
-        case 0x27: /* stdf */
-        case 0x37: /* stdfa */
-        case 0x26: /* stqf */
-        case 0x36: /* stqfa */
-        case 0x25: /* stfsr */
-        case 0x3c: /* casa */
-        case 0x3e: /* casxa */
-            is_write = 1;
-            break;
-        }
-    }
-    return handle_cpu_signal(pc, info, is_write, sigmask);
-}
-
-#elif defined(__arm__)
-
-#if defined(__NetBSD__)
-#include <ucontext.h>
-#include <sys/siginfo.h>
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__NetBSD__)
-    ucontext_t *uc = puc;
-    siginfo_t *si = pinfo;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    uint32_t fsr;
-    int is_write;
-
-#if defined(__NetBSD__)
-    pc = uc->uc_mcontext.__gregs[_REG_R15];
-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-    pc = uc->uc_mcontext.gregs[R15];
-#else
-    pc = uc->uc_mcontext.arm_pc;
-#endif
-
-#ifdef __NetBSD__
-    fsr = si->si_trap;
-#else
-    fsr = uc->uc_mcontext.error_code;
-#endif
-    /*
-     * In the FSR, bit 11 is WnR, assuming a v6 or
-     * later processor.  On v5 we will always report
-     * this as a read, which will fail later.
-     */
-    is_write = extract32(fsr, 11, 1);
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__aarch64__)
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
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    unsigned long pc;
-    uint16_t *pinsn;
-    int is_write = 0;
-
-    pc = uc->uc_mcontext.psw.addr;
-
-    /*
-     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
-     * of the normal 2 arguments.  The 4th argument contains the "Translation-
-     * Exception Identification for DAT Exceptions" from the hardware (aka
-     * "int_parm_long"), which does in fact contain the is_write value.
-     * The rt signal handler, as far as I can tell, does not give this value
-     * at all.  Not that we could get to it from here even if it were.
-     * So fall back to parsing instructions.  Treat read-modify-write ones as
-     * writes, which is not fully correct, but for tracking self-modifying code
-     * this is better than treating them as reads.  Checking si_addr page flags
-     * might be a viable improvement, albeit a racy one.
-     */
-    /* ??? This is not even close to complete.  */
-    pinsn = (uint16_t *)pc;
-    switch (pinsn[0] >> 8) {
-    case 0x50: /* ST */
-    case 0x42: /* STC */
-    case 0x40: /* STH */
-    case 0xba: /* CS */
-    case 0xbb: /* CDS */
-        is_write = 1;
-        break;
-    case 0xc4: /* RIL format insns */
-        switch (pinsn[0] & 0xf) {
-        case 0xf: /* STRL */
-        case 0xb: /* STGRL */
-        case 0x7: /* STHRL */
-            is_write = 1;
-        }
-        break;
-    case 0xc8: /* SSF format insns */
-        switch (pinsn[0] & 0xf) {
-        case 0x2: /* CSST */
-            is_write = 1;
-        }
-        break;
-    case 0xe3: /* RXY format insns */
-        switch (pinsn[2] & 0xff) {
-        case 0x50: /* STY */
-        case 0x24: /* STG */
-        case 0x72: /* STCY */
-        case 0x70: /* STHY */
-        case 0x8e: /* STPQ */
-        case 0x3f: /* STRVH */
-        case 0x3e: /* STRV */
-        case 0x2f: /* STRVG */
-            is_write = 1;
-        }
-        break;
-    case 0xeb: /* RSY format insns */
-        switch (pinsn[2] & 0xff) {
-        case 0x14: /* CSY */
-        case 0x30: /* CSG */
-        case 0x31: /* CDSY */
-        case 0x3e: /* CDSG */
-        case 0xe4: /* LANG */
-        case 0xe6: /* LAOG */
-        case 0xe7: /* LAXG */
-        case 0xe8: /* LAAG */
-        case 0xea: /* LAALG */
-        case 0xf4: /* LAN */
-        case 0xf6: /* LAO */
-        case 0xf7: /* LAX */
-        case 0xfa: /* LAAL */
-        case 0xf8: /* LAA */
-            is_write = 1;
-        }
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__mips__)
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
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
-    uint32_t insn = *(uint32_t *)pc;
-    int is_write = 0;
-
-    /* Detect store by reading the instruction at the program
-       counter. Note: we currently only generate 32-bit
-       instructions so we thus only detect 32-bit stores */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
-    }
-
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#else
-
-#error host CPU specific signal handler needed
-
-#endif
-
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 73c0f9066b..509dad7850 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -24,6 +24,7 @@
 #include "qemu.h"
 #include "trace.h"
 #include "signal-common.h"
+#include "host-signal.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
@@ -753,59 +754,85 @@ static inline void rewind_if_in_safe_syscall(void *puc)
 }
 #endif
 
-static void host_signal_handler(int host_signum, siginfo_t *info,
-                                void *puc)
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 {
     CPUArchState *env = thread_cpu->env_ptr;
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
-
-    int sig;
+    bool sync_sig = false;
     target_siginfo_t tinfo;
     ucontext_t *uc = puc;
     struct emulated_sigtable *k;
+    uintptr_t pc = 0;
+    int guest_sig;
 
-    /* the CPU emulator uses some host signals to detect exceptions,
-       we forward to it some signals */
-    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
-        && info->si_code > 0) {
-        if (cpu_signal_handler(host_signum, info, puc))
+    /*
+     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
+     * handling wrt signal blocking and unwinding.  SIGSEGV may need to
+     * remove write-protection and restart the instruction.
+     */
+    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
+        pc = adjust_signal_pc(host_signal_pc(uc));
+        if (host_sig == SIGSEGV &&
+            info->si_code == SEGV_ACCERR &&
+            host_sigsegv_write(info, uc) &&
+            handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask, pc,
+                                        (uintptr_t)info->si_addr)) {
             return;
+        }
+        sync_sig = true;
+    } else {
+        rewind_if_in_safe_syscall(puc);
+
+        /*
+         * Block host signals until target signal handler entered.
+         * We can't block SIGSEGV or SIGBUS while we're executing
+         * guest code in case the guest code provokes one in the
+         * window between now and it getting out to the main loop.
+         * Signals will be unblocked again in process_pending_signals().
+         *
+         * WARNING: we cannot use sigfillset() here because the uc_sigmask
+         * field is a kernel sigset_t, which is much smaller than the
+         * libc sigset_t which sigfillset() operates on. Using sigfillset()
+         * would write 0xff bytes off the end of the structure and trash
+         * data on the struct.
+         * We can't use sizeof(uc->uc_sigmask) either, because the libc
+         * headers define the struct field with the wrong (too large) type.
+         */
+        memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
+        sigdelset(&uc->uc_sigmask, SIGSEGV);
+        sigdelset(&uc->uc_sigmask, SIGBUS);
     }
 
     /* get target signal number */
-    sig = host_to_target_signal(host_signum);
-    if (sig < 1 || sig > TARGET_NSIG)
+    guest_sig = host_to_target_signal(host_sig);
+    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
         return;
-    trace_user_host_signal(env, host_signum, sig);
-
-    rewind_if_in_safe_syscall(puc);
+    }
+    trace_user_host_signal(env, host_sig, guest_sig);
 
     host_to_target_siginfo_noswap(&tinfo, info);
-    k = &ts->sigtab[sig - 1];
+    k = &ts->sigtab[guest_sig - 1];
     k->info = tinfo;
-    k->pending = sig;
+    k->pending = guest_sig;
     ts->signal_pending = 1;
 
-    /* Block host signals until target signal handler entered. We
-     * can't block SIGSEGV or SIGBUS while we're executing guest
-     * code in case the guest code provokes one in the window between
-     * now and it getting out to the main loop. Signals will be
-     * unblocked again in process_pending_signals().
-     *
-     * WARNING: we cannot use sigfillset() here because the uc_sigmask
-     * field is a kernel sigset_t, which is much smaller than the
-     * libc sigset_t which sigfillset() operates on. Using sigfillset()
-     * would write 0xff bytes off the end of the structure and trash
-     * data on the struct.
-     * We can't use sizeof(uc->uc_sigmask) either, because the libc
-     * headers define the struct field with the wrong (too large) type.
+    /*
+     * For synchronous signals, unwind the cpu state to the faulting
+     * insn and then exit back to the main loop so that the signal
+     * is delivered immediately.
      */
-    memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
-    sigdelset(&uc->uc_sigmask, SIGSEGV);
-    sigdelset(&uc->uc_sigmask, SIGBUS);
+    if (sync_sig) {
+        clear_helper_retaddr();
+        sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+        cpu->exception_index = EXCP_INTERRUPT;
+        cpu_loop_exit_restore(cpu, pc);
+    }
 
-    /* interrupt the virtual CPU as soon as possible */
+    /*
+     * Interrupt the virtual CPU as soon as possible, but for now
+     * return to continue with the current TB.
+     */
     cpu_exit(thread_cpu);
 }
 
-- 
2.25.1


