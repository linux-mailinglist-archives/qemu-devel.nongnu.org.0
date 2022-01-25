Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4E49A221
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:49:44 +0100 (CET)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAxr-0005Zl-R7
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Hs-9D
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::134] (port=44596
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf3-0001Zu-W6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:27 -0500
Received: by mail-il1-x134.google.com with SMTP id i14so15512592ila.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=HzoTLHwHZzUMXXd4kmxLBvsxjhUB5suqPlthEbHXhKw7WUQYKnXFknxSD6hRC2TaNl
 S99PwoGmmZvr97RVsMYdN5BXv+w/Ewcmhk9ysdjCA3VqXlHxTY/XkzozSOfJVdJufesx
 Yb0JNWuovWDxvgoZmB9bHJtgSnL2mXTyRhaP9sG7cWZiwNtlq0UDJhQGYvmju7vvgtZN
 b7rvHSIEW0oRgAPkrZP1G9Gcb5R+zOlGDxBPFeDVeaLvhepcIU1PeSQV/28Iga8LOBeS
 NqAy+amK1YinBFmRBfH0lxDuaBZNDsV46k4fHUR8h/76XRXeY9zBhC8TcdaGhOYrfwyD
 djzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=fUctrxu4KcTtwcFiGMTJVwVc1NHoITpCje7gkGsslroaBXySW1dJN5ZPSc9DoNhbKV
 x5mLuv4462nHvrbLHJ1dKJrEz/hUuzpwlM/gdjhW/wxAxMchKk/o+/g/8a/Cjp4w2lWO
 dv5JOqYyWHxwxNWkv24x3Ln+mlC9aeS467eS3CgKRE9hRyShPnWPYXUiHYTeu5VXmyuc
 36cib/hLEpMiNAb2KxKZXYb+XC0mKBNWqaJSLfMjZxdNBhLW6ZNxino5m1+g21KeBQEV
 4BPm97BG3IZB4qOxatcbcrqQLgsSpxbDhiZrK2+WR53NxvVhpzWR5Z63iLH47887u7t8
 7E9Q==
X-Gm-Message-State: AOAM532rBnCYkCuN3voW/YbAbG9c+IL+CKSesGrRHxYs+MVFta/AjJ0r
 nPy46oUaubQdjS9dDCHu9AGB98+AFbm44Q==
X-Google-Smtp-Source: ABdhPJyLfzUeBzeHUi7xQLzdHsMJXAhKicv1VkTR89WcoFkT4JC3WVNEk4405pvFT8ZH5LFLmCYllA==
X-Received: by 2002:a92:d810:: with SMTP id y16mr3443664ilm.64.1643074212939; 
 Mon, 24 Jan 2022 17:30:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/40] bsd-user/host/i386/host-signal.h: Implement
 host_signal_*
Date: Mon, 24 Jan 2022 18:29:27 -0700
Message-Id: <20220125012947.14974-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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


