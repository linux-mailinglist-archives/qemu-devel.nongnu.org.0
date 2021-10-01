Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C8A41F32A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:32:39 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMOk-00041T-BE
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4u-0004hd-1x
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:08 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4q-00050Y-It
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:07 -0400
Received: by mail-qt1-x833.google.com with SMTP id f15so9620389qtv.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHk0L4QVJKHbdhHw2ZILrKhqMEpfB7Y/GR3loPVJEL4=;
 b=VOPV7a5MvSPeLhFRK8afKO3t56mNUPUFEr+jD7M/hGI3C0q3tMq/+xu/rWBxJn14YF
 BFwREGkMLdVjiliew4nP2P7vtFci730rPX7C7Fo5a3jarVUy4wzsqU+uzREHdWk2VSeN
 T3+9M9N0CZkKP1aFjo9myPJ9RV8fcyCDaDoB+UoiQWMZS26MWDTvX1/FGMY+iSjHnULH
 Ge96sJJ/LU2qLz2TZ7X6soZzqCgEqI+qfphvVHswVTJ9842wKPld22aXkmkVLjpLg7iK
 esF1OhWG5lyFyAwYBtvbSmUt/Ktu0YHzLf+thFR3kR9amdUhKF3fZu7lo8EdSQ1vXi0l
 PlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHk0L4QVJKHbdhHw2ZILrKhqMEpfB7Y/GR3loPVJEL4=;
 b=Pc1OMqsLPei3YPEHcrIH6EvUummCVXTtH08HSCTuYKQqEWdskIxAKyFyKBmAkuee5z
 VIXDvQYdGK3L2C7eCwg0IKNzsuLet85ERvqvcNUJ0dBwJNm1eHz1lzByVM4NPnqiK2dr
 6EJEpkcp6XlEdALM72rVNwBYFpunJJsLOcFdAFSVE68Jl25q/xZKuGWghr3yNJBP19jv
 c7EINpdJkDXtp6Ww0XK/yzL0kk8p5RkU8ROOgCRA1DEIHIIG4Vji7i9XGC0M7CAlGrcs
 FPxfu4T4X9+QOzfIFcfxkpJp2EOVgMDftzQaO37yep3VcxwgQdwR4mXr8Jf22lM3DHjP
 GvjQ==
X-Gm-Message-State: AOAM532xeuiCO2vXA4tVc3wAW00XIBpamQJT1UteE0nX3ql3sQMQFml1
 KuxDH2z1RmNF5zv2SrJ+Gd1P9jYlQ+dQcg==
X-Google-Smtp-Source: ABdhPJyhfq8W5ZdAnRgTyiVbsFX1cPvi5cxmPHejFPBEoBl5HjVrT1/o4c93uIcU5RggTNMxUTkfnw==
X-Received: by 2002:ac8:4e30:: with SMTP id d16mr14370068qtw.309.1633108322194; 
 Fri, 01 Oct 2021 10:12:02 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/41] linux-user/host/sparc: Populate host_signal.h
Date: Fri,  1 Oct 2021 13:11:20 -0400
Message-Id: <20211001171151.1739472-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.
Drop the Solais code as completely unused.

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
index b895b5c8bd..c7d083db92 100644
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


