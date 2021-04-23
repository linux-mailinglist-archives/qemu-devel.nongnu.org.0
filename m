Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9BB369BBC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:00:47 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2us-0004V9-TZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bH-00061Q-N5
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:35 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b5-0008Dc-Sg
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:31 -0400
Received: by mail-il1-x130.google.com with SMTP id c4so15204634ilq.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhU1HMEXvEeUtKRiD585rg920MVTurXkg6N55NOj/8s=;
 b=al2RLTaZZb89dDQrmPkUPrNegWwrEOh1hE7E5y2g+tX6MpR1zIBGZ1z4Ha2mnPPqIM
 e/zLMbASpLB5YSCIK2OeldGwt7TrXYm1yMOOS+9tOhWcp5k2d5EvFPvy7KJoWor9hDu+
 k6RUfGnH9x3RZLa9fyZ2Fn+2YM5y8aIWK3tbb9LOR45JA4FFiXbiviSNPugdnO8VLyHY
 iEzhwVY/K+cegSoxggESsClF9mm0NioV8okD/RS/puHjTnw7lVeOUG6JXD0/xdQsetFc
 NaXNrAxVxuHFOFuAQoTc/HZTLm80QLmnOTV1ik+tn8HnyW28bjWeIFX7vbdjsVtUlQtS
 ZEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhU1HMEXvEeUtKRiD585rg920MVTurXkg6N55NOj/8s=;
 b=LrA3PfLoHRqu/wvYKyFQpUxbv9uNzQnMzInrBAelwyklineA3f58Z77CvymDqdVD79
 3ezSv3vuJHsrB+bIvcYm8B/nMgK6uQOVFdWzwy3IWkoL5Ht1OatRFrqphAEXT9tX1hSG
 1e16tgRzOj4cpb/POiu0KXg4tXCyOvoGnxhHZvi1Fhtq76xbODQL2Gn9a9Sj7l09W9Cd
 EXxu/fdoDdJLn6WNzWnhx5jDYxAFquwe4tyJzvP6nojNY20It9gUIV6mi78frYm6TrGE
 T+93mqwd/pcSJbK/WGx90CJxdwEShW1V3BJld3ZB//NuEZlHVnXKK073EHs1JafRRfhN
 lUXw==
X-Gm-Message-State: AOAM530DhmHGklx7os5S7uOmohailwUWxQsAkI9U0TfLL0KtwliS4syC
 Lhn6bTTX5hw3kMnqFyl2ePeGgKqBIXqBmiCl
X-Google-Smtp-Source: ABdhPJzX2oOzSrn1YCS3cWKi8Q9oNVAOjavd+apxMliEQTQPSJwBCXfHf0JVQI7Hp0vxHijO1vwXkQ==
X-Received: by 2002:a92:d7c2:: with SMTP id g2mr4537183ilq.265.1619210418067; 
 Fri, 23 Apr 2021 13:40:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:17 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] bsd-user: introduce host_os.h for bsd-specific code and
 defaults
Date: Fri, 23 Apr 2021 14:39:55 -0600
Message-Id: <20210423203959.78275-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Introduce host_os.h for frebsd, netbsd and openbsd. This sets the default bsd
being implemented today. In the future it will have code that is per-BSD
specific. Abstracted from a larger c93465b6208c4c95cc0a394ffef4180ba6ccf27a in
the qemu-bsd-user repo.

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
index 95fda8c5ae..fbcc8cc28c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -40,6 +40,8 @@
 #include "exec/log.h"
 #include "trace/control.h"
 
+#include "host_os.h"
+
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -761,7 +763,7 @@ int main(int argc, char **argv)
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


