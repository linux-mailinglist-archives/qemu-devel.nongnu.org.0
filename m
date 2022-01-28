Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7F4A046C
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:42:19 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDask-0007Bh-PL
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf6-0000DA-0C
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:12 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41648
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf4-0001Yq-CV
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:11 -0500
Received: by mail-io1-xd29.google.com with SMTP id q204so9678413iod.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=u8LJvgrJOy9CU1AwK1LOQ1IWuJwk0y6ZsHxiSxw8N3mKnOAIsEeC3Y8pyle3iGHoxq
 aP3MAEMdz0iqS71U/WFWT81tY1qhWOvNKPotFJ/tzzTVVm51kdoGEyjsh2r2eJSYvS+A
 BcX+xCDrPoolpmqV+308o7w/8xkqo0xH6iv1wIn7RubMVCNgo7cfk44GU2eJOhJh0xBF
 MPAR7XRVumNntHDvxNCaSNn70X/ZTD6zotCOp+vUcxftpyoD+uh43GvJnqDRSW9u/a8K
 MxK10RZ8bLI/IH94xOVY/MLW3ky2cCoqlNHBKMdrbGhKRa43maMUzpIvpdMJ7gvPuS8q
 cVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=PzSg0yKWE+8NywKXV6efbdWcUvSKLxQfAafqN3e77AOzZSSqid3J9W+xGDRe+FeCbD
 xsaktan0wkQM9DFuBJjyHEPyJHOQ5Xx5G2/9bRHql9T7zAsm1Da2hFkGplZYh7NfCBZn
 R2wWXXPnGxP39u6ly0qyMGGpfyULwM2Z55KJQpyuwrCx4nY9CPIVIAL9cmVoAGjtSZKT
 0+7Iou+5cBAFUJZHtNTt2VOjvI7ChJGCGsK9WMWEE0sZpjxjc1W088X5NHZgdG5f51kM
 HPfAfSE1MlUzENP3dasmkgHkBcOPN+HD3Hma4rtD+ZIbsOOTKg+P6mSJfjlmqlmKdCm3
 ZDXg==
X-Gm-Message-State: AOAM532dm9lk+t+6+dmupVM2XBMIsjeQ69eiA3nmb01giuckcMIatQpo
 q1aozn8XfSTYWo0h/k2+GgGBZvjBU4Zxcg==
X-Google-Smtp-Source: ABdhPJzBbsfBR/ynpE9HTt3SsA6LzkU1+Hp1PRCJotDf4M7l3LCa2Zg3OMZH7td/ohboWAAYpqjdgA==
X-Received: by 2002:a05:6638:28f:: with SMTP id
 c15mr6079096jaq.188.1643412489003; 
 Fri, 28 Jan 2022 15:28:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/40] bsd-user/signal.c: implement force_sig_fault
Date: Fri, 28 Jan 2022 16:27:33 -0700
Message-Id: <20220128232805.86191-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start to implement the force_sig_fault code. This currently just calls
queue_signal(). The bsd-user fork version of that will handle this the
synchronous nature of this call. Add signal-common.h to hold signal
helper functions like force_sig_fault.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h | 14 ++++++++++++++
 bsd-user/signal.c        | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 bsd-user/signal-common.h

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
new file mode 100644
index 00000000000..6207417d39e
--- /dev/null
+++ b/bsd-user/signal-common.h
@@ -0,0 +1,14 @@
+/*
+ * Emulation of BSD signals
+ *
+ * Copyright (c) 2013 Stacey Son
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef SIGNAL_COMMON_H
+#define SIGNAL_COMMON_H
+
+void force_sig_fault(int sig, int code, abi_ulong addr);
+
+#endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 05b277c6422..1206d0d728c 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "signal-common.h"
 
 /*
  * Stubbed out routines until we merge signal support from bsd-user
@@ -34,6 +35,23 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
     qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
 }
 
+/*
+ * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
+ * 'force' part is handled in process_pending_signals().
+ */
+void force_sig_fault(int sig, int code, abi_ulong addr)
+{
+    CPUState *cpu = thread_cpu;
+    CPUArchState *env = cpu->env_ptr;
+    target_siginfo_t info = {};
+
+    info.si_signo = sig;
+    info.si_errno = 0;
+    info.si_code = code;
+    info.si_addr = addr;
+    queue_signal(env, sig, &info);
+}
+
 void signal_init(void)
 {
 }
-- 
2.33.1


