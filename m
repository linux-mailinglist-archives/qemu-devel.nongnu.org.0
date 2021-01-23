Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB7301328
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:00:26 +0100 (CET)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B29-0003sU-04
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Aya-0006w9-CD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:44 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:46237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyZ-0005qg-06
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:44 -0500
Received: by mail-pf1-f177.google.com with SMTP id f63so5153955pfa.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIoUr2yR0KcUYoWG4DQ2Z71j4B+vjENfUsLTTDxw42w=;
 b=AnxK4rezKyOD9GNi7pevCHb1MfqLWAG+gW6HeMYL+cUsIjWfb3f9+LGxzJvoQppvdr
 YhSDZSgQpGGjTqFNaj+s4YCv00aMKVHqlg7XeFmjqjsWqOgIKJubFBQ4WPBN2uOSiwiM
 9pv93cquXnLqrPxGrZnnwyNDBjBcVY8ylEDOzFZJUL2NISS9+p9gzCT12ahUYwCvYZd/
 UehsaHjwv+WBklOl+HhIRpc5d+mea4e22aHJffo7VaUjBeE+XjkMkNeOol6BPA8Kb2qw
 jx845Lvc8nfDabHZIosQyY0i/y7RB/3gM0waUgbUcF5co180NB9EDDfP4GieK6EVIS+h
 TAtw==
X-Gm-Message-State: AOAM533STTzMV6SgiAWJPkiV6GqODQL7ZCbrceBoaT0WlqkcRBWyuZIS
 pO7ONUFBELG7HDiIEQ6KJMsTGncngZg=
X-Google-Smtp-Source: ABdhPJyxPmwLq/bu8lSCIaiXPqEOkxQaFvvF09AP3Vxs1yzSBFrJor1uA9u/XWEbk1t125U2w8ORbg==
X-Received: by 2002:a63:dc53:: with SMTP id f19mr7879889pgj.443.1611377801326; 
 Fri, 22 Jan 2021 20:56:41 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:41 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/11] osdep: build with non-working system() function
Date: Fri, 22 Jan 2021 20:56:26 -0800
Message-Id: <20210123045632.18482-6-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build without error on hosts without a working system(). If system()
is called, return -1 with ENOSYS.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure            | 20 ++++++++++++++++++++
 include/qemu/osdep.h | 12 ++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/configure b/configure
index d72ab22da5..de7487a0c7 100755
--- a/configure
+++ b/configure
@@ -5302,6 +5302,22 @@ but not implemented on your system"
     fi
 fi
 
+##########################################
+# check for system()
+# make sure there is no compile error
+
+have_system_function=no
+cat > $TMPC << EOF
+#include <stdlib.h>
+int main(void) {
+    return system("");
+}
+EOF
+if compile_prog "" "" ; then
+    have_system_function=yes
+fi
+
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -6200,6 +6216,10 @@ if test "$secret_keyring" = "yes" ; then
   echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
 fi
 
+if test "$have_system_function" = "yes" ; then
+  echo "HAVE_SYSTEM_FUNCTION=y" >> $config_host_mak
+fi
+
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a434382c58..5bd1a67769 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -682,4 +682,16 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+/**
+ * Platforms which do not support system() return ENOSYS
+ */
+#ifndef HAVE_SYSTEM_FUNCTION
+#define system platform_does_not_support_system
+static inline int platform_does_not_support_system(const char *command)
+{
+    errno = ENOSYS;
+    return -1;
+}
+#endif /* !HAVE_SYSTEM_FUNCTION */
+
 #endif
-- 
2.28.0


