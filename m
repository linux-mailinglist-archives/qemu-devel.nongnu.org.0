Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B76442C8B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:29:46 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrz7-00029M-7H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0003jj-RY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:47025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrds-0000sO-7G
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:54 -0400
Received: by mail-qt1-x82b.google.com with SMTP id s1so17057747qta.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xi5Xc/by+fXO9rb16n3Qpt44Vj6KLnw5qZ8SYUB9TCU=;
 b=QQrtI7EZahGS/Rso0AXET1VU/SFI5k/kagepGctStPT7hJWf/c0IEO+sF3H3B422oK
 wcfGvOcHI3tnd1MqOt18Mf/aLT2165PY1ufbWKH8eFiCZY6BHG16W2q564/Xwsrt9gTw
 ZMiFkvmWK9Vu86RQXGDvNT52qHADPhT3uATl4OElOwZKsOb8S2TvPybPN586d+aC9Ohy
 LpqaE1YgKI4BCjQQpF4X2oAD38gAwoS/g/IDRtY2a2usMM5uCptF9c/Wtf/NRXqkJhJS
 AzSMBwNV+rXPZS4OjGho5tOkj2wpDtTJU6mYZaC3sFN8Obh8PV0/OMvxZucNSqIsVJci
 Jr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xi5Xc/by+fXO9rb16n3Qpt44Vj6KLnw5qZ8SYUB9TCU=;
 b=F0X90bK2XvkGeMTGWOa4JlFXmDOn2ufSUpRkqBxxcE+6MfRBstbLvrdfPJj5PaQbyD
 ki+9xDOqkDjvj0UHiTF0IM1QRnairGsvmamKIogcLNd+oK9URvTVsi3UQ5Csn2XQtiQM
 stsYg+z24arX3AAAmPywcCvJkvsTG8DhRz7hSiW6FBCXdXy0J/ucXv2tWLH3hn4TwNd8
 NF8a1IMGW+FqnN570LPjgrLEnPWNTbCzbdeF5qilX5D6IaOngnV+xbuIw6KwQjYhzD4v
 FHAY6sy119/GWb/NQZ95VTJgG2rbLTO0aUlnYAr9QnseH2xS/0hJM6qLWnQttvR1gAzh
 +DbA==
X-Gm-Message-State: AOAM533XVPcKg2bn+wH+e+IGKpmjJrzGWaMc6kv0YCoY2m0z+C2of77+
 EJ7JrTaWYRDbPBaCyvncB8s5Ro3o1Gds0g==
X-Google-Smtp-Source: ABdhPJwTWPWL9tJu6IurrL9IzAHO840X2s6bRry/5RgIrzFCn+08WyJabxiYVUb0J+eMl5IxmYnBJA==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id
 s42mr27799400qtc.376.1635851266962; 
 Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/60] linux-user/host/alpha: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:49 -0400
Message-Id: <20211102110740.215699-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/alpha/host-signal.h | 42 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +--------------------
 2 files changed, 43 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..e080be412f
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,42 @@
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
+#ifndef ALPHA_HOST_SIGNAL_H
+#define ALPHA_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.sc_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *pc = (uint32_t *)host_signal_pc(uc);
+    uint32_t insn = *pc;
+
+    /* XXX: need kernel patch to get write flag faster */
+    switch (insn >> 26) {
+    case 0x0d: /* stw */
+    case 0x0e: /* stb */
+    case 0x0f: /* stq_u */
+    case 0x24: /* stf */
+    case 0x25: /* stg */
+    case 0x26: /* sts */
+    case 0x27: /* stt */
+    case 0x2c: /* stl */
+    case 0x2d: /* stq */
+    case 0x2e: /* stl_c */
+    case 0x2f: /* stq_c */
+        return true;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5a0a65fa46..e9b6eb696f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,36 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__alpha__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                           void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uint32_t *pc = uc->uc_mcontext.sc_pc;
-    uint32_t insn = *pc;
-    int is_write = 0;
-
-    /* XXX: need kernel patch to get write flag faster */
-    switch (insn >> 26) {
-    case 0x0d: /* stw */
-    case 0x0e: /* stb */
-    case 0x0f: /* stq_u */
-    case 0x24: /* stf */
-    case 0x25: /* stg */
-    case 0x26: /* sts */
-    case 0x27: /* stt */
-    case 0x2c: /* stl */
-    case 0x2d: /* stq */
-    case 0x2e: /* stl_c */
-    case 0x2f: /* stq_c */
-        is_write = 1;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#elif defined(__sparc__)
+#if defined(__sparc__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


