Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2D543E72
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:19:56 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz35n-0004xJ-N8
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz338-00018h-Eb
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:10 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz336-0006A1-R7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:10 -0400
Received: by mail-io1-xd2c.google.com with SMTP id 19so946298iou.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGQIfvqGKRBhKV4r5du5kcOf3P++/TK2DI7dqWk8+6U=;
 b=6Zgr3yCJjLKpsk6F+vgIB5mYX7ctSu36aUOMSAka5j3D8qiO6uDw2f5a0ytRIpkE/K
 5BQdY9QhhDJ4ujczzR2LfuYUKsouvfc4r/rntiFpLBHoPDWDappYFxbErMCS1vOjvJ/X
 0lymHt5wM6efaYGL8lmeytxex4VI0Cfk3nZtQ2iQcuvsjBuUqVy1smd+s6qW6j0FLDGG
 KPonD/jgcC/kXFlmfGGmlOHZ4kKldaAML4L0RqCJkoTYyKQtUaKAItNiK5kPHN48nN6C
 voJnOrRdfxQj7C0AGaK2jfHPTfl6AB+cU5ZVoxWrlNYr3wX6WRqYhaQbKdh9vKbLZo1z
 i6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGQIfvqGKRBhKV4r5du5kcOf3P++/TK2DI7dqWk8+6U=;
 b=j/I9M0GtYyKRxvKBL5NAsZFrzelNtMugUEvFAZWl2ta5eB4EuWc1Gj/CyxSkXoMCjB
 fMys4INIvj+6qLUmVBT8k0SwToOz+4k+azr3E9iwfCTrKfxNYhHJ0UqZYiyX2CjPYFnh
 x336jDvkCOdZHq7GuCs2/vPP6MxiVSxfbaXNxMi/Ne9qT1QvmpCITnvTo2hnicp5kKHw
 QV3/eOmKJO8ZgyQcPcPTxuC1NTBN9SCEHOVUFXCD6XG9O8NkSw+YrS8iFVRC5+nwa4/P
 NrScpSAKgmc4Aj28h8MwqtbeMGDV+nai1o66hHi6xg1Y98NPDS4OcBhOM3xpFlpX2mSC
 yeCg==
X-Gm-Message-State: AOAM532zTkEBx8L3GIm+fzMOxTQWf07+j6Sf7pqig9jTGBlpQsxIXwDA
 Z5neIqMEbblGdMYmdWNDpiZT9dd66RyLiA==
X-Google-Smtp-Source: ABdhPJyBmnVzYWxQjAafVjhZWHFq40hbfuuxrAbebFQ8Hy/xHkhqjPPlrGtcVvv7q1UeuD9urtntXw==
X-Received: by 2002:a05:6602:1552:b0:669:5870:884d with SMTP id
 h18-20020a056602155200b006695870884dmr8186950iow.134.1654723027584; 
 Wed, 08 Jun 2022 14:17:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/6] bsd-user/freebsd/os-syscall.c: Implement exit
Date: Wed,  8 Jun 2022 15:17:11 -0600
Message-Id: <20220608211711.56158-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
References: <20220608211711.56158-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
index 3a33d54fa4d..71aa0d38e03 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -41,6 +41,7 @@
 #include "user/syscall-trace.h"
 
 #include "bsd-file.h"
+#include "bsd-proc.h"
 
 /* I/O */
 safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
@@ -215,6 +216,12 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
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


