Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BE3E373A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:51:42 +0200 (CEST)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUEH-0006wA-Dn
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU63-00074J-Pu
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:11 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU62-0004sb-8B
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:11 -0400
Received: by mail-io1-xd44.google.com with SMTP id n19so20055392ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fffwkuyOJdVnhGXC/B1gg3Dw6R62PN5p41n4wCJVr3Y=;
 b=Gg0+CJurbgGeau2wiwQU2O3xuMN2LUM/7hlzX0wMuESEC9sL9VPMRSh2maGDoVVO1O
 Tvmn25o/YpwwpLIe8JuS0brgSozlvYZ4L6fSVYSfYFH9xcYFIfadkbleFAEBtHeKgEBm
 /MVWIJAA9XIZ13PQQUjXpzkEt7yDusAlUlPNXDXYCxoEpHD+SlOadYkjsv+woAPDmwXs
 26vUKSz+FqGV0+pffIrhKKfHDFCD6AZp5VC89KSAlYnS/aTIqG+yr+wk9TrUDok6pTvV
 K1c+JsSldVYAwkCfeC9tm/t8o/NMOfJY41NVaIkzJqSZg6Rffp2J8Cmdt2jooFV7qtNC
 x20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fffwkuyOJdVnhGXC/B1gg3Dw6R62PN5p41n4wCJVr3Y=;
 b=nI0KUekNq3GirGurnJo9JtGtZjmPJfun2PTo80lsURXz3DwNlqaQRHWYf/4IXXL8KA
 KnSMC8xsev9L0Z4QeRDzqHwyEpqFRKeLB20bOtjcmYRWQnHSfcgrCGOgvNlnXMRthrlu
 1lBcpD24ToehMCKHb7zME09mqAXWpspHNEZAn88ZzOSfl3DmUdzpklRpUvYT9h4o6SyR
 BI84L8f21Oi1Er8jFWcXOp5rwNQx4/2B4NXoL6hG6uG7YphJH6YIkIDgSFjnloZLwvUa
 kkauyTPJ83o2zGBrpupNzo4woDOPD3MoGlbIBRAc1pQn1N7Xfg6Cb2dpimfseM4u1UfR
 hKRA==
X-Gm-Message-State: AOAM533aOR7JZplA+QfLCM9Qthd/dsDqNMTqc7G4xkagcoZi1H+Hc7er
 To2fj3zi2qM4Wb5bP4YTRSC6G1OGe1Dw1wqy
X-Google-Smtp-Source: ABdhPJywaYJI51UT4mDWOY9DoxQifRXqYJ3QNv5F7TnfjaSgmLss6NRRxmaXkywuMZEt7YSfWQqnRw==
X-Received: by 2002:a6b:e706:: with SMTP id b6mr175837ioh.202.1628372588878;
 Sat, 07 Aug 2021 14:43:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 18/49] bsd-user: add host-os.h
Date: Sat,  7 Aug 2021 15:42:11 -0600
Message-Id: <20210807214242.82385-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Host OS specific bits for this implementation go in this file.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/host-os.h | 23 +++++++++++++++++++++++
 bsd-user/netbsd/host-os.h  | 23 +++++++++++++++++++++++
 bsd-user/openbsd/host-os.h | 23 +++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 bsd-user/freebsd/host-os.h
 create mode 100644 bsd-user/netbsd/host-os.h
 create mode 100644 bsd-user/openbsd/host-os.h

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
new file mode 100644
index 0000000000..a799164324
--- /dev/null
+++ b/bsd-user/freebsd/host-os.h
@@ -0,0 +1,23 @@
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
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
new file mode 100644
index 0000000000..b44cb7fdda
--- /dev/null
+++ b/bsd-user/netbsd/host-os.h
@@ -0,0 +1,23 @@
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
+#endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
new file mode 100644
index 0000000000..9083555f26
--- /dev/null
+++ b/bsd-user/openbsd/host-os.h
@@ -0,0 +1,23 @@
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
+#endif /*!__HOST_OS_H_ */
-- 
2.32.0


