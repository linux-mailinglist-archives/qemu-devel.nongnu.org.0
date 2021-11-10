Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A201E44C51E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:36:00 +0100 (CET)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqZr-0006rW-F1
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:35:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWj-0007jS-L0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:45 -0500
Received: from [2607:f8b0:4864:20::d36] (port=43779
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWg-0005ci-PH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:45 -0500
Received: by mail-io1-xd36.google.com with SMTP id z26so3460245iod.10
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xX0hIQSZjL8ZR7arM3SqbUY2tpWX5DtaOT38oFoQlVs=;
 b=XdgKX2MFsNTdPawTvR1a9Guy4tJRvkcuxcrlRPVJbmu3NQI/C79Hk6C0SXy8eUVPBt
 bTvX0hiBM80gSjOETPZqq5PEE/7HRKd/WEbfxjTDYmOHjNCnjrgfbVDu96lA+OwDSJuz
 3YVV2ars5Y+0fusZ1XDH2qkhKXenxlmS2qdsjlnilzSMn9SeIe+EnvXNuGiqiFIBxsKW
 POumbpC+ZgxyXLDQnamFhCNnuszZFrJWR+5s/36fWaIj72yg4KRkmU2EEcjClEcUJrnL
 H4vQszMMA5hPvpvvXJLn29Gu2T1XN3jFOG5g+e0LifRKm05EsRkXmOmS95ZX3q32D7ac
 RxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xX0hIQSZjL8ZR7arM3SqbUY2tpWX5DtaOT38oFoQlVs=;
 b=DlYgA0ceVVSNpf8+7NKGwp+ZDvi5hIlCRVS0Wx6L0PcyXGW0KS2aU9+kkgh0Jktew9
 7rlgdsp8tTQh/pIpP8LKd3MVfFT+MIpgKJRQ8eX7lB9GmUwDtE1KS0GPWJsF0SebQlr3
 QFHcj7ZuD9CzYmBx66yTsZWCI7aQPEDYCWkJGQDdiaQOaP3/x6tAXpgSipE5lxx7TCl5
 BimLqQB0I7U/A5ulioi3bE7pB4TsA5nRXcPOe3cRw/uNIozG8P+dXiN/Zfy82uX11S4C
 hXAXMA+plbGc7bNQNNLQFWJNFeek9IZjeZr+zxEPkZtm34pEPDzw7hMaegvS3iEGsWBG
 oWDA==
X-Gm-Message-State: AOAM533YDf1HySWufzurPm7APKnyL0hBQlUZZUdgNgIjAY4tNXXoBzlK
 vqTKCOmP8Qv4Y4zmLtsTk4pCgkiq36FcCQ==
X-Google-Smtp-Source: ABdhPJx3Rp7gaStEeZ+vhMmC3WNZCyp/+0l7RWaIV4yyju99auh62UIB1TvzWrj3cHsVjn1Ll3ioqg==
X-Received: by 2002:a02:2345:: with SMTP id u66mr74890jau.129.1636561961495;
 Wed, 10 Nov 2021 08:32:41 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 6/6] *-user: move safe-syscall.* to common-user
Date: Wed, 10 Nov 2021 09:31:33 -0700
Message-Id: <20211110163133.76357-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
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


