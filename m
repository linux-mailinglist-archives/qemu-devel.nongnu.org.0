Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788A4A5022
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:31:10 +0100 (CET)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdKP-0006l0-8m
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcni-00052c-ID
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: from [2607:f8b0:4864:20::d34] (port=37496
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eX-NH
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: by mail-io1-xd34.google.com with SMTP id n17so18417563iod.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=Sl6oaauEX+cU+VPCcpcnOjWZjkAg66bk8DOizjp4sJIQaYns/H8/AVvgg4nPUm/Rv2
 VoZ+X1XS7XRoGUg0WxlDLpXif3Tqbd3zCqVnkoLL+kqNvcH6GHDx5AGHrM24+nEhc7Hz
 YOm7ssfLyRmbUYlA855DQztJjw+UK9+Inarv0IWdw405TVf+vgAraOxRNbS9U58gPaMD
 F0axVq6aenRL6X4FROp8TS6I6Ph3/DN/4h7Dlz0r62nwTRuR8KownFDyT5WeICABaNu+
 4HzEwZeSuyULEVVLxjXppbx03XJ9FrVM/KthUSenhpZIesjvqF8vs5T3kjA6KDpYfibF
 UKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lp+mf01Obw62O4XR76se3KsYTrGoqPsoy/y1+puMOw=;
 b=LqzhFw6ZS/tamdXC2orvnrEF/0OQ5jEC0hN1RCddIm7r+783yb9sicjFzfbGIf5nMx
 BoBO010JNxxD5xYjspZ2wXh0dgTmLtluVAXQguLVz5MmHeuzt0HcBxsabC8OPcR2EAFO
 39Ww/rVQrizkpAjHM5MVsNhGX/M16E4ZFCxF9IPFGPH/36HQBmxzFdTbQC2WhJOlseg9
 wNFL8+JGqfwt3r9r5UxJPiFPV1r4x+FIpLAb6PWYaQlp/zwhJ7RFBSvYoW+WV2LEPMwS
 SRrqAZXS81GhvwS+GCz3z/gvw5uxJY8lsjpee9F2jTT9pDcddFg0J6D9ly7sYg09YHKY
 JDPA==
X-Gm-Message-State: AOAM533brzNPz83ew4xnNRp1aWaYuKQ5muLXDornZsQEibArs4Ld9QQV
 xWL+K5kW0nhYMhukZ4/bbfxhZGwLFdejzw==
X-Google-Smtp-Source: ABdhPJzzwtbIFkNWBLRXArV/lgNGrUI03iij+wO1iGjstoJCc1+HWcuryGf7AdYyo3/A++iX1FXYsA==
X-Received: by 2002:a05:6638:3781:: with SMTP id
 w1mr10240136jal.26.1643659010547; 
 Mon, 31 Jan 2022 11:56:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/40] bsd-user/host/i386/host-signal.h: Implement host_signal_*
Date: Mon, 31 Jan 2022 12:56:16 -0700
Message-Id: <20220131195636.31991-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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


