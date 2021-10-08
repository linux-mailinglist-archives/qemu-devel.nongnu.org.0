Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95C427422
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:23:22 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzCz-0005lz-3T
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5W-0000IW-PK
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:40 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5R-0006rL-1R
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:38 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b78so12441682iof.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piPIEwSR0Pxb7i39KbgYug1Bnr819V88PhrigZ0VDaY=;
 b=vsPGrPFuq+tw2DLgNmqRl/pgrnt1QoNF4aGLNtEaABpTUNVIMLjWwqpXTfMpD7U6+5
 xNWce6Q6zb5psRAv/h6KzbY5I5ArHIPtp+LD8mCPBKlSVYMOUptVcXnI0U5FJ0B14hrS
 xxRlS9AlQoimbyuVUqLKpyb/kK9g8oL5uBc7u8CTlEFRElA87xVWosJoFf2hCJYnqE7h
 AR8pZK/KjynMIqq/2SUkgtLjWU/fvruWSOjR5/SnYuGtz0vLrsAVtS8eBwtI89dAqEgB
 dS6XYPgNYueB8ll2VUggIqd/V2uYQTSA13yZ/Y1PZBUKKiVthR2dzEMCjbyPTT+zjPsP
 dxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piPIEwSR0Pxb7i39KbgYug1Bnr819V88PhrigZ0VDaY=;
 b=nwFXo0AXVY2ElCnTgr1vPBBAeJeb82NTXAVXqAXP8UQLs5qkML4kQ8/Sz/U2iT6gto
 IMRivtYM7q6YVD8pbMzuoHAk6/W8Wl+WFlE3gNd4UdgSe8OSaAK3JJfP+CGQikupc7/J
 j6pi1GZ9NNufn3z2PlQe3BtikoTHWUU1T5F1q2krejOHDtLFDB/8bjZhe52tKOYvP1Lo
 +L4nBsZEJyR3EhsqWCTK5ZoZXjO/SHUGUMhl2fWIEMJ3+jnGHonwGhrm0ETuZINHxDqU
 XueWzJ2clFL0KtbhDQCflQw2SJ7ncYtEGiIrGXAic+RJGJ6IzfPzxoEA1iGt8/4ti4Yz
 Xoww==
X-Gm-Message-State: AOAM532pWQpm30/J0v85xa6fo4RZx7mGAnnrG/hw8abS0/HjW0RU+YWs
 OLrfomnDfFZ1imOSc5Edr1fXafMU+bDQSg==
X-Google-Smtp-Source: ABdhPJwuhlbBYnK7uofF83cqpYCFLRm5AKsWWP1jorPz+xvYGtLeq8VdC7z927Y1P8Bvf/5qeM2Bgw==
X-Received: by 2002:a02:1049:: with SMTP id 70mr9660040jay.123.1633734931745; 
 Fri, 08 Oct 2021 16:15:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] bsd-user/sysarch: Provide a per-arch framework for
 sysarch syscall
Date: Fri,  8 Oct 2021 17:15:04 -0600
Message-Id: <20211008231506.17471-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing glue to pull in do_freebsd_sysarch to call
do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for
sysctl and sysarch system calls because they are mostly arch specific.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/meson.build |  3 +++
 bsd-user/freebsd/os-sys.c    | 27 +++++++++++++++++++++++++++
 bsd-user/meson.build         |  3 +++
 bsd-user/qemu.h              |  3 +++
 bsd-user/syscall.c           |  7 -------
 5 files changed, 36 insertions(+), 7 deletions(-)
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
index 243fb78930..a4163c91ff 100644
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
index d3b9f431e2..d3322760f4 100644
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


