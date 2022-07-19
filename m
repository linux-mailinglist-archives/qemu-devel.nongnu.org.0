Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF757A303
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:29:01 +0200 (CEST)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp9g-0001E6-BU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3V-00082m-Ri
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3U-0001ja-Au
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+9Qd3nGSR57IbMLQ7TrVHVX9wcUmAoe43XRQUY5t5w=;
 b=F6ZllXyUuHHd2eGu2c6T0hXqVYfNw1RfR9007bn4eMCyyRMaLiuEUaLyOxWHvCJMXa6YPG
 AEykARrVC67N0YkSz2kL5tU8DLDuat79nFP1k57drnahIOzEnlOOS/LQi5H+XrYz8dwJyr
 bpFrNaF2/wGZvYPWWDNrzl/WI+h3TQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-hlMrmvs2NaiTBcgk2Qv7Aw-1; Tue, 19 Jul 2022 11:22:31 -0400
X-MC-Unique: hlMrmvs2NaiTBcgk2Qv7Aw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BA2E180F6E2;
 Tue, 19 Jul 2022 15:22:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22DA9492C3B;
 Tue, 19 Jul 2022 15:22:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E2D51800629; Tue, 19 Jul 2022 17:22:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Felix=20xq=20Quei=C3=9Fner?= <xq@random-projects.net>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 6/6] gtk: Add show_tabs=on|off command line option.
Date: Tue, 19 Jul 2022 17:22:18 +0200
Message-Id: <20220719152218.825707-7-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
References: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Felix xq Queißner <xq@random-projects.net>

The patch adds "show_tabs" command line option for GTK ui similar to
"grab_on_hover". This option allows tabbed view mode to not have to be
enabled by hand at each start of the VM.

Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220712133753.18937-1-xq@random-projects.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c        | 4 ++++
 qapi/ui.json    | 7 ++++++-
 qemu-options.hx | 6 +++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 2a791dd2aa04..1467b8c7d7f0 100644
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
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 413371d5e8bf..cf58ab4283da 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1195,12 +1195,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @show-tabs:   Display the tab bar for switching between the various graphical
+#               interfaces (e.g. VGA and virtual console character devices)
+#               by default.
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
index 377d22fbd82f..79e00916a11f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1938,7 +1938,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
@@ -2023,6 +2023,10 @@ SRST
 
         ``grab-on-hover=on|off`` : Grab keyboard input on mouse hover
 
+        ``show-tabs=on|off`` : Display the tab bar for switching between the
+                               various graphical interfaces (e.g. VGA and
+                               virtual console character devices) by default.
+
         ``show-cursor=on|off`` :  Force showing the mouse cursor
 
         ``window-close=on|off`` : Allow to quit qemu with window close button
-- 
2.36.1


