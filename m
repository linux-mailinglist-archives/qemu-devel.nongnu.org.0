Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D864D9C12
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:24:03 +0100 (CET)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU79e-00030l-53
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:24:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iw-00064r-JD
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:28 -0400
Received: from [2607:f8b0:4864:20::102e] (port=36406
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iv-0008Jy-2p
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:26 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso2239641pjb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1A01qt64fth03kaxOvkd6uuWOpE/ywgplyaseYZCZk=;
 b=Qq9+1eiHw8njqJjOPIDuxI8M/uc8gVFsvwZE34fb6ixQgz0lFsuOYI/PSBmTQU2QNf
 FI0Mg4s+YPOFqcHNL8eCa8rUt0Y04vOES2I73XZm2tKDz3KfSdE5TgKzYV6H5GaFI/E7
 ZvS7uaPSnC7PyGUBGUw00JeeIpA5aVMZsnS8dbNiTIe2OXPWldA5p37OO0pcweXRwR7/
 Y8o0oQPK7wDCUZG6vBNLlsuikOXZFz2/gueu2VdLFsX2G46vsx1FU10ZbfV4IgcKN1H+
 vu+5A9GX8MQFpp+7rRqd0mLMIpC0UH3k8S/Se6nK0ipjylZOvzwNOVotpzrRK9g82UTd
 xenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1A01qt64fth03kaxOvkd6uuWOpE/ywgplyaseYZCZk=;
 b=c5l1WV2gBFhEfJEWJQEWu5jjHRAQuMHzoHWOIwoV6/uQxtSKtoIGZG3gFJzFfpeeZb
 2IXkBOhEGctpgty0oVUyv6EGGumW1QA2f1mt3XZGOD2l8LNO67sF1trYnJyBLYV/yZBF
 kGGlHzd7gk+5h9ACMtda+4ffJiuY2+nD6xUyf1r7lqQcAJ9paDXQstGST+ZeJjyLgIRW
 95VfWtLAv8VbYTfZJU2/79oLa11JPQuNRvXJHPZYrOOBm4pNZIQIOrZX/nHVQxy5ZxKP
 wOxRc/PxiD7G7tYvkPqNZlPiTrTnKZ7J/NacOEc53hngDUua/wax3RBbsFbcy8xoG/t7
 1LNg==
X-Gm-Message-State: AOAM533vbqahM4lT9hPcL+250+f8W98hhR8Y94ErNmoA3wI7mATI29LR
 EXc9T2xTZhjEvvHwhJOu3/yLKSrjYUg=
X-Google-Smtp-Source: ABdhPJxKA+w3ppZkxrOiKiUsq+kne0AQIE94pOt+b6BSNQqKXC6qEa4xZMnhVYtN6NnjQMXFDJNcAA==
X-Received: by 2002:a17:90b:4f8c:b0:1bf:3ef:d668 with SMTP id
 qe12-20020a17090b4f8c00b001bf03efd668mr4356528pjb.219.1647348983430; 
 Tue, 15 Mar 2022 05:56:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a637a07000000b0037c9268a310sm20730135pgc.3.2022.03.15.05.56.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] ui/cocoa: add option to disable left-command forwarding
 to guest
Date: Tue, 15 Mar 2022 13:53:46 +0100
Message-Id: <20220315125350.82452-18-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Carwyn Ellis <carwynellis@gmail.com>
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
index 5ce0ada75e..f464b2fe27 100644
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
index a66ba3d7b6..1aa51c42dc 100644
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
@@ -2002,6 +2004,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


