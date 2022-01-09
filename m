Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E5488A81
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:22:45 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6axv-0008K0-Cu
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aur-0005M2-4O
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:34 -0500
Received: from [2607:f8b0:4864:20::12e] (port=46615
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aup-00075O-5V
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:32 -0500
Received: by mail-il1-x12e.google.com with SMTP id e8so9249571ilm.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ToPw1lb/7gSL+1Pg8gDpDNCotwUl1c4vZ43gWdUHFE0=;
 b=Te8rKZ+/gafC74iQ7Ut0k3F5IjPGdOT/OmyfvaUWXvWKyo70rC4UmjELCHx1CiVXou
 f0DfVTbDTAQQz0bRJSSTLDuzhoe3JJ+vZMPdTWAO25eqwqYC1SSZ56YZs4a8Xi0M8DZG
 9PbP5UKRlt4Nog2GBBGsMB14IDBOE6BkWrhI/LGtTBJeXKIq2/MXF4EGUc1vXbw/NQwN
 CfkbmaNNR61Zuu7pfHU0RoLRuWFeYLVU1EzhcvnkEzL7NprSP2XBI/+HzD93IFBYOa+0
 5oKTT5nB0nYGlAD7OxolcwgjPapGYvcnYPS+ynDcnfnnLWu4agxLUCYCeV37h1lGLdlS
 yfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ToPw1lb/7gSL+1Pg8gDpDNCotwUl1c4vZ43gWdUHFE0=;
 b=7LNwySjdDiXq8vFcszWZdBRcZyDvUMCo0/4LVypP3eSvfxNFGgwzsyFkaafhBvUgmi
 fL26iE2ZC/0tGJagPv4RAdd46S5PEky0d1hXegQwLU9mvmPG1cW16HigCIbVbkthZJhz
 LYAVWIAJhooXNVn4U4z70PHdTu4BT2Zw4rL20U7jemVEuqv9CWXq3KfqQaZB9ZAoxjL2
 dSJApDlKdf3XSY5y2znHk9lY5AOK5svv3k4zLoeNzt/QS4KU9fttF5b1MnLMhHGkXat8
 lJA9mDs5nuy+nN1QThubW5DUVzIPdCDwxWLZr6JZr7GkPshUY+zMpiTYnNdwqoP20zw2
 fukw==
X-Gm-Message-State: AOAM531x44GnFAHZZTHOVTRh+0AZPeZRinJ1iAfMlPt7X/HrXQEb49HZ
 lPYRLs8KuQNNvWs8E00WhsXfIdFLjvkPUkIN
X-Google-Smtp-Source: ABdhPJzSW81IDvR1s7vcgFXHh/IBJcElOjbTGI/Oj0DbmB9fYN5vDANOFkiATEgc6y/OnV3fVqmXNA==
X-Received: by 2002:a05:6e02:1588:: with SMTP id
 m8mr18376184ilu.113.1641745169887; 
 Sun, 09 Jan 2022 08:19:29 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:28 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/30] bsd-user/signal.c: implement force_sig_fault
Date: Sun,  9 Jan 2022 09:18:55 -0700
Message-Id: <20220109161923.85683-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start to implement the force_sig_fault code. This currently just calls
queue_signal(). The bsd-user fork version of that will handle this the
synchronous nature of this call. Add signal-common.h to hold signal
helper functions like force_sig_fault.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


