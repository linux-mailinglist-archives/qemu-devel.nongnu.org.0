Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50F36A218
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:26:24 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL6t-0004E4-R0
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiW-0005dp-KO
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:13 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi8-0004Gf-Aw
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:12 -0400
Received: by mail-io1-xd34.google.com with SMTP id f21so15648612ioh.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kRsfn0hNO8O4221/YdDV/oj5LN+Il3pJXCXbGHcuegg=;
 b=JOACspWZH/Bvbl6QYnI32zI/vrr49Hk1dNnW9ZUltZGBBiVyXhEqMK6BkrInsk9W8w
 gy+7eDcrLqeNSNIv+hZuLPhYRyYcVp8Qxd1nz6FxPTS9hoGsLj3sZ5eZx/5N/rketaoR
 6neYTt3JOVaQ1msCykdfPgF1IP/07WxLm9Sd8PFq86EkMbDmGv49T+81vDFMAbvJbqQW
 jjsZqU70Y8YLyrOgDqEJ0r9M2xQ0XUsPCDE/nVj5sIWq8yNcikN44fsgPoaZLbONU5nV
 4MASwJhlhobRwI8H2ft7Y0NghqpDkfrP+1FuvM4r4xk7TMSMtKvze8EZJttPwkp3TeMJ
 p2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kRsfn0hNO8O4221/YdDV/oj5LN+Il3pJXCXbGHcuegg=;
 b=RMhxOhj1iPx5Dr3n4LhnkzvdCnz5eeef9gsGuUHSNxQqAIkzqu4MaSmMHDQs03R9Ys
 3EuPeLRyXny/agHr7zlMVkTVmOA2mYyQMpRlw1bPLAFsmI/fP6fay1slXPWF09YxzQLP
 4pl8OmT/yoTKukGrU/COc78dToOcTxOr2tHqaOXBD3isc14gC84w/WgVHdVHzm8VXZlT
 j1owCMBNKNxNbW2CXxbKaTvaGzkzgwuyTa3lkMdjD67s70r75D7qe9YlrPxp7Y+mI8pv
 9hfwM9srHVXpM410AZJ4EwjpEyKYHHTxdbk9CEDCRajy9EYFsNaRp11f7vwZEt9PRUux
 nYbw==
X-Gm-Message-State: AOAM532pIn5yxHp12siHEfZCTydOQnpMZdAhtnro4Wy2LEcpSag4ZBiD
 pcBaEfWVXjyGLUH2p1j+MXgtUmMXDWmq/un1
X-Google-Smtp-Source: ABdhPJzLwpm4FP5dNevVZGhBo6KQcz80OlZtttJtpShOXU2pl539+xW80aUhgnigR4v8TJQR+Bg/gQ==
X-Received: by 2002:a6b:b542:: with SMTP id e63mr7260368iof.144.1619280045746; 
 Sat, 24 Apr 2021 09:00:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:45 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/48] bsd-user: introduce host_os.h for bsd-specific code
 and defaults
Date: Sat, 24 Apr 2021 09:59:51 -0600
Message-Id: <20210424160016.15200-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Introduce host_os.h for frebsd, netbsd and openbsd. This sets the default bsd
being implemented today. In the future it will have code that is per-BSD
specific. Abstracted from a larger c93465b6208c4c95cc0a394ffef4180ba6ccf27a in
the qemu-bsd-user repo.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/host_os.h | 25 +++++++++++++++++++++++++
 bsd-user/main.c            |  4 +++-
 bsd-user/netbsd/host_os.h  | 25 +++++++++++++++++++++++++
 bsd-user/openbsd/host_os.h | 25 +++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/freebsd/host_os.h
 create mode 100644 bsd-user/netbsd/host_os.h
 create mode 100644 bsd-user/openbsd/host_os.h

diff --git a/bsd-user/freebsd/host_os.h b/bsd-user/freebsd/host_os.h
new file mode 100644
index 0000000000..ceb1543d06
--- /dev/null
+++ b/bsd-user/freebsd/host_os.h
@@ -0,0 +1,25 @@
+/*
+ *  FreeBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#define HOST_DEFAULT_BSD_TYPE target_freebsd
+
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index a98a45df21..a81a70f8ac 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,6 +41,8 @@
 #include "exec/log.h"
 #include "trace/control.h"
 
+#include "host_os.h"
+
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -619,7 +621,7 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    bsd_type = target_openbsd;
+    bsd_type = HOST_DEFAULT_BSD_TYPE;
 
     if (argc <= 1) {
         usage();
diff --git a/bsd-user/netbsd/host_os.h b/bsd-user/netbsd/host_os.h
new file mode 100644
index 0000000000..ccbea076e6
--- /dev/null
+++ b/bsd-user/netbsd/host_os.h
@@ -0,0 +1,25 @@
+/*
+ *  NetBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#define HOST_DEFAULT_BSD_TYPE target_netbsd
+
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host_os.h b/bsd-user/openbsd/host_os.h
new file mode 100644
index 0000000000..79468073e4
--- /dev/null
+++ b/bsd-user/openbsd/host_os.h
@@ -0,0 +1,25 @@
+/*
+ *  OpenBSD host dependent code and definitions
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
+#ifndef __HOST_OS_H_
+#define __HOST_OS_H_
+
+#define HOST_DEFAULT_BSD_TYPE target_openbsd
+
+#endif /*!__HOST_OS_H_ */
-- 
2.22.1


