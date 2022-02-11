Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E004B1B66
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:42:06 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKwn-0004Qg-R4
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKml-0003t4-IY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:44 -0500
Received: from [2607:f8b0:4864:20::435] (port=35339
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmi-0007Hq-7p
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id l19so7678276pfu.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MExGM3MYFPcI7+Ux4ttjU7B5pEnYQhssTtf96VqegiE=;
 b=jfhmKXJw+nLERJWyHeRP067AURB6tZOxV41T/QhHeeTaBbxC+ks0FtL8sK+qjjemSS
 AWYyHA3cMPAkCoaVirGzAop6w/5jnLHkBUmvmIRudv5Lk6JcYHN2ozEgrbgxD1f7+2se
 j2e/G9vIpYRSykPogUM+baeYoRzACYtlsUX/86jAJU2XTyND819FR43siB/o29czXfl6
 RF2OBLagVrGQzqE91j9hsj1LmflfQPTT1SwfTSaM2voDMAihvwZ6WgyciusoiuAx2Dnp
 EKOZ37P0X+VUypAdua402eVdEr5+E2TQ6O56eefX8feRkdT+XhIBW6pGBq1gvlvoLhvj
 OAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MExGM3MYFPcI7+Ux4ttjU7B5pEnYQhssTtf96VqegiE=;
 b=dgOMiVw30J4/pr+/ouOTrZan/ER+rqYAuteUGGnosrrix3u2vfS6pYAmCMU4ESLUiR
 g2jm1+Um2PJXcwCAjClqL5voQHe9SzawozDWNGJxpIFKugurwvmRHyndoh18Ruj3bLQR
 CAHoLSi0irjYDYnI9GlKQmbmfZsj7w/MjUdYOCS1ADnpWFGZVN6tMQIJjiEPn+vgwhOo
 op8GD57g7RH/soZblcyNmNolxmppWTnj0HHNDkKxOY6+1lPDEelsRW/ji8dxCR5DzE3k
 OV4IICFhvp5UDA7iSivhapH16FJnE+QvABZtu6jDlTS/hbTIb4MokQDWUaZ3NZWnyC/4
 +fqQ==
X-Gm-Message-State: AOAM531EA9ssC5hXdi6YUvqegHF3TN4t7GokZqyEfg9cTifi7QYi2Tg2
 +08er4thGFx6y9wFru8HQCxX1yWaDiyzJgEU
X-Google-Smtp-Source: ABdhPJyP3PGdfeY2dpfVV8BMpyh3QB8WClQ2+oBqFRbQQxRqWYALmrYFom9h5KbUccljbjD5uditwA==
X-Received: by 2002:a63:1d26:: with SMTP id d38mr8222904pgd.301.1644543098642; 
 Thu, 10 Feb 2022 17:31:38 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/34] linux-user: Introduce host_signal_mask
Date: Fri, 11 Feb 2022 12:30:27 +1100
Message-Id: <20220211013059.17994-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Do not directly access the uc_sigmask member.
This is preparation for a sparc64 fix.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/aarch64/host-signal.h  |  5 +++++
 linux-user/include/host/alpha/host-signal.h    |  5 +++++
 linux-user/include/host/arm/host-signal.h      |  5 +++++
 linux-user/include/host/i386/host-signal.h     |  5 +++++
 .../include/host/loongarch64/host-signal.h     |  5 +++++
 linux-user/include/host/mips/host-signal.h     |  5 +++++
 linux-user/include/host/ppc/host-signal.h      |  5 +++++
 linux-user/include/host/riscv/host-signal.h    |  5 +++++
 linux-user/include/host/s390/host-signal.h     |  5 +++++
 linux-user/include/host/sparc/host-signal.h    |  5 +++++
 linux-user/include/host/x86_64/host-signal.h   |  5 +++++
 linux-user/signal.c                            | 18 ++++++++----------
 12 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/linux-user/include/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
index 9770b36dc1..76ab078069 100644
--- a/linux-user/include/host/aarch64/host-signal.h
+++ b/linux-user/include/host/aarch64/host-signal.h
@@ -40,6 +40,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.pc = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     struct _aarch64_ctx *hdr;
diff --git a/linux-user/include/host/alpha/host-signal.h b/linux-user/include/host/alpha/host-signal.h
index f4c942948a..a44d670f2b 100644
--- a/linux-user/include/host/alpha/host-signal.h
+++ b/linux-user/include/host/alpha/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.sc_pc = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint32_t *pc = (uint32_t *)host_signal_pc(uc);
diff --git a/linux-user/include/host/arm/host-signal.h b/linux-user/include/host/arm/host-signal.h
index 6c095773c0..bbeb4ffefb 100644
--- a/linux-user/include/host/arm/host-signal.h
+++ b/linux-user/include/host/arm/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.arm_pc = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     /*
diff --git a/linux-user/include/host/i386/host-signal.h b/linux-user/include/host/i386/host-signal.h
index abe1ece5c9..fd36f06bda 100644
--- a/linux-user/include/host/i386/host-signal.h
+++ b/linux-user/include/host/i386/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.gregs[REG_EIP] = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
diff --git a/linux-user/include/host/loongarch64/host-signal.h b/linux-user/include/host/loongarch64/host-signal.h
index 7effa24251..a9dfe0c688 100644
--- a/linux-user/include/host/loongarch64/host-signal.h
+++ b/linux-user/include/host/loongarch64/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.__pc = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     const uint32_t *pinsn = (const uint32_t *)host_signal_pc(uc);
diff --git a/linux-user/include/host/mips/host-signal.h b/linux-user/include/host/mips/host-signal.h
index c666ed8c3f..ff840dd491 100644
--- a/linux-user/include/host/mips/host-signal.h
+++ b/linux-user/include/host/mips/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.pc = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 #if defined(__misp16) || defined(__mips_micromips)
 #error "Unsupported encoding"
 #endif
diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
index 1d8e658ff7..730a321d98 100644
--- a/linux-user/include/host/ppc/host-signal.h
+++ b/linux-user/include/host/ppc/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.regs->nip = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.regs->trap != 0x400
diff --git a/linux-user/include/host/riscv/host-signal.h b/linux-user/include/host/riscv/host-signal.h
index a4f170efb0..aceae544f2 100644
--- a/linux-user/include/host/riscv/host-signal.h
+++ b/linux-user/include/host/riscv/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.__gregs[REG_PC] = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     /*
diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index a524f2ab00..e454cea54a 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -21,6 +21,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.psw.addr = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
diff --git a/linux-user/include/host/sparc/host-signal.h b/linux-user/include/host/sparc/host-signal.h
index 7342936071..158918f2ec 100644
--- a/linux-user/include/host/sparc/host-signal.h
+++ b/linux-user/include/host/sparc/host-signal.h
@@ -29,6 +29,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
 #endif
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint32_t insn = *(uint32_t *)host_signal_pc(uc);
diff --git a/linux-user/include/host/x86_64/host-signal.h b/linux-user/include/host/x86_64/host-signal.h
index c71d597eb2..d64d076625 100644
--- a/linux-user/include/host/x86_64/host-signal.h
+++ b/linux-user/include/host/x86_64/host-signal.h
@@ -20,6 +20,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
     uc->uc_mcontext.gregs[REG_RIP] = pc;
 }
 
+static inline void *host_signal_mask(ucontext_t *uc)
+{
+    return &uc->uc_sigmask;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 32854bb375..0c61459d4a 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -820,6 +820,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     int guest_sig;
     uintptr_t pc = 0;
     bool sync_sig = false;
+    void *sigmask = host_signal_mask(uc);
 
     /*
      * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
@@ -849,8 +850,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
             if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
                 /* If this was a write to a TB protected page, restart. */
                 if (is_write &&
-                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
-                                                pc, guest_addr)) {
+                    handle_sigsegv_accerr_write(cpu, sigmask, pc, guest_addr)) {
                     return;
                 }
 
@@ -865,10 +865,10 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
                 }
             }
 
-            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            sigprocmask(SIG_SETMASK, sigmask, NULL);
             cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
         } else {
-            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            sigprocmask(SIG_SETMASK, sigmask, NULL);
             if (info->si_code == BUS_ADRALN) {
                 cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
             }
@@ -909,17 +909,15 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
      * now and it getting out to the main loop. Signals will be
      * unblocked again in process_pending_signals().
      *
-     * WARNING: we cannot use sigfillset() here because the uc_sigmask
+     * WARNING: we cannot use sigfillset() here because the sigmask
      * field is a kernel sigset_t, which is much smaller than the
      * libc sigset_t which sigfillset() operates on. Using sigfillset()
      * would write 0xff bytes off the end of the structure and trash
      * data on the struct.
-     * We can't use sizeof(uc->uc_sigmask) either, because the libc
-     * headers define the struct field with the wrong (too large) type.
      */
-    memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
-    sigdelset(&uc->uc_sigmask, SIGSEGV);
-    sigdelset(&uc->uc_sigmask, SIGBUS);
+    memset(sigmask, 0xff, SIGSET_T_SIZE);
+    sigdelset(sigmask, SIGSEGV);
+    sigdelset(sigmask, SIGBUS);
 
     /* interrupt the virtual CPU as soon as possible */
     cpu_exit(thread_cpu);
-- 
2.25.1


