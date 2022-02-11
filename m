Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A84B1B6C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:43:41 +0100 (CET)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKyK-0006Y1-A7
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmo-0003uj-OS
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:48 -0500
Received: from [2607:f8b0:4864:20::102d] (port=44979
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKml-0007Jw-CD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so7346873pjh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtGuFC3UKK0Idn4w3teyZ8nMq31tfjbJpMimKivxIv0=;
 b=F8Q1dUMmfsxxA5W5oCNR1T6uemG52YLV4GONAmncF6M7AV9y+JgA0wdntquRulxIrk
 YvnbMMt9bzQHpcznFCgYcTn74RXOeF3Psj2m5GEdJgQlRhdfdxMSP86Tv1AjmEvufoSG
 UdvseZ0p34gXolq2ztBzeYSOY1PI0MA29wOjuskxHv1IG6l4AxXWFDToOfrTRmT7n6PX
 GOgXcPJAOtd4TJrfz4Z2XTByvBSFhaGjhoZ58FB6luuzwqAlzzixiLeXtHeSrD2rWZKk
 tcpgKgtw7pWeMFov5o9EwnPwUcba+cAtZbA8KEZLnG/eYkVWcoUK1YCuJouO8dssMytp
 Ld5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtGuFC3UKK0Idn4w3teyZ8nMq31tfjbJpMimKivxIv0=;
 b=D/+CU26aHuLTHeEa0VL4trUsgFTbD+CabOVRtVgGsCLRy0vmPv+kW/Nbf/uJ1qCExS
 z3w40ZWQZ87nwRWN387oav8e0no2D7sicBnJEl7jtydc9V91nFBL5AIYI2p9dGlBbFUo
 t34/Zd0c8py5C8s4W6LgO1qV5AnveDvWOzEEImCaFTw9yNI+q4MeEiRt9WccDA4KX5FF
 0KxBh70DxL5Y97LGu9UFWZh+kIvkSoDtddnXQnvFD6msGmIgw/QYYpc+NJo7hWc1RZB1
 6JekCTVl1/Qi6/sSvo0ysidNzMuu40sKJRoZOm2L8QGaQrKuIHlYFcTPBoe9MiypEnOX
 lVXg==
X-Gm-Message-State: AOAM533PqEDkvnSOdA/yXj20wxHzRJPGN28K01ZX787WroAL6iZnAUAz
 RQj0m39kS9PCY9Vc60TpbLTMS42t4KDvpggi
X-Google-Smtp-Source: ABdhPJzvUXQHvWqZ43D3rqoLsOdRLCD6Zq/ThsCA0kDywjF3x9/x7DWha12vxxJIMRwe4Oj5+CAmkw==
X-Received: by 2002:a17:90a:190e:: with SMTP id
 14mr210941pjg.210.1644543101436; 
 Thu, 10 Feb 2022 17:31:41 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/34] linux-user: Introduce host_sigcontext
Date: Fri, 11 Feb 2022 12:30:28 +1100
Message-Id: <20220211013059.17994-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not directly access ucontext_t as the third signal parameter.
This is preparation for a sparc64 fix.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


