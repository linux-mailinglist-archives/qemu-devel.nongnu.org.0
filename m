Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B74A5BAE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:01:13 +0100 (CET)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErqS-0004F7-Ci
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:01:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7t-0005C2-7L
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::12e] (port=39774
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7q-0003bp-DL
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:08 -0500
Received: by mail-il1-x12e.google.com with SMTP id z7so13965114ilb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSGQ/GmeXW/IFZq2u0G+wlHtpufwI4M6hwKbZgp8r+Y=;
 b=EkFYLX68/ZjsPTbHsy4HZV4lKFTYd2s7aFqXUduQl8oGdt64iX/8e/FOp8xEE5OocQ
 ZmQfhRGjrUvuQ1kAYhtd4hQN0x8IOOngcHq31dKG5Qw5U9Ltvk0Xe7ECQllbTt3Dezg4
 5UCAHwdlftgKdxtkgdOTLcv/yf/N0OG+9J/g3fjU5vYQqEHGKaEteP/KWkX3TtOpRvGi
 NqCaEi+Qk7Mh6ZIO2jhEO9BxTW3cZy4W6ELteRQyDBLQK985xKhP41OdrC1WWZu6u9MM
 wrlJ58sx9YOBHfNzpmqdGJGRbV7W/NWaBvwxWE66bgYcKwzxh6yqpyjrPJMQps0z9GyC
 T3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSGQ/GmeXW/IFZq2u0G+wlHtpufwI4M6hwKbZgp8r+Y=;
 b=Vtpk12Bzg4zklgTuN/g+NtbxB7bRqgU8PfSUFZ31a1MRnvB8u3yXDlCH6R+cRhKiqf
 8pVbjYJpZ0lUy77g1AzgNXAk57auQXLxdkzJXBKiO8lwagUd9EAySLMtAsfTBRHyAJ+X
 NnVTvfCOo2+hFBEv9vHed1o0iILBWezoziOpi6k6xmH5w8fIsRjgotFy2CaIjIX0is2M
 0eYbVKlvUKbJ98GBYYA1Q+frxvc6sQZmFlodaJudRAYEUzpPi11aAd4gQmGgeG7ZYP4W
 gy1fM0ITmegqYVPb2+BKmolUT2vwf5SU7hAClvcFOj9EjcMQZF/4QnsrZg0TFgtWr1QR
 io/A==
X-Gm-Message-State: AOAM533h5vLw8d+yA5FwOPfYqyAvbaR9tsdGh9nI7+aOtXAmKlRtsOsk
 fEqg+j8HPWJ+vczmcQgJYgzCaQRWOEHZMA==
X-Google-Smtp-Source: ABdhPJw9u1D5FjPVrtyZA2NxzflwZ8o48/bjpPFjnbg1sgzPhTVTW3/XxYE07cFNzTlY/Eh8aY6INA==
X-Received: by 2002:a05:6e02:17ca:: with SMTP id
 z10mr7313084ilu.100.1643714105107; 
 Tue, 01 Feb 2022 03:15:05 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] bsd-user: introduce target.h
Date: Tue,  1 Feb 2022 04:14:50 -0700
Message-Id: <20220201111455.52511-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
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
index 00000000000..1f7ee49bfb4
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
+static inline int regpairs_aligned(void *cpu_env)
+{
+    return 1;
+}
+
+#endif /* ! TARGET_H */
+
diff --git a/bsd-user/i386/target.h b/bsd-user/i386/target.h
new file mode 100644
index 00000000000..b0ab477d683
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
+static inline int regpairs_aligned(void *cpu_env)
+{
+    return 0;
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
index 00000000000..6d3aef8fc49
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
+static inline int regpairs_aligned(void *cpu_env)
+{
+    return 0;
+}
+
+#endif /* ! TARGET_H */
+
-- 
2.33.1


