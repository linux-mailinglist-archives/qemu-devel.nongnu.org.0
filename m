Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C63FF854
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:20:44 +0200 (CEST)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwwj-0005I4-Dr
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRJ-000746-5i
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:14 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRE-00034X-9M
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:12 -0400
Received: by mail-il1-x12d.google.com with SMTP id u7so3563460ilk.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=VHVyWOln3gY6tDMdRIo/26ZKQZC7o4XZZ25SRzxfwaqdWuB6sPJ9cuT/PD/sOHX8YI
 EETBEsArrWRArTWXyuhY7z0aVnZg/7rB7M/7Z6EnwxiDh1UrpoNmrxKUxMdWtZfE3yAp
 LY9Jm9JLf8dpTP3kY0WsYvi7GrzWuEvlrZN0qqEgLQf9Yg/o0tSMAaoeu/QzQA8vuDoi
 qTeKGDX78lICg8jWeL3YU1HxmqZ7L9LQ7qJ0OKK2k7/KSE11xRarpU1r6ZZKqRwAOQRh
 ogsEiK+IjfGL04f8rYGzOdYKf8sWRKDMUNfq2U737MevsVZK5G7cTWLRPBgyH64+cTLb
 6trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=HmNy3GMlk4S/zE5rgSeH88mHM8dEew2n/fYYuCEx+uHdfK0c21yRQdM8dITOq8U+aZ
 SbN3p2dpnEEVrq9QWHUguIlitXO6QcOqD1Z+Ns0sOz7t9qTrU6nk2RBS4wCtUkLGte05
 YvGD6cwafT7AduseJU+0M+hHy9YOHIFcmh3ojsDSpeBXvAzJ1iP4E/ehFNvFF6lEi5bO
 PfBmkItcSOAiTUgtrMGl1IlUmRlYFKiMcZG52ZVx070o8UzUkKgNq1kaJCf72KO7ds68
 VY2Z79fel02iuV7WmAjHK3/oGhBd9LIN1w03807RDMOEI7gg4kHdt2Mop3ht0imHa1m5
 dN+w==
X-Gm-Message-State: AOAM531HioXdDRng8/yx31T8wKHSJ90iQ7xaXH/58VNp7WCx4Lwyzy6b
 dk0H5F2vfuFs8x4jOQfWe5mvoEznQZZcqA==
X-Google-Smtp-Source: ABdhPJyFPjlqT0uyCxvmQx5fnPUOAAWrByE8+mBGc6uf9+cdhN2catS9bWgB1Jtv4IKGzpi9sWLczA==
X-Received: by 2002:a92:cd85:: with SMTP id r5mr541073ilb.213.1630626487000;
 Thu, 02 Sep 2021 16:48:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:06 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/43] bsd-user: Create target specific vmparam.h
Date: Thu,  2 Sep 2021 17:47:10 -0600
Message-Id: <20210902234729.76141-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Target specific values for vm parameters and details.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_vmparam.h  | 38 ++++++++++++++++++++++
 bsd-user/i386/target_arch_vmparam.h   | 46 +++++++++++++++++++++++++++
 bsd-user/qemu.h                       |  1 +
 bsd-user/x86_64/target_arch_vmparam.h | 46 +++++++++++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 bsd-user/freebsd/target_os_vmparam.h
 create mode 100644 bsd-user/i386/target_arch_vmparam.h
 create mode 100644 bsd-user/x86_64/target_arch_vmparam.h

diff --git a/bsd-user/freebsd/target_os_vmparam.h b/bsd-user/freebsd/target_os_vmparam.h
new file mode 100644
index 0000000000..990300c619
--- /dev/null
+++ b/bsd-user/freebsd/target_os_vmparam.h
@@ -0,0 +1,38 @@
+/*
+ *  FreeBSD VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_OS_VMPARAM_H_
+#define _TARGET_OS_VMPARAM_H_
+
+#include "target_arch_vmparam.h"
+
+/* Compare to sys/exec.h */
+struct target_ps_strings {
+    abi_ulong ps_argvstr;
+    uint32_t ps_nargvstr;
+    abi_ulong ps_envstr;
+    uint32_t ps_nenvstr;
+};
+
+extern abi_ulong target_stkbas;
+extern abi_ulong target_stksiz;
+
+#define TARGET_PS_STRINGS  ((target_stkbas + target_stksiz) - \
+                            sizeof(struct target_ps_strings))
+
+#endif /* !TARGET_OS_VMPARAM_H_ */
diff --git a/bsd-user/i386/target_arch_vmparam.h b/bsd-user/i386/target_arch_vmparam.h
new file mode 100644
index 0000000000..bb7718265b
--- /dev/null
+++ b/bsd-user/i386/target_arch_vmparam.h
@@ -0,0 +1,46 @@
+/*
+ *  i386 VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to i386/include/vmparam.h */
+#define TARGET_MAXTSIZ  (128 * MiB)             /* max text size */
+#define TARGET_DFLDSIZ  (128 * MiB)             /* initial data size limit */
+#define TARGET_MAXDSIZ  (512 * MiB)             /* max data size */
+#define TARGET_DFLSSIZ  (8 * MiB)               /* initial stack size limit */
+#define TARGET_MAXSSIZ  (64 * MiB)              /* max stack size */
+#define TARGET_SGROWSIZ (128 * KiB)             /* amount to grow stack */
+
+#define TARGET_RESERVED_VA 0xf7000000
+
+#define TARGET_USRSTACK (0xbfc00000)
+
+static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
+{
+    return state->regs[R_ESP];
+}
+
+static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
+{
+    state->regs[R_EDX] = retval2;
+}
+
+#endif /* !_TARGET_ARCH_VMPARAM_H_ */
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index fea1a167e4..1b37757e06 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -41,6 +41,7 @@ extern enum BSDType bsd_type;
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
+#include "target_os_vmparam.h"
 #include "exec/gdbstub.h"
 
 /*
diff --git a/bsd-user/x86_64/target_arch_vmparam.h b/bsd-user/x86_64/target_arch_vmparam.h
new file mode 100644
index 0000000000..81a915f2e5
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_vmparam.h
@@ -0,0 +1,46 @@
+/*
+ *  Intel x86_64 VM parameters definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to amd64/include/vmparam.h */
+#define TARGET_MAXTSIZ  (128 * MiB)             /* max text size */
+#define TARGET_DFLDSIZ  (32 * GiB)              /* initial data size limit */
+#define TARGET_MAXDSIZ  (32 * GiB)              /* max data size */
+#define TARGET_DFLSSIZ  (8 * MiB)               /* initial stack size limit */
+#define TARGET_MAXSSIZ  (512 * MiB)             /* max stack size */
+#define TARGET_SGROWSIZ (128 * KiB)             /* amount to grow stack */
+
+#define TARGET_VM_MAXUSER_ADDRESS   (0x00007fffff000000UL)
+
+#define TARGET_USRSTACK (TARGET_VM_MAXUSER_ADDRESS - TARGET_PAGE_SIZE)
+
+static inline abi_ulong get_sp_from_cpustate(CPUX86State *state)
+{
+    return state->regs[R_ESP];
+}
+
+static inline void set_second_rval(CPUX86State *state, abi_ulong retval2)
+{
+    state->regs[R_EDX] = retval2;
+}
+
+#endif /* !_TARGET_ARCH_VMPARAM_H_ */
-- 
2.32.0


