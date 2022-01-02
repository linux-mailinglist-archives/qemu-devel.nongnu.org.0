Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A92482C71
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 18:44:24 +0100 (CET)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n44u7-0000ce-VW
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 12:44:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rr-0006KS-Bh; Sun, 02 Jan 2022 12:42:04 -0500
Received: from [2a00:1450:4864:20::32d] (port=52820
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rp-0003lY-QM; Sun, 02 Jan 2022 12:42:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id g132so20266284wmg.2;
 Sun, 02 Jan 2022 09:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=uCyL1Q9YZmojI8gjUnStkPWS7TvApbOtoS+o3RyLBNk=;
 b=jwhzm/HD9ToSjyfYQPGe5oB8CaYAwm1Bwnb92xNRgED1FPhD/5Ev44eRbnpkTDmbIG
 5DWPF0fdqjd4QudAq3hEzoNGUdgO1KJxqf6khjR28e0Oyi35SCBHEsRu4zeltmMNzIx1
 ljb91eDe874rzt4OXSaU1OOL7okrzyfuLULD2Sy9BGaOY6EV7ERZCyBKEp2Q9U5zZFTi
 poGXDZS7U5Tk1PP4kH4LjzjcBDwBEOu0ZDtZFRxVogXYDa5sjTmCuqP/QgZM8ZiNnV2G
 rge3Uu0jd72O5Yh312bU0rKKqnXNS0YbRChzzYV6cIIw7j6Fw6UNEfcKSD8K8gZnZwZ9
 QpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=uCyL1Q9YZmojI8gjUnStkPWS7TvApbOtoS+o3RyLBNk=;
 b=5f1Z7ER6w5gWPIFFod0DmMihTmjIHccfeGNk6oriPmsFMnGO7OiyjjQAn7O/EerHPA
 K5MWysjMXqB643UpJYTP6QN672JUCk9fXvMJnjqxaaVQkLQWnRBhQhnhbFXEITil1HTI
 nVYv8zdSjWab1/ez5qfc4wa7RIawbEM5uK97bmvpagZuS7SC0IHM4bB33Bjt3jLexn+2
 b9HOXuzI2YN8gctk9T0eF012Z1Xtcnpj+LLSrKJ24r1QGsa7pqjLEzlO6uIIb3T/wBV1
 dpZ81T0mw8lHfsN0MfiA8u2EvfG/Hpe3yJzqQKCXo0I2PqpUkqDoaXy59X2Zqj3Y/8GD
 rdjw==
X-Gm-Message-State: AOAM531TTdGozcNenqDKEs028SDQkgstASXeb2LAP+hJWwqm+vyVlunF
 pKMIG1VaMNhrrvm2JLYCN0U+10teYAM=
X-Google-Smtp-Source: ABdhPJyrM8Y48NkXiitJUY8nX53eoiwOt/uF+/RPf6zkVkQeOpqf+Bt+G6INrEypDn3uLrT0qzgNiA==
X-Received: by 2002:a1c:4644:: with SMTP id t65mr35921020wma.116.1641145320164; 
 Sun, 02 Jan 2022 09:42:00 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id w9sm1626565wrq.70.2022.01.02.09.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:42:00 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/cocoa: add option to disable left-command forwarding
 to guest
Date: Sun,  2 Jan 2022 17:41:52 +0000
Message-Id: <20220102174153.70043-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102174153.70043-1-carwynellis@gmail.com>
References: <20220102174153.70043-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching between guest and host on a Mac using command-tab the
command key is sent to the guest which can trigger functionality in the
guest OS. Specifying left-command-key=off disables forwarding this key
to the guest. Defaults to enabled.

Also updated the cocoa display documentation to reference the new
left-command-key option along with the existing show-cursor option.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 qapi/ui.json    | 17 +++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      |  8 +++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da37..764480e145 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1107,6 +1107,22 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool'  } }
 
+##
+# @DisplayCocoa:
+#
+# Cocoa display options.
+#
+# @left-command-key: Enable/disable forwarding of left command key to
+#                    guest. Allows command-tab window switching on the
+#                    host without sending this key to the guest when
+#                    "off". Defaults to "on"
+#
+# Since: 6.2.50
+#
+##
+{ 'struct'  : 'DisplayCocoa',
+  'data'    : { '*left-command-key' : 'bool' } }
+
 ##
 # @DisplayEGLHeadless:
 #
@@ -1254,6 +1270,7 @@
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
+      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
diff --git a/qemu-options.hx b/qemu-options.hx
index fd1f8135fb..6fa9c38c83 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1912,6 +1912,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_DBUS_DISPLAY)
     "-display dbus[,addr=<dbusaddr>]\n"
     "             [,gl=on|core|es|off][,rendernode=<file>]\n"
+#endif
+#if defined(CONFIG_COCOA)
+    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
 #endif
     "-display none\n"
     "                select display backend type\n"
@@ -1999,6 +2002,15 @@ SRST
         ``charset=CP850`` for IBM CP850 encoding. The default is
         ``CP437``.
 
+    ``cocoa``
+        Display video output in a Cocoa window. Mac only. This interface
+        provides drop-down menus and other UI elements to configure and
+        control the VM during runtime. Valid parameters are:
+
+        ``show-cursor=on|off`` :  Force showing the mouse cursor
+
+        ``left-command-key=on|off`` : Disable forwarding left command key to host
+
     ``egl-headless[,rendernode=<file>]``
         Offload all OpenGL operations to a local DRI device. For any
         graphical display, this display needs to be paired with either
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b..01045d6698 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static int left_command_key_enabled = 1;
 
 static int gArgc;
 static char **gArgv;
@@ -834,7 +835,8 @@ QemuCocoaView *cocoaView;
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        !!(modifiers & NSEventModifierFlagCommand) &&
+                        left_command_key_enabled) {
                         [self toggleKey:Q_KEY_CODE_META_L];
                     }
                     break;
@@ -2054,6 +2056,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
         cursor_hide = 0;
     }
 
+    if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
+        left_command_key_enabled = 0;
+    }
+
     // register vga output callbacks
     register_displaychangelistener(&dcl);
 
-- 
2.34.1


