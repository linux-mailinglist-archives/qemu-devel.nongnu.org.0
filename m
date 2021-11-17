Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A0454ED3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:55:33 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRxs-0006Kd-Ae
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mnRwT-0005e9-LQ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:54:05 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:56866
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mnRwR-0000xT-AW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:54:05 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 44B9EDA04AC;
 Wed, 17 Nov 2021 21:54:00 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 13B37460015; Wed, 17 Nov 2021 21:53:59 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH v2 for-6.2] meson.build: Support ncurses on MacOS and OpenBSD
Date: Wed, 17 Nov 2021 21:53:55 +0100
Message-Id: <20211117205355.1392292-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MacOS provides header files for curses 5.7 with support
for wide characters, but requires _XOPEN_SOURCE_EXTENDED=1
to activate that.

By default those old header files are used even if there
is a newer Homebrew installation of ncurses 6.2 available.

Change also the old macro definition of NCURSES_WIDECHAR
and set it to 1 like it is done in newer versions of
curses.h when _XOPEN_SOURCE_EXTENDED=1 is defined.

OpenBSD has the same version of ncurses and needs the same fix.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2:
- Only define _XOPEN_SOURCE_EXTENDED when curses.h is used.
- Extended to fix OpenBSD, too (untested!)

 meson.build | 5 ++++-
 ui/curses.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index e2d38a43e6..16b3f748f4 100644
--- a/meson.build
+++ b/meson.build
@@ -681,6 +681,9 @@ iconv = not_found
 curses = not_found
 if have_system and not get_option('curses').disabled()
   curses_test = '''
+    #if defined(__APPLE__) || defined(__OpenBSD__)
+    #define _XOPEN_SOURCE_EXTENDED 1
+    #endif
     #include <locale.h>
     #include <curses.h>
     #include <wchar.h>
@@ -704,7 +707,7 @@ if have_system and not get_option('curses').disabled()
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
-  curses_compile_args = ['-DNCURSES_WIDECHAR']
+  curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
     if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
       curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
diff --git a/ui/curses.c b/ui/curses.c
index e4f9588c3e..861d63244c 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -38,6 +38,10 @@
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
+#if defined(__APPLE__) || defined(__OpenBSD__)
+#define _XOPEN_SOURCE_EXTENDED 1
+#endif
+
 /* KEY_EVENT is defined in wincon.h and in curses.h. Avoid redefinition. */
 #undef KEY_EVENT
 #include <curses.h>
-- 
2.30.2


