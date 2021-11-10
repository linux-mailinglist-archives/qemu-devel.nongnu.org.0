Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351944C512
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:34:09 +0100 (CET)
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqY4-0001nV-Jz
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWf-0007Vl-Nn
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:41 -0500
Received: from [2607:f8b0:4864:20::d33] (port=45779
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWb-0005bi-D6
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:41 -0500
Received: by mail-io1-xd33.google.com with SMTP id v23so3448514iom.12
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGjqnBrwXclKNyjUNjesMbXpJ87GafcQyfEXdTM32Cg=;
 b=Z+7Gzl6Rw+3LxZfnOv4qP57M0KRz21kLLGzUv3in4Q956xZ85uxj7md6IFkL2hVSZC
 Yky+96MMeZ2+t8OtFnLLJrAOKdTKbrmW6CfOJLGMOU66kwIfHM5SiSmkUePm3EHNiAJd
 3jws4RnTASJBBkrslf+jkpZax6Sbz3jPLeMi6HmiETjuT3zOdyPTa+9+PUnPKdVlVYjl
 2JrvposZWzpmYZoDb6If0J0nzVI/RpoP0q7+8+lNf2bJz0OQGKpvpbd6piiuFHrxweiK
 Ee6FSG7wTD/B748adTAQzJqo0G67yFrrqhjKZRL3EkjBXQp/tSKjeIiNca67RGBY44Xv
 mWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGjqnBrwXclKNyjUNjesMbXpJ87GafcQyfEXdTM32Cg=;
 b=s34/D5tqi15WVoIxK82sp9zqaYhH2zF3YEGz+yU/ZkK6wRJCWACXrcs7r0IVFlgfDd
 4M0poiVl8iWnE4StWj09sgAZD7D/h2Qda8pqAxSJ4r0lHEExJrd19mcyBqlJuKoyu5vE
 526/HvdX5rSOFP6vMt2TWGvuAfiHdnt8kVsptVj9lEiw288T+PwUFZ2U2kabfwTj/Siu
 7YBB7uv4ag8i2jGAWnKWGo7beikLlNfxD+vO+nJzoZS8DTKORRzp/I5sn8Y+p8bRPDU0
 Rdb0sx9uNtH0u7huj/nWnSxGuoaYt538OifsjQJXV8l/W5bJAIuhA+4IJHkSIxk3bf5t
 bM6g==
X-Gm-Message-State: AOAM533F+37HmJhZ7iz1QmJtFaZpt5TN23YMy9S1bC7s+FRPM2243G0+
 xo7HRwj3BxrCEfFFo4d7AQ5vsTL7UXTLkA==
X-Google-Smtp-Source: ABdhPJyP6nqoYdtpcjqar2A39OuFVSG0BV4vd0VqEEXdnax+KS3Q/d32OU8IBGjKETeYh2S/EfVBHw==
X-Received: by 2002:a05:6638:11cb:: with SMTP id
 g11mr71212jas.139.1636561956001; 
 Wed, 10 Nov 2021 08:32:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:35 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/6] linux-user: Add host_signal_set_pc to set pc in mcontext
Date: Wed, 10 Nov 2021 09:31:28 -0700
Message-Id: <20211110163133.76357-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new function host_signal_set_pc to set the next pc in an
mcontext. The caller should ensure this is a valid PC for execution.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/host-signal.h | 5 +++++
 linux-user/host/alpha/host-signal.h   | 5 +++++
 linux-user/host/arm/host-signal.h     | 5 +++++
 linux-user/host/i386/host-signal.h    | 5 +++++
 linux-user/host/mips/host-signal.h    | 5 +++++
 linux-user/host/ppc/host-signal.h     | 5 +++++
 linux-user/host/riscv/host-signal.h   | 5 +++++
 linux-user/host/s390/host-signal.h    | 5 +++++
 linux-user/host/sparc/host-signal.h   | 9 +++++++++
 linux-user/host/x86_64/host-signal.h  | 5 +++++
 10 files changed, 54 insertions(+)

diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
index 0c0b08383a..9770b36dc1 100644
--- a/linux-user/host/aarch64/host-signal.h
+++ b/linux-user/host/aarch64/host-signal.h
@@ -35,6 +35,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.pc;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.pc = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     struct _aarch64_ctx *hdr;
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
index e080be412f..f4c942948a 100644
--- a/linux-user/host/alpha/host-signal.h
+++ b/linux-user/host/alpha/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.sc_pc;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.sc_pc = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint32_t *pc = (uint32_t *)host_signal_pc(uc);
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
index efb165c0c5..6c095773c0 100644
--- a/linux-user/host/arm/host-signal.h
+++ b/linux-user/host/arm/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.arm_pc;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.arm_pc = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     /*
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
index 4c8eef99ce..abe1ece5c9 100644
--- a/linux-user/host/i386/host-signal.h
+++ b/linux-user/host/i386/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.gregs[REG_EIP];
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.gregs[REG_EIP] = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
index ef341f7c20..c666ed8c3f 100644
--- a/linux-user/host/mips/host-signal.h
+++ b/linux-user/host/mips/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.pc;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.pc = pc;
+}
+
 #if defined(__misp16) || defined(__mips_micromips)
 #error "Unsupported encoding"
 #endif
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
index a491c413dc..1d8e658ff7 100644
--- a/linux-user/host/ppc/host-signal.h
+++ b/linux-user/host/ppc/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.regs->nip;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.regs->nip = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.regs->trap != 0x400
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index 3b168cb58b..a4f170efb0 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.__gregs[REG_PC];
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__gregs[REG_PC] = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     /*
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
index 26990e4893..a524f2ab00 100644
--- a/linux-user/host/s390/host-signal.h
+++ b/linux-user/host/s390/host-signal.h
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.psw.addr;
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.psw.addr = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
index 5e71d33f8e..e301c2c1ea 100644
--- a/linux-user/host/sparc/host-signal.h
+++ b/linux-user/host/sparc/host-signal.h
@@ -20,6 +20,15 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 #endif
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+#ifdef __arch64__
+    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
+#else
+    &uc->uc_mcontext.gregs[REG_PC] = pc;
+#endif
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     uint32_t insn = *(uint32_t *)host_signal_pc(uc);
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/host-signal.h
index 883d2fcf65..c71d597eb2 100644
--- a/linux-user/host/x86_64/host-signal.h
+++ b/linux-user/host/x86_64/host-signal.h
@@ -15,6 +15,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
     return uc->uc_mcontext.gregs[REG_RIP];
 }
 
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.gregs[REG_RIP] = pc;
+}
+
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
     return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
-- 
2.33.0


