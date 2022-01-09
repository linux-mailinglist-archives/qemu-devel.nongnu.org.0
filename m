Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14487488A9E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:37:35 +0100 (CET)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bCI-0000hN-6i
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av5-0005n0-FF
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:47 -0500
Received: from [2607:f8b0:4864:20::d36] (port=44768
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av4-00077F-5u
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:47 -0500
Received: by mail-io1-xd36.google.com with SMTP id h23so14307224iol.11
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+mDsyE6iKW/0OlAkZLrdWVvhPaN3N+mGKQdNQNNxRM=;
 b=F39kkwpo0rH2GF3Qwo/hur6eSDX0eQwZcaTyiSoz+UvZ3/Q6dWdrXKSUNv9dUWbXQn
 q5nNi6bdmpRD4ZVok+HYZcpC8E9nK0dCPzTGwS7T9xMBEyfrE37Uvgje0l8d3tJR0TCl
 YS7gmzd001Puxw8fjhuzOstXY8pBh1dYjEKKzariGgTodXwhMQtBMdRhUUR6c1UtEZaj
 ajdMK+3FDwYMgNjjvKpf5pMrWsLSKSWssbaKsmGN/ssGmbsebgVXUeL0U6sWJvRHT52c
 0CA1R4sVzbWrksrP8RLxbxIfi0MTmFspKrOhdgff0eqTyHUCUPFgEAEz/C52rEQUexGQ
 4GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+mDsyE6iKW/0OlAkZLrdWVvhPaN3N+mGKQdNQNNxRM=;
 b=VkYrqPeC049axiGMi9r/lTRuLTweS64ZqPPzujHrVEpbJHB0TTY7RdygMoOJ5ta643
 bGRKbm8ker06HgFaZ4cjykknDj0nUUEvSFsS1+bXBYviLGohhsdZsG1NSTR7zviDbHxl
 Or1FS1lchyB9ybstBHzzFxK+hKCXzEE1K6QmkG9nlmJzUId053Plc79S551UULkihJIU
 D88usQcPCwH2XBRGyy3koWyiL+AU0cminzAOjGXcJWojZBTUlTSruSCxU8jZ1gBaHtu0
 7cO6nh7PENuj3lXYLu86hEyZ++dw5nAT/JkbtO8lDffiEI3vjORvYgvMKy1sDOD+3UGj
 mrFA==
X-Gm-Message-State: AOAM532Dy1sDbS4Mc6sGvOQ3/RfZyT2kUdtDpYKAeRTx7N4K+fl/XSFH
 R7USM83KXTCCEjL23SVbGIGyUB4KnAQ8jwpJ
X-Google-Smtp-Source: ABdhPJwJHJwqzzWTTro2FJ97Z8BufOfgUeJI/umXoQuH1NW80ioa3mTHgFygCBng/pqg4CAkoW9smQ==
X-Received: by 2002:a05:6638:359f:: with SMTP id
 v31mr32430668jal.59.1641745184902; 
 Sun, 09 Jan 2022 08:19:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/30] bsd-user/host/x86_64/host-signal.h: Implement
 host_signal_*
Date: Sun,  9 Jan 2022 09:19:06 -0700
Message-Id: <20220109161923.85683-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
x86_64.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/x86_64/host-signal.h | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 bsd-user/host/x86_64/host-signal.h

diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal.h
new file mode 100644
index 00000000000..43961685df1
--- /dev/null
+++ b/bsd-user/host/x86_64/host-signal.h
@@ -0,0 +1,37 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef X86_64_HOST_SIGNAL_H
+#define X86_64_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+#include <machine/trap.h>
+#include <vm/pmap.h>
+#include <machine/pmap.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.mc_rip;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.mc_rip = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * Look in sys/amd64/amd64/trap.c. NOTE: mc_err == tr_err due to type punning
+     * between a trapframe and mcontext on FreeBSD/amd64.
+     */
+    return uc->uc_mcontext.mc_trapno == T_PAGEFLT &&
+        uc->uc_mcontext.mc_err & PGEX_W;
+}
+
+#endif
-- 
2.33.1


