Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D233BAE6A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:51:33 +0200 (CEST)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m07DI-0006m1-Tf
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0719-0004G0-9D
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0717-0006t2-2a
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f14so18873302wrs.6
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oz3/9LjOF/DujRVAV4aK72odTL+SNItH8ndIDVrL7Cc=;
 b=vQPIFpT0avrRTFZcX1IapggI2sqF9HHkNWC88ySXNsUG0BGV6biJKrz+jmgIvXcZfI
 KIDsAsD1kFcOMPo2emJowwLFF58tcIzKNpDjF4r+rV/tpKtLd2dtBQdOihTEJhzZZXB3
 /l49CauVvnpISpD7uOaHV/3Rc53yhm6dASnK70smHZX0mRam6xyYslljA4o8sHTOoof7
 OxtOxv5tn2RM++zx4ohNanopfu3+15myCa1UNRmb1OrjOhwOKiKbxJakn8szXQECfS24
 gXqrtui4RlBaYgzv4GgK91Kscr/fFKXqVcohGJGxZ36KqvuxLnzqOjbQ0bG5UQwFYRaf
 zwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Oz3/9LjOF/DujRVAV4aK72odTL+SNItH8ndIDVrL7Cc=;
 b=XIwnCfePRXj/k2VgtsOqYOr3g/rS+jIbw1qOWZSMjHaNaB3bJqxqshpr/HxX2elA24
 HhqPLLRVrhSmohFNmm6UlxZeD1+iIq+RmiYhAC509rdm0f39T1ch7NOMze9ikWwxZhZU
 9dvde76Eipo5dMWNWvotByAiFwgX3wbFCcXcmSqulkecrBl6mCMsTinhyr/JRHbO4A1m
 wcjulosiMZv60CQzI7vSKK7/HLoswTsBZ5GpAPPKB82y9jM9YKWZksevyn0QQErL99p8
 xaYu4Xdyg2//cUU8+zBX6ABLlRt6IzeQ81Gtr21fjFlUKKlo7RjcQVs8s65ukKuvHIGZ
 Oiwg==
X-Gm-Message-State: AOAM531c3eXb2nvKeIlRw7X64gJfW96Ai/oi0no1tgfXwf6Rkdq24RMJ
 iYfqiBiODUtIqJSwJsEIROc0EeW9CzE=
X-Google-Smtp-Source: ABdhPJwu0aMwGWM8VnVjhDt2sPa0r1PD7zNBSELGyOjoA4PtJ8asQNeIoBx2ntJhyCjCWhvsM6Zhfw==
X-Received: by 2002:a05:6000:18ca:: with SMTP id
 w10mr11188229wrq.55.1625423935535; 
 Sun, 04 Jul 2021 11:38:55 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f14sm3451041wmq.10.2021.07.04.11.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] linux-user: Extract target errno related functions to
 'target_errno.h'
Date: Sun,  4 Jul 2021 20:37:55 +0200
Message-Id: <20210704183755.655002-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract target errno related functions to a new 'target_errno.h'
header, so we can do the host <-> target errno conversion out of
the big syscall.c (which is already 13k LoC).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/target_errno.h |  32 +++++++
 linux-user/syscall.c      | 162 +--------------------------------
 linux-user/target_errno.c | 183 ++++++++++++++++++++++++++++++++++++++
 linux-user/meson.build    |   1 +
 4 files changed, 217 insertions(+), 161 deletions(-)
 create mode 100644 linux-user/target_errno.h
 create mode 100644 linux-user/target_errno.c

diff --git a/linux-user/target_errno.h b/linux-user/target_errno.h
new file mode 100644
index 00000000000..4e5e9d384c9
--- /dev/null
+++ b/linux-user/target_errno.h
@@ -0,0 +1,32 @@
+/*
+ *  Linux syscalls
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
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
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef LINUX_USER_TARGET_ERRNO_H
+#define LINUX_USER_TARGET_ERRNO_H
+
+#define ERRNO_TABLE_SIZE 1200
+
+int target_to_host_errno(int err);
+
+void target_to_host_errno_table_init(void);
+
+int host_to_target_errno(int err);
+
+#endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3761d3b2d64..06c4358b813 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -131,6 +131,7 @@
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
 #include "qapi/error.h"
+#include "target_errno.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
 
@@ -507,167 +508,6 @@ static inline int next_free_host_timer(void)
 }
 #endif
 
-#define ERRNO_TABLE_SIZE 1200
-
-/*
- * target_to_host_errno_table[] is initialized from
- * host_to_target_errno_table[] in target_to_host_errno_table_init().
- */
-static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
-};
-
-/*
- * This list is the union of errno values overridden in asm-<arch>/errno.h
- * minus the errnos that are not actually generic to all archs.
- */
-static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
-    [EAGAIN]            = TARGET_EAGAIN,
-    [EIDRM]             = TARGET_EIDRM,
-    [ECHRNG]            = TARGET_ECHRNG,
-    [EL2NSYNC]          = TARGET_EL2NSYNC,
-    [EL3HLT]            = TARGET_EL3HLT,
-    [EL3RST]            = TARGET_EL3RST,
-    [ELNRNG]            = TARGET_ELNRNG,
-    [EUNATCH]           = TARGET_EUNATCH,
-    [ENOCSI]            = TARGET_ENOCSI,
-    [EL2HLT]            = TARGET_EL2HLT,
-    [EDEADLK]           = TARGET_EDEADLK,
-    [ENOLCK]            = TARGET_ENOLCK,
-    [EBADE]             = TARGET_EBADE,
-    [EBADR]             = TARGET_EBADR,
-    [EXFULL]            = TARGET_EXFULL,
-    [ENOANO]            = TARGET_ENOANO,
-    [EBADRQC]           = TARGET_EBADRQC,
-    [EBADSLT]           = TARGET_EBADSLT,
-    [EBFONT]            = TARGET_EBFONT,
-    [ENOSTR]            = TARGET_ENOSTR,
-    [ENODATA]           = TARGET_ENODATA,
-    [ETIME]             = TARGET_ETIME,
-    [ENOSR]             = TARGET_ENOSR,
-    [ENONET]            = TARGET_ENONET,
-    [ENOPKG]            = TARGET_ENOPKG,
-    [EREMOTE]           = TARGET_EREMOTE,
-    [ENOLINK]           = TARGET_ENOLINK,
-    [EADV]              = TARGET_EADV,
-    [ESRMNT]            = TARGET_ESRMNT,
-    [ECOMM]             = TARGET_ECOMM,
-    [EPROTO]            = TARGET_EPROTO,
-    [EDOTDOT]           = TARGET_EDOTDOT,
-    [EMULTIHOP]         = TARGET_EMULTIHOP,
-    [EBADMSG]           = TARGET_EBADMSG,
-    [ENAMETOOLONG]      = TARGET_ENAMETOOLONG,
-    [EOVERFLOW]         = TARGET_EOVERFLOW,
-    [ENOTUNIQ]          = TARGET_ENOTUNIQ,
-    [EBADFD]            = TARGET_EBADFD,
-    [EREMCHG]           = TARGET_EREMCHG,
-    [ELIBACC]           = TARGET_ELIBACC,
-    [ELIBBAD]           = TARGET_ELIBBAD,
-    [ELIBSCN]           = TARGET_ELIBSCN,
-    [ELIBMAX]           = TARGET_ELIBMAX,
-    [ELIBEXEC]          = TARGET_ELIBEXEC,
-    [EILSEQ]            = TARGET_EILSEQ,
-    [ENOSYS]            = TARGET_ENOSYS,
-    [ELOOP]             = TARGET_ELOOP,
-    [ERESTART]          = TARGET_ERESTART,
-    [ESTRPIPE]          = TARGET_ESTRPIPE,
-    [ENOTEMPTY]         = TARGET_ENOTEMPTY,
-    [EUSERS]            = TARGET_EUSERS,
-    [ENOTSOCK]          = TARGET_ENOTSOCK,
-    [EDESTADDRREQ]      = TARGET_EDESTADDRREQ,
-    [EMSGSIZE]          = TARGET_EMSGSIZE,
-    [EPROTOTYPE]        = TARGET_EPROTOTYPE,
-    [ENOPROTOOPT]       = TARGET_ENOPROTOOPT,
-    [EPROTONOSUPPORT]   = TARGET_EPROTONOSUPPORT,
-    [ESOCKTNOSUPPORT]   = TARGET_ESOCKTNOSUPPORT,
-    [EOPNOTSUPP]        = TARGET_EOPNOTSUPP,
-    [EPFNOSUPPORT]      = TARGET_EPFNOSUPPORT,
-    [EAFNOSUPPORT]      = TARGET_EAFNOSUPPORT,
-    [EADDRINUSE]        = TARGET_EADDRINUSE,
-    [EADDRNOTAVAIL]     = TARGET_EADDRNOTAVAIL,
-    [ENETDOWN]          = TARGET_ENETDOWN,
-    [ENETUNREACH]       = TARGET_ENETUNREACH,
-    [ENETRESET]         = TARGET_ENETRESET,
-    [ECONNABORTED]      = TARGET_ECONNABORTED,
-    [ECONNRESET]        = TARGET_ECONNRESET,
-    [ENOBUFS]           = TARGET_ENOBUFS,
-    [EISCONN]           = TARGET_EISCONN,
-    [ENOTCONN]          = TARGET_ENOTCONN,
-    [EUCLEAN]           = TARGET_EUCLEAN,
-    [ENOTNAM]           = TARGET_ENOTNAM,
-    [ENAVAIL]           = TARGET_ENAVAIL,
-    [EISNAM]            = TARGET_EISNAM,
-    [EREMOTEIO]         = TARGET_EREMOTEIO,
-    [EDQUOT]            = TARGET_EDQUOT,
-    [ESHUTDOWN]         = TARGET_ESHUTDOWN,
-    [ETOOMANYREFS]      = TARGET_ETOOMANYREFS,
-    [ETIMEDOUT]         = TARGET_ETIMEDOUT,
-    [ECONNREFUSED]      = TARGET_ECONNREFUSED,
-    [EHOSTDOWN]         = TARGET_EHOSTDOWN,
-    [EHOSTUNREACH]      = TARGET_EHOSTUNREACH,
-    [EALREADY]          = TARGET_EALREADY,
-    [EINPROGRESS]       = TARGET_EINPROGRESS,
-    [ESTALE]            = TARGET_ESTALE,
-    [ECANCELED]         = TARGET_ECANCELED,
-    [ENOMEDIUM]         = TARGET_ENOMEDIUM,
-    [EMEDIUMTYPE]       = TARGET_EMEDIUMTYPE,
-#ifdef ENOKEY
-    [ENOKEY]            = TARGET_ENOKEY,
-#endif
-#ifdef EKEYEXPIRED
-    [EKEYEXPIRED]       = TARGET_EKEYEXPIRED,
-#endif
-#ifdef EKEYREVOKED
-    [EKEYREVOKED]       = TARGET_EKEYREVOKED,
-#endif
-#ifdef EKEYREJECTED
-    [EKEYREJECTED]      = TARGET_EKEYREJECTED,
-#endif
-#ifdef EOWNERDEAD
-    [EOWNERDEAD]        = TARGET_EOWNERDEAD,
-#endif
-#ifdef ENOTRECOVERABLE
-    [ENOTRECOVERABLE]   = TARGET_ENOTRECOVERABLE,
-#endif
-#ifdef ENOMSG
-    [ENOMSG]            = TARGET_ENOMSG,
-#endif
-#ifdef ERKFILL
-    [ERFKILL]           = TARGET_ERFKILL,
-#endif
-#ifdef EHWPOISON
-    [EHWPOISON]         = TARGET_EHWPOISON,
-#endif
-};
-
-static void target_to_host_errno_table_init(void)
-{
-    /*
-     * Build target_to_host_errno_table[] table
-     * from host_to_target_errno_table[].
-     */
-    for (int i = 0; i < ERRNO_TABLE_SIZE; i++) {
-        target_to_host_errno_table[host_to_target_errno_table[i]] = i;
-    }
-}
-
-static inline int host_to_target_errno(int err)
-{
-    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
-        host_to_target_errno_table[err]) {
-        return host_to_target_errno_table[err];
-    }
-    return err;
-}
-
-static inline int target_to_host_errno(int err)
-{
-    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
-        target_to_host_errno_table[err]) {
-        return target_to_host_errno_table[err];
-    }
-    return err;
-}
-
 static inline abi_long get_errno(abi_long ret)
 {
     if (ret == -1)
diff --git a/linux-user/target_errno.c b/linux-user/target_errno.c
new file mode 100644
index 00000000000..2a7320d240f
--- /dev/null
+++ b/linux-user/target_errno.c
@@ -0,0 +1,183 @@
+/*
+ *  Linux syscalls
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
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
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "target_errno.h"
+#include "errno_defs.h"
+
+/*
+ * target_to_host_errno_table[] is initialized from
+ * host_to_target_errno_table[] in target_to_host_errno_table_init().
+ */
+static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
+};
+
+/*
+ * This list is the union of errno values overridden in asm-<arch>/errno.h
+ * minus the errnos that are not actually generic to all archs.
+ */
+static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
+    [EAGAIN]            = TARGET_EAGAIN,
+    [EIDRM]             = TARGET_EIDRM,
+    [ECHRNG]            = TARGET_ECHRNG,
+    [EL2NSYNC]          = TARGET_EL2NSYNC,
+    [EL3HLT]            = TARGET_EL3HLT,
+    [EL3RST]            = TARGET_EL3RST,
+    [ELNRNG]            = TARGET_ELNRNG,
+    [EUNATCH]           = TARGET_EUNATCH,
+    [ENOCSI]            = TARGET_ENOCSI,
+    [EL2HLT]            = TARGET_EL2HLT,
+    [EDEADLK]           = TARGET_EDEADLK,
+    [ENOLCK]            = TARGET_ENOLCK,
+    [EBADE]             = TARGET_EBADE,
+    [EBADR]             = TARGET_EBADR,
+    [EXFULL]            = TARGET_EXFULL,
+    [ENOANO]            = TARGET_ENOANO,
+    [EBADRQC]           = TARGET_EBADRQC,
+    [EBADSLT]           = TARGET_EBADSLT,
+    [EBFONT]            = TARGET_EBFONT,
+    [ENOSTR]            = TARGET_ENOSTR,
+    [ENODATA]           = TARGET_ENODATA,
+    [ETIME]             = TARGET_ETIME,
+    [ENOSR]             = TARGET_ENOSR,
+    [ENONET]            = TARGET_ENONET,
+    [ENOPKG]            = TARGET_ENOPKG,
+    [EREMOTE]           = TARGET_EREMOTE,
+    [ENOLINK]           = TARGET_ENOLINK,
+    [EADV]              = TARGET_EADV,
+    [ESRMNT]            = TARGET_ESRMNT,
+    [ECOMM]             = TARGET_ECOMM,
+    [EPROTO]            = TARGET_EPROTO,
+    [EDOTDOT]           = TARGET_EDOTDOT,
+    [EMULTIHOP]         = TARGET_EMULTIHOP,
+    [EBADMSG]           = TARGET_EBADMSG,
+    [ENAMETOOLONG]      = TARGET_ENAMETOOLONG,
+    [EOVERFLOW]         = TARGET_EOVERFLOW,
+    [ENOTUNIQ]          = TARGET_ENOTUNIQ,
+    [EBADFD]            = TARGET_EBADFD,
+    [EREMCHG]           = TARGET_EREMCHG,
+    [ELIBACC]           = TARGET_ELIBACC,
+    [ELIBBAD]           = TARGET_ELIBBAD,
+    [ELIBSCN]           = TARGET_ELIBSCN,
+    [ELIBMAX]           = TARGET_ELIBMAX,
+    [ELIBEXEC]          = TARGET_ELIBEXEC,
+    [EILSEQ]            = TARGET_EILSEQ,
+    [ENOSYS]            = TARGET_ENOSYS,
+    [ELOOP]             = TARGET_ELOOP,
+    [ERESTART]          = TARGET_ERESTART,
+    [ESTRPIPE]          = TARGET_ESTRPIPE,
+    [ENOTEMPTY]         = TARGET_ENOTEMPTY,
+    [EUSERS]            = TARGET_EUSERS,
+    [ENOTSOCK]          = TARGET_ENOTSOCK,
+    [EDESTADDRREQ]      = TARGET_EDESTADDRREQ,
+    [EMSGSIZE]          = TARGET_EMSGSIZE,
+    [EPROTOTYPE]        = TARGET_EPROTOTYPE,
+    [ENOPROTOOPT]       = TARGET_ENOPROTOOPT,
+    [EPROTONOSUPPORT]   = TARGET_EPROTONOSUPPORT,
+    [ESOCKTNOSUPPORT]   = TARGET_ESOCKTNOSUPPORT,
+    [EOPNOTSUPP]        = TARGET_EOPNOTSUPP,
+    [EPFNOSUPPORT]      = TARGET_EPFNOSUPPORT,
+    [EAFNOSUPPORT]      = TARGET_EAFNOSUPPORT,
+    [EADDRINUSE]        = TARGET_EADDRINUSE,
+    [EADDRNOTAVAIL]     = TARGET_EADDRNOTAVAIL,
+    [ENETDOWN]          = TARGET_ENETDOWN,
+    [ENETUNREACH]       = TARGET_ENETUNREACH,
+    [ENETRESET]         = TARGET_ENETRESET,
+    [ECONNABORTED]      = TARGET_ECONNABORTED,
+    [ECONNRESET]        = TARGET_ECONNRESET,
+    [ENOBUFS]           = TARGET_ENOBUFS,
+    [EISCONN]           = TARGET_EISCONN,
+    [ENOTCONN]          = TARGET_ENOTCONN,
+    [EUCLEAN]           = TARGET_EUCLEAN,
+    [ENOTNAM]           = TARGET_ENOTNAM,
+    [ENAVAIL]           = TARGET_ENAVAIL,
+    [EISNAM]            = TARGET_EISNAM,
+    [EREMOTEIO]         = TARGET_EREMOTEIO,
+    [EDQUOT]            = TARGET_EDQUOT,
+    [ESHUTDOWN]         = TARGET_ESHUTDOWN,
+    [ETOOMANYREFS]      = TARGET_ETOOMANYREFS,
+    [ETIMEDOUT]         = TARGET_ETIMEDOUT,
+    [ECONNREFUSED]      = TARGET_ECONNREFUSED,
+    [EHOSTDOWN]         = TARGET_EHOSTDOWN,
+    [EHOSTUNREACH]      = TARGET_EHOSTUNREACH,
+    [EALREADY]          = TARGET_EALREADY,
+    [EINPROGRESS]       = TARGET_EINPROGRESS,
+    [ESTALE]            = TARGET_ESTALE,
+    [ECANCELED]         = TARGET_ECANCELED,
+    [ENOMEDIUM]         = TARGET_ENOMEDIUM,
+    [EMEDIUMTYPE]       = TARGET_EMEDIUMTYPE,
+#ifdef ENOKEY
+    [ENOKEY]            = TARGET_ENOKEY,
+#endif
+#ifdef EKEYEXPIRED
+    [EKEYEXPIRED]       = TARGET_EKEYEXPIRED,
+#endif
+#ifdef EKEYREVOKED
+    [EKEYREVOKED]       = TARGET_EKEYREVOKED,
+#endif
+#ifdef EKEYREJECTED
+    [EKEYREJECTED]      = TARGET_EKEYREJECTED,
+#endif
+#ifdef EOWNERDEAD
+    [EOWNERDEAD]        = TARGET_EOWNERDEAD,
+#endif
+#ifdef ENOTRECOVERABLE
+    [ENOTRECOVERABLE]   = TARGET_ENOTRECOVERABLE,
+#endif
+#ifdef ENOMSG
+    [ENOMSG]            = TARGET_ENOMSG,
+#endif
+#ifdef ERKFILL
+    [ERFKILL]           = TARGET_ERFKILL,
+#endif
+#ifdef EHWPOISON
+    [EHWPOISON]         = TARGET_EHWPOISON,
+#endif
+};
+
+void target_to_host_errno_table_init(void)
+{
+    /*
+     * Build target_to_host_errno_table[] table
+     * from host_to_target_errno_table[].
+     */
+    for (int i = 0; i < ERRNO_TABLE_SIZE; i++) {
+        target_to_host_errno_table[host_to_target_errno_table[i]] = i;
+    }
+}
+
+int host_to_target_errno(int err)
+{
+    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
+        host_to_target_errno_table[err]) {
+        return host_to_target_errno_table[err];
+    }
+    return err;
+}
+
+int target_to_host_errno(int err)
+{
+    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
+        target_to_host_errno_table[err]) {
+        return target_to_host_errno_table[err];
+    }
+    return err;
+}
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682d..f757b63310b 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -9,6 +9,7 @@
   'signal.c',
   'strace.c',
   'syscall.c',
+  'target_errno.c',
   'uaccess.c',
   'uname.c',
 ))
-- 
2.31.1


