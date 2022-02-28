Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6B4C77A9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:26:08 +0100 (CET)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkil-0001y5-NB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:26:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV3-00008x-K0
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:57 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=46024
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV2-0006bA-3B
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:57 -0500
Received: by mail-io1-xd2f.google.com with SMTP id c14so15630356ioa.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fn4/rm/OJxkJxNYI+SpIvqX9qWLZWvAB3WmoXDOuRIk=;
 b=rKDLlwDkGojBhTI4vaTj+Rx7EDqtL6Kd6YahAtgjzjjifpm/mEL8/rYSwM1pRUKnty
 bSsdhbbgWmhcbIMU3ESUAZ3RMbVaiXxc2qpYw8LUzcC3zdkr31UwMKRhpc320JMhA2li
 /iPiprWp4n4oDwMIJHsiaPId1Tp6Rw9JSsTu/LM4VGd3uCB/QOmqyj9hTnssqXkN+PU3
 Cv6insmAth0ZfX/d3HJv4/8ljasnINGAiAqmvmJ/1hPt+ZG769GZspyLacsrI+uk/S5U
 Hu67JHV42R9iKkM5b/EvT0uNM+dFVR1AuXPTQnHxu0ngZkmjeVNRj3Z18sNBL6yfpshK
 plDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fn4/rm/OJxkJxNYI+SpIvqX9qWLZWvAB3WmoXDOuRIk=;
 b=CaC9lgBrvIL0dFIdPSQtiECGwLXVmLk4vop7//Paw+8lgsJ0PGb7mD8fMMwa3Oj/qu
 6bSXdyna95uHNe7aRecoI+7SHIxh9Z6iWcinaWYOicxXzFLzSYO+Y0BeL9IAMbS1NDQg
 MNpT++hbEVmJG8og+XHq9CLrtiuxJAd4YUeQJcb0OgTvUbwSbAqNrn1FN1IxL9OlcNdH
 xPPTdWfN/I89fnn38C1FUgzrdC6PPcLjsyyHrNgVIGslvTJDQ5iL2mkWIfRhPSdDUo2H
 sxKATkg/q+iTnMhpNOZVWIxZI1vdI4Z5DZFqn6OF0rVRE8xr5kJkhoiepTuR2dimvDvV
 48sg==
X-Gm-Message-State: AOAM530FeUZSWVIta6+juUf7FcebyVVJa7MJqQGR4+D8eBxWrSzFjTB7
 J8DnUAARZNkLAfcHYxxFymcG76pRvUWYIQ==
X-Google-Smtp-Source: ABdhPJxmDUThMFtL20g6vrmm3mIeJVwQf/4ryIFrKIWIjJ39t2FA7cyWk8cJFkjnT8IsMGK5SjfUgA==
X-Received: by 2002:a6b:8e17:0:b0:60d:c43a:6992 with SMTP id
 q23-20020a6b8e17000000b0060dc43a6992mr16450968iod.24.1646071914805; 
 Mon, 28 Feb 2022 10:11:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
Date: Mon, 28 Feb 2022 11:12:11 -0700
Message-Id: <20220228181214.2602-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


