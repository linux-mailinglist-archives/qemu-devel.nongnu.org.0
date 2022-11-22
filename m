Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECCD633636
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 08:48:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxNz9-0002vC-T4; Tue, 22 Nov 2022 02:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oxNyy-0002ua-K3
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 02:46:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oxNyw-0005uP-J5
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 02:46:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 429F74033B;
 Tue, 22 Nov 2022 10:46:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C3D053D3;
 Tue, 22 Nov 2022 10:46:01 +0300 (MSK)
Received: (nullmailer pid 848963 invoked by uid 1000);
 Tue, 22 Nov 2022 07:46:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3] disas: recognize either <capstone.h> or
 <capstone/capstone.h>
Date: Tue, 22 Nov 2022 10:45:59 +0300
Message-Id: <20221122074559.848913-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Historically, capstone varies in requiring either <capstone.h>
or <capstone/capstone.h> include depending on version and the
way how it has been installed.  This has already been an issue
before, and will likely become an issue again with capstone
5.0 which seem to have changed this aspect once again.

Recognize both ways in the meson check, but prefer <capstone.h>
so it's easy to override which capstone to use by
pkgconfig's --cflags (or --extra-cflags).

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: use cc.has_header, not cc.compile (pm215)
v3: fix the forgotten arg for config_host_data.set
 (comitted locally but not included in previous format-patch)

 include/disas/capstone.h |  5 +++++
 meson.build              | 21 +++++++++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index e29068dd97..406132a63c 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -3,7 +3,12 @@
 
 #ifdef CONFIG_CAPSTONE
 
+#ifdef HAVE_CAPSTONE_CAPSTONE_H
+#include <capstone/capstone.h>
+#else
 #include <capstone.h>
+#endif
+
 
 #else
 
diff --git a/meson.build b/meson.build
index cf3e517e56..b97e9e1195 100644
--- a/meson.build
+++ b/meson.build
@@ -2680,16 +2680,17 @@ if not get_option('capstone').auto() or have_system or have_user
   capstone = dependency('capstone', version: '>=3.0.5',
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: get_option('capstone'))
-
-  # Some versions of capstone have broken pkg-config file
-  # that reports a wrong -I path, causing the #include to
-  # fail later. If the system has such a broken version
-  # do not use it.
-  if capstone.found() and not cc.compiles('#include <capstone.h>',
-                                          dependencies: [capstone])
-    capstone = not_found
-    if get_option('capstone').enabled()
-      error('capstone requested, but it does not appear to work')
+  if capstone.found()
+    # capstone works either with <capstone.h> or <capstone/capstone.h>
+    if cc.has_header('capstone.h', dependencies: [capstone])
+      # nothing to be done here (see include/disas/capstone.h)
+    elif cc.has_header('capstone/capstone.h', dependencies: [capstone])
+      config_host_data.set('HAVE_CAPSTONE_CAPSTONE_H', 1)
+    else
+      capstone = not_found
+      if get_option('capstone').enabled()
+        error('capstone requested, but it does not appear to work')
+      endif
     endif
   endif
 endif
-- 
2.30.2


