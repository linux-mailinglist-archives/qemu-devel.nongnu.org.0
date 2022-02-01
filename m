Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584504A5C1D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:21:33 +0100 (CET)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsA8-0002aZ-FQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7x-0005Jb-Rj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:13 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=46941
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7w-0003oS-1J
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:13 -0500
Received: by mail-io1-xd2b.google.com with SMTP id e79so20649105iof.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gLbBpeV4+czyf27Fa2Bgm+gKfkQ9bODAt7Z8w6KPjk=;
 b=ItEZ5foxFulxLKp/HlQWk77pfqi3x1GUT6DC0G9QinlWh9B8eSCNeFGfDxTkAlLKQU
 mC9fFC0zozP5yZint7LdRMXL2yyrbAWyZp2HqEN46NdqWwI0EK4WpqWeyxeoDk2zg2/E
 PjE6FrOZvjoPTqmg1LS/BPEMmKQX+afwKQ6IIrMM0IdVY/tR1MA03RofSpYvCCo3qy78
 nm9XijTe7XG3ZuSdi5MekIPTN9uO6wihzRT2k2A7hGh6dbpLwnEeyAKEmP6n3WI2zW1X
 y/yelNPdUi6Q1XW2f6iCiB5tKQedAlE9WqOqe/W1ePllesKyKj9ZRMCdd+97qDHvUiKK
 JnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2gLbBpeV4+czyf27Fa2Bgm+gKfkQ9bODAt7Z8w6KPjk=;
 b=hZuZ277hPXnZUpiW0GeCNXTdD0VMp1b+dG1GrxlG/LRPtFr9RhS7Zwv6d5Abnxqw5G
 jcbuFDrltpwUon+C5etcfA/4e7qBjvWmeFk7cMBLQWoJFZ6S2znMBl+tFQTP+2WXXERv
 4By5ciMZ52wJwXf3e+b3j0uTAwl24FWjPKiBwatxyxZF6gLmyELz4aaFYKZWGHT3BTQS
 atkinCjFNuOii/1lxi6777sZlwaHwGq3/qtZkieThmKqo4B+re+xWtXSevfLkgTcE800
 PDaUGFM3wRC059P7XKdOlkjGhX1Nw5clPhL7z/WBRCIeSvCk04GTZhswl8M7V16kiEGm
 ghfg==
X-Gm-Message-State: AOAM533KxcbgowB2DBpIj/07xFYuQ9YR5hYcfF5vM/cW1VKC8GCQ/vXU
 6+8X57aFJDt04osQGxS19wdeO6fqSyat3g==
X-Google-Smtp-Source: ABdhPJyoxrBdwXHZz0ADOLLjTKnj8xtfCc2XT7Kbp5dSQbKscgaoD/WrPajHKhGiyNBB32TMRAj+ng==
X-Received: by 2002:a6b:8e89:: with SMTP id q131mr13457264iod.77.1643714110639; 
 Tue, 01 Feb 2022 03:15:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/22] bsd-user/freebsd/os-syscall.c: Implement exit
Date: Tue,  1 Feb 2022 04:14:55 -0700
Message-Id: <20220201111455.52511-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the exit system call. Bring in bsd-proc.h to contain all the
process system call implementation and helper routines.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
index f52c9e3c306..f66b6a1b1f5 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -41,6 +41,7 @@
 #include "user/syscall-trace.h"
 
 #include "bsd-file.h"
+#include "bsd-proc.h"
 
 /* I/O */
 safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
@@ -227,6 +228,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     }
 
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


