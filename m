Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC14C5714
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:18:26 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0i9-0002N7-EA
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xb-0008MQ-GX
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:32 -0500
Received: from [2607:f8b0:4864:20::d35] (port=33391
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XW-0000R0-QP
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:28 -0500
Received: by mail-io1-xd35.google.com with SMTP id 195so10261448iou.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZAk+HxivcsVXdzMR+tdKprIWyAWN9zGQFho4BCOxTM=;
 b=UiC0dSiY+iEnf971gV5E90S00XLB/6RQNFutAjtl/yWuYWOgJR+5o4Wvsn7pKidz0k
 3mF8DOfNTnQ5b5xpIJbF52f+Vl/Q69cdaUfqjPValorIaVdO0g0G11nCtnhiWU0NihmH
 qz6szljQRtXPtFF9pS0URZgrWneyI2MmubiZxxA4RWBDFkNny+NXOcLnrjCg3e9+3TzJ
 9z5whifYsAdZFnenPWZETyL4NeRkcKQMKzDqKWyLTphCl4qbc9NEebbUgO3WYhsDJdXW
 uGoQQJdf2B8p6koPiwk+yQt+Jlm7wddvmWX9AdH72YANa/xIe7Qu3SMEyq04EEWcbU+s
 d5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZAk+HxivcsVXdzMR+tdKprIWyAWN9zGQFho4BCOxTM=;
 b=DQVtQATnh4XlZSqinWbr8gXGc3U3Lfw3dk4XSu4f7vJTubACm9/m4bLAHn5lDwHRxt
 6jrGaBpTcZQqnc3jOs6Ofbnzuy3UEdngQiYUwD8PEwXD7u7y/+wNvtNgEHFREcHcE3SV
 0EmWrA/4znGEyYNsqEUe19P+v+VfIFwssU51UUgyDPOpi+o1T5tGtz704f+loHOL/1SW
 x+lcjBv+cWtl4qP1Fj2LOuVvVxp2LTAuyJT3EY4XQO7f8RF62i2iTFt/Adkr4V49bdcd
 QBFfUB+lA9z+D4p0kZ3qKWyzc/lLK5URsgy2m0Sf/hjCN5cb65IKMaB5tmvtP59Nqz0/
 bT7Q==
X-Gm-Message-State: AOAM533upCWoUz3B9NMN6UYjw42rYarqsMXKU1QzbtcS+y4ofMHE/WRy
 wcsS6IaIIeEsqzJlhWxFCp5qaF4gXhpjKw==
X-Google-Smtp-Source: ABdhPJy7TIWvLpmNujUEsP2kBiIbATcxcqTFypGo3Rrx85kQvt3W+P7hNlx3zaw3WQMjVwbZ61qfXQ==
X-Received: by 2002:a6b:a0d:0:b0:641:4da9:db9b with SMTP id
 z13-20020a6b0a0d000000b006414da9db9bmr9382705ioi.166.1645895245521; 
 Sat, 26 Feb 2022 09:07:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:25 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
Date: Sat, 26 Feb 2022 10:07:41 -0700
Message-Id: <20220226170744.76615-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
 bsd-user/bsd-file.h           | 30 ++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 bsd-user/bsd-file.h

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
new file mode 100644
index 00000000000..f0c3f347ec0
--- /dev/null
+++ b/bsd-user/bsd-file.h
@@ -0,0 +1,30 @@
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
+#include "qemu/path.h"
+
+extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
+        int copy);
+extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
+        int copy);
+
+#endif /* !BSD_FILE_H_ */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 597a41c2f50..a17ff9f6ecc 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -41,6 +41,8 @@
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
+#include "bsd-file.h"
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
-- 
2.33.1


