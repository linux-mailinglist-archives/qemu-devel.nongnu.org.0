Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E84A04BB
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:02:21 +0100 (CET)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbC8-0001ua-Sh
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000ka-K7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::d35] (port=33281
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafh-0001aZ-1D
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:58 -0500
Received: by mail-io1-xd35.google.com with SMTP id y84so9768641iof.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=a8VtirO52CbuAFtpIEC3Gk7gCk7FGNXpf1FUnNam/NRjegMfjn3cJuhIoCxPqKKyCe
 HCVt/gRwtmM8OGyfgMUlxICj0LHw/aDsV9nDTkPJQ6YIuTfKrg8FOTC974MzjjcVthjx
 GOkJwDXvSvHLaq9t9jKw33of669z2sUIOmL9Lm2gY/L2AU0AuuT+6oeDghy8+KCx8PKz
 pYqY2S09Qjs1JtaPwuqoAf+kL8PD1ZQTtIbVgsvDJ8q64k9VmhQBaO7N6jdM0XZtSIy0
 sAVMdgj2RIhJPMagZXoclr9ArF4NdNChowCrEn569zJ71NSEjBc70nIjY+CgoPsr7apM
 opUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=pXSctxY+5zP1ZIYh2lgwc10qOwarpdMlKttasmfgksnyU+FG2LM9zgGtjlwjLEOwh1
 /2UwztO4yWCSJByJtKdrIlyAIAD+E7bU/MSb1eQlE4DLb6JOq/QEVfKcCCkz8ro/emsH
 mBy145VsP93UNgOIR4zjKF26ILej/pDjDn7z/YGQaWouI1ULpqVow4c8KxixfbvMeHXg
 L7hdC0BHquCjEg25c6dcFU3Pib00swgMIpkMSsUl0avDX3R3S/o3eNWmWxOL7eVmSeaW
 /MQvoQmQhesT1n+bBBnFOyC0Syf4wkb8rvqOsc1pswyywWGCLdr/OVb2AKWeGfgN75Bt
 NhZg==
X-Gm-Message-State: AOAM5323x8H1b/loxLcWMA6h+/h62kriVvgb47p6dJim+K6ZFJv32FtU
 ghyZFMii0qTjbrjk1ZX1aq2CxhLkhNDBhg==
X-Google-Smtp-Source: ABdhPJzMmkqf1vDsx3tSBJ/VkypFc841TrWazWjfyQJPWZ299HHaepW7NGGZZugsA+BFLoSyeTQyQA==
X-Received: by 2002:a05:6638:3045:: with SMTP id
 u5mr4979429jak.105.1643412504591; 
 Fri, 28 Jan 2022 15:28:24 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:24 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/40] bsd-user/host/i386/host-signal.h: Implement
 host_signal_*
Date: Fri, 28 Jan 2022 16:27:45 -0700
Message-Id: <20220128232805.86191-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
i386.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/host/i386/host-signal.h | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 bsd-user/host/i386/host-signal.h

diff --git a/bsd-user/host/i386/host-signal.h b/bsd-user/host/i386/host-signal.h
new file mode 100644
index 00000000000..169e61b154c
--- /dev/null
+++ b/bsd-user/host/i386/host-signal.h
@@ -0,0 +1,37 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef I386_HOST_SIGNAL_H
+#define I386_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+#include <machine/trap.h>
+#include <vm/pmap.h>
+#include <machine/pmap.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.mc_eip;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.mc_eip = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * Look in sys/i386/i386/trap.c. NOTE: mc_err == tr_err due to type punning
+     * between a trapframe and mcontext on FreeBSD/i386.
+     */
+    return uc->uc_mcontext.mc_trapno == T_PAGEFLT &&
+        uc->uc_mcontext.mc_err & PGEX_W;
+}
+
+#endif
-- 
2.33.1


