Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A061E49A230
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:56:09 +0100 (CET)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB44-0001vW-O6
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:56:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfB-0002FT-5t
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:30 -0500
Received: from [2607:f8b0:4864:20::12b] (port=45898
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf3-0001Zy-Sn
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:19 -0500
Received: by mail-il1-x12b.google.com with SMTP id h30so15510253ila.12
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ke/+X5Zea6HMmQRZ3wmrxLwRK299Km5+GDI9cZXaqxw=;
 b=YoE7R6BfFiusBr+LgBY7ap8JyofTxgrJCaPhce6VJUQ4ume/uZ0EKztfP1+AqHeAS6
 u1/VP76oE1zLg0GcLqfsp2i1CoXEtGx17qeSP0GlVvI7fNScs5wvcD09aaGVT9IZ+Clz
 /Ycc9MH44uWBFNRJMn/FO201xXUfpxre1lxjAJB9HIlBiGfTptziOBpoFeQyunbT+KEX
 FbeqfQyemGQ5PGRgOtJHyloFYJm6gaFtkFnjpyR+ZfgMRcWduvJdGj002XCk4gcPH4Gf
 wtNdhTUSJlc0lRB8QXs+4XhJnx+zHS9PyxLsEqXCSspeDmoaF31TRSUtDIMUEVXCkAW5
 RlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ke/+X5Zea6HMmQRZ3wmrxLwRK299Km5+GDI9cZXaqxw=;
 b=pVKGQwEleEVrVK6LbXNylz+GAWpSgRmo9IY3fcH4qHhppNXCKbCq5Cj+wqyaCHJame
 rb59tKobIk0YOB+HwWwZenbmZvfV0JETwvbZFkEr3qbRTUcnS22p/sERi0DZK5wzPvcF
 df5qUYDJYB/FwqgkOzEQVxA3p0KstkXL91J8O2ysziJpf+V7xpthBL+ALCXfqrhXSWLJ
 vxWexSALpq0LR7naFfTYGyYpwdSqchaWwEnmkAc1ASabuGyEcAYBOQVglmbsBsvJHNAo
 hb2mSrXGFP66YexEYbcUbxDe5IDYewd25MbRclBNxH9ExK7Q66vAi1C3fNAFL0MhY8x1
 yWPQ==
X-Gm-Message-State: AOAM531GJld6lHf6v120+mPVRQKsvG9ue252gXoS9B6yn+M1nHUOufHU
 YLC53e5M7691Am69ycygCzmTKLUCiJTI+g==
X-Google-Smtp-Source: ABdhPJyTub0cs9kMxWoa2zocHmOv4UAq04/9QATDTT+ZYDi4dsBnR3aDaqLX05JHdNAol19v0ZUoig==
X-Received: by 2002:a05:6e02:148a:: with SMTP id
 n10mr10224575ilk.228.1643074212197; 
 Mon, 24 Jan 2022 17:30:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:11 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/40] bsd-user/host/arm/host-signal.h: Implement
 host_signal_*
Date: Mon, 24 Jan 2022 18:29:26 -0700
Message-Id: <20220125012947.14974-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
arm.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/arm/host-signal.h | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 bsd-user/host/arm/host-signal.h

diff --git a/bsd-user/host/arm/host-signal.h b/bsd-user/host/arm/host-signal.h
new file mode 100644
index 00000000000..56679bd6993
--- /dev/null
+++ b/bsd-user/host/arm/host-signal.h
@@ -0,0 +1,35 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ARM_HOST_SIGNAL_H
+#define ARM_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[_REG_PC];
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__gregs[_REG_PC] = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * In the FSR, bit 11 is WnR. FreeBSD returns this as part of the
+     * si_info.si_trapno.
+     */
+    uint32_t fsr = info->si_trapno;
+
+    return extract32(fsr, 11, 1);
+}
+
+#endif
-- 
2.33.1


