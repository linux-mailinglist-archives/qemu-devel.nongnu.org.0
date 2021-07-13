Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7223C71EE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:16:37 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JDA-0003Th-Kt
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifu-0000a5-D3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:14 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifp-0006DH-4L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:11 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJW5G-1ljYti2yl6-00JomH; Tue, 13
 Jul 2021 15:41:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] linux-user: Simplify host <-> target errno conversion
 using macros
Date: Tue, 13 Jul 2021 15:41:47 +0200
Message-Id: <20210713134152.288423-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ej8Q/YiFxiejtXD7fy9+561On7LtHz8CIlqS3LfFS4UiXgPoKCf
 YBqvZLNg2QI7IcP4vDU1OFBUM0hopLBXMuAZFBc2oqJ/+CNr6Cmdwb1Q8uxgnwVT/mQNeqI
 XCOHLqs8D89n0qtjMGxDKSrAO0o9eQU8e8+BtoUFLgWQS/p2bnhC5XWlwF9AZgDHFTHdhM1
 7+riuXBCXULXYHAUKDwIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OaxS6sq4GqU=:kPBdlot7HsB35YFs3wjyEg
 xLHkTXlLDHncPlTPjx9F2Rr0SGoTLFa3lRtkaJwA0YDYWKwFEuIS1uM05Xh6TjCzzkBT90STl
 oZEp2DWwTgzUj5R6cU8qpite+ow0CL/CKKnaxn+PHG4klOYALEin1cYMipSt4K2cjlNxOyai0
 k3fyuxDlIZTekd8Jox7YbYkH6MxfHNhH+gQ1PAsFWii45TGfjrxW9M2JtszX2WC6nOA5W3BOm
 vTWoiicQVI8I+SmwHqf05foHDaY7HQlPrr1wcAIvdBGwl/f1lg2nBbZxfED7fKomTLAjYpn/P
 sw33hnK2qW6fPl7i3OZQ9tztaBm/ah5p8M1EBkZORSczE3WdsW2m6n0rb9wk67rOSESOTZ7hN
 0jzNfzsoB1137Mc062U6dKaiTYD4sAUYsH1nquHhiwSnHdUcYaJvk8cl08nmmFMompDvWnzar
 uYp56FwunWTC7Sdfl7bLsoaJ6vUbf7O1J6/I3HM6z3rGIvUtk2qx7ruXUPE+DDDvkpuoiQfsE
 C6g37RCLnfhWtWabo0+wx25sQ7mKbjZthVcvw1MrQnhsDD5ua1ZVQkjJAOJ8Xvxa0eIf+misB
 QDufIRxNcZLEhQQSs+7nENiN+yOkJcnapy4XAxexs/iU4qWgAZ2Cfc5Dyw5O7zi9/U3SFj+ZZ
 sAUhII13UZboTEbev/bjWd02xjh610f5n5WZUS1D78lhbGmKb5wzGmFpZm7Hdt30tK5m8dl7B
 Klnk4/uqlj2DlEQREHBllIkCIJjq3HgEgZR+H+R9jO+ItBH99ZXRK6TJz7HdfTvaptF+a3AC8
 CugRPAq5bc1UYqE6aIJnojlpM2ZUa0yom0CCRNDhj2MXjVWiWzuxBP8CghyizdHyfql6gg9
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Convert the host_to_target_errno_table[] array to a switch
case to allow compiler optimizations (such noticing the identity
function when host and guest errnos match). Extract the errnos
list as to a new includible unit, using a generic macro. Remove
the code related to target_to_host_errno_table[] initialization.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210708170550.1846343-8-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++++
 linux-user/syscall.c    | 159 ++++------------------------------------
 2 files changed, 154 insertions(+), 145 deletions(-)
 create mode 100644 linux-user/errnos.c.inc

diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
new file mode 100644
index 000000000000..963ba1ce9d11
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
+#ifdef ERFKILL
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
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4842a1987b79..94ec6f730b3f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -509,150 +509,26 @@ static inline int next_free_host_timer(void)
 
 #define ERRNO_TABLE_SIZE 1200
 
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
@@ -7102,7 +6978,6 @@ void syscall_init(void)
     IOCTLEntry *ie;
     const argtype *arg_type;
     int size;
-    int i;
 
     thunk_init(STRUCT_MAX);
 
@@ -7112,12 +6987,6 @@ void syscall_init(void)
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
-- 
2.31.1


