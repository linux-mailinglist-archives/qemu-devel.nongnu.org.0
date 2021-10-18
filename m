Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D31432764
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:18:13 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY9E-0007ZD-SZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtg-0008RA-QB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:08 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXte-0001zQ-TB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:08 -0400
Received: by mail-io1-xd31.google.com with SMTP id y67so17467999iof.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G30MUb6lWC10SOxAq7yJXdYDan64XgWpt5jR9Uu/6d8=;
 b=SIvtSSa1iC7GMo61jPcI2EQHMyUzwACYL2xcTXKSDi7B8s6iWa9r64/wPqBuWcZHsC
 cx9vL4VWUDn3SzKkGAPtbZA4RC3VbZ1CqCqmQnJZkg5FV5Ss2h4wmV5i48xPdObH17J4
 9VBL96DrxcMCh1jV95EGCY5Gxou9qae/KVL9r89IrVZveGuLY/44XDJNXOMkIYqzrav1
 EnRzIJAo1cmaJYKUWrHnZ2NUYzt3OZ2UAQLAjYHEFLAS4/7vXVGOsVZgaFY7RNsVz7d0
 IF8Z4Hqme9OxGUdtYWsM6OoHYBbyYoeowu2H9oF6SIAYUG11+Yx1BIlRPspLaUyJ/tQH
 t3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G30MUb6lWC10SOxAq7yJXdYDan64XgWpt5jR9Uu/6d8=;
 b=MhaR/sEYLvnKUOtrPU0p+TEaZ8ARci0A+N6MK3hgv7XNv5yNHckSdEKUs4S7Tehy/6
 x+RB4Y4TCUvVd8gHcDrNC/TDG1cnAQx2JozfIVPJHv0XBFR0c7lrlfXz6MeYv2kOKsXY
 1Qe1Z6X6vfhZczJEtJRhf/hjTYbAFHTM9/eudO/4L0FX/V6UFKAQjh0vrO5nEVB3K9LZ
 /Dcen6u66CTlKd+LvT+uv8FpaSZ8+9LeMhwssI0n4pd1NmqkGyd7rsuewU4BsAY2xRP1
 kq4U9l61TI8zmCzGLYF/6owULTYsiHX5r+FS2URxH3mP/pWOnRioAlrvV0otXWF96crm
 aizg==
X-Gm-Message-State: AOAM531o5iLXyUurKPALiIc4at1eQFVbnNbJ5w9PS5BwE2AP/M7kciDu
 6K5C6vsBbOBDo6+w9WvBLedxuAfyzPoDBg==
X-Google-Smtp-Source: ABdhPJzGgbZihhsk49p+aR1PX3rMONsM31g30/GxytW2I+5PyeyGztCZerVIu7sYU3VWDuQlWjzUnw==
X-Received: by 2002:a02:9f1a:: with SMTP id z26mr1142458jal.86.1634583724845; 
 Mon, 18 Oct 2021 12:02:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/23] bsd-user/sysarch: Move to using
 do_freebsd_arch_sysarch interface
Date: Mon, 18 Oct 2021 13:01:13 -0600
Message-Id: <20211018190115.5365-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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


