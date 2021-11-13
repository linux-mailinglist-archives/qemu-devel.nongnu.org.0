Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0E44F152
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 06:03:42 +0100 (CET)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mllCX-00088X-JP
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 00:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll60-00077c-7C
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:56 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=43648
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5y-0003Me-FI
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:55 -0500
Received: by mail-io1-xd2c.google.com with SMTP id z26so13786506iod.10
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xX0hIQSZjL8ZR7arM3SqbUY2tpWX5DtaOT38oFoQlVs=;
 b=s0+R+QnZ9cRezKbYnHenbv8CsI8Km6OGbbyFZwKt4kn3+r2AfTceoa/JsL3VJaAU1P
 20o/siBSLhNSN3rGDlPOq6h53ZFpb3z5qF62MirR8lTtR9X/X1IJiiVgjcQgj8jAk57P
 eb8m4Mz761hDg1X3hlXMTM/HCVvaH5exYihgdGqw/yV9wq91o4h7D7VvQ1zVoFJgOt3d
 Q8hq0peLkIjRN2A4k2nsHfAIgeBzDI2t+jJLX1K9Pshbx9QwQtG/3smA2rRh8erwUxMA
 d616gtSYZ1Mo5vsmIkSNj9aEAMMIJzAbhXXQxOXrEi9j3Ivg/wC0/xr0vOEP58VWp+sj
 +PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xX0hIQSZjL8ZR7arM3SqbUY2tpWX5DtaOT38oFoQlVs=;
 b=SMEaANdVUGrGIONxPpwU1m1Ie+L3DqFpHfrjaVmmg+Bm/JUhshryjSivcMEsLNfKhw
 0jsIcJzbirGbKaleEJePsTIsD+DaQQyEmo5/9o1Gto+hnHgVO4sIIWYF/q6MYYh5BU81
 o0rU3Q9OKdZYqITs64XdoKhZrbGOcSH+wopLP76Vz7+67GcNetz9sTi4WAF1G/EWeIXY
 qwCvihLglJ6va2DaBGM3O+emncWooFJgqejy6tDJIlF1gzs5+9fmTeCPIZ5OW8eECDac
 aFQXQpo9w1Ih6JpPDTfOVdEASaRxJFPeaDGmrZLjMiiLhdlSsaIrf7hEi7fUSctSwfcG
 Z0CQ==
X-Gm-Message-State: AOAM530yKZCVfff4wy/2Ne5/yq/Qh2kg3eciSbvjyFJlPinllFMHQH8d
 UWk3fcx3Hm5PJNlXBTPCrTUVawT0k2MkmQ==
X-Google-Smtp-Source: ABdhPJwFiF+wTum5KPwky+ZyWA7aN/BZot1XPStRVIsidCK/Z2SVJQX+NRrtNnvgaIYWJG+v3O295w==
X-Received: by 2002:a05:6638:f83:: with SMTP id
 h3mr15598889jal.102.1636779413104; 
 Fri, 12 Nov 2021 20:56:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 5/5] *-user: move safe-syscall.* to common-user
Date: Fri, 12 Nov 2021 21:56:03 -0700
Message-Id: <20211113045603.60391-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113045603.60391-1-imp@bsdimp.com>
References: <20211113045603.60391-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move linux-user/safe-syscall.S to common-user/common-safe-syscall.S and
replace it with a #include "common-safe-syscall.S" so that bsd-user can
also use it. Also move safe-syscall.h so that it can define a few more
externs.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 common-user/common-safe-syscall.S          | 30 +++++++++++++++++++++
 {linux-user => common-user}/safe-syscall.h |  0
 linux-user/safe-syscall.S                  | 31 +---------------------
 linux-user/signal.c                        |  1 +
 meson.build                                |  1 +
 5 files changed, 33 insertions(+), 30 deletions(-)
 create mode 100644 common-user/common-safe-syscall.S
 rename {linux-user => common-user}/safe-syscall.h (100%)

diff --git a/common-user/common-safe-syscall.S b/common-user/common-safe-syscall.S
new file mode 100644
index 0000000000..42ea7c40ba
--- /dev/null
+++ b/common-user/common-safe-syscall.S
@@ -0,0 +1,30 @@
+/*
+ * safe-syscall.S : include the host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ *
+ * Written by Peter Maydell <peter.maydell@linaro.org>
+ *
+ * Copyright (C) 2016 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "hostdep.h"
+#include "target_errno_defs.h"
+
+/* We have the correct host directory on our include path
+ * so that this will pull in the right fragment for the architecture.
+ */
+#ifdef HAVE_SAFE_SYSCALL
+#include "safe-syscall.inc.S"
+#endif
+
+/* We must specifically say that we're happy for the stack to not be
+ * executable, otherwise the toolchain will default to assuming our
+ * assembly needs an executable stack and the whole QEMU binary will
+ * needlessly end up with one. This should be the last thing in this file.
+ */
+#if defined(__linux__) && defined(__ELF__)
+.section        .note.GNU-stack, "", %progbits
+#endif
diff --git a/linux-user/safe-syscall.h b/common-user/safe-syscall.h
similarity index 100%
rename from linux-user/safe-syscall.h
rename to common-user/safe-syscall.h
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index 42ea7c40ba..c86f0aea74 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -1,30 +1 @@
-/*
- * safe-syscall.S : include the host-specific assembly fragment
- * to handle signals occurring at the same time as system calls.
- *
- * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "hostdep.h"
-#include "target_errno_defs.h"
-
-/* We have the correct host directory on our include path
- * so that this will pull in the right fragment for the architecture.
- */
-#ifdef HAVE_SAFE_SYSCALL
-#include "safe-syscall.inc.S"
-#endif
-
-/* We must specifically say that we're happy for the stack to not be
- * executable, otherwise the toolchain will default to assuming our
- * assembly needs an executable stack and the whole QEMU binary will
- * needlessly end up with one. This should be the last thing in this file.
- */
-#if defined(__linux__) && defined(__ELF__)
-.section        .note.GNU-stack, "", %progbits
-#endif
+#include "common-safe-syscall.S"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ee038c2399..cfda166f9c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -31,6 +31,7 @@
 #include "trace.h"
 #include "signal-common.h"
 #include "host-signal.h"
+#include "safe-syscall.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
diff --git a/meson.build b/meson.build
index 728d305403..2f3b0fb2d6 100644
--- a/meson.build
+++ b/meson.build
@@ -2873,6 +2873,7 @@ foreach target : target_dirs
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
       target_inc += include_directories('common-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('common-user')
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.0


