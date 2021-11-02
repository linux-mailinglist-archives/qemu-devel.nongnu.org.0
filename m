Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F6442C87
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:27:53 +0100 (CET)
Received: from localhost ([::1]:41514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrxI-00065q-PD
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre3-0003kD-MR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:01 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0000tU-GR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:57 -0400
Received: by mail-qk1-x72c.google.com with SMTP id bi29so19207500qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCPpn5LVQcjFIXnJdO6By+zwqZwVsISAIj+ezxFmWpI=;
 b=IuNexV1bmUfejmZfUziZJFSjEUMiFx3BPKrxJ+nb0xk17JFAKy2xhTPtwjCOuWbkro
 OhN/6otscNa6tH26NVJjFqGxZRIM/Ke48cLX9hKtBimiGJaBL2WQAPkoejoREiotJMYi
 sA9iBQBXe40qHlYurdmYGne6CXu6BTbmQawGSWkf8A7bGRW0rQ99zs5YaqvjBDRLEFve
 lztbeG77MvUNRI8bAnnrnUYBHsDtwx2CgUcfLH7CNbG9M7I3ovPoBbWFJgaYVVis9+S4
 Ew81rFAAr0fCiQT9UacXccNV0WhPCrujkVxJJosaw06CKQOvdWKW82qD7jP5wY0bP/L3
 Y8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCPpn5LVQcjFIXnJdO6By+zwqZwVsISAIj+ezxFmWpI=;
 b=tz2FAtOa0nvI98RzPOln0NahJy4pYFfH1ZJ79FwBzpGcgZHX1wp5vTirqOjvphSPjx
 Dfzb4XidsYac8oXQ4W9x17Jm+DcKS3NSkjmgGYQHf5i0dD7sBLPpUWVc1l+6xFfdh0xn
 VbJX+qWBkVthAyXBhNzM7eljuMo5FJjoQgBDpl+gg6p9qBdcjaSKaXVI1g1UyCusF3s0
 3YCRbx0jwbz66EoK4DWULr2I4HO9lwn3TwUj56gE0SHNjbMC2WSUYqbcFSvKqECpGIMz
 tpqV9II4+T2XHgsPhfPqVICutD/QAyF7r/9vjZuCQXnbz7sV7+0t+nmh0tqMxs/63t48
 pEKw==
X-Gm-Message-State: AOAM5300XyhHn+53rdFY1Lq34p9SvgSGfFu3DarMfMqIiJ4UVRUAxPFZ
 RJH98utXZGSqxIWuNI0HncRzoA1T4wPSQA==
X-Google-Smtp-Source: ABdhPJzKSREyqamnYsAR3ZIKROkJw6ge6vREvgZooSAh8j99Nzlffe+Nz6SftPAbojDUPaH9qIIBoQ==
X-Received: by 2002:a05:620a:4589:: with SMTP id
 bp9mr14864366qkb.274.1635851269428; 
 Tue, 02 Nov 2021 04:07:49 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/60] linux-user/host/s390: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:53 -0400
Message-Id: <20211102110740.215699-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/s390/host-signal.h  | 94 ++++++++++++++++++++++++++++-
 linux-user/host/s390x/host-signal.h |  2 +-
 accel/tcg/user-exec.c               | 88 +--------------------------
 3 files changed, 95 insertions(+), 89 deletions(-)

diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
index f4b4d65031..26990e4893 100644
--- a/linux-user/host/s390/host-signal.h
+++ b/linux-user/host/s390/host-signal.h
@@ -1 +1,93 @@
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


