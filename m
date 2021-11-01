Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D624F441F93
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:50:18 +0100 (CET)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbRq-0000Us-0l
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5z-0003UL-PE
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:43 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5v-0000bP-Ta
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:43 -0400
Received: by mail-qt1-x834.google.com with SMTP id 19so14949501qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEDwxUXgiYnv/fNgu18FTMT9QLfw45+NrWi/CrHqjtM=;
 b=bZX63F4QzUDnm4q1Koo//0uTsJafG5c+HaK/3SpELTEC4s7YX4xETAOMDEaC+qnYhm
 +AuClDol+DryWDCwVjv42bjteOIAjHaF9heIyqtWwN96GmrU464QDVj7dEg/kkkOhD17
 ItMFTUv5sCHVJApj5AYf15758208G6peXLLZ/73gKAimPNWpY+rKoBqAtZJwPRsA61iI
 CLK34V9W3ax5xGM2xJfXVPSoANsZBddV/NS7XyqRQ5sJDxWvUg9GtYseCvufc9Otx0Ta
 tckzNhAuGU8P5mGFTt7pxX+oNWy1+HVxHUB6eIjFO21NN5jvY3LJdWxX/KNBDP5dqlZt
 jXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEDwxUXgiYnv/fNgu18FTMT9QLfw45+NrWi/CrHqjtM=;
 b=7Wvyd///IVoi3P4HNfA3f8B8xb2ZPUdcCmGZV649m+sayf0901lURunBQfGjOnNjRl
 dARsHNunez0Ks1IRD12gIk3M7GVteQ2MjQ/tCz039Ws8fT2E5yIcVO/ngy4ZK2GydAA2
 IfWWNhFjIJMv/VgIBJ2Ar/xszeRJGtDX2F0vmRX9WAvPA8DWmF78IJRN4XqG220+Qkyg
 8Rq9ZKuhfcjIi3sHkdbgRjD3HhPzTB0ZxQDQAJb39hE94OsURrelHZm+6zmhA7lG7H41
 ErnVexhgScApsvaKJuC3aSnTrv9pk31SwxTNwn9Gi/db1U72ceEDA5sxcGNazx6LWxLb
 +pLQ==
X-Gm-Message-State: AOAM530WpFnIW6h4j+rri0EuAVVvNElcKESDwtVTiyuwsCWLs+zHpwu4
 K7VTzNAvJHYHe5y0XUedLPK66aZopZRRfg==
X-Google-Smtp-Source: ABdhPJwSCXuWJXWi7fukSvdJsc3cGn6aYywajomY9IpIbBeD/QUUfNbCnxp3LdO7HGSUi+qjdt99NQ==
X-Received: by 2002:a05:622a:b:: with SMTP id
 x11mr31559665qtw.211.1635787656755; 
 Mon, 01 Nov 2021 10:27:36 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/60] linux-user/host/sparc: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:39 -0400
Message-Id: <20211101172729.23149-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.
Drop the Solaris code as completely unused.

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/sparc/host-signal.h   | 55 +++++++++++++++++++++++-
 linux-user/host/sparc64/host-signal.h |  2 +-
 accel/tcg/user-exec.c                 | 62 +--------------------------
 3 files changed, 56 insertions(+), 63 deletions(-)

diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
index f4b4d65031..5e71d33f8e 100644
--- a/linux-user/host/sparc/host-signal.h
+++ b/linux-user/host/sparc/host-signal.h
@@ -1 +1,54 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
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


