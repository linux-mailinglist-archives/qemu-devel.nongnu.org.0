Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3E458F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:14:59 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp99u-00066G-D1
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp979-0004aw-Bz
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:07 -0500
Received: from [2a00:1450:4864:20::42b] (port=44664
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp977-0005HA-9j
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id n29so32576351wra.11
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/HEpXEnNBxz9iHZEfDzUaUwsQCc0aqYlTEzaPR5D7I=;
 b=h2neJk9flw8pbKEwnfBd4wUHFWUyr18DTE1PdddqKOhiEoii7y8gH3WpN50sUv2j7M
 26MGnxVLvPUDAb0boViFKFnF2CmORlo5leE8eMCHBCatI3c+dQy1VIi8ukVDwT6c53ip
 WIspfhPJrIKBkV+PX4JPM7ZtMmjxgzd8St71b9wzl0nT8wlFjyT0xZOn4RQWeY0Djy5g
 eVamQjnKNMFMIJZwEKaesWry56zg77BKmR2pV2/i6yrpjuq2cwX9gwm6CqF689cT6niK
 hw1+1uoaazbH6+XMH/VNOtzeSzdVrT/dfhZNs3pKlUuTR0tXfFzjeX2zn6UEEgIeyzYc
 8RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/HEpXEnNBxz9iHZEfDzUaUwsQCc0aqYlTEzaPR5D7I=;
 b=2Hip9gLGFeEhPf5LXQTSG0U0yafhW/xS5EW1/t54iqvgpp0TYzU/oqbQRKKUf1vLDi
 8GtT7DcXAH2CJG1XFZnMxo4dGCZRZBTs27ZJByx4KyDcd3D1997XGzDWaC8376nthvD2
 6QsMJuyg60ZfDwTEe0iBgQ0unOWopquW4N+lZmAgN2JZ05K9KlT9fNUpEk0Ew+zbXyXI
 0QI5D90eqKATXjHElujBSfr1hcimE2T0QJ8M4UmstCME7S0D2pWjKClPISX2Qrt6eemb
 bRaxWeHXRjtEHyyghENnYzan35JIOz37qy+Kdzg4u1Iq/rBoBn2VPKGRjrN0DtQe21Ye
 Oy5A==
X-Gm-Message-State: AOAM533D7JdaS/KmTUxPvSMd4Ypj8SiqfWoSWw0uFi3gPGGCc2ZbL8Ss
 Up/9BSyujPnYGL0DZ1Ivrdi+e/BUZUxIauWO4cw=
X-Google-Smtp-Source: ABdhPJz4SwcBOdwCEa3W7GtdvWV3bsgz3+zPBxIaYgK/15UlRkQAJ+/Omnu5ufKCLvqRcEwUGVOMlw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr39426290wrb.50.1637586723705; 
 Mon, 22 Nov 2021 05:12:03 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id q84sm25364820wme.3.2021.11.22.05.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:12:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/2] linux-user: Add host_signal_set_pc to set pc in
 mcontext
Date: Mon, 22 Nov 2021 14:11:59 +0100
Message-Id: <20211122131200.229286-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122131200.229286-1-richard.henderson@linaro.org>
References: <20211122131200.229286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 raj.khem@gmail.com, Warner Losh <imp@bsdimp.com>, laurent@vivier.eu
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


