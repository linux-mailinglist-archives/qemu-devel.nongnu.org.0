Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627962726C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 21:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouJIi-0000X8-Ip; Sun, 13 Nov 2022 15:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ouJIf-0000WZ-K5
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 15:09:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ouJIc-0005fn-6I
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 15:09:52 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9A18C40199;
 Sun, 13 Nov 2022 23:09:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 0920810C;
 Sun, 13 Nov 2022 23:09:51 +0300 (MSK)
Received: (nullmailer pid 18936 invoked by uid 1000);
 Sun, 13 Nov 2022 20:09:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] capstone: use <capstone/capstone.h> instead of <capstone.h>
Date: Sun, 13 Nov 2022 23:09:42 +0300
Message-Id: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The upcoming capstone 5.0 drops support for the old way
of including its header, due to this change:
https://github.com/capstone-engine/capstone/commit/6656bcb63ab4e87dc6079bd6b6b12cc8dd9b2ad8
The official way is to use <capstone/capstone.h>

This change has already been proposed before, see
https://patchwork.kernel.org/project/qemu-devel/patch/20180215173539.11033-1-f4bug@amsat.org/
but it didn't find its way into qemu at that time.

On current systems, using <capstone/capstone.h> works
now (despite the pkg-config-supplied -I/usr/include/capstone) -
since on all systems capstone headers are put into capstone/
subdirectory of a system include dir. So this change is
compatible with both the obsolete way of including it
and the only future way.

I dunno how relevant this is for 7.2, it's probably too
late already to test it on everything, but at the same
time, once capstone-5 will be released, there will be many
user questions about how to build qemu. This has already
been asked in #qemu - gentoo already have capstone-5.0-rc
and qemu fails to build with that one, but works fine
with this change.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
Since v1: include the forgotten-to-be-committed meson.build change

 include/disas/capstone.h | 2 +-
 meson.build              | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index e29068dd97..d8fdc5d537 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -3,7 +3,7 @@
 
 #ifdef CONFIG_CAPSTONE
 
-#include <capstone.h>
+#include <capstone/capstone.h>
 
 #else
 
diff --git a/meson.build b/meson.build
index cf3e517e56..6f34c963f7 100644
--- a/meson.build
+++ b/meson.build
@@ -2680,12 +2680,7 @@ if not get_option('capstone').auto() or have_system or have_user
   capstone = dependency('capstone', version: '>=3.0.5',
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: get_option('capstone'))
-
-  # Some versions of capstone have broken pkg-config file
-  # that reports a wrong -I path, causing the #include to
-  # fail later. If the system has such a broken version
-  # do not use it.
-  if capstone.found() and not cc.compiles('#include <capstone.h>',
+  if capstone.found() and not cc.compiles('#include <capstone/capstone.h>',
                                           dependencies: [capstone])
     capstone = not_found
     if get_option('capstone').enabled()
-- 
2.30.2


