Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF37440ACA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:56:15 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsaU-0006iu-K3
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryQ-000260-U1
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryJ-00006t-C0
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id n23so2348756pgh.8
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tI14VBzrVDI2miPE7O8+ompmGRlpfh5I41U9LPaIFUg=;
 b=RD7LDgdj1d7DwWEZaHLMOUbRw80sZZsl4jfQ9OT88mlS00ZjjS2y3Vmm7fPk+uiVJP
 6WESARsqsYzWF74IivB2zh14eFzdEHo7TBOWr87RVgrRt5b1txA/XTV1/Dwpv2M0pJtd
 0x9HB9viqdHyBEz1VSEXYERGPeQ41vgqpVbMjVQ6jQv5qy4bIG6ozMJiZSE1L6YutbI0
 ks4fbKJtyugGMLribgbQWv6KkfcdKfDjmgokuoOWRLsTXgz3f06jLZBA+TIEVNWDZhDR
 qiFB7azLEqUpRvcHKMfmB1eKs80QPAdeem72gxUC6iaGZOobA1ZN/tmQSVsLatDfUqK3
 HpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI14VBzrVDI2miPE7O8+ompmGRlpfh5I41U9LPaIFUg=;
 b=Oi46hssX0GngTxOZkxoK3G8KN6vL8JM7X5q14+vRZfvcU31rN5jiQAwd7rG6hBPswF
 sRmIu8SQqRkvIYfxM42DG+d4G5Gs2XMrp9KhvCxk4yle1/BbiPJ1iXVgOMWMxsRgnf1H
 DkIMLd/sRj8VapZpGMZXIn821JoBv/+IELtP2Sbw38JTi1n2k+C7ipSh/piNoGxjjoMq
 MF6+7No7lFz9vC+F2sWe9PKT8kHm1Z7SQRO7+225manHzx+MKy3EDeLzwJ/O+YPnIz//
 IFqLXOZ/IvJgoMpMg7ZFGWu073sCrU55hKjCFyPX9btALubux91MfiaxwQ5pj16rgyL0
 Irtw==
X-Gm-Message-State: AOAM530+bvNRrCdycuIY4TWcaNqZ4FbVS6PBRjt0UHEfjBFPCKkcSwia
 hPkAst9h3heUnQT9N8BwsFIuWQoA48dZCA==
X-Google-Smtp-Source: ABdhPJz0wb1zkQEVjW4KIXp61Qy4zckyptCIEf5GBWg4nTysweeMVF7E1NdTrs/9JveDA3rIBs94Dg==
X-Received: by 2002:a63:201:: with SMTP id 1mr13628385pgc.22.1635614205640;
 Sat, 30 Oct 2021 10:16:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/66] linux-user/host/alpha: Populate host_signal.h
Date: Sat, 30 Oct 2021 10:15:38 -0700
Message-Id: <20211030171635.1689530-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +---------------------
 2 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..e27704d832
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,41 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
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


