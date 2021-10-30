Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14845440ABC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:49:13 +0200 (CEST)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsTf-00060O-UO
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryN-0001xB-LH
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:51 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryK-00007E-Ll
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:51 -0400
Received: by mail-pf1-x432.google.com with SMTP id m14so12286299pfc.9
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRfWyXLb4RxsKriS/H5VXElUeDZuAf/HaA29wXvInaU=;
 b=ogGNEduXUMHDHm7DuuLgv8UXo6KxBLa8rfTsFF0BQxogHuivClzGgpAqCz1/0wNf2/
 jhi5Jd9En3eF621J9eJ1BK2gXGswGM3/TEXPraN8tZkyjLy9XbAqAXW+/SKYY3cWwoBd
 uo4q6E9jdTWM43rvkAW9NSGXToekdUWaA9RiKC7t81czWz8m0ZC9+YXWTRVw/Esbdo1B
 Dxce9LJNPRfxDGg69YdvZ5FQ9AdJlA6P/QogAMt7Mf23ENwLV4RME2ertQjIGFM8olT5
 HH0B8mWt8kNjmVDxVRLSHtqdGL2CfZRyju6dgmCEqAdgofAMX0MQWJw0/f8Pauw33J8y
 giKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRfWyXLb4RxsKriS/H5VXElUeDZuAf/HaA29wXvInaU=;
 b=8J4X/PoJ9lVTVZ9tUldc4ZzeGxSFDLNCjUL1io862Cgs6koxAcesHowQE9CqIdwoRd
 W/C/vFh2TUdAz6XH+ldV06V3x4WSTcTPaM5cc4BIhzTCB3nOq2MmniEfOUnaWzcMCwfp
 +OzP9X1j1hQr32p19F5+yODR3TtxBK5IyZuxggzISfrRgZ5VvFtxL9tM7dRniMEAMQqX
 CCDJRVGVoGF/K6FogPApkrfwHdnyJjHtJwLodaQyYskGWB3pjHgn5DsAyHAJ1xr3BHTv
 sfVpRjWCimr4V/QpXiP7Sv/TRcSbokFX3yaOI0nOkQAgwFFk5JYZ5ZSTuOwIk7+eJfc8
 g+/g==
X-Gm-Message-State: AOAM533CKCo34H3i8bDXfrqZRKBugwMGcnhK5ssrgfDbnkLip61TOW71
 91ZUwdQie0e02VzirrpqfxvCP9dpqlQ97w==
X-Google-Smtp-Source: ABdhPJzESBbWRyhX+RlP4kVUTyjsy0murKNt5pX1DnXfe89vC56KMWH5KFjcT2by7MowZn9QmvEF7g==
X-Received: by 2002:a63:af07:: with SMTP id w7mr13761650pge.202.1635614206481; 
 Sat, 30 Oct 2021 10:16:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/66] linux-user/host/sparc: Populate host_signal.h
Date: Sat, 30 Oct 2021 10:15:39 -0700
Message-Id: <20211030171635.1689530-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.
Drop the Solaris code as completely unused.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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
index e9b6eb696f..694eff7f04 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,67 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


