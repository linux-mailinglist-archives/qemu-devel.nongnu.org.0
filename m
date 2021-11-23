Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADD45AA54
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:45:43 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZrS-0003Qf-KI
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:45:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkO-0004Zi-VI
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:25 -0500
Received: from [2a00:1450:4864:20::429] (port=39436
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkM-00051M-OB
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so3731421wrn.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cmtw05llgb/mcCqlw3igL1JShmvNTdbzkXIsqE25pVo=;
 b=cG1IHwjX0JTUX+evIDjTsgnUCFWIpu03G3o7zbiXKpM9otfEE0BuZqgQChKg19kTI9
 NxB32konO/q34ccmkLCnjAnWgPzEPumuLXu55HcK1eVkQRxLeM/VflaEz8gkHwzyipF1
 RRR+oL8JZ5QBdtomhUb1kBxJkN0n2+H/IRKurlqOPzNZsimu2qZTZC7bMsrAyyzk+OGi
 LgLlUCn4UGei1bZxiBznhl7qQIEaoIrdLglz5T4QpORLC72wVNh/IjclHMw6fpOOboG0
 LA5qaSKB5dGUbGC0iw8o+6Z4RjeY/Z26FTeHPgGTm3WQMHzpuXJc1408jKtdBS1L1nnQ
 cavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cmtw05llgb/mcCqlw3igL1JShmvNTdbzkXIsqE25pVo=;
 b=5t85aGVL/BKnZemV9tE6sLs+VDIsoYSgpIS28G5jR76Q8PUtR7/zzg7AgC2Ky5EVu8
 MsdRCFQ668XcZMlioSQqvx/SiVhooggMHSmLQpMaVVEhUeEqcPI7kr4blcQ8pFvhaBRu
 DY3r9IJ4b2b6+G3AvAQdje1jgShn4y+F41YbhHLTOqPfIN7ydXssrHKp2cRDxBPEbrHV
 +9yUAScVcitw6SQSNPIuN6QJ6b/JGMiBmNv8M3KOsEwSK0bxipP21PrlBuPxQTd8Ym9D
 8acml0exUtACKqdmk0HyTprG4D1wcD6ZwbV74zgSO1vLIZ7j0XNPV2bRG5tYo/QTnxQ1
 BMsQ==
X-Gm-Message-State: AOAM531WaxSwBxkc5UPzlSk8/idyyzO40ybAW09FcGWEIf9zMc8em253
 tWAHwklXEvCV7+zcQT00Vpx/z5fpeookiXnSqSA=
X-Google-Smtp-Source: ABdhPJwBqzFPuZpvn9LmNd6NeX3OFtbPrMdHPqFSTmQlmbScmjJ/OE18GOF4EmF39qAGKP86PDI7Uw==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr9065595wrw.36.1637689101247;
 Tue, 23 Nov 2021 09:38:21 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/16] common-user: Move safe-syscall.* from linux-user
Date: Tue, 23 Nov 2021 18:37:55 +0100
Message-Id: <20211123173759.1383510-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
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
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (97%)
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
index d3879aa3c1..e3a12857f9 100644
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
index 3252aff23d..190c050220 100644
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
similarity index 97%
rename from linux-user/host/ppc64/safe-syscall.inc.S
rename to common-user/host/ppc64/safe-syscall.inc.S
index 36230169f4..5271b47248 100644
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


