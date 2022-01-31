Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1D4A5035
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:36:18 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdPN-0004Nj-Nz
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:36:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnl-00054C-6R
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::d33] (port=44560
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002cJ-Qt
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:24 -0500
Received: by mail-io1-xd33.google.com with SMTP id p63so17548543iod.11
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=R9qydVIq5yCAAjfQY7m0iL0DFx8mEWbc04Kc1HF9nHt84w9GwhkeyCUqwQw0Xddc+e
 JNTHVw8qpEnsQTgpSZHHP4DMixv9pyvW0/RglzToT2PXrnSXWY+6WBRmcZm5O8XE2AKf
 tlVkucauIE1b5rsr0PFUg5K78SMoIsA4I9FoFaXFcI5R1uiL+meVcLMdCDnVRetkMd18
 Rqt32YQtJDIA3fe4MnzWeTudvk0V6ispR2FdVYkCSitY8wcJNKWVsNnefPxMERUKbYit
 Pk8DdzmLBJr1KFwnnMxYF24UpjGZyVMwQswhUrUEQteeQcsvtMofncQtwO8Viu7mofy6
 Nv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=Exbs1FjN+tXbO1Oha8wD5G9T64WSXPeoDnQnv8KDjpN44usDcPmnOlJWBjbZX0VeYy
 bi9JGvqUOa9yJ5rgZO/a97MlxOxTfex8zV3tO0nKKiXZXvV3LyCERIrNf6fmSO/U47R8
 fw7i/0QsBkV4T7AxGhbmqiYtdW3J6DbakIodCbXR6l23WSLBW5AGwdm9yCqjONC8fvGK
 Vn74T6TfHV+Pujmqjsa5/VUcWNncNZKvg2a26qrrtRfM04E+woiQhivxOdJ4K454lsXq
 oVr+6kHxQRj0H0a0NHGrbJllPapsDEyJFUpEigWO3QCUk9ApXYW5Jdig4Io+9jhb1S44
 l+yg==
X-Gm-Message-State: AOAM531wlujjRAxsDMyHNxX50cEUEL7wdewejOmGUQntqR+DaARjOiV8
 255zbfRQvUYMOhDUrRrcHFSjPVEPGHwr0A==
X-Google-Smtp-Source: ABdhPJzMSSRmLg8X8zh89BkTxK7lzDkxlmGd7j1JFqSQPyI6vi2BlWj6OheGL/3zT6TH9T7PX5u0aA==
X-Received: by 2002:a05:6602:3411:: with SMTP id
 n17mr11937169ioz.128.1643658998219; 
 Mon, 31 Jan 2022 11:56:38 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/40] bsd-user/signal.c: implement force_sig_fault
Date: Mon, 31 Jan 2022 12:56:04 -0700
Message-Id: <20220131195636.31991-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


