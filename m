Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E174739AA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:40:12 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvrY-0003u8-4t
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve9-0008Da-UF
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:22 -0500
Received: from [2607:f8b0:4864:20::1029] (port=56029
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve6-0005TC-AP
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:21 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v23so13037927pjr.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TF/5F0KhHfx4Tt29kavc4e0UvcD5M5TJZh5E8RHIj5w=;
 b=iqreD0J5GHHEZJB+yJ4cGfWCkCzY1B2RJ7wdBVq9ClI0JFX0OWeiVS6CMLgVDmdUTX
 X1a9zQ7oQXbDLTJnEFLUxeB367/EPtmOIWTbc9YXCbCdI82knRH7tkCi/YNRXe9Tc2yq
 iEJh8fNMdCOHm5Zo3yLDBgpxCJo4cU4lbf/jkcyl3uY5StXgzLhrDdQ1RoG66It5K9eD
 m7TTr4/mnbdVFIjOm/tmUUD9hFKMbwhcQRU7/nq8gSvIcom8DEbLX8majITWjEIHQ9Po
 cA5gtbqBGccrtKdrF85rMQnJa/Eg1aASk8IZ8y19UjRSesh45ppTtCwA5BJKaf16ZkaX
 xQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TF/5F0KhHfx4Tt29kavc4e0UvcD5M5TJZh5E8RHIj5w=;
 b=cRgJQTJIWkUYB0qbNGIjnpuFBv4A69tt08vO0dkrEyHXfjy7Cy6B264WAwrZMfLlXY
 Ypup0hLmot5dGrTR1L6sN25K0F2nQGPeFyU/yLAaeG0RXrmMAufFFkIHNq0V0N7R6VyN
 C1KZQaBWaq4cj/pvSczsW2uDw9hzoj7jcJQFMVpNMpLQXTPXepv5Q8hDVoFu+PpeyAGZ
 0FAF90p4zYtEJmPVABx+9LorRfUOFLcg0kEFHFGBvQoZJmkpDY6qyJqTKwv20Ot5JDvY
 iwboigjNqKUv7760khZoIN7v+YzRgxaXYVQMPQfidGEwBDK5PKwXjltj7hHQvJU8S+Ik
 kT5A==
X-Gm-Message-State: AOAM530D9CxT6uN+Ck+uNCnggFTLlW9OmXWIRmTYkJaKEX6KH/uJu7ZG
 i1ZAFskpum0PzwzTgejsEAk8S7xy1WAbfQ==
X-Google-Smtp-Source: ABdhPJxhgEfFBwzp2LczGtufbZBXkY2yG0PoEcKCM28ZDz/++qIQQLAbP4cxmoVkEIU3eaJ9yhCmYA==
X-Received: by 2002:a17:90b:4c8f:: with SMTP id
 my15mr1689293pjb.132.1639441576961; 
 Mon, 13 Dec 2021 16:26:16 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/15] common-user: Move safe-syscall.* from linux-user
Date: Mon, 13 Dec 2021 16:26:00 -0800
Message-Id: <20211214002604.161983-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move linux-user safe-syscall.S and safe-syscall-error.c to common-user
so that bsd-user can also use it.  Also move safe-syscall.h to
include/user/.  Since there is nothing here that is related to the guest,
as opposed to the host, build it once.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                    | 18 +++++++++++++++++-
 {linux-user => include/user}/safe-syscall.h    |  0
 .../safe-syscall-error.c                       |  2 +-
 linux-user/signal.c                            |  2 +-
 linux-user/syscall.c                           |  2 +-
 MAINTAINERS                                    |  2 ++
 bsd-user/meson.build                           |  2 ++
 .../host/aarch64/safe-syscall.inc.S            |  2 +-
 .../host/arm/safe-syscall.inc.S                |  2 +-
 .../host/i386/safe-syscall.inc.S               |  2 +-
 .../host/mips/safe-syscall.inc.S               |  2 +-
 .../host/ppc64/safe-syscall.inc.S              |  2 +-
 .../host/riscv/safe-syscall.inc.S              |  2 +-
 .../host/s390x/safe-syscall.inc.S              |  2 +-
 .../host/sparc64/safe-syscall.inc.S            |  2 +-
 .../host/x86_64/safe-syscall.inc.S             |  2 +-
 common-user/meson.build                        |  6 ++++++
 {linux-user => common-user}/safe-syscall.S     |  0
 linux-user/meson.build                         |  5 +++--
 19 files changed, 42 insertions(+), 15 deletions(-)
 rename {linux-user => include/user}/safe-syscall.h (100%)
 rename {linux-user => common-user}/safe-syscall-error.c (95%)
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (97%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (98%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (98%)
 rename {linux-user => common-user}/host/mips/safe-syscall.inc.S (98%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (98%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (97%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (98%)
 rename {linux-user => common-user}/host/sparc64/safe-syscall.inc.S (97%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (98%)
 create mode 100644 common-user/meson.build
 rename {linux-user => common-user}/safe-syscall.S (100%)

diff --git a/meson.build b/meson.build
index 96de1a6ef9..d5ac65b877 100644
--- a/meson.build
+++ b/meson.build
@@ -2366,6 +2366,7 @@ block_ss = ss.source_set()
 bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
+common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2610,15 +2611,30 @@ subdir('tcg')
 subdir('fpu')
 subdir('accel')
 subdir('plugins')
+subdir('ebpf')
+
+common_user_inc = []
+
+subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
-subdir('ebpf')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
 linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
+common_user_ss = common_user_ss.apply(config_all, strict: false)
+common_user = static_library('common-user',
+                             sources: common_user_ss.sources(),
+                             dependencies: common_user_ss.dependencies(),
+                             include_directories: common_user_inc,
+                             name_suffix: 'fa',
+                             build_by_default: false)
+common_user = declare_dependency(link_with: common_user)
+
+user_ss.add(common_user)
+
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
diff --git a/linux-user/safe-syscall.h b/include/user/safe-syscall.h
similarity index 100%
rename from linux-user/safe-syscall.h
rename to include/user/safe-syscall.h
diff --git a/linux-user/safe-syscall-error.c b/common-user/safe-syscall-error.c
similarity index 95%
rename from linux-user/safe-syscall-error.c
rename to common-user/safe-syscall-error.c
index 55d95ac39a..cf74b504f8 100644
--- a/linux-user/safe-syscall-error.c
+++ b/common-user/safe-syscall-error.c
@@ -10,7 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 
 /*
  * This is intended to be invoked via tail-call on the error path
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 12b1705287..510db73c34 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -31,7 +31,7 @@
 #include "trace.h"
 #include "signal-common.h"
 #include "host-signal.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f5bf6d155c..56a3e17183 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -132,7 +132,7 @@
 #include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..6dc3e1cd1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3078,6 +3078,8 @@ M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
 F: thunk.c
 F: accel/tcg/user-exec*.c
+F: include/user/
+F: common-user/
 
 BSD user
 M: Warner Losh <imp@bsdimp.com>
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 87885d91ed..25c3976ead 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+common_user_inc += include_directories('.')
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
similarity index 97%
rename from linux-user/host/aarch64/safe-syscall.inc.S
rename to common-user/host/aarch64/safe-syscall.inc.S
index 87c9580faa..73a04b73b3 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2016 Red Hat, Inc.
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/arm/safe-syscall.inc.S
rename to common-user/host/arm/safe-syscall.inc.S
index f1a6aabfd3..66176a902c 100644
--- a/linux-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2016 Red Hat, Inc.
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/i386/safe-syscall.inc.S
rename to common-user/host/i386/safe-syscall.inc.S
index 1fb031d228..aced8c5141 100644
--- a/linux-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2016 Red Hat, Inc.
diff --git a/linux-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/mips/safe-syscall.inc.S
rename to common-user/host/mips/safe-syscall.inc.S
index e9362e774d..fc75a337d1 100644
--- a/linux-user/host/mips/safe-syscall.inc.S
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <richard.henderson@linaro.org>
  * Copyright (C) 2021 Linaro, Inc.
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/ppc64/safe-syscall.inc.S
rename to common-user/host/ppc64/safe-syscall.inc.S
index 69d3c70094..947a850dfd 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/common-user/host/ppc64/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2016 Red Hat, Inc.
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
similarity index 97%
rename from linux-user/host/riscv/safe-syscall.inc.S
rename to common-user/host/riscv/safe-syscall.inc.S
index ca456d8a46..dfe83c300e 100644
--- a/linux-user/host/riscv/safe-syscall.inc.S
+++ b/common-user/host/riscv/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2018 Linaro, Inc.
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/s390x/safe-syscall.inc.S
rename to common-user/host/s390x/safe-syscall.inc.S
index 66f84385a2..2ccbaa2402 100644
--- a/linux-user/host/s390x/safe-syscall.inc.S
+++ b/common-user/host/s390x/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <rth@twiddle.net>
  * Copyright (C) 2016 Red Hat, Inc.
diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/common-user/host/sparc64/safe-syscall.inc.S
similarity index 97%
rename from linux-user/host/sparc64/safe-syscall.inc.S
rename to common-user/host/sparc64/safe-syscall.inc.S
index 3a0e76fcc7..6ad0b06d9a 100644
--- a/linux-user/host/sparc64/safe-syscall.inc.S
+++ b/common-user/host/sparc64/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Written by Richard Henderson <richard.henderson@linaro.org>
  * Copyright (C) 2021 Red Hat, Inc.
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
similarity index 98%
rename from linux-user/host/x86_64/safe-syscall.inc.S
rename to common-user/host/x86_64/safe-syscall.inc.S
index f88cbe1347..84fed206f9 100644
--- a/linux-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -1,7 +1,7 @@
 /*
  * safe-syscall.inc.S : host-specific assembly fragment
  * to handle signals occurring at the same time as system calls.
- * This is intended to be included by linux-user/safe-syscall.S
+ * This is intended to be included by common-user/safe-syscall.S
  *
  * Copyright (C) 2015 Timothy Edward Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  *
diff --git a/common-user/meson.build b/common-user/meson.build
new file mode 100644
index 0000000000..45b8d0de2c
--- /dev/null
+++ b/common-user/meson.build
@@ -0,0 +1,6 @@
+common_user_inc += include_directories('host/' / config_host['ARCH'])
+
+common_user_ss.add(files(
+  'safe-syscall.S',
+  'safe-syscall-error.c',
+))
diff --git a/linux-user/safe-syscall.S b/common-user/safe-syscall.S
similarity index 100%
rename from linux-user/safe-syscall.S
rename to common-user/safe-syscall.S
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 94ac3c58ce..bf9d945504 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -2,6 +2,9 @@ if not have_linux_user
    subdir_done()
 endif
 
+common_user_inc += include_directories('host/' / config_host['ARCH'])
+common_user_inc += include_directories('.')
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
@@ -9,8 +12,6 @@ linux_user_ss.add(files(
   'linuxload.c',
   'main.c',
   'mmap.c',
-  'safe-syscall.S',
-  'safe-syscall-error.c',
   'signal.c',
   'strace.c',
   'syscall.c',
-- 
2.25.1


