Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E63C14FF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:18:30 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UrF-0003Js-1t
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ul1-000118-Vu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:12:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ul0-0002eD-1C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:12:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d2so7780531wrn.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaZ47NRpvrdxfMWdREZhs3pYHkHZftsvUkIIlMLRUwQ=;
 b=WsDTKyeDU8EbrD9kw5BWgCviAzKoSCLaDGgg4+UiAvdNegF+qlr2h00H/0bPiy/bVj
 pqvPO0UD4lhC1rjd2tvZ8YQPdSgOk0rVGd1UaRlF1k4lD93oO3J5ubukIRkSz9lh6Mee
 md6JySiCERaPxTQhdmM1sBvG8VdYiSdns0a7VinQeChmPpwFouTGcsHQzV52pVDo9Xfd
 46aErYyVSuVGAGWtWk6YcKkt7asI1eR7qdlwMYgYWQ6YC++4CIRyrJBGAQFoTGzo3q8Y
 iL1vKzzy0VTlsPBM2CcW0JZjLJyp17fU4CCeUGBICUthu3L8tqaAtOjSyQZ63VZQEliq
 0vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IaZ47NRpvrdxfMWdREZhs3pYHkHZftsvUkIIlMLRUwQ=;
 b=PeWsgRgbu1xt/gtcRLALvkndR5Fliaj4RQgd0AYNC+O9sSwNKy1Ibqzkb91JlaZsGE
 C2y56svqQA0k1FV0RlCMJwQNbzmRss4ejJxjp1KjAWnNEpf0rfgm+ZUP4bs89EXNvgLi
 rhQ0VmpjPwKG3lo61yCykWg4az9aO2oAsX/Tub80+te7hb+XE+UbGcuWKEjop9Y5Z5pW
 si65xqaVZD88+ECqTbykUMcYvYW1VrD83E4fT12+AMVUx1WMfYRWyXF4aBNCEMhboNcW
 j2wrOxVRScd1MWha6/QxcNhFdWwrEvHX5JTEl1GCWk7ICO1sW1NaQk7CCY7ijWjqvbCk
 BfXg==
X-Gm-Message-State: AOAM530h7hR+H/sqi0MizXXHufQ+bQpvjWwDBaRNDrR/XTA4ApAFUalq
 eqfIzYxnZ0+/mgLPBGsQGVIg5oXQAk0=
X-Google-Smtp-Source: ABdhPJxYiV3DGglTFK+Ih3HPn8cnE7bc9ZLuabN85gwiaaWwDpWWEzyaXup+2WKlYDhVFTeUOTCwwA==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr10795305wre.186.1625753520470; 
 Thu, 08 Jul 2021 07:12:00 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x17sm2435059wru.6.2021.07.08.07.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] linux-user: Simplify host <-> target errno conversion
 using macros
Date: Thu,  8 Jul 2021 16:11:21 +0200
Message-Id: <20210708141121.1731691-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the host_to_target_errno_table[] array to a switch case
to allow compiler optimizations. Extract the errnos list as to
a new includible unit, using a generic macro. Remove the code
related to target_to_host_errno_table[] initialization.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c    | 169 +++++-----------------------------------
 linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 148 deletions(-)
 create mode 100644 linux-user/errnos.c.inc

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56682b06cbd..8bb528d2cf7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -507,157 +507,37 @@ static inline int next_free_host_timer(void)
 }
 #endif
 
-#define ERRNO_TABLE_SIZE 1200
-
 static inline bool errno_exists(int err)
 {
-    return err >= 0 && err < ERRNO_TABLE_SIZE;
+    switch (err) {
+#define E(X)  case X: return true;
+#include "errnos.c.inc"
+#undef E
+    default:
+        return false;
+    }
 }
 
-/* target_to_host_errno_table[] is initialized from
- * host_to_target_errno_table[] in syscall_init(). */
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
-#ifdef ERFKILL
-    [ERFKILL]           = TARGET_ERFKILL,
-#endif
-#ifdef EHWPOISON
-    [EHWPOISON]         = TARGET_EHWPOISON,
-#endif
-};
-
-static inline int host_to_target_errno(int err)
+static inline int host_to_target_errno(int host_errno)
 {
-    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
-        host_to_target_errno_table[err]) {
-        return host_to_target_errno_table[err];
+    switch (host_errno) {
+#define E(X)  case X: return TARGET_##X;
+#include "errnos.c.inc"
+#undef E
+    default:
+        return host_errno;
     }
-    return err;
 }
 
-static inline int target_to_host_errno(int err)
+static inline int target_to_host_errno(int target_errno)
 {
-    if (err >= 0 && err < ERRNO_TABLE_SIZE &&
-        target_to_host_errno_table[err]) {
-        return target_to_host_errno_table[err];
+    switch (target_errno) {
+#define E(X)  case TARGET_##X: return X;
+#include "errnos.c.inc"
+#undef E
+    default:
+        return target_errno;
     }
-    return err;
 }
 
 static inline abi_long get_errno(abi_long ret)
@@ -7107,7 +6987,6 @@ void syscall_init(void)
     IOCTLEntry *ie;
     const argtype *arg_type;
     int size;
-    int i;
 
     thunk_init(STRUCT_MAX);
 
@@ -7117,12 +6996,6 @@ void syscall_init(void)
 #undef STRUCT
 #undef STRUCT_SPECIAL
 
-    /* Build target_to_host_errno_table[] table from
-     * host_to_target_errno_table[]. */
-    for (i = 0; i < ERRNO_TABLE_SIZE; i++) {
-        target_to_host_errno_table[host_to_target_errno_table[i]] = i;
-    }
-
     /* we patch the ioctl size if necessary. We rely on the fact that
        no ioctl has all the bits at '1' in the size field */
     ie = ioctl_entries;
diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
new file mode 100644
index 00000000000..807c97ca25e
--- /dev/null
+++ b/linux-user/errnos.c.inc
@@ -0,0 +1,140 @@
+/*
+ * This list is the union of errno values overridden in asm-<arch>/errno.h
+ * minus the errnos that are not actually generic to all archs.
+ *
+ * Please keep this list sorted alphabetically.
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
+E(EADDRINUSE)
+E(EADDRNOTAVAIL)
+E(EADV)
+E(EAFNOSUPPORT)
+E(EAGAIN)
+E(EALREADY)
+E(EBADE)
+E(EBADFD)
+E(EBADMSG)
+E(EBADR)
+E(EBADRQC)
+E(EBADSLT)
+E(EBFONT)
+E(ECANCELED)
+E(ECHRNG)
+E(ECOMM)
+E(ECONNABORTED)
+E(ECONNREFUSED)
+E(ECONNRESET)
+E(EDEADLK)
+E(EDESTADDRREQ)
+E(EDOTDOT)
+E(EDQUOT)
+E(EHOSTDOWN)
+E(EHOSTUNREACH)
+#ifdef EHWPOISON
+E(EHWPOISON)
+#endif
+E(EIDRM)
+E(EILSEQ)
+E(EINPROGRESS)
+E(EISCONN)
+E(EISNAM)
+#ifdef EKEYEXPIRED
+E(EKEYEXPIRED)
+#endif
+#ifdef EKEYREJECTED
+E(EKEYREJECTED)
+#endif
+#ifdef EKEYREVOKED
+E(EKEYREVOKED)
+#endif
+E(EL2HLT)
+E(EL2NSYNC)
+E(EL3HLT)
+E(EL3RST)
+E(ELIBACC)
+E(ELIBBAD)
+E(ELIBEXEC)
+E(ELIBMAX)
+E(ELIBSCN)
+E(ELNRNG)
+E(ELOOP)
+E(EMEDIUMTYPE)
+E(EMSGSIZE)
+E(EMULTIHOP)
+E(ENAMETOOLONG)
+E(ENAVAIL)
+E(ENETDOWN)
+E(ENETRESET)
+E(ENETUNREACH)
+E(ENOANO)
+E(ENOBUFS)
+E(ENOCSI)
+E(ENODATA)
+#ifdef ENOKEY
+E(ENOKEY)
+#endif
+E(ENOLCK)
+E(ENOLINK)
+E(ENOMEDIUM)
+#ifdef ENOMSG
+E(ENOMSG)
+#endif
+E(ENONET)
+E(ENOPKG)
+E(ENOPROTOOPT)
+E(ENOSR)
+E(ENOSTR)
+E(ENOSYS)
+E(ENOTCONN)
+E(ENOTEMPTY)
+E(ENOTNAM)
+#ifdef ENOTRECOVERABLE
+E(ENOTRECOVERABLE)
+#endif
+E(ENOTSOCK)
+E(ENOTUNIQ)
+E(EOPNOTSUPP)
+E(EOVERFLOW)
+#ifdef EOWNERDEAD
+E(EOWNERDEAD)
+#endif
+E(EPFNOSUPPORT)
+E(EPROTO)
+E(EPROTONOSUPPORT)
+E(EPROTOTYPE)
+E(EREMCHG)
+E(EREMOTE)
+E(EREMOTEIO)
+E(ERESTART)
+#ifdef ERKFILL
+E(ERFKILL)
+#endif
+E(ESHUTDOWN)
+E(ESOCKTNOSUPPORT)
+E(ESRMNT)
+E(ESTALE)
+E(ESTRPIPE)
+E(ETIME)
+E(ETIMEDOUT)
+E(ETOOMANYREFS)
+E(EUCLEAN)
+E(EUNATCH)
+E(EUSERS)
+E(EXFULL)
-- 
2.31.1


