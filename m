Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516124478FC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:54:21 +0100 (CET)
Received: from [::1] (port=37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvjg-0000V3-7v
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhe-0005zW-QR
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:14 -0500
Received: from [2607:f8b0:4864:20::136] (port=33567
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhc-0002nk-9i
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:14 -0500
Received: by mail-il1-x136.google.com with SMTP id l19so15626102ilk.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/bcMnK09mA61YDjbq505/3gEhhtbTNE0YI5skGQUVE=;
 b=VXgU9VRhZ8275E6BaIIzfLAfEgPXUyfwjcW1Pe7Z343h32CdhBweZu6kD/f9sd22/0
 05Yd4PhJOwmZXc8NT/qEAV+9Fs1Rd9AyAdaFxbwKi/TkgMC93M/DxC2rnlmQENzpBmsU
 J+c+CVaWQZ80HjgJE3ntY4f51kr0wqOTlz7PIGlYzp5wsuoG6VI7E6rwO7am4r9bdFip
 2bdEUo4h2Mss9uS0VwBwcDcE2Fyyiur6CyrbFmLsFo8WprWTubFbr9JBV425c4p1LIqu
 GgKO9bBNcL++t7UwTWS30H5ZuwaY08/Pp21KTxbANf9UKhkPMrIuGUf1SY/MsgSehr37
 VSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/bcMnK09mA61YDjbq505/3gEhhtbTNE0YI5skGQUVE=;
 b=jD1eKG84sM4tZB7XKQnq9pLxVvQh1DqskLf2Ki4huiiYqMD5bki5HxV+bdqRu5tiXd
 GKXME9TVGV/xykRIjfTkJPl/ZqHJqTbdt+0EHz5Q7bAELDHZDR+ZaMgIJYJnwr3zjqdU
 b5ZJelnW8IIv0mQwOjnZVCVI0oVLkz6C6nHhrtQCnlovyVcx2fY4b4PYJ0q2BYlnQXGA
 ba5qznYFZFHhK/zTpD1FBGswR5gaeNVW3nJWa9YtLehcBVVgpjwsx0/win7xM0YmZpOW
 b8rXagGmpBuZlf2ItxdOKtJyQXkD0iGqRMP/iBXi0tVu9cDXHeXyTjzWor5ZaNvZXvDN
 +2cA==
X-Gm-Message-State: AOAM531FAoYmogMFBLxSct1HxFWcVqhZ6X2Qg1gw0w4lXUlyy2kO14BL
 fkpaevPQlKEC6jmqfehH6A7R5LiN/cKOuQ==
X-Google-Smtp-Source: ABdhPJyykepfs483xaeygC4BTCRgShTNmEra46qhJZSAAf9KbtUqSqC4qsHzrMVkZElY7+bC1IhvUQ==
X-Received: by 2002:a05:6e02:1bef:: with SMTP id
 y15mr43517342ilv.11.1636343530933; 
 Sun, 07 Nov 2021 19:52:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/37] bsd-user/mips*: Remove mips support
Date: Sun,  7 Nov 2021 20:51:00 -0700
Message-Id: <20211108035136.43687-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD is dropping support for mips starting with FreeBSD 14. mips
support has been removed from the bsd-user fork because updating it for
new signal requirements will take too much time. Remove it here since it
is a distraction.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
 bsd-user/mips/target_syscall.h        | 52 --------------------
 bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
 bsd-user/mips64/target_syscall.h      | 53 --------------------
 4 files changed, 243 deletions(-)
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h

diff --git a/bsd-user/mips/target_arch_sysarch.h b/bsd-user/mips/target_arch_sysarch.h
deleted file mode 100644
index 6da803a408..0000000000
--- a/bsd-user/mips/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips/target_syscall.h b/bsd-user/mips/target_syscall.h
deleted file mode 100644
index aacc6ddf9f..0000000000
--- a/bsd-user/mips/target_syscall.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- *  mips system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS_SYSCALL_H_
-#define _MIPS_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips"
-#else
-#define UNAME_MACHINE "mipsel"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH   UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS_SYSCALL_H_ */
diff --git a/bsd-user/mips64/target_arch_sysarch.h b/bsd-user/mips64/target_arch_sysarch.h
deleted file mode 100644
index e6f9c00d5f..0000000000
--- a/bsd-user/mips64/target_arch_sysarch.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  mips64 sysarch() system call emulation
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
-
-#include "target_syscall.h"
-#include "target_arch.h"
-
-static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
-        abi_ulong parms)
-{
-    int ret = 0;
-
-    switch (op) {
-    case TARGET_MIPS_SET_TLS:
-        target_cpu_set_tls(env, parms);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
-            ret = -TARGET_EFAULT;
-        }
-        break;
-
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static inline void do_freebsd_arch_print_sysarch(
-        const struct syscallname *name, abi_long arg1, abi_long arg2,
-        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    switch (arg1) {
-    case TARGET_MIPS_SET_TLS:
-        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    case TARGET_MIPS_GET_TLS:
-        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
-        break;
-
-    default:
-        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
-    }
-}
-
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips64/target_syscall.h b/bsd-user/mips64/target_syscall.h
deleted file mode 100644
index bf4c598b13..0000000000
--- a/bsd-user/mips64/target_syscall.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- *  mips64 system call definitions
- *
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef _MIPS64_SYSCALL_H_
-#define _MIPS64_SYSCALL_H_
-
-/*
- * struct target_pt_regs defines the way the registers are stored on the stack
- * during a system call.
- */
-
-struct target_pt_regs {
-    /* Saved main processor registers. */
-    abi_ulong regs[32];
-
-    /* Saved special registers. */
-    abi_ulong cp0_status;
-    abi_ulong lo;
-    abi_ulong hi;
-    abi_ulong cp0_badvaddr;
-    abi_ulong cp0_cause;
-    abi_ulong cp0_epc;
-};
-
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-#define UNAME_MACHINE "mips64"
-#else
-#define UNAME_MACHINE "mips64el"
-#endif
-
-#define TARGET_HW_MACHINE       "mips"
-#define TARGET_HW_MACHINE_ARCH  UNAME_MACHINE
-
-/* sysarch() commands */
-#define TARGET_MIPS_SET_TLS     1
-#define TARGET_MIPS_GET_TLS     2
-
-#endif /* !_MIPS64_SYSCALL_H_ */
-- 
2.33.0


