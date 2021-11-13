Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682CE44F151
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 06:02:16 +0100 (CET)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mllB9-0006bk-E3
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 00:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5z-00075d-7O
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:55 -0500
Received: from [2607:f8b0:4864:20::d34] (port=37857
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5v-0003M9-T3
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:54 -0500
Received: by mail-io1-xd34.google.com with SMTP id k21so13845792ioh.4
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8S4suhXJjmAAl79YQ+hrQqaT6PvDtJNGpGFTtHdTrfM=;
 b=mMdEyPNIC9UjoKWbKLJOddGy+fasHBMM3XvOjx3DegIbxZ+O/fLUNdQq4r2BDZvZfz
 aZyql13EMuwwmxW4XrRCtYiP9H62X4hVCCHqrDJVBL/W36wZl9P4fAT0Whv8fWdWzhjJ
 tCeTL4BrYSLk4UZ+oyejlXLQbSPyADrefKyACclKWy8wk3qpZc4oHPCaQ5M3gXLiWSaw
 EK7oD0S3vcHRSfEtRaYKjBaje6ZmKomQn7pBuNq7JV9HJjufh27y5hx+JZjRTBnA3f1i
 rxFQzgUMBQtqgSh+B0sizTLtjFp+y0/is4UfSoRv4vS3LGTVjs5C+3syu3GIWPcONcpg
 +0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8S4suhXJjmAAl79YQ+hrQqaT6PvDtJNGpGFTtHdTrfM=;
 b=VLhqKFONvLYIy92QwQuVdIJ8T9OcMmIodMpJv4vGVyZcTvVCKjMAFVdYfperpL4qei
 XRS2C1QTegJRrPtwD/XC1NBbE6tEU9XxBceyQj7Elhtc1XrK5hLDgZ04+8zai+cYGH5u
 kcEuST6Pqs32KqTOKx/RQmB/JudieKeTPoUPMcH6hmpCALkMSfwanjlbJn1gW+HztZS8
 pFsaGxCugYwzmKtQq+lZXki0NsWeGOJPhRvEWrt3RhJDjPxzPXHovK1yYGUzbZ2427Fu
 pg29wqJmRF5q1KlKeAp32cuUgzvpWBnQFNzLfedvyJh3JfsoMns+vQqd5AtwvaSEfXNw
 ue5Q==
X-Gm-Message-State: AOAM53211JPDuFaDKlSjeb+eyn5FbUw5Tz/ebrANsbNsF+IOyur4UMdK
 WJ/dmnMhWv49E5Xqgz0IO/CRyaNjbfMARQ==
X-Google-Smtp-Source: ABdhPJwXQgHe+iZ4KAuri0BmoecC9vLQcQALUXkUGlBdLY7idOz0aioQ3cIdGgYMEXcU/e+MbaCB/Q==
X-Received: by 2002:a02:caac:: with SMTP id e12mr16035487jap.29.1636779409492; 
 Fri, 12 Nov 2021 20:56:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 1/5] linux-user: Add host_signal_set_pc to set pc in mcontext
Date: Fri, 12 Nov 2021 21:55:59 -0700
Message-Id: <20211113045603.60391-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113045603.60391-1-imp@bsdimp.com>
References: <20211113045603.60391-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
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
index 5e71d33f8e..7342936071 100644
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
+    uc->uc_mcontext.gregs[REG_PC] = pc;
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


