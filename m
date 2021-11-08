Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05704478AA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 03:48:46 +0100 (CET)
Received: from [::1] (port=53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjuiD-0008GA-Sx
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 21:48:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjueY-0002uo-SO
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:45:02 -0500
Received: from [2607:f8b0:4864:20::72f] (port=46767
 helo=mail-qk1-x72f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjueW-0005f7-ND
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:44:58 -0500
Received: by mail-qk1-x72f.google.com with SMTP id bl12so14232235qkb.13
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 18:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WsLO8A98ncSHQryH3E3fZBiVJ7KQ5mOAWvNz0c/T7dg=;
 b=YGWO53z+o1XmBeUaPSWMq8n3DZaDliqtrPGhfdE80SFHDp0ZDCXJd79biPp+EYSgyh
 FuS5okEc7ovyt772eazNE9nDfyv95NCiI/gQKrmjSBS8thM+b9ObDx7lNgP8rZCYZJ2I
 nmTT+AWb9wCLKSwmkpBbBKjX9wBE+DcNWpkEQxYcnTkoheTIoNtmL//AUJT4bfx6y5dU
 Zme/JFhGQ3OCI1zDbbDXDoakXUkoI0TflH5uNQmAFeysYedWkwdR2wTONLxxCHac+O+B
 mgaF/Rcl2T/3pyl+vlY74G14rLOioK9ZGX/PM9d9YyO80C3nXQBsNYv6kH0gC/df2Hyt
 PUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WsLO8A98ncSHQryH3E3fZBiVJ7KQ5mOAWvNz0c/T7dg=;
 b=VK56VeoHXp1AHW3Lm6C+RlOvitOGGjMLos0uSZSlGeuIYXmDzfypgAaDpemYGNhVW5
 JxgKUOG8kU+IfPdvqudTg7yW6MiWnkZ2z5PiekDmuq7XblwV/A6RgmlfxLqCVY6+6+zR
 Pve5Cvttgs0Ep5LgiOYZYby6q89rR2o8MI1ReGHmLn+JretQNKGoQBbmYFD9UNXrmpAc
 LAe/8R9eE1N/i8S2ZUbPGOwPpPVXDQHvWrJY5ycGt+2qIEcs2j7Qz8+Rii7gpFj1Nwbf
 WlzfuUAFF0wnmVynLG1kPxfTkbeLGzuygd2VMJ5hmXNKxkFgMdFhKqn4HsuFzVN1rf0d
 3/QA==
X-Gm-Message-State: AOAM5308baTTRbr9jGil7wE9T0H6eRGfB2mTRM1ANgyGXYTzcuYdxqSy
 FMeS09tv1bVsZ8tXFhakyKS4GI+sGpkAuw==
X-Google-Smtp-Source: ABdhPJzJgioSpEy06jYbtwchInH/3tfw/HVh+7e5/uXGRzAhWlLOmb67/SfsjNlGztyYGveulUfXow==
X-Received: by 2002:a05:6638:d16:: with SMTP id
 q22mr22220981jaj.35.1636339091423; 
 Sun, 07 Nov 2021 18:38:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m2sm9030284iow.6.2021.11.07.18.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 18:38:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/4] linux-user: Add host_signal_set_pc to set pc in mcontext
Date: Sun,  7 Nov 2021 19:37:35 -0700
Message-Id: <20211108023738.42125-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108023738.42125-1-imp@bsdimp.com>
References: <20211108023738.42125-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=imp@bsdimp.com; helo=mail-qk1-x72f.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new function host_signal_set_pc to set the next pc in an
mcontext. The caller should ensure this is a valid PC for execution.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


