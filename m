Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CC445E8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:23:13 +0100 (CET)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipou-0007Wl-Sh
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplg-0004EL-QD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:52 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipld-00042y-O2
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:52 -0400
Received: by mail-il1-x135.google.com with SMTP id f10so8266611ilu.5
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDPt+10pI2apuOo9dXdmFVld2os3PLc83HBDg8phZBs=;
 b=cGhb2BisdGQt9pQ+jOl57shUMusmZDfK7i7YyovASaM8LtIa+Onj8GDIWD/T1rEyaD
 Ttn7sIASZkG1U+a3mi/+H7steP9rE4ae7t+YUoUnkSLfPFF8q6tFszMmC0yzTqwhlSEU
 CQZRrD1NCrXsUQcQ6q3hdcrUhXcIzPrZ1nMaSorfqAgzGj7dTUSlG+zYRRplniFVbC/y
 h7O2LntKnBUTh9C/5KP6sKo2NhsW6JXazYT9tM47NwlBU09x3+jGa5rU0rk8AuSVCjFf
 TyehDt+egTUstqG9L9nATfTr027f2tqwpc4p99UcpVPGlaei9sZzy2YRy7SsPprFx/xy
 OsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDPt+10pI2apuOo9dXdmFVld2os3PLc83HBDg8phZBs=;
 b=6B42tD9C2TfqbeC4VfCkGR3CryBYn5OXuH0v6oRRLY6LZzGwWY+G8co97HIP0WJRt7
 VEJxGJripYrJGojcA5aUe6QCcVwoyk2e0qJL/FJuHW+GlzUEV/RQ8km+YU13vOxDOFNY
 IiS71FbBORJFoVIDILn6Ms9/4yCQQxmZER7Zd9C+UpqJjo9bHQUTC7mlC2myqUrISxlo
 uPpm7I7J5w1Ohni0a9oTXJVOKpMuUJ8uoNvE8/ZfducRi6paQmmirkdLufzfVzLeXSqh
 fkTOISIiwueoxEm0pd4ESyRMax5rrsEx2zHPihKC2dvr8yVvxg2GmRVbbq2XFaeE3/Oh
 a49A==
X-Gm-Message-State: AOAM531RJPPFpsTcAXHQo0Qarmul4L9U+pxFRuWxCw3FTLa7vhIvi/wH
 u/m1NIRLfrKNIzxnwS1RE+SmsiDEuy/lVQ==
X-Google-Smtp-Source: ABdhPJyyNr6VGXtoH4vWJOIJmyrJly1Jp0Lj67zE6PoCh3B9DO/7+xLp419jcloOWNtwIFHmgppksg==
X-Received: by 2002:a92:6412:: with SMTP id y18mr32996662ilb.178.1636082388232; 
 Thu, 04 Nov 2021 20:19:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/36] bsd-user/freebsd: Create common target_os_ucontext.h
 file
Date: Thu,  4 Nov 2021 21:18:43 -0600
Message-Id: <20211105031917.87837-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD has a MI ucontext structure that contains the MD mcontext
machine state and other things that are machine independent. Create an
include file for all the ucontext stuff. It needs to be included in the
arch specific files after target_mcontext is defined. This is largely
copied from sys/_ucontext.h with the comments about layout removed
because we don't support ancient FreeBSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_signal.h   |  3 ---
 bsd-user/freebsd/target_os_ucontext.h | 35 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 1a4c5faf19..3ed454e086 100644
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
index 0000000000..1d0c3c4e65
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
2.33.0


