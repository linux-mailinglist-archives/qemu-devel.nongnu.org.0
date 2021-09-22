Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA413414191
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:18:01 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvZw-0004KE-P8
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWw-0001PM-QB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:55 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWu-0007Z1-Dh
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:54 -0400
Received: by mail-il1-x144.google.com with SMTP id h9so1565553ile.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fBb/Bk54Z8xBOeddOPBJJaFD8BHPUCGJPfhM+8RZ+0M=;
 b=mpPJVXvr3/BrzQzaYdg+7jrTe1IEk0Z+i9DrHBHkfb8/4tzf45BkFYMSkSDIZz4fbq
 sk8U7V+i4ICO8ZkLPtAQ8WTPmqMjX3+yy8DThLdrCe34LGGByomzx2dN7uHZwHVFxkAT
 KS1BT6JJRoNZN+Mu5/ID9U9h/zEbwWDxS7o0nRv7Nn3UWH0IDx+HdW2bVhucYylc3z2x
 0v6hKlZSnE/CRSEp868ejCqFk6TApcig5dXw3mou8YN1p02VnmZZEXol9rdcoNv0GOIB
 JKXIN8v0Uq/3bq7Ssbh1x6XwKNbDoUVj9JenX50A9h8nMJGHEk+jbGvmm6b2d3XTEGZA
 c1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBb/Bk54Z8xBOeddOPBJJaFD8BHPUCGJPfhM+8RZ+0M=;
 b=QrUGJG2EEHw1YffnzjdY/GmcdPVXy2yYkwP/8VPRVAidixF0cd8G6dtnnQS9hmY9yI
 IXtqBs3if0TjvO8iH1YeohFT/eqf0zz9PHbkDCkCQtXsXsBSq7yMzeeHGSTr6oRMHScI
 BNZwiYU/eU5YG11zdS93Xk0ifuFPSR9nREIIUSo0jtHal2XFdjQptRz2VRBX8KBZHWSb
 9uAsjgIYUv2JX277RFqkS3XmfjEao/3k1kPQ15jWy7wjk01on0ZpQOieZAx1cLUGgbIs
 V6JqVIlVsQ1qv7adRi3mDdKgteed0WXhFvvOy1oi13vP8LeBOAQi96XzJ1apUDt6EuG4
 niFQ==
X-Gm-Message-State: AOAM530gFxtj63j+EOU0C9tYc74JLXRosSB7u498xgOTl4ed91bem9Qd
 LC0boJ1Axx3peVYJ+3Y+66gSraohoCmrQ3/x43Q=
X-Google-Smtp-Source: ABdhPJzh1M2KM27J2vjsYAxeY33F813YoHu/1694SgDFtwrl/UGalJWTEtDvyqHctAKgr1lswO8hHQ==
X-Received: by 2002:a05:6e02:156c:: with SMTP id
 k12mr24479141ilu.61.1632291291078; 
 Tue, 21 Sep 2021 23:14:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] bsd-user/sysarch: Provide a per-arch framework for
 sysarch syscall
Date: Wed, 22 Sep 2021 00:14:36 -0600
Message-Id: <20210922061438.27645-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::144;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing glue to pull in do_freebsd_sysarch to call
do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for
sysctl and sysarch system calls because they are mostly arch specific.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/meson.build |  3 +++
 bsd-user/freebsd/os-sys.c    | 28 ++++++++++++++++++++++++++++
 bsd-user/meson.build         |  6 ++++++
 bsd-user/qemu.h              |  3 +++
 bsd-user/syscall.c           |  7 -------
 5 files changed, 40 insertions(+), 7 deletions(-)
 create mode 100644 bsd-user/freebsd/meson.build
 create mode 100644 bsd-user/freebsd/os-sys.c

diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
new file mode 100644
index 0000000000..4b69cca7b9
--- /dev/null
+++ b/bsd-user/freebsd/meson.build
@@ -0,0 +1,3 @@
+bsd_user_ss.add(files(
+  'os-sys.c',
+))
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
new file mode 100644
index 0000000000..756b024305
--- /dev/null
+++ b/bsd-user/freebsd/os-sys.c
@@ -0,0 +1,28 @@
+/*
+ *  FreeBSD sysctl() and sysarch() system call emulation
+ *
+ *  Copyright (c) 2013-15 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu.h"
+#include "target_arch_sysarch.h"
+
+/* sysarch() is architecture dependent. */
+abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
+{
+
+    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
+}
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 0369549340..561913de05 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -8,3 +8,9 @@ bsd_user_ss.add(files(
   'syscall.c',
   'uaccess.c',
 ))
+
+# Pull in the OS-specific build glue, if any
+if fs.exists(targetos)
+   subdir(targetos)
+endif
+
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4ee57b91f0..3dde381d5d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;
 abi_long get_errno(abi_long ret);
 int is_error(abi_long ret);
 
+/* os-sys.c */
+abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 9bc72501b2..9f51563abd 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -88,13 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)
     return 0;
 }
 
-#if defined(TARGET_I386)
-static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
-{
-    do_freebsd_arch_sysarch(env, op, parms);
-}
-#endif
-
 #ifdef __FreeBSD__
 /*
  * XXX this uses the undocumented oidfmt interface to find the kind of
-- 
2.32.0


