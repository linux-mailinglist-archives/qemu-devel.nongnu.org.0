Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E181DADD8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 10:46:21 +0200 (CEST)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbKMm-0007G3-UF
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 04:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKK0-0001GW-Ku
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:43:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKJy-0006cj-4q
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589964205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MTFofh9WuadtI7+M3O5h8JB/kkVmabuiTsntuabFXs=;
 b=IbDhPSg/76VmHI/mMBaS7MnBuMrVZRf1cNLUYfxsPhza/aIv8kt7tYH/BVGNGDKE3olKbx
 nuPqfUFpVm4VrsIQIpOvscQnRRf/vUc8CBVMvSqbb+YMB2yvMFjNrsSsy7agGftLE3h1yY
 6Y8UgC+vvn/3RO/hhj8uwRHDLZeXZPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-mNIxnFhWNT-hkh231EbU2A-1; Wed, 20 May 2020 04:43:23 -0400
X-MC-Unique: mNIxnFhWNT-hkh231EbU2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31FC2EC1A0;
 Wed, 20 May 2020 08:43:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C60CA1001920;
 Wed, 20 May 2020 08:43:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AD3F99D55; Wed, 20 May 2020 10:43:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] ui/sdl2: fix handling of AltGr key on Windows
Date: Wed, 20 May 2020 10:43:11 +0200
Message-Id: <20200520084316.22057-7-kraxel@redhat.com>
In-Reply-To: <20200520084316.22057-1-kraxel@redhat.com>
References: <20200520084316.22057-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Wire up the keyboard hooking code on Windows to fix the AltGr
key and improve keyboard grabbing.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 20200516072014.7766-6-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/sdl2.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 61c7956da334..79c1ea29d223 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -30,6 +30,7 @@
 #include "ui/sdl2.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "ui/win32-kbd-hook.h"
 
 static int sdl2_num_outputs;
 static struct sdl2_console *sdl2_console;
@@ -220,6 +221,7 @@ static void sdl_grab_start(struct sdl2_console *scon)
     }
     SDL_SetWindowGrab(scon->real_window, SDL_TRUE);
     gui_grab = 1;
+    win32_kbd_set_grab(true);
     sdl_update_caption(scon);
 }
 
@@ -227,6 +229,7 @@ static void sdl_grab_end(struct sdl2_console *scon)
 {
     SDL_SetWindowGrab(scon->real_window, SDL_FALSE);
     gui_grab = 0;
+    win32_kbd_set_grab(false);
     sdl_show_cursor(scon);
     sdl_update_caption(scon);
 }
@@ -325,6 +328,19 @@ static int get_mod_state(void)
     }
 }
 
+static void *sdl2_win32_get_hwnd(struct sdl2_console *scon)
+{
+#ifdef CONFIG_WIN32
+    SDL_SysWMinfo info;
+
+    SDL_VERSION(&info.version);
+    if (SDL_GetWindowWMInfo(scon->real_window, &info)) {
+        return info.info.win.window;
+    }
+#endif
+    return NULL;
+}
+
 static void handle_keydown(SDL_Event *ev)
 {
     int win;
@@ -544,6 +560,11 @@ static void handle_windowevent(SDL_Event *ev)
         sdl2_redraw(scon);
         break;
     case SDL_WINDOWEVENT_FOCUS_GAINED:
+        win32_kbd_set_grab(gui_grab);
+        if (qemu_console_is_graphic(scon->dcl.con)) {
+            win32_kbd_set_window(sdl2_win32_get_hwnd(scon));
+        }
+        /* fall through */
     case SDL_WINDOWEVENT_ENTER:
         if (!gui_grab && (qemu_input_is_absolute() || absolute_enabled)) {
             absolute_mouse_grab(scon);
@@ -558,6 +579,9 @@ static void handle_windowevent(SDL_Event *ev)
         scon->ignore_hotkeys = get_mod_state();
         break;
     case SDL_WINDOWEVENT_FOCUS_LOST:
+        if (qemu_console_is_graphic(scon->dcl.con)) {
+            win32_kbd_set_window(NULL);
+        }
         if (gui_grab && !gui_fullscreen) {
             sdl_grab_end(scon);
         }
-- 
2.18.4


