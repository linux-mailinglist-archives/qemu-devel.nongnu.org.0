Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E24CEE6B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:23:35 +0100 (CET)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Du-0000Zc-D9
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0A3-0001df-9O; Sun, 06 Mar 2022 18:19:35 -0500
Received: from [2a00:1450:4864:20::32f] (port=39702
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0A1-0007VZ-Nq; Sun, 06 Mar 2022 18:19:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so9749120wmq.4; 
 Sun, 06 Mar 2022 15:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzGUfymbxp+y62HZzvEHIfdBSsWo5xnhh+8DCigMhQg=;
 b=ZugEt4kYgi2lUDQawRRp0gFddzyNARQjS0H3R8KoLk6zt3VidBexZnCf5hwaNP+el5
 XBv5Pi3dYVz7ChHNkWDiNBmI8nwapeCnWoVruqk0W5vINzXuLHE16G9GKpNwtSHkFmi3
 QGv7ZexDItWRffK8p8akYCEJKCGzyjfHMGt0KP666v/1D894t5cM0+24Qg3W2hA3Iw2+
 5eipF+Sz1G1Nb4bJvNAWzq6RUanmFNVIQbkG3ahCZZPao/x2oHIYjyrLJiUDXbsOJslS
 YIRWd7excNd1/EVepGCDAv9sngEm2Ary8X55FU16d1lpdc+hXDiLt76SU+fkQAoGBFlm
 oPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzGUfymbxp+y62HZzvEHIfdBSsWo5xnhh+8DCigMhQg=;
 b=y2ixEiLQ3/pvAf0IwdL/Jthju+uRkkcB3mstUIf0xt+G+Vwki/4G0mZ2u8B/uO78BW
 xsn6TbtrlpDI0Iom/PnBkv5Z0pDqUGgYHCO9x28d0Eh468eCQwucfTCGGwn7s9XV01JQ
 s0oT/IYPOWisgKBoQiGdGYRjul6G5Ar3M9Q4E14V30XPNSFK7Kb8D0Ycxh/RdcABa+6m
 0iR+L3yytm8pHgJeBnjuo4szxUaZC2sHwthtWczYr3PQpMUccYE8hYnR4kOXWIi+Fdmr
 nCxzaW5qzzPnwZv1inmLPwtU5o6MBIw53Py66qyiY8JB9BizU30P01dYu24qRtEzYiNL
 eikA==
X-Gm-Message-State: AOAM533V38qMGf0IUghaMwp3KtEOmih0QnHtrgJKmbkPJS4+y9jxjYsr
 RC31eo8ifXOYxz7EmYu1lqc7RPr0El4=
X-Google-Smtp-Source: ABdhPJzYmhZcajM43EcqRn65mlws4R5thWnt7bAxxZFePIADvFJxOoHZTMVJv54laTOMYUqCJ+u9nQ==
X-Received: by 2002:a05:600c:602a:b0:389:9e05:6f01 with SMTP id
 az42-20020a05600c602a00b003899e056f01mr4484487wmb.1.1646608771355; 
 Sun, 06 Mar 2022 15:19:31 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm9836661wrv.79.2022.03.06.15.19.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/22] ui/cocoa: add option to disable left-command
 forwarding to guest
Date: Mon,  7 Mar 2022 00:17:49 +0100
Message-Id: <20220306231753.50277-19-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Carwyn Ellis <carwynellis@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carwyn Ellis <carwynellis@gmail.com>

When switching between guest and host on a Mac using command-tab the
command key is sent to the guest which can trigger functionality in the
guest OS. Specifying left-command-key=off disables forwarding this key
to the guest. Defaults to enabled.

Also updated the cocoa display documentation to reference the new
left-command-key option along with the existing show-cursor option.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
[PMD: Set QAPI structure @since tag to 7.0]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/ui.json    | 18 ++++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      |  8 +++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 4a13f883a3..4dea35a819 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1260,6 +1260,23 @@
 { 'struct'  : 'DisplayCurses',
   'data'    : { '*charset'       : 'str' } }
 
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
+# Since: 7.0
+##
+{ 'struct': 'DisplayCocoa',
+  'data': {
+      '*left-command-key': 'bool'
+  } }
+
 ##
 # @DisplayType:
 #
@@ -1338,6 +1355,7 @@
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
+      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
diff --git a/qemu-options.hx b/qemu-options.hx
index 094a6c1d7c..ffaeab61ed 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1922,6 +1922,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_DBUS_DISPLAY)
     "-display dbus[,addr=<dbusaddr>]\n"
     "             [,gl=on|core|es|off][,rendernode=<file>]\n"
+#endif
+#if defined(CONFIG_COCOA)
+    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
 #endif
     "-display none\n"
     "                select display backend type\n"
@@ -2009,6 +2012,15 @@ SRST
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
index a6db8ebfb6..319af5045b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
 };
 static int last_buttons;
 static int cursor_hide = 1;
+static int left_command_key_enabled = 1;
 
 static int gArgc;
 static char **gArgv;
@@ -853,7 +854,8 @@ QemuCocoaView *cocoaView;
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        !!(modifiers & NSEventModifierFlagCommand) &&
+                        left_command_key_enabled) {
                         [self toggleKey:Q_KEY_CODE_META_L];
                     }
                     break;
@@ -2068,6 +2070,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


