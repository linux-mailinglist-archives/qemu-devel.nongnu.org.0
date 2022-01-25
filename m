Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928349A220
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:49:42 +0100 (CET)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAxp-0005PD-NG
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAep-0001wF-IJ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:03 -0500
Received: from [2607:f8b0:4864:20::131] (port=42820
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAen-0001Lc-V6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:03 -0500
Received: by mail-il1-x131.google.com with SMTP id u5so15515108ilq.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=tVYd1zC5mC4CJkl3VP4ooUHmxppuy5WW2HrCuhpkWL60U6qyi5hOv7Q9lMCqu6zond
 /O59XcsL1CPlfRIMs6QIe3Xw2/zIyq9tNZtCSpG7V0l0+F2ondReFnuDcXMB2BsQoHDB
 rnJyKkLkCp61afksyKINwlfrtP9PU6O8j37Tn3qCQJf1DYVCZiweYyo34HAru4MHiBuG
 HByZQAaU5ll8RTd9oJq1+lYRXhPaeHaa93Mr4V8IGAH1r/QyAjwCOjNzhughlXWCm2sE
 H/VmjgXbTgldj4Xs/ISENqbIWKYuwglVfW3S7IeJ2RJMrcD9QePJi9u3Dn3yghXK0MXc
 68zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PjL9OS801//J6FLPGxe5bj91YwywO1H07GXqkeIugE=;
 b=ejG+6tPzaFjI1T+E1LWFtaXD3Ic0Uj+vzxxu0oYOi81ajUbb27YCXQ6BMwEl2xSO3L
 76wc1Z2jdfHIXSAaFxI2mz1KIkvtYjCHRcBkh3JcmxarlPrEFr1vLQZSjdcttQ/bqfe4
 3CB0NKrn+CkohjvPuzyCUK0WMhN8Xkk3BZ8ShbUMs91PHiyA35tZruXOG9n7HFs/KvHa
 W1RQsp1loU08WJO46mZDI+SHUeHWFrLvMbKsNgXLF4XjcELDkJJwHWmmngpY+1jmNjzt
 t7AEi24w+FK0009kRatNehtaNJyVaKLLuy5HMfS6/Qigz9NXSrdo2zjol0sPOdjUd2S8
 C6/Q==
X-Gm-Message-State: AOAM532XJk5wSDnBgTaWlwXVVxhKphcUQI/JA012h4UHmqfe7u1Jvnb8
 UtFgsRk3YQj+LBLulx5BUx045Xb98tUjMQ==
X-Google-Smtp-Source: ABdhPJzWxDzdUvxt5gUMdpOaHiYq3JFNW+LvVF+p0bTJO0QZvERqOK3zQAN3TuvcXA155dDpkXUlZw==
X-Received: by 2002:a05:6e02:1c0c:: with SMTP id
 l12mr10392801ilh.273.1643074200758; 
 Mon, 24 Jan 2022 17:30:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/40] bsd-user/signal.c: implement force_sig_fault
Date: Mon, 24 Jan 2022 18:29:15 -0700
Message-Id: <20220125012947.14974-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


