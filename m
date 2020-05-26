Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814691CCCF9
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 20:44:33 +0200 (CEST)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXqwC-0000UC-JN
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 14:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXquv-0007hR-9Q
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:13 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jXqut-0005Kj-B3
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:43:13 -0400
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout08.t-online.de (Postfix) with SMTP id 6D7E3410DE0D;
 Sun, 10 May 2020 20:43:07 +0200 (CEST)
Received: from linpower.localnet
 (bLYMKoZU8hKhDKb8PFWW0jzr1G64I1AXiXwwqX-uajYjh2-B4mwX-J5cBQZ-ljEwhJ@[46.86.59.135])
 by fwd13.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jXqun-0gUsd60; Sun, 10 May 2020 20:43:05 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 96DAE200624; Sun, 10 May 2020 20:43:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 01/10] ui/win32-kbd-hook: handle AltGr in a hook procedure
Date: Sun, 10 May 2020 20:42:55 +0200
Message-Id: <20200510184304.9267-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
References: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bLYMKoZU8hKhDKb8PFWW0jzr1G64I1AXiXwwqX-uajYjh2-B4mwX-J5cBQZ-ljEwhJ
X-TOI-MSGID: 17a9a933-805a-419d-9d43-3b9b32aec4d4
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 14:43:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Import win32 keyboard hooking code from project spice-gtk. This
patch removes the extra left control key up/down input events
inserted by Windows for the right alt key up/down input events
with international keyboard layouts. Additionally there's some
code to grab the keyboard.

The next patches will use this code.

Only Windows needs this.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/Makefile.objs    |   1 +
 ui/win32-kbd-hook.c | 100 ++++++++++++++++++++++++++++++++++++++++++++
 ui/win32-kbd-hook.h |  14 +++++++
 3 files changed, 115 insertions(+)
 create mode 100644 ui/win32-kbd-hook.c
 create mode 100644 ui/win32-kbd-hook.h

diff --git a/ui/Makefile.objs b/ui/Makefile.objs
index e6da6ff047..f74d72a612 100644
--- a/ui/Makefile.objs
+++ b/ui/Makefile.objs
@@ -15,6 +15,7 @@ common-obj-$(CONFIG_SPICE) += spice-core.o spice-input.o spice-display.o
 common-obj-$(CONFIG_COCOA) += cocoa.o
 common-obj-$(CONFIG_VNC) += $(vnc-obj-y)
 common-obj-$(call lnot,$(CONFIG_VNC)) += vnc-stubs.o
+common-obj-$(CONFIG_WIN32) += win32-kbd-hook.o
 
 # ui-sdl module
 common-obj-$(CONFIG_SDL) += sdl.mo
diff --git a/ui/win32-kbd-hook.c b/ui/win32-kbd-hook.c
new file mode 100644
index 0000000000..d558912ef2
--- /dev/null
+++ b/ui/win32-kbd-hook.c
@@ -0,0 +1,100 @@
+/*
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "win32-kbd-hook.h"
+
+static Notifier win32_unhook_notifier;
+static HHOOK win32_keyboard_hook;
+static HWND win32_window;
+static DWORD win32_grab;
+
+static LRESULT CALLBACK keyboard_hook_cb(int code, WPARAM wparam, LPARAM lparam)
+{
+    if  (win32_window && code == HC_ACTION && win32_window == GetFocus()) {
+        KBDLLHOOKSTRUCT *hooked = (KBDLLHOOKSTRUCT *)lparam;
+
+        if (wparam != WM_KEYUP) {
+            DWORD dwmsg = (hooked->flags << 24) |
+                          ((hooked->scanCode & 0xff) << 16) | 1;
+
+            switch (hooked->vkCode) {
+            case VK_CAPITAL:
+                /* fall through */
+            case VK_SCROLL:
+                /* fall through */
+            case VK_NUMLOCK:
+                /* fall through */
+            case VK_LSHIFT:
+                /* fall through */
+            case VK_RSHIFT:
+                /* fall through */
+            case VK_RCONTROL:
+                /* fall through */
+            case VK_LMENU:
+                /* fall through */
+            case VK_RMENU:
+                break;
+
+            case VK_LCONTROL:
+                /*
+                 * When pressing AltGr, an extra VK_LCONTROL with a special
+                 * scancode with bit 9 set is sent. Let's ignore the extra
+                 * VK_LCONTROL, as that will make AltGr misbehave.
+                 */
+                if (hooked->scanCode & 0x200) {
+                    return 1;
+                }
+                break;
+
+            default:
+                if (win32_grab) {
+                    SendMessage(win32_window, wparam, hooked->vkCode, dwmsg);
+                    return 1;
+                }
+                break;
+            }
+
+        } else {
+            switch (hooked->vkCode) {
+            case VK_LCONTROL:
+                if (hooked->scanCode & 0x200) {
+                    return 1;
+                }
+                break;
+            }
+        }
+    }
+
+    return CallNextHookEx(NULL, code, wparam, lparam);
+}
+
+static void keyboard_hook_unhook(Notifier *n, void *data)
+{
+    UnhookWindowsHookEx(win32_keyboard_hook);
+    win32_keyboard_hook = NULL;
+}
+
+void win32_kbd_set_window(HWND hwnd)
+{
+    if (hwnd && !win32_keyboard_hook) {
+        /* note: the installing thread must have a message loop */
+        win32_keyboard_hook = SetWindowsHookEx(WH_KEYBOARD_LL, keyboard_hook_cb,
+                                               GetModuleHandle(NULL), 0);
+        if (win32_keyboard_hook) {
+            win32_unhook_notifier.notify = keyboard_hook_unhook;
+            qemu_add_exit_notifier(&win32_unhook_notifier);
+        }
+    }
+
+    win32_window = hwnd;
+}
+
+void win32_kbd_set_grab(bool grab)
+{
+    win32_grab = grab;
+}
diff --git a/ui/win32-kbd-hook.h b/ui/win32-kbd-hook.h
new file mode 100644
index 0000000000..1e0e866610
--- /dev/null
+++ b/ui/win32-kbd-hook.h
@@ -0,0 +1,14 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef UI_WIN32_KBD_HOOK_H
+#define UI_WIN32_KBD_HOOK_H
+
+void win32_kbd_set_window(HWND hwnd);
+void win32_kbd_set_grab(bool grab);
+
+#endif
-- 
2.26.1


