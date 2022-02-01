Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026A4A5B9D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:54:50 +0100 (CET)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErkH-0006fH-I2
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7r-0005BC-Sk
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:07 -0500
Received: from [2607:f8b0:4864:20::d31] (port=35496
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7m-0003YW-M2
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:07 -0500
Received: by mail-io1-xd31.google.com with SMTP id 9so20767143iou.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+hwpRasrlBwRhMd/TMNJlUBlbRLqHxNn2N1IM+WvmM=;
 b=n3EHe1t1Auw6xRddKBbo8HxG1Dy4ZJg5RhCF/q4SrF3eto9kOamgNpuwWLy14hWOH9
 lulmoJE9OpvxQIY/1rOA1NK0BBtskdpYjL3i6eQ394hQ7yjAWyODJPRniBvXwx6TjUuy
 K1bgmFCrqvvCIU9szHSUCvWrg+NFDYr6TuuFYuymynV0O3Xz0Ad0SNOWd/1AiLXb1Xi3
 EI8J6HSYXi6NNO2vmthaaGP6p0eukKXylEu3FnTRdh3JATt4R6s5wQU3K8uBVhoSPiHk
 CQZmyu4p5MqV1SynYG9upiamkb8uIsqEm/gQvtH+uNhVBSWuGG5f3RsvTxuFjsVTe38W
 Jx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+hwpRasrlBwRhMd/TMNJlUBlbRLqHxNn2N1IM+WvmM=;
 b=QlISaVP+J5sfVcMm1z5pz1dMlDAf1RD12bQVrIxP4tfd3ykaZetwQtj9F0Eck6KSB1
 6tKNRtxv1b9CPsLZizutrqCiJv8wO7C6KSVVyxmTvdgKn+1v6J4dvX7SlDld7nEI+Ipq
 BISuUM2433lri3qSpbBuKJc0C52rgiQRMkz0bFUv0oQ0ZwPKX5UwFe9VWnsqSUOcdGHS
 /FbzpHyDZ5Rc9kz6fQpthY+r94BT/w27+GJUaqV4Y7s9P3242nZWF2DYhKOkYRmQsmII
 QVzNDq4L/J2U7kl06c7QO+BwPfQ/kNog4cilpyeWGMkyJvxFpUXiyejPjZWGrFY2CSuT
 kbow==
X-Gm-Message-State: AOAM532+esnbblMeaxsSTFNMJynOoT9ad9amRpONEnwH7Bxg6hRa9zUr
 mXq8QVDRXKIhjQ2MpXAuoIDJG0giB1exqw==
X-Google-Smtp-Source: ABdhPJyTKPOlLTFRF7FT0k1JB0U2Dbbuiz4ZPSPOvNn97F4z2wU0p4a0fZhmRbZxWPRsAyGKQRNCHA==
X-Received: by 2002:a05:6602:1345:: with SMTP id
 i5mr13288894iov.143.1643714101185; 
 Tue, 01 Feb 2022 03:15:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/22] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
Date: Tue,  1 Feb 2022 04:14:46 -0700
Message-Id: <20220201111455.52511-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An include file that pulls in all the definitions needed for the file
related system calls. This also includes the host definitions to
implement the system calls and some helper routines to lock/unlock
different aspects of the system call arguments.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 39 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  2 ++
 2 files changed, 41 insertions(+)
 create mode 100644 bsd-user/bsd-file.h

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
new file mode 100644
index 00000000000..2f743db38e1
--- /dev/null
+++ b/bsd-user/bsd-file.h
@@ -0,0 +1,39 @@
+/*
+ *  file related system call shims and definitions
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
+
+#ifndef BSD_FILE_H_
+#define BSD_FILE_H_
+
+#include <sys/types.h>
+#include <sys/mount.h>
+#include <sys/uio.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "qemu/path.h"
+
+extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
+        int copy);
+extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
+        int copy);
+
+#endif /* !BSD_FILE_H_ */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2e84cf350b1..060134a9ecd 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -40,6 +40,8 @@
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
+#include "bsd-file.h"
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
-- 
2.33.1


