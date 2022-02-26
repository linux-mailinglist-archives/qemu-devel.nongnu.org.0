Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D34C571B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:23:37 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0nA-0001Z1-DA
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:23:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xc-0008N9-Ky
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:32 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=34502
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XZ-0000RZ-5R
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:32 -0500
Received: by mail-io1-xd2d.google.com with SMTP id f14so10230319ioz.1
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g2a4iUrTub2nz3g1lIS5iV9/jqK5TM3KXVGIVjpt/k4=;
 b=ZC3ZLBuI8smnKr5OJUbtyGkKZpLo7K1i8nsBgYwdRgQHBixuK7V/CtZmQkTlQdVrwa
 WRdmiMoKHDzE8FPXkRWSWzGXx7gPXxKWtPSfh3o9GVqTSdSF3Vmm6qtSX8bdNHAXjcgh
 Y0wTyj1WF3/5TO/9sST9l10MoJHSwBqrHjQexEgLFNwauURkHevAp3pprRW9eVl+ai6f
 Vq6wteKgqvId+lQsOGI8/3KBozOHIw0oV6U3nlsMQtwkOge2QywiB5OOaZ2P8l5P14IY
 Pfh2pG+EJQqD+6Ru05IU/PnxX8K+odGv+l1Q5Cuwa+kwHYxenzRM1aXxbAty3zrofI+7
 vmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2a4iUrTub2nz3g1lIS5iV9/jqK5TM3KXVGIVjpt/k4=;
 b=v2ow12k2iC2LPUh/mBA8/ngkjRVE0zNe3iJwDRKWQRjhmQ8tlZZM8CbEK/XTZ1Z40k
 5iClFNsbSH2As1ig862j+m3D7l9nTiVoH00qVmXW7BKzFtm/hFs2LUQ/7RjijCW1y2PJ
 1tnlnGPIT6G9v3em6bYgTLsDj8Rv2H/1W477A6H9Y9WIWoLHiO6iIPITV8P2VkxL53qD
 Soj5kdd2biPkCBZuVbPvxZaK3wXnSx5CPLZEldr6fmb3vtxUOMcw5nqV8C0JelYIhQav
 M92i3WhrWdVSy/mcqR4+wvoFaalxxQtQ/4YRUuOjPshMnHildU5Vb6RS3uGSqOboUraL
 tSYA==
X-Gm-Message-State: AOAM532815bdMYxZfjrqHlg+Jk4wwRk0D7NruYdhXwrCgiw5KMg4mZgL
 vif7EuzPSXof+VclocRFfIGQvnnR9Wn8sQ==
X-Google-Smtp-Source: ABdhPJzeacKxKO3dzqGCZxuIAtZmTb1plNNb+cPr4UYPaBUNxAG+iuRwrUvWGssvuK+BfkKnBoqvzQ==
X-Received: by 2002:a05:6638:92a:b0:314:ed12:9b3d with SMTP id
 10-20020a056638092a00b00314ed129b3dmr10743840jak.229.1645895246450; 
 Sat, 26 Feb 2022 09:07:26 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:26 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] bsd-user: introduce target.h
Date: Sat, 26 Feb 2022 10:07:42 -0700
Message-Id: <20220226170744.76615-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create target.h. This file is intended to be simple and describe basic
things about the architecture. If something is a basic feature of the
architecture, it belongs here. Should we need something that's per-BSD
there will be a target-os.h that will live in the per-bsd directories.

Define regpairs_aligned to reflect whether or not registers are 'paired'
for 64-bit arguments or not. This will be false for all 64-bit targets,
and will be true on those architectures that pair (currently just armv7
and powerpc on FreeBSD 14.x).

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target.h    | 21 +++++++++++++++++++++
 bsd-user/i386/target.h   | 21 +++++++++++++++++++++
 bsd-user/qemu.h          |  1 +
 bsd-user/x86_64/target.h | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 bsd-user/arm/target.h
 create mode 100644 bsd-user/i386/target.h
 create mode 100644 bsd-user/x86_64/target.h

diff --git a/bsd-user/arm/target.h b/bsd-user/arm/target.h
new file mode 100644
index 00000000000..419c039b68e
--- /dev/null
+++ b/bsd-user/arm/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all i386 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_H
+#define TARGET_H
+
+/*
+ * arm EABI 'lumps' the registers for 64-bit args.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return true;
+}
+
+#endif /* ! TARGET_H */
+
diff --git a/bsd-user/i386/target.h b/bsd-user/i386/target.h
new file mode 100644
index 00000000000..9b9df047a3b
--- /dev/null
+++ b/bsd-user/i386/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all i386 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
+
+/*
+ * i386 doesn't 'lump' the registers for 64-bit args.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return false;
+}
+
+#endif /* ! TARGET_ARCH_H */
+
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 56042ddbc5d..a9efa807b78 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -35,6 +35,7 @@ extern char **environ;
 #include "target_syscall.h"
 #include "target_os_vmparam.h"
 #include "target_os_signal.h"
+#include "target.h"
 #include "exec/gdbstub.h"
 
 /*
diff --git a/bsd-user/x86_64/target.h b/bsd-user/x86_64/target.h
new file mode 100644
index 00000000000..8956631db1d
--- /dev/null
+++ b/bsd-user/x86_64/target.h
@@ -0,0 +1,21 @@
+/*
+ * Intel general target stuff that's common to all x86_64 details
+ *
+ * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_H
+#define TARGET_H
+
+/*
+ * x86 doesn't 'lump' the registers for 64-bit args, all args are 64 bits.
+ */
+static inline bool regpairs_aligned(void *cpu_env)
+{
+    return false;
+}
+
+#endif /* ! TARGET_H */
+
-- 
2.33.1


