Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95029410837
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:54:46 +0200 (CEST)
Received: from localhost ([::1]:57214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfU5-0002TL-I9
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLR-00057u-6L
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLK-0006nO-Hi
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:48 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so13084896pgr.11
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsP+4M7jyqQgsIMdfJ1ZQMN2aE0h8mf2eX18qZMVb8g=;
 b=U5D26PN6TLgDamLuGf7Fb9mxGIYUro5zAQCpW2xGZIx5bO6ulDyhoz7B6/WycSquh+
 zC1vQdyXc0LKvYKib3ffJC6Jygnsews1L9cnQm56PtpXkPB+MtZEynf+LAJ5m0IwZnhy
 QTT8cinaa/UNrjr/kxU2BdwQyMyuS9l/N2Gi7BXXW5hihMQRzgo5pWjJpt0eqNCcBMB2
 roXqxZ6eh+IFx2OF6p9I3qj+PCAjEv9HXTHB2c27/m/PaVcb4uiBekHFxyr45XS6tMCN
 VHomsH1j+lHDlCzOAG16/d9riXJtH5f4z615MsLFOzSCnP6QVfErBpAvZgb5D3ZZOw4q
 WvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsP+4M7jyqQgsIMdfJ1ZQMN2aE0h8mf2eX18qZMVb8g=;
 b=Sf6wyu2BiKzPAFB9Yw5C0cUlofLJaB7u2BfuIlraaRO7T2EAfAQCFZXpe0kkOdeW6i
 pSZuupD5ZE9Y7eeSDBp1J7iLacR5r7lZCSANQfzzwewR6oXIQAj7kjJL3nthMTYlFwrV
 xPCmzYW9LsRWmGN1jSs+2Occ2DHUTE1BUQNFigUbJNltIGjOz6VEl4a03stxg8dkPBKk
 0w6JbfGMKPgA6x7/ony89NVDKjTS/3ZfeQz9ElYia+M8ieM9M4tOj8h/xWUQKTWbfaYo
 EaiO4ThZ14wKoKXR6mfJAXAZSRjUKQ696NYGb+Qb0BhEnel71Y45e4uI5+wwCwajhvmP
 IiLQ==
X-Gm-Message-State: AOAM5305a0URl/edDjVjZK7La2+1YNVh2sQjhtNXFlJhnLdzPivRumeV
 ayGluUC396JGKotPdXIXYhuR35tj+5G7yQ==
X-Google-Smtp-Source: ABdhPJzr5RWbSWOwcfi1WrO3dbniKm5KTdg4JHZGNW3peDS81LuuI/zBA9/Gp9F4bNIAoGaXeAMdog==
X-Received: by 2002:aa7:9433:0:b0:3f2:58c4:ca5e with SMTP id
 y19-20020aa79433000000b003f258c4ca5emr17136547pfo.27.1631990740095; 
 Sat, 18 Sep 2021 11:45:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/41] linux-user/host/s390: Populate host_signal.h
Date: Sat, 18 Sep 2021 11:44:59 -0700
Message-Id: <20210918184527.408540-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

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
index 8f4e788304..0810b71ba0 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,93 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


