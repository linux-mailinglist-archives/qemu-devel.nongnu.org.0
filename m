Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCA440AC5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:53:52 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsYB-0000tJ-3J
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryQ-00025z-QP
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryM-000081-Bf
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id m21so12952478pgu.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62zfa97eDd8IjxitzdW43+81lSbg3lzSCBc6OjWVN/U=;
 b=oF93bzObM114dEqJFd6nS5BRumvf7TS3Td+hzbYvWHUvObkRYNypwebLIoAmWh4aPN
 EL/IYWENRe/fUcNjGw+JyZ3KyhmKkTYmUZqADSxOGa0QYhbHUeAAI3jUQvgXCqJg7aDt
 I86tfSF+clyXRHkNEYWoASnsJYZWUvr8Q4hbPeI5tqfeYw+v5BuVDpZLWnmQlsfaIUau
 aBzblc8Na/xJe5NlAw7QY4qMrZtv96968paDxJB08l2rpY6QPLlYmyEr544Y6S8vVag7
 47uq3H+9YSOPEAvYExyQColbJPLp8rHmmIYgXXNxqbxmpgwSrTlVxWDODWvq/dljTGtf
 04yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62zfa97eDd8IjxitzdW43+81lSbg3lzSCBc6OjWVN/U=;
 b=uQKSNeO9NHJAsfbOOdDNBZ163h+Gk6bvZaCc7Sxg7FnTpj9MJftSaDaesK9GAC+4P/
 jHPywx98YHPr3M33pcxPTRpjP1tXzMdpXTeQx7+Icst7qac8z/z3j2HuEVTfU4OXVBuH
 oDZrEV9I7xy0hRsexx6zosx+VWp0RWsvcnqdyGCIqbCFpwYhW3zvnhaaEPzfyromhrXh
 1WDDQv6WVqeRD1WzX/n0HbYr6WoN/ZSkO+cfktsVmwwzi4nk83b+uAwDFaNlGmynLv0t
 g5snp8N9rvpiIzKYZrf9O9BZkKBCO2uynhBC6BxRAhmy+MBjpj/YHorEk9pikM2RlaaK
 nV1g==
X-Gm-Message-State: AOAM5315+iZUlaeo4zDj0d2EIcW/uHamDudPHpKQ1zvYPCIfgFwAJzEm
 iOu+RRoRL9MoGRwRrnsSEMLS6HHDaHVQBA==
X-Google-Smtp-Source: ABdhPJwhpbIVRjwmxw/EUEEEyZwoC4U1bJkOleclhf89ylvlPM8AYB/O01UUig4DTo1BUDLBv1veAg==
X-Received: by 2002:aa7:8059:0:b0:47e:5de6:5bc7 with SMTP id
 y25-20020aa78059000000b0047e5de65bc7mr14397718pfm.78.1635614209037; 
 Sat, 30 Oct 2021 10:16:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/66] linux-user/host/s390: Populate host_signal.h
Date: Sat, 30 Oct 2021 10:15:42 -0700
Message-Id: <20211030171635.1689530-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/s390/host-signal.h  | 93 ++++++++++++++++++++++++++++-
 linux-user/host/s390x/host-signal.h |  2 +-
 accel/tcg/user-exec.c               | 88 +--------------------------
 3 files changed, 94 insertions(+), 89 deletions(-)

diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
index f4b4d65031..21f59b612a 100644
--- a/linux-user/host/s390/host-signal.h
+++ b/linux-user/host/s390/host-signal.h
@@ -1 +1,92 @@
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
+#ifndef S390_HOST_SIGNAL_H
+#define S390_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.psw.addr;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
+
+    /*
+     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
+     * of the normal 2 arguments.  The 4th argument contains the "Translation-
+     * Exception Identification for DAT Exceptions" from the hardware (aka
+     * "int_parm_long"), which does in fact contain the is_write value.
+     * The rt signal handler, as far as I can tell, does not give this value
+     * at all.  Not that we could get to it from here even if it were.
+     * So fall back to parsing instructions.  Treat read-modify-write ones as
+     * writes, which is not fully correct, but for tracking self-modifying code
+     * this is better than treating them as reads.  Checking si_addr page flags
+     * might be a viable improvement, albeit a racy one.
+     */
+    /* ??? This is not even close to complete.  */
+    switch (pinsn[0] >> 8) {
+    case 0x50: /* ST */
+    case 0x42: /* STC */
+    case 0x40: /* STH */
+    case 0xba: /* CS */
+    case 0xbb: /* CDS */
+        return true;
+    case 0xc4: /* RIL format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0xf: /* STRL */
+        case 0xb: /* STGRL */
+        case 0x7: /* STHRL */
+            return true;
+        }
+        break;
+    case 0xc8: /* SSF format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x2: /* CSST */
+            return true;
+        }
+        break;
+    case 0xe3: /* RXY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x50: /* STY */
+        case 0x24: /* STG */
+        case 0x72: /* STCY */
+        case 0x70: /* STHY */
+        case 0x8e: /* STPQ */
+        case 0x3f: /* STRVH */
+        case 0x3e: /* STRV */
+        case 0x2f: /* STRVG */
+            return true;
+        }
+        break;
+    case 0xeb: /* RSY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x14: /* CSY */
+        case 0x30: /* CSG */
+        case 0x31: /* CDSY */
+        case 0x3e: /* CDSG */
+        case 0xe4: /* LANG */
+        case 0xe6: /* LAOG */
+        case 0xe7: /* LAXG */
+        case 0xe8: /* LAAG */
+        case 0xea: /* LAALG */
+        case 0xf4: /* LAN */
+        case 0xf6: /* LAO */
+        case 0xf7: /* LAX */
+        case 0xfa: /* LAAL */
+        case 0xf8: /* LAA */
+            return true;
+        }
+        break;
+    }
+    return false;
+}
+
+#endif
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/host/s390x/host-signal.h
index f4b4d65031..0e83f9358d 100644
--- a/linux-user/host/s390x/host-signal.h
+++ b/linux-user/host/s390x/host-signal.h
@@ -1 +1 @@
-#define HOST_SIGNAL_PLACEHOLDER
+#include "../s390/host-signal.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5cdbfab35b..f18f3b2a5c 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,93 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__s390__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    unsigned long pc;
-    uint16_t *pinsn;
-    int is_write = 0;
-
-    pc = uc->uc_mcontext.psw.addr;
-
-    /*
-     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
-     * of the normal 2 arguments.  The 4th argument contains the "Translation-
-     * Exception Identification for DAT Exceptions" from the hardware (aka
-     * "int_parm_long"), which does in fact contain the is_write value.
-     * The rt signal handler, as far as I can tell, does not give this value
-     * at all.  Not that we could get to it from here even if it were.
-     * So fall back to parsing instructions.  Treat read-modify-write ones as
-     * writes, which is not fully correct, but for tracking self-modifying code
-     * this is better than treating them as reads.  Checking si_addr page flags
-     * might be a viable improvement, albeit a racy one.
-     */
-    /* ??? This is not even close to complete.  */
-    pinsn = (uint16_t *)pc;
-    switch (pinsn[0] >> 8) {
-    case 0x50: /* ST */
-    case 0x42: /* STC */
-    case 0x40: /* STH */
-    case 0xba: /* CS */
-    case 0xbb: /* CDS */
-        is_write = 1;
-        break;
-    case 0xc4: /* RIL format insns */
-        switch (pinsn[0] & 0xf) {
-        case 0xf: /* STRL */
-        case 0xb: /* STGRL */
-        case 0x7: /* STHRL */
-            is_write = 1;
-        }
-        break;
-    case 0xc8: /* SSF format insns */
-        switch (pinsn[0] & 0xf) {
-        case 0x2: /* CSST */
-            is_write = 1;
-        }
-        break;
-    case 0xe3: /* RXY format insns */
-        switch (pinsn[2] & 0xff) {
-        case 0x50: /* STY */
-        case 0x24: /* STG */
-        case 0x72: /* STCY */
-        case 0x70: /* STHY */
-        case 0x8e: /* STPQ */
-        case 0x3f: /* STRVH */
-        case 0x3e: /* STRV */
-        case 0x2f: /* STRVG */
-            is_write = 1;
-        }
-        break;
-    case 0xeb: /* RSY format insns */
-        switch (pinsn[2] & 0xff) {
-        case 0x14: /* CSY */
-        case 0x30: /* CSG */
-        case 0x31: /* CDSY */
-        case 0x3e: /* CDSG */
-        case 0xe4: /* LANG */
-        case 0xe6: /* LAOG */
-        case 0xe7: /* LAXG */
-        case 0xe8: /* LAAG */
-        case 0xea: /* LAALG */
-        case 0xf4: /* LAN */
-        case 0xf6: /* LAO */
-        case 0xf7: /* LAX */
-        case 0xfa: /* LAAL */
-        case 0xf8: /* LAA */
-            is_write = 1;
-        }
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__mips__)
+#if defined(__mips__)
 
 #if defined(__misp16) || defined(__mips_micromips)
 #error "Unsupported encoding"
-- 
2.25.1


