Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A384AD423
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:57:22 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMJN-0004F9-FS
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:57:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgG-0007C0-EV
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:53 -0500
Received: from [2607:f8b0:4864:20::42a] (port=44837
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgD-0000S4-RG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:52 -0500
Received: by mail-pf1-x42a.google.com with SMTP id n32so17342247pfv.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oHQ1OXiOIcQWGDrerT0s2CKiSSZ/T9A2Et8ZkjaMCfg=;
 b=JBRzzfceKggQRZZCvfVQQ8rPbFK6LtMzL5voC6MBWOxdkTerigxmPYQ0Vk4y07YH53
 BeKYSrPbcgj32ni+Ulgdf9tMbm1XBFFOCgFYqiF62iKVg8JjjMNxL+mRwPqRH53DGKsu
 MThlVWC6Oon/eHsXkU0fMbdIV3m0F2/h3k8F99FxA6caid0OVOooREteHCxbR8JPoiKT
 W5gZ8ZZD3jen4w9HreAmvcZqbJsyQdOT9kK4NIgZ+G1MA92hOb9XS3rFi/bhkuLUq8c6
 E6xbcI/h3rK8ga0elbXzt3fIpOaoB92qa7QqlwVtVlNZZl7Wwx/hJcsGKDg4/bNevS+D
 xvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHQ1OXiOIcQWGDrerT0s2CKiSSZ/T9A2Et8ZkjaMCfg=;
 b=G8gSF8hy+GPuJGt4Lny258igYNaAS+/30Ryhf7hSBhGllXBt9o7jl3Mz3mt3jDUPVu
 IRnDnZLM/ORXETDFCmSVyqLAd4B9FcUUP0xYsXmChDk1q6tW3lzqSN5lz/NhfNjsNzO6
 hQBiu1jynKJHMk0nK76UC+Y0QX786mhu6gj91k2lVwosz9z3M0frj0MCONrJI0usBBf7
 vIg0EkzFJkze5AfXSr9Rl6YukMkfbBYKRIcUV18TMSq0w6deS8ILAcVC8wuu14WB/NiC
 Q/M3xThhJMRhSwCg83njcfOW9NQUHmkN30Odzr3ly6wNXaZ5qe1TA4gY+S2mtU3Wx4li
 fxBw==
X-Gm-Message-State: AOAM532RK/OVOtWdwVqWsKvy8/CwjAePpCtNhNTTGKzaIT66OX7PW0un
 UZuOa22DkqMI8phvJTKKHMkqLM9lB77I+Q==
X-Google-Smtp-Source: ABdhPJy5uHdcHefX5Wu6lro/CN9z4Cp+C0z4AMvN8pjt1Pr8kbxR1xRCMDA529vxQt3GLGqoFGfJMA==
X-Received: by 2002:a63:4408:: with SMTP id r8mr1166970pga.101.1644304368460; 
 Mon, 07 Feb 2022 23:12:48 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id b12sm13908088pfm.154.2022.02.07.23.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:12:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] linux-user: Introduce host_sigcontext
Date: Tue,  8 Feb 2022 18:12:35 +1100
Message-Id: <20220208071237.319844-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071237.319844-1-richard.henderson@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not directly access ucontext_t as the third signal parameter.
This is preparation for a sparc64 fix.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/aarch64/host-signal.h     | 13 ++++++++-----
 linux-user/include/host/alpha/host-signal.h       | 11 +++++++----
 linux-user/include/host/arm/host-signal.h         | 11 +++++++----
 linux-user/include/host/i386/host-signal.h        | 11 +++++++----
 linux-user/include/host/loongarch64/host-signal.h | 11 +++++++----
 linux-user/include/host/mips/host-signal.h        | 11 +++++++----
 linux-user/include/host/ppc/host-signal.h         | 11 +++++++----
 linux-user/include/host/riscv/host-signal.h       | 11 +++++++----
 linux-user/include/host/s390/host-signal.h        | 11 +++++++----
 linux-user/include/host/sparc/host-signal.h       | 11 +++++++----
 linux-user/include/host/x86_64/host-signal.h      | 11 +++++++----
 linux-user/signal.c                               |  4 ++--
 12 files changed, 80 insertions(+), 47 deletions(-)

diff --git a/linux-user/include/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
index 76ab078069..be079684a2 100644
--- a/linux-user/include/host/aarch64/host-signal.h
+++ b/linux-user/include/host/aarch64/host-signal.h
@@ -11,6 +11,9 @@
 #ifndef AARCH64_HOST_SIGNAL_H
 #define AARCH64_HOST_SIGNAL_H
 
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
 /* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
 #ifndef ESR_MAGIC
 #define ESR_MAGIC 0x45535201
@@ -20,7 +23,7 @@ struct esr_context {
 };
 #endif
 
-static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
+static inline struct _aarch64_ctx *first_ctx(host_sigcontext *uc)
 {
     return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
 }
@@ -30,22 +33,22 @@ static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
     return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
 }
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.pc;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.pc = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     struct _aarch64_ctx *hdr;
     uint32_t insn;
diff --git a/linux-user/include/host/alpha/host-signal.h b/linux-user/include/host/alpha/host-signal.h
index a44d670f2b..4f9e2abc4b 100644
--- a/linux-user/include/host/alpha/host-signal.h
+++ b/linux-user/include/host/alpha/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef ALPHA_HOST_SIGNAL_H
 #define ALPHA_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.sc_pc;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.sc_pc = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     uint32_t *pc = (uint32_t *)host_signal_pc(uc);
     uint32_t insn = *pc;
diff --git a/linux-user/include/host/arm/host-signal.h b/linux-user/include/host/arm/host-signal.h
index bbeb4ffefb..faba496d24 100644
--- a/linux-user/include/host/arm/host-signal.h
+++ b/linux-user/include/host/arm/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef ARM_HOST_SIGNAL_H
 #define ARM_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.arm_pc;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.arm_pc = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     /*
      * In the FSR, bit 11 is WnR, assuming a v6 or
diff --git a/linux-user/include/host/i386/host-signal.h b/linux-user/include/host/i386/host-signal.h
index fd36f06bda..e2b64f077f 100644
--- a/linux-user/include/host/i386/host-signal.h
+++ b/linux-user/include/host/i386/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef I386_HOST_SIGNAL_H
 #define I386_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.gregs[REG_EIP];
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.gregs[REG_EIP] = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
         && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
diff --git a/linux-user/include/host/loongarch64/host-signal.h b/linux-user/include/host/loongarch64/host-signal.h
index a9dfe0c688..d33c3fc03e 100644
--- a/linux-user/include/host/loongarch64/host-signal.h
+++ b/linux-user/include/host/loongarch64/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef LOONGARCH64_HOST_SIGNAL_H
 #define LOONGARCH64_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.__pc;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.__pc = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     const uint32_t *pinsn = (const uint32_t *)host_signal_pc(uc);
     uint32_t insn = pinsn[0];
diff --git a/linux-user/include/host/mips/host-signal.h b/linux-user/include/host/mips/host-signal.h
index ff840dd491..0dbc5cecfd 100644
--- a/linux-user/include/host/mips/host-signal.h
+++ b/linux-user/include/host/mips/host-signal.h
@@ -11,17 +11,20 @@
 #ifndef MIPS_HOST_SIGNAL_H
 #define MIPS_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.pc;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.pc = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
@@ -30,7 +33,7 @@ static inline void *host_signal_mask(ucontext_t *uc)
 #error "Unsupported encoding"
 #endif
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     uint32_t insn = *(uint32_t *)host_signal_pc(uc);
 
diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
index 730a321d98..b80384d135 100644
--- a/linux-user/include/host/ppc/host-signal.h
+++ b/linux-user/include/host/ppc/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef PPC_HOST_SIGNAL_H
 #define PPC_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.regs->nip;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.regs->nip = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     return uc->uc_mcontext.regs->trap != 0x400
         && (uc->uc_mcontext.regs->dsisr & 0x02000000);
diff --git a/linux-user/include/host/riscv/host-signal.h b/linux-user/include/host/riscv/host-signal.h
index aceae544f2..decacb2325 100644
--- a/linux-user/include/host/riscv/host-signal.h
+++ b/linux-user/include/host/riscv/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef RISCV_HOST_SIGNAL_H
 #define RISCV_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.__gregs[REG_PC];
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.__gregs[REG_PC] = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     /*
      * Detect store by reading the instruction at the program counter.
diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index e454cea54a..6f191e64d7 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -11,22 +11,25 @@
 #ifndef S390_HOST_SIGNAL_H
 #define S390_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.psw.addr;
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.psw.addr = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
 
diff --git a/linux-user/include/host/sparc/host-signal.h b/linux-user/include/host/sparc/host-signal.h
index 158918f2ec..871b6bb269 100644
--- a/linux-user/include/host/sparc/host-signal.h
+++ b/linux-user/include/host/sparc/host-signal.h
@@ -11,7 +11,10 @@
 #ifndef SPARC_HOST_SIGNAL_H
 #define SPARC_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* FIXME: the third argument to a SA_SIGINFO handler is *not* ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
 #ifdef __arch64__
     return uc->uc_mcontext.mc_gregs[MC_PC];
@@ -20,7 +23,7 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 #endif
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
 #ifdef __arch64__
     uc->uc_mcontext.mc_gregs[MC_PC] = pc;
@@ -29,12 +32,12 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
 #endif
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     uint32_t insn = *(uint32_t *)host_signal_pc(uc);
 
diff --git a/linux-user/include/host/x86_64/host-signal.h b/linux-user/include/host/x86_64/host-signal.h
index d64d076625..5a7627fedc 100644
--- a/linux-user/include/host/x86_64/host-signal.h
+++ b/linux-user/include/host/x86_64/host-signal.h
@@ -10,22 +10,25 @@
 #ifndef X86_64_HOST_SIGNAL_H
 #define X86_64_HOST_SIGNAL_H
 
-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+/* The third argument to a SA_SIGINFO handler is ucontext_t. */
+typedef ucontext_t host_sigcontext;
+
+static inline uintptr_t host_signal_pc(host_sigcontext *uc)
 {
     return uc->uc_mcontext.gregs[REG_RIP];
 }
 
-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
 {
     uc->uc_mcontext.gregs[REG_RIP] = pc;
 }
 
-static inline void *host_signal_mask(ucontext_t *uc)
+static inline void *host_signal_mask(host_sigcontext *uc)
 {
     return &uc->uc_sigmask;
 }
 
-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
         && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 0c61459d4a..27a0ff30e9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -800,7 +800,7 @@ void queue_signal(CPUArchState *env, int sig, int si_type,
 /* Adjust the signal context to rewind out of safe-syscall if we're in it */
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
-    ucontext_t *uc = (ucontext_t *)puc;
+    host_sigcontext *uc = (host_sigcontext *)puc;
     uintptr_t pcreg = host_signal_pc(uc);
 
     if (pcreg > (uintptr_t)safe_syscall_start
@@ -815,7 +815,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
     target_siginfo_t tinfo;
-    ucontext_t *uc = puc;
+    host_sigcontext *uc = puc;
     struct emulated_sigtable *k;
     int guest_sig;
     uintptr_t pc = 0;
-- 
2.25.1


