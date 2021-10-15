Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1642E79C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:15:55 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEdO-0006wo-08
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYl-0006wA-V2
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:07 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYj-0000Ch-Ux
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id v20so5592585plo.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZX7omI0tPPRPhD891DSXxNdsSqSoW7wps3jDTVHJCM=;
 b=lWSV+ihwzI0o0pFCII1olUxyGiYKqp7q4SiXIaK0czjck5LUuovV59k2c3dGJIfAFv
 wJ4/lcX8lakaC9twYQcEJp5x0/8x4Ta0r+iciiPehIOruDLqO4vgPSlO2CPXOK7ARuwI
 d/b4UbgTlTiuJCQUuYDMqR8l+5YwIYfn1agobvPxrkh1Xf1+IoHx4z/QYxVP+yxD6+Tf
 xRWszafOAWzglJJDKYNbxNVg0LfeWhckOZVgd6uCWKNRkTuLMM6RoccXF65YcXkFPe2w
 5MsVXTT0e05KV9frkS49VLVzj6wUB66C5wfcP2NaDMl01THY5mqF1/us4xd3cGQEm7cU
 kEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZX7omI0tPPRPhD891DSXxNdsSqSoW7wps3jDTVHJCM=;
 b=2ayuPKaPQWp/5pNR6vZmtK/lu7i8TGdXcixHdigDpJ12RvIrNAyf2AKv9gBkTCTrpz
 vzmBD0d/r/fuKzVxe2UKG/ILN3RwzUTdEXGv4GGubtkg/BAfDmSPPuNpMG69AOmw8SCp
 zXPoCdDHNnP1bXhR6p8d8q/F4hUpOlaIBdPHXsoVT748ba5qBpXuGW6NSXn2OoLBrXKt
 nIDIdO3hzj5JpdN9tD2l0izALaAa6owJTzlUcyDyRWsAZB5Z4W0abOSJjOx1Q6ICdVCh
 p2zvF+JJvH6DMoO0/ck7+dISsR5+bjDBcHffw14f47nQ5Lb6K+BhtAugpmx74jxMZn03
 REaw==
X-Gm-Message-State: AOAM530efvaLVmzEVPnqjgh40Sfp2rfKo597W7KSgNh8ZRkh66RqUsAw
 dnNQJiRqA5A5rGpMICWu+9zPwqqNAoBEfw==
X-Google-Smtp-Source: ABdhPJz+VvBKOzeY69yYPYg3gGbVQmGYEf4SCvks9+/L7SG8dCIxvKH4hcVqFXo4mSh0ZimlpyWcGg==
X-Received: by 2002:a17:902:fe83:b0:13f:5415:2710 with SMTP id
 x3-20020a170902fe8300b0013f54152710mr8850968plm.16.1634271064464; 
 Thu, 14 Oct 2021 21:11:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/67] linux-user/host/sparc: Populate host_signal.h
Date: Thu, 14 Oct 2021 21:09:56 -0700
Message-Id: <20211015041053.2769193-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.
Drop the Solaris code as completely unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/sparc/host-signal.h   | 54 ++++++++++++++++++++++-
 linux-user/host/sparc64/host-signal.h |  2 +-
 accel/tcg/user-exec.c                 | 62 +--------------------------
 3 files changed, 55 insertions(+), 63 deletions(-)

diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
index f4b4d65031..232943a1db 100644
--- a/linux-user/host/sparc/host-signal.h
+++ b/linux-user/host/sparc/host-signal.h
@@ -1 +1,53 @@
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
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
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
index f4b4d65031..1191fe2d40 100644
--- a/linux-user/host/sparc64/host-signal.h
+++ b/linux-user/host/sparc64/host-signal.h
@@ -1 +1 @@
-#define HOST_SIGNAL_PLACEHOLDER
+#include "../sparc/host-signal.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0db3c5cf3c..17fe867aeb 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,67 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__sparc__)
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
+#if defined(__arm__)
 
 #if defined(__NetBSD__)
 #include <ucontext.h>
-- 
2.25.1


