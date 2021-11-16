Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA6452FCC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:05:17 +0100 (CET)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwH6-0004Di-K3
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:05:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEy-0001Pd-Os
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:04 -0500
Received: from [2a00:1450:4864:20::42d] (port=37431
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEw-0004ue-Ai
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:04 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b12so36785315wrh.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/HEpXEnNBxz9iHZEfDzUaUwsQCc0aqYlTEzaPR5D7I=;
 b=oAI7f/A/5Okgc+KopbzT+ZYrWSv3o3wIzjTk7k+p2IaHH5X7pIPxHIeB/qhZqDOx4E
 bPgrMadJs6EIrh8l1EVGJxp+9KQjF9giCslm4wCzfbiXcAgjzGUgLGBGl7w+Es/K544+
 1TAMMOjWd5+P2xsCvxv+8B55u5V2aJG6LKuYb/wmuyq92YyNYun+b2/fsdZgnHXRIy+W
 bLQUx8JxR3jR0IS0C8g3R5S7Dmx3/c4yi2LyAa7k5ianf6VLsKMBERMyW9oLBcAXCK9z
 sh0VdiKlfhuoQA5BL51jcKuyMFVcslepNWb9rNPzWUyAY2d5ofr3h8wyhZZPdhOMcAgS
 tWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/HEpXEnNBxz9iHZEfDzUaUwsQCc0aqYlTEzaPR5D7I=;
 b=ekmtbC7LMnpgONjyjlCNc0Y/RNcSkOGXIwkBhnAhsvp+HBoUmvSlFSkS96adivyoYi
 eqmqJ6NmwpsdohgNXl2IaPGlLvdadqzXJ1rsOfasggovEXm2mB7Wiv63e6k11qHL+zYJ
 ECXgUEkTio+6YmGE9T+VUTeYtd/T/gqWfFjc+jztZp6lNd9kr+rX2KBm9LmcB7rtx+4u
 6BI/J9xZb6CkzYHI1XKm6mLPe2ADaSEfC0sddwmF7K+QoXXZWRRJQs0sbpZoF5c2NFgm
 UbECmy/YFRccryH7bIZyaZ+CeoPWyXzJT78FYVKu+3EHsjnOt1iheikNLfB4SWWaCvJr
 iSHA==
X-Gm-Message-State: AOAM531XjFVioKxAMQsBCAE1CQ4fUXlOqyq7gMPOvlSJYMTD+p6ZoOzl
 DqVKEfzpNjDVkJOhRB3xXyJ+sB2Ic0PzCWpbgkg=
X-Google-Smtp-Source: ABdhPJxcP5jR7Sb8+P+2ESQ1QuS9EDfKLSZUWdHq8gIwAAg2ldgRLXz64/BqcNaehfLTjXQ+aApFsQ==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr8758804wrv.106.1637060580570; 
 Tue, 16 Nov 2021 03:03:00 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/9] linux-user: Add host_signal_set_pc to set pc in
 mcontext
Date: Tue, 16 Nov 2021 12:02:48 +0100
Message-Id: <20211116110256.365484-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Add a new function host_signal_set_pc to set the next pc in an
mcontext. The caller should ensure this is a valid PC for execution.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211113045603.60391-2-imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


