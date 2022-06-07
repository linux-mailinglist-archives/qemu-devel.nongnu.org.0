Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF35414EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:24:33 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfkf-00021n-0Y
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfbG-0006RO-Km
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:50 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb5-0004Nq-NM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:49 -0400
Received: by mail-io1-xd32.google.com with SMTP id s26so6819165ioa.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/5GRLhuryvhFCNL7Z2U0IxtJCZm43srKeThQEapvKBc=;
 b=do4D4MJmsE6smWqbstnNw9gRaM0xV1/0pkXMyQKgl9qbA99krXLeQcCI+iCj4DnzIj
 ljuvNbE1/RKySseGCphMNXgHAawYaVNGRbXchh64/+TOwjkHh6Yv7FXk9/0ZZkTz3sAo
 yyipHxzSb4+73MmJMRaqFdLgCzljEJJc14l/acyxyxu5HeHEX7UBja+qQ5M77hZlFHTM
 jSX0/uNY+0Jm56JzKNj44HhvcsCAm3XEQnKgHoqPV3eQ4Q+DVqfM/UgfVJBntWHKSHMz
 6+PspOgDA7DAyLEXy4NRDsom8+xZAohAVTOS+T15IWxEkUDkZUNxWgOxtizWPfUJvFn4
 81RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/5GRLhuryvhFCNL7Z2U0IxtJCZm43srKeThQEapvKBc=;
 b=4b0lUukgBEmX/8JzY78mbYmksn1Gbs43r78baHGCIiodyzBSkNHno+sgtv+gAltoZp
 H1FGupRvXZt3fUksowadoGIvLu07B90QF7BsPtyLSjUdnbqDbPJXI9252P0DVM60LwvY
 IU+LRZsEhQHuI8VkWsfFWPfIskuFc2oanfHtby7UbP+7TlHJ5XPKOEZCJ9+8ZiF7UCg/
 O541dABQdLiSC3cJkgv4CRoFANtXAqpwYRIoz69DenyD9gpwB1IYzroYldzsAfYZDGGG
 hEcFoMKJv9fJv9tU4ovkrqyp0t7xoyg6P4y8/BQUzcfLet+Tu4xFC/VPc5z/9fZgee+K
 bgfA==
X-Gm-Message-State: AOAM532/sLo7yMIZm6nX/sZJ/pkZjRTFx5+lVV/NHo3S0B1FdkRvxzfF
 +/aiNbjl9o6QiRAIj/tJEYWSp111DRnFXg==
X-Google-Smtp-Source: ABdhPJw5F62FLv8VA0HO0JVzElui1peHZUyOEP3XEQ03wviW4wNkelc2iB5LmolzYYUljgn4o23x9g==
X-Received: by 2002:a02:2124:0:b0:32d:beca:e5ab with SMTP id
 e36-20020a022124000000b0032dbecae5abmr16793683jaa.119.1654632878351; 
 Tue, 07 Jun 2022 13:14:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 6/6] bsd-user/freebsd/os-syscall.c: Implement exit
Date: Tue,  7 Jun 2022 14:14:40 -0600
Message-Id: <20220607201440.41464-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the exit system call. Bring in bsd-proc.h to contain all the
process system call implementation and helper routines.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-proc.h           | 43 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  7 ++++++
 2 files changed, 50 insertions(+)
 create mode 100644 bsd-user/bsd-proc.h

diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
new file mode 100644
index 00000000000..8f0b6990d14
--- /dev/null
+++ b/bsd-user/bsd-proc.h
@@ -0,0 +1,43 @@
+/*
+ *  process related system call shims and definitions
+ *
+ *  Copyright (c) 2013-2014 Stacey D. Son
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
+#ifndef BSD_PROC_H_
+#define BSD_PROC_H_
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/resource.h>
+#include <unistd.h>
+
+/* exit(2) */
+static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
+{
+#ifdef TARGET_GPROF
+    _mcleanup();
+#endif
+    gdb_exit(arg1);
+    qemu_plugin_user_exit();
+    /* XXX: should free thread stack and CPU env here  */
+    _exit(arg1);
+
+    return 0;
+}
+
+#endif /* !BSD_PROC_H_ */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 4c7c32daa56..2daba0e623c 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -41,6 +41,7 @@
 #include "user/syscall-trace.h"
 
 #include "bsd-file.h"
+#include "bsd-proc.h"
 
 /* I/O */
 safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
@@ -226,6 +227,12 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 
     switch (num) {
+        /*
+         * process system calls
+         */
+    case TARGET_FREEBSD_NR_exit: /* exit(2) */
+        ret = do_bsd_exit(cpu_env, arg1);
+        break;
 
         /*
          * File system calls.
-- 
2.33.1


