Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90033F902E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:35:35 +0200 (CEST)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN26-0003wM-Tl
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg5-0006PU-NM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:49 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg1-0006wh-PK
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:49 -0400
Received: by mail-io1-xd42.google.com with SMTP id j18so5557219ioj.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=yH2yYDZQxFMuO45DJLL59IMjxBbFThLedK6aJEnzxrcSZORgJ3Bacxny3JFoI0Kzr/
 aN11E9Giv7ns4hOrEzgtm+rA2FrX8UoB2t/TfzDy4XGtG2ycY4o1cYRfK1NI6+V4ecs2
 3lvdHU5wDw/FYLymg1aSN9Rqz0Wa+tJFir8agKVSBWR0Ofm7G5hrDDCcGlAeRcEyO8DB
 adikhyuSGtUadCy1TaAhoQyKf0IKHjVayrQlOILEOtY8LDaDRvPzwFQ2HSByfQx6mGtB
 ZltS6MXsNPsJaNZPjWSVl0Iiph4TOnHKetu+tio8Rccqf8i85gBCWA0xHSZxkNgFTc4N
 Bf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/alk5dhNog11lYeAdIDLuwiTsPArXCiZibQ+tOSdZPs=;
 b=lkIWkms1CIXGjTUV2uOmafT0QsLDXY9FfDLh51xwisqclGnnMf+fX+EmYN0KYAIuX9
 Da5hJMp2CrMsAAm4Nnef1QFa9waAtDIfEQ3pxafOzdBnHpLh7jBluZcNv6Cu/nsydsRv
 20yZDsbM7KUSj5WpXOkhzmA9go6Y100XkIIb/64MM8dwd66NB7p0WAFNhDQ5lrsmxshj
 bHNddfb2pw7N2YapbqQBoG0NdP4freaBzfcc0TMi2ua/7svgo1OGtpiWT+u6fa2DcOi1
 SgVwO/qKXQ9+zB4ymf9SEDDS/HqH/roHrWbWXKHhw8PM+9MBEH1rC4/eX3rbxS2YDI37
 3LOw==
X-Gm-Message-State: AOAM5322xqHukohIV4wiJ3Y44Tzb30C3h7NaXQuJvhjfpAhoErE8sAup
 HB+U7/vxXvLY8KRiXj/Re654SRkdUAJ67XL7
X-Google-Smtp-Source: ABdhPJxseQuSF9MxD2L4nntAjPKJiOowJX/iudSTQA4ugRcGVcJ6Dn67td3M5y/OU2Kr4iWE/Ro2/Q==
X-Received: by 2002:a6b:e70f:: with SMTP id b15mr4795800ioh.140.1630012364504; 
 Thu, 26 Aug 2021 14:12:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:43 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/43] bsd-user: Create target specific vmparam.h
Date: Thu, 26 Aug 2021 15:11:42 -0600
Message-Id: <20210826211201.98877-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
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


