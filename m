Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9A3E373D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:53:29 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUG0-0004JI-E6
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU65-00079p-3l
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:13 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU63-0004tM-LN
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:12 -0400
Received: by mail-io1-xd2f.google.com with SMTP id i7so13719022iow.1
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDu3yCQrTbca9PIzdC+muV0f2JJWzFWzaLb4L/j0/WM=;
 b=1gwyh1YcOla24TL23ibqyCtnIAYuaekVNI2vgnm4/XSclKrjRzn7RCICt/kwJwO92u
 yQp3DHAzmt30FxT+lISsNwmQMJCLCrBZjmqrYjMWogdqG2wc3kYk8TTKQRT8eCZC7yu7
 RtONXd5Ykdv0qijwPYvwwxAminAQQNcYe/R9VuXFk+tuFDgMVMpoqfLwtjBsbk/n/h+x
 +HB2+i0SMGs7RKos46tHMZcu0pay3gQsvRN0f+0kMRhWmiplhJkht22wZedxMUiVEb8o
 TDEA7PKvTWJmXwUBgzZoH1F04aCeNkmwPVyiLgNWHufS3WvRjiZ/n5AAT5HCeYx8w5ME
 Y7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDu3yCQrTbca9PIzdC+muV0f2JJWzFWzaLb4L/j0/WM=;
 b=IzoLLdj4/dVReT3tCy2w0R6R3BUoKKho6jDuKUTnrq2f7DmuaTOEMl8hBF8YeIjpd8
 x445Uxf0r3onOghtrnPpBmEFKj0aPOHbtRJ+Ym3HEMKVqoygdBIrnwo1TMKS8OTT05Hy
 oXpvCS5bTe9yVrcnFMOQojNCwjrF8wfiKq2BLvwqs395ClNwkYV/WAMqzjdxxZs0Co9l
 sEadWh7N1sKDqE1GuHLC17gufocG9UTPVuiJ5sOt4VBpcvFjotVg8vFZ9DbObPZ4zBPk
 cd6pzrvhLicOPP+U6j9IhtrFy/XaBMgRhliD9ylJOy/IG3yTAROp9XMtMH+wneAr4bO/
 Mmcw==
X-Gm-Message-State: AOAM533bMam9MD9hRnEea6Js1JU9/N6Ii5zXjb1F4a3Cu2rEslthGOlF
 3jdZZ2VoMVN6OLVYZRlNax6FYRa3Ssj/yar/
X-Google-Smtp-Source: ABdhPJzh0f1EctCorGKIaDYzBpzgYpasdEgNfb25fRs2F6Pja9S8XWNZAYq/E8YRe0nY8q+HvAHwtg==
X-Received: by 2002:a05:6e02:1bc1:: with SMTP id
 x1mr100440ilv.33.1628372590153; 
 Sat, 07 Aug 2021 14:43:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 19/49] bsd-user: Include host-os.h from main
Date: Sat,  7 Aug 2021 15:42:12 -0600
Message-Id: <20210807214242.82385-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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

Include host-os.h from main.c to pick up the default OS to emulate.  Set
that default in main().

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/host-os.h | 2 ++
 bsd-user/main.c            | 4 +++-
 bsd-user/netbsd/host-os.h  | 2 ++
 bsd-user/openbsd/host-os.h | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
index a799164324..ceb1543d06 100644
--- a/bsd-user/freebsd/host-os.h
+++ b/bsd-user/freebsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_freebsd
+
 #endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 9166049c5a..d9965e6611 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,6 +41,8 @@
 #include "exec/log.h"
 #include "trace/control.h"
 
+#include "host-os.h"
+
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -352,7 +354,7 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    bsd_type = target_openbsd;
+    bsd_type = HOST_DEFAULT_BSD_TYPE;
 
     if (argc <= 1) {
         usage();
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
index b44cb7fdda..ccbea076e6 100644
--- a/bsd-user/netbsd/host-os.h
+++ b/bsd-user/netbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_netbsd
+
 #endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
index 9083555f26..79468073e4 100644
--- a/bsd-user/openbsd/host-os.h
+++ b/bsd-user/openbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_openbsd
+
 #endif /*!__HOST_OS_H_ */
-- 
2.32.0


