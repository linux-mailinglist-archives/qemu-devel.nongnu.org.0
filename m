Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DF4A4FE6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:12:19 +0100 (CET)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd2A-0000ko-UY
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnd-0004sq-Gc
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: from [2607:f8b0:4864:20::d35] (port=42499
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002ec-6c
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: by mail-io1-xd35.google.com with SMTP id r144so18376570iod.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+J/ZcXBMkl7vIRUbXRkoafaooBA4s7iAGTsSYqX/VvY=;
 b=djDQUxApj4ttbasQSfDnHZEdyu/8JJE/BzdHxQoCYVyj0WAh9/VQ1SlGwPMgivNNJ4
 WY14lFoAVV+1bRXE2K/YBOZ1UX+KzAeAsFnNjk4DeS6SsRAWVaG9BMy43KEpC88LJ/Nm
 iIhBjmhG4dm9dNkZf/fnkuJ2L5bX1fE6L1vVNtmhBEQ7CYX1kQnoUIAWq+6Lx4cmO0hi
 6RylR6+AGhebd88Pou2EdP57c3gekuFU1e8k4DmiuKehujAmpWpm29CJVFRL1ea/rECw
 FowfzMxVbsBktpxH14xxqfj6EHSQttOa5A+02hwMgD+yEk6ihdPdMpcM53L6vbA6Ndop
 TyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J/ZcXBMkl7vIRUbXRkoafaooBA4s7iAGTsSYqX/VvY=;
 b=QIpNXxviay6IniJjV9RBK/IHJwBY4UcDK4pxTCMYT4uj3rfakZU2gNdsu+UEDFBTmM
 olASTsYsSpJZIyAgB48r9fuDsqWDilKe+z7Eyo3Y2RTa6hHBNhBqr8yGgTTv/YwATOZv
 8mJHOALhzp5wTRrcEyXdjk5brmtga7+pLx0mG6iLk/fkTUxb7NX6LExsTpcefLPrzmKw
 eAAZ6flg6qEG8hJhb/EXnHo8k5SfVTYesVBKfgnytyFclH4w1d5F+vqS9MXvRDALQFFi
 +zVzvlp1GBcc7x4TfcuuFmj+WIs1jfiQqv3uFi9pSFVAYkWIXDBJ1roCkUpplRGfYx1k
 rjxg==
X-Gm-Message-State: AOAM531dF+6SoSHHubZwEdgTYpjRX78KjWR4lfXB5fj8odFfdA69/sFp
 /5gJDJLMgEUxfd9mcXinO0t2PUcpCmn/1A==
X-Google-Smtp-Source: ABdhPJyY8Qsp3vkBukdRkvtpT9rclcV2rs592HLA/rSJbjc0gscnceBOehctlw0OZF4xesJRWti8pg==
X-Received: by 2002:a02:9997:: with SMTP id a23mr3028256jal.12.1643659011413; 
 Mon, 31 Jan 2022 11:56:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:50 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/40] bsd-user/host/x86_64/host-signal.h: Implement
 host_signal_*
Date: Mon, 31 Jan 2022 12:56:17 -0700
Message-Id: <20220131195636.31991-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
x86_64.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/host/x86_64/host-signal.h | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 bsd-user/host/x86_64/host-signal.h

diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal.h
new file mode 100644
index 00000000000..47ca19f8814
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
+     * Look in sys/amd64/amd64/trap.c. NOTE: mc_err == tr_err due to type
+     * punning between a trapframe and mcontext on FreeBSD/amd64.
+     */
+    return uc->uc_mcontext.mc_trapno == T_PAGEFLT &&
+        uc->uc_mcontext.mc_err & PGEX_W;
+}
+
+#endif
-- 
2.33.1


