Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16813E3744
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:55:46 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUID-000454-OL
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6D-0007ff-72
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:21 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6B-00050K-5x
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:20 -0400
Received: by mail-io1-xd42.google.com with SMTP id n19so20055851ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HKY4/GdCAuZdXZ+sZtb65CygtqaDscQyIFstkbna0Y=;
 b=Oaw44+Eq2NkPObSwrzzYQk+zfCVY8jCPtMrDCQ/SXU/DHvLhlYA/I2jEdoIn7JxAmb
 VUbu+G2tzP73eSl1Ue4BpHawsrYmyiunk06eREB+E76YZWfXTlzP2Ud8VzXqRiBisI5t
 Ev6fraHsn5w6YQm7/g6TUgAPAkVRYtpjOY7nBgNERkenJUN3nrmcWIuJ/RY4drzl0F53
 TMwNXBcD0XjroHhhneMYN89ddlMOvV9n/ymCCw+sXGZGyYxKgDB8/48qS3/0O75CXvGR
 ycwNooZwaY7fUF2fiSgwrTYPOBeKxP/nPi2SDwlKJSIW/EmcNKcYc5+9lXXxibnQ55kC
 gEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HKY4/GdCAuZdXZ+sZtb65CygtqaDscQyIFstkbna0Y=;
 b=qC04Bc4ssOJ1+tITdufuy8DdY/QOt9LJ+Ltt4kRYkpFeFwd14kNiJyxhG/3PG+qGed
 a8kOAH2iB9vDyqB+4kNdLjMWGwSR43LQI58fHtv2KTKBd9fPeRFzIq+6izHbZt/+basn
 Edh1uhqzAZg/+F+6GHIAH2U/WydKj40oqZvbGaRNWw1GJCX1Ys16xWTt4enewD8i8I0Q
 CvXsu85LGlGSS/32UxCO84/7B0wEQA9rr8NMwqenEGUEcz9izofbrKcVEk39E8IB3SDD
 5o234rIfdwM17SYYjElN0OBHdEdkc7NZE4Tce1wOeT/EprhF2DcuqWJTxYc63HrpSuZx
 1oOg==
X-Gm-Message-State: AOAM533Fq0x4jI3dEAp14NRzbc9KgsY64zdgVuE7UD53DkEIyDE7AThT
 tkxb9xrZpx84zugDwsFVqEAMTJjm3KK9AbND
X-Google-Smtp-Source: ABdhPJwQXuHQSKsnMMBR1vX0P0R07CayDLr/8ZavK7R+Efco8CKEp7uYnCDOmfmzCSawWoX+HqN1OA==
X-Received: by 2002:a6b:6609:: with SMTP id a9mr412706ioc.8.1628372597974;
 Sat, 07 Aug 2021 14:43:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 26/49] bsd-user: Create target specific vmparam.h
Date: Sat,  7 Aug 2021 15:42:19 -0600
Message-Id: <20210807214242.82385-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Target specific values for vm parameters and details.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_vmparam.h  | 38 ++++++++++++++++++++++
 bsd-user/i386/target_arch_vmparam.h   | 46 +++++++++++++++++++++++++++
 bsd-user/qemu.h                       |  2 +-
 bsd-user/x86_64/target_arch_vmparam.h | 46 +++++++++++++++++++++++++++
 4 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/freebsd/target_os_vmparam.h
 create mode 100644 bsd-user/i386/target_arch_vmparam.h
 create mode 100644 bsd-user/x86_64/target_arch_vmparam.h

diff --git a/bsd-user/freebsd/target_os_vmparam.h b/bsd-user/freebsd/target_os_vmparam.h
new file mode 100644
index 0000000000..d7ad149137
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
+		sizeof(struct target_ps_strings))
+
+#endif /* !TARGET_OS_VMPARAM_H_ */
diff --git a/bsd-user/i386/target_arch_vmparam.h b/bsd-user/i386/target_arch_vmparam.h
new file mode 100644
index 0000000000..c42ec87d54
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
+#define TARGET_MAXTSIZ  (128UL*1024*1024)   /* max text size */
+#define TARGET_DFLDSIZ  (128UL*1024*1024)   /* initial data size limit */
+#define TARGET_MAXDSIZ  (512UL*1024*1024)   /* max data size */
+#define TARGET_DFLSSIZ  (8UL*1024*1024)     /* initial stack size limit */
+#define TARGET_MAXSSIZ  (64UL*1024*1024)    /* max stack size */
+#define TARGET_SGROWSIZ (128UL*1024)        /* amount to grow stack */
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
index 9322187891..c5414c7b4c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -44,7 +44,7 @@ extern enum BSDType bsd_type;
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
-//#include "target_os_vmparam.h"
+#include "target_os_vmparam.h"
 //#include "target_os_signal.h"
 //#include "hostdep.h"
 #include "exec/gdbstub.h"
diff --git a/bsd-user/x86_64/target_arch_vmparam.h b/bsd-user/x86_64/target_arch_vmparam.h
new file mode 100644
index 0000000000..addb68fa94
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
+#define TARGET_MAXTSIZ  (128UL*1024*1024)   /* max text size */
+#define TARGET_DFLDSIZ  (32768UL*1024*1024) /* initial data size limit */
+#define TARGET_MAXDSIZ  (32768UL*1024*1024) /* max data size */
+#define TARGET_DFLSSIZ  (8UL*1024*1024)     /* initial stack size limit */
+#define TARGET_MAXSSIZ  (512UL*1024*1024)   /* max stack size */
+#define TARGET_SGROWSIZ (128UL*1024)        /* amount to grow stack */
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


