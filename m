Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E602948829A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:49:40 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n670x-0007rz-VC
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005Jd-O2
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:03 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=45054
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IV-0003K1-7n
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:58 -0500
Received: by mail-io1-xd2e.google.com with SMTP id h23so10031156iol.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqNi6fntG0ZGKoQuBAAKzElQ2KHXFVMfekNgaGGkf34=;
 b=tN1ZW4XnAaZDOcABUjHaiDx07fmQUjmIe65E9izTV6U1X+JAipFYpWBJefU//swq9N
 kf1DoOBMfCoGEGvrwsu1Yq5DFrvVjbw9jK0/nhq/awbi/JXkwN0GIBwBE0Vtx9mr5Bn1
 m97tWmD34I4PPxSa2pHFfcZL1A56cp5sglvijkELRC1OydGbaJsNDKcRmsvxh9Zj8DXC
 55i5ay5G/i3xwC3X4Dg77XXJ1XCRCDIECPXBQMr2uqG4s4CvRVpNoXI/uWpxZMNycz4Q
 apFuAeHPv+MqN6aMwT4k2zz8yktlzx52LjpwVJ+fig12Ri9bjYPPwbjtEtNl3pJ8xkeT
 lrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqNi6fntG0ZGKoQuBAAKzElQ2KHXFVMfekNgaGGkf34=;
 b=LR9Oxnz7Ec88owrLCQQD05g6Bu7ZlNi26OyXqKn9AYoO7drg03XmAcH99ypBVf5ArI
 k5/NfZfiys97G3RoBFB3QF32CkgoJI2MjgIgPbB6rSoB5M2LPVO0OtrnoTkngzY7+uSR
 CFHLP9szXjHUF2ssE+jeqskwCzC4dOTZsy1lWeR+94NGHmxjExi76HlPCXhWI9ob/DqG
 uVdbZUAFUd1DaLpjz02BXwrqblgpUK/yk/pLe6F0ErhMhfyuwFAjC5nPAGUCoUx/9KZG
 0oMBITqtIgCMaMc1fPbzJKv6h0UKlM8kAxDdiqilxvb1Rf0a/3o6HXMvLpFAGAHn5YzJ
 amjQ==
X-Gm-Message-State: AOAM5304EZCqNlYcjzBMfnah6p6ccm1+hNhwclHjuFBfalkO6j00w4fN
 vPStrCPvQChM4JxKDHHlEtF0NPs1FLgJGvJ+
X-Google-Smtp-Source: ABdhPJx+JdOOYLuFjxQRO6bvzhnjjuvG4haECxQXuRZeS1RL0RjLjd8POBTNiR/FGpbHZsepCDdIig==
X-Received: by 2002:a5d:8a0a:: with SMTP id w10mr31730136iod.90.1641627464641; 
 Fri, 07 Jan 2022 23:37:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/37] bsd-user/freebsd: Create common target_os_ucontext.h file
Date: Sat,  8 Jan 2022 00:37:02 -0700
Message-Id: <20220108073737.5959-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD has a MI ucontext structure that contains the MD mcontext
machine state and other things that are machine independent. Create an
include file for all the ucontext stuff. It needs to be included in the
arch specific files after target_mcontext is defined. This is largely
copied from sys/_ucontext.h with the comments about layout removed
because we don't support ancient FreeBSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_signal.h   |  3 ---
 bsd-user/freebsd/target_os_ucontext.h | 35 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 1a4c5faf19e..3ed454e086d 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,9 +1,6 @@
 #ifndef _TARGET_OS_SIGNAL_H_
 #define _TARGET_OS_SIGNAL_H_
 
-/* FreeBSD's sys/ucontext.h defines this */
-#define TARGET_MC_GET_CLEAR_RET 0x0001
-
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
new file mode 100644
index 00000000000..1d0c3c4e651
--- /dev/null
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -0,0 +1,35 @@
+/*
+ * FreeBSD has a common ucontext definition for all architectures.
+ *
+ * Copyright 2021 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+ */
+#ifndef TARGET_OS_UCONTEXT_H
+#define TARGET_OS_UCONTEXT_H
+
+/*
+ * Defines the common bits for all of FreeBSD's architectures. Has to be
+ * included AFTER the MD target_mcontext_t is defined, however, so can't
+ * be in the grab-bag that is target_os_signal.h.
+ */
+
+/* See FreeBSD's sys/ucontext.h */
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
+/* FreeBSD's sys/_ucontext.h structures */
+typedef struct target_ucontext {
+    target_sigset_t     uc_sigmask;
+    target_mcontext_t   uc_mcontext;
+    abi_ulong           uc_link;
+    target_stack_t      uc_stack;
+    int32_t             uc_flags;
+    int32_t             __spare__[4];
+} target_ucontext_t;
+
+#ifdef TARGET_MCONTEXT_SIZE
+G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
+G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
+#endif /* TARGET_MCONTEXT_SIZE */
+
+#endif /* TARGET_OS_UCONTEXT_H */
-- 
2.33.1


