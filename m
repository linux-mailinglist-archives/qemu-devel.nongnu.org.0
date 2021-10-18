Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D774323D0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:27:15 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVTn-0008LY-1v
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV94-0007kS-D1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:52 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8s-00086l-6y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:50 -0400
Received: by mail-io1-xd29.google.com with SMTP id o184so4901220iof.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G30MUb6lWC10SOxAq7yJXdYDan64XgWpt5jR9Uu/6d8=;
 b=nym2sN3oripiGovBJc0wOlJ/Bn629wppRhq+L0f5S2SHP48+mKPeB71QkCCUpZpqiR
 rfdnOBUviCPHZiadXgSjEJF2QMOe6tM0eKOipDYg4apgrnKspe8onUAO2tkSLlFjFgIY
 UA1imlIFcVBVnDd3ouuu8i4VPpWfGPJItGTp8TU7JTd75gKMbTnvcC5GGWZO0HGCI4yJ
 hE/oF71nD2y1WivEpkJBy4WHN1z3R7um2OvMxIF8xSkgaWf5GMp70JiD3L2MmUi2hCeY
 WzV347XKjzU5HCJDcnnMnfSlruRde6JOQSBEOqcDFdSyOpdOOyjZPNSYp/zpubC00iM9
 anYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G30MUb6lWC10SOxAq7yJXdYDan64XgWpt5jR9Uu/6d8=;
 b=uc0oKmJ1L2JMSmY64XJIQ/rABEr0uvHU4GGmvapAfF8EI+ifWzdYHU6cnEzTHA/EML
 QpRgIpLu+l5gwXWB7q9BNDH9rZr8fmsbjv6ANPdfE91XefTsYQdNFvRdbNR4MS898X6F
 RMV1LtQwdVY/ZGr6JAXNCnZxhGWLtGddglz/yjQTSa5uLy3oxeEFg5eNiUfJxGL9RYXf
 to1iyH6E/QDon2ChCjqqE4bcHurajIWJwIolgeJucBW0HLYd5tzLrVIIqvBmydyjZZwK
 dNSoirV06315xv7bCSH5EH9HtxGsVmcLINj7iofABZUw1ehT0YdZbRHVKwwv48ZuOtQt
 ZaTQ==
X-Gm-Message-State: AOAM532/FTjr4uaed41KGSJprclHKIdYQo0o11+oNDBjf+RkNDWeN47u
 TuaB5IqpGqSRLsWC1fad9u9EG98ntRV6ag==
X-Google-Smtp-Source: ABdhPJxET78QUE9cnFxrBE+NrqGdoP53YYG86yFaZp5menkz/fje3CGxbNzqMiK6WvdMkA5CPA3RpQ==
X-Received: by 2002:a05:6602:490:: with SMTP id
 y16mr14766166iov.169.1634573135321; 
 Mon, 18 Oct 2021 09:05:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] bsd-user/sysarch: Move to using do_freebsd_arch_sysarch
 interface
Date: Mon, 18 Oct 2021 10:04:56 -0600
Message-Id: <20211018160458.1976-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_freebsd_arch_sysarch() exists in $ARCH/target_arch_sysarch.h for x86.
Call it from do_freebsd_sysarch() and remove the mostly duplicate
version in syscall.c. Future changes will move it to os-sys.c and
support other architectures.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/freebsd/meson.build |  3 +++
 bsd-user/freebsd/os-sys.c    | 27 +++++++++++++++++++
 bsd-user/meson.build         |  3 +++
 bsd-user/qemu.h              |  3 +++
 bsd-user/syscall.c           | 50 ------------------------------------
 5 files changed, 36 insertions(+), 50 deletions(-)
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
index 0000000000..309e27b9d6
--- /dev/null
+++ b/bsd-user/freebsd/os-sys.c
@@ -0,0 +1,27 @@
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
+    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
+}
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5378f56f71..87885d91ed 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -12,3 +12,6 @@ bsd_user_ss.add(files(
   'syscall.c',
   'uaccess.c',
 ))
+
+# Pull in the OS-specific build glue, if any
+subdir(targetos)
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index cdb85140f4..e65e41d53d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;
 abi_long get_errno(abi_long ret);
 bool is_error(abi_long ret);
 
+/* os-sys.c */
+abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 2fd2ba8330..d3322760f4 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -88,56 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)
     return 0;
 }
 
-#if defined(TARGET_I386)
-static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
-{
-    abi_long ret = 0;
-    abi_ulong val;
-    int idx;
-
-    switch (op) {
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_SET_GSBASE:
-    case TARGET_FREEBSD_I386_SET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_SET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_SET_GSBASE:
-    case TARGET_FREEBSD_AMD64_SET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        if (get_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        cpu_x86_load_seg(env, idx, 0);
-        env->segs[idx].base = val;
-        break;
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_GET_GSBASE:
-    case TARGET_FREEBSD_I386_GET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_GET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_GET_GSBASE:
-    case TARGET_FREEBSD_AMD64_GET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        val = env->segs[idx].base;
-        if (put_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        break;
-    /* XXX handle the others... */
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-    return ret;
-}
-#endif
-
 #ifdef __FreeBSD__
 /*
  * XXX this uses the undocumented oidfmt interface to find the kind of
-- 
2.32.0


