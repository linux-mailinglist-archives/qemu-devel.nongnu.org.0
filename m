Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7E55BB4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:20:41 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sPg-0003bI-W0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xq@random-projects.net>)
 id 1o5rqo-0000Ap-HS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:44:38 -0400
Received: from mout-p-202.mailbox.org ([80.241.56.172]:53130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xq@random-projects.net>)
 id 1o5rqm-0006sO-O5
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:44:38 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LWtqL49K2z9sSQ;
 Mon, 27 Jun 2022 18:44:30 +0200 (CEST)
From: =?UTF-8?q?Felix=20xq=20Quei=C3=9Fner?= <xq@random-projects.net>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Felix=20=22xq=22=20Quei=C3=9Fner?= <xq@random-projects.net>
Subject: [PATCH] gtk: Add show_tabs=on|off command line option.
Date: Mon, 27 Jun 2022 18:44:05 +0200
Message-Id: <20220627164404.12137-1-xq@random-projects.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.241.56.172;
 envelope-from=xq@random-projects.net; helo=mout-p-202.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Jun 2022 13:18:08 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds "show_tabs" command line option for GTK ui similar to "grab_on_hover". This option allows tabbed view mode to not have to be enabled by hand at each start of the VM.

Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
---
 qapi/ui.json    | 5 ++++-
 qemu-options.hx | 2 +-
 ui/gtk.c        | 4 ++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 413371d5e8..049e7957a9 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1195,12 +1195,15 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @show-tabs:   Displays the tab items by default.
+#               Since 7.1
 #
 # Since: 2.12
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*show-tabs'     : 'bool'  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..2b279afff7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1937,7 +1937,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "            [,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
-    "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
+    "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off][,show-tabs=on|off]\n"
     "            [,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
diff --git a/ui/gtk.c b/ui/gtk.c
index 2a791dd2aa..1467b8c7d7 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2390,6 +2390,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.grab_on_hover) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
+    if (opts->u.gtk.has_show_tabs &&
+        opts->u.gtk.show_tabs) {
+        gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
+    }
     gd_clipboard_init(s);
 }
 
-- 
2.36.1


