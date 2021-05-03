Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF1371289
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:41:57 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldU9M-0005cZ-B5
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4F-0003FI-JV; Mon, 03 May 2021 04:36:39 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0000hx-LA; Mon, 03 May 2021 04:36:39 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MWixU-1m66m11wls-00X3JR; Mon, 03
 May 2021 10:36:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] ui: Fix memory leak in qemu_xkeymap_mapping_table()
Date: Mon,  3 May 2021 10:36:10 +0200
Message-Id: <20210503083623.139700-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IcjDGF21BmgUbOnL3MDeHVJm+J47UmjXlE5erQbpG+Xe+k+VQ4t
 FrBc685P46/qP5TajRMaurv6XZNN7YF4KuoIbgCg/9lzDSLOSnxFtPtRrdjjehNlip3FYqs
 qu22iJhtcZ3t2XMkI+GSjongYX1CihSxBUaG14l4Guh9ruFG/9YzRwGSpbZQry/15ZzEBQ1
 HwVweZzQ0ZJELlRNT5kdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vcgjhDfF+3k=:8ytKojUygY9t7Uk8iwViQw
 AEXDqhMumuyGvrMtDtOmyqv0FGeZ1oxbABe5lnt6d/EXhx3rUqFRa/FOA4wiNEuTwpKFszQSP
 N9Gr1Yw+8eoWMjDLX6GUaBF0cz3tQcH2FCy5dhtZ8P5l9hedKZSPgCCKbC7k312hLuu73US8w
 DwOcw1zNEtXGZTE4PmbUKxwGl1ogdh5PCGwoBPihMP2Kx79+poTCHCEhIsvZ+Fk1gso0HPQTh
 zI69vC3RdgpnI7ckZrY8MgCq/DRLwntbjqTF7SI3OYZ05Jg4V2pYjv56IN5VdzjbuAf1OITEf
 6Nd+ZG+KMIFzbhl8wrqs8Xi0m4lvc4L4KD7c6PXz8Kq0VHYgZB8zxlzKUZMZKEqrqD86furQ6
 IaqoQWfyMaCPtOK0L4a3gbIJptegGLNkXdg036GzzXPGACUxlgNGcPPLeLXp5+WrEY58K2qqE
 YE9m20vCoqTYxhJIDEa0OfBIZAs4uGkRWo18GBVTj6n18msuat7OJcRj+7+jLgfkiXD77J9tL
 D40fQUgt2tqCMDel3rS1Sw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Refactor qemu_xkeymap_mapping_table() to have a single exit point,
so we can easily free the memory allocated by XGetAtomName().

This fixes when running a binary configured with --enable-sanitizers:

  Direct leak of 22 byte(s) in 1 object(s) allocated from:
      #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
      #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)

Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210430155009.259755-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 ui/x_keymap.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/ui/x_keymap.c b/ui/x_keymap.c
index 555086fb6bd5..2ce7b899615f 100644
--- a/ui/x_keymap.c
+++ b/ui/x_keymap.c
@@ -56,6 +56,7 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
 {
     XkbDescPtr desc;
     const gchar *keycodes = NULL;
+    const guint16 *map;
 
     /* There is no easy way to determine what X11 server
      * and platform & keyboard driver is in use. Thus we
@@ -83,21 +84,21 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
     if (check_for_xwin(dpy)) {
         trace_xkeymap_keymap("xwin");
         *maplen = qemu_input_map_xorgxwin_to_qcode_len;
-        return qemu_input_map_xorgxwin_to_qcode;
+        map = qemu_input_map_xorgxwin_to_qcode;
     } else if (check_for_xquartz(dpy)) {
         trace_xkeymap_keymap("xquartz");
         *maplen = qemu_input_map_xorgxquartz_to_qcode_len;
-        return qemu_input_map_xorgxquartz_to_qcode;
+        map = qemu_input_map_xorgxquartz_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "evdev")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x70)) {
         trace_xkeymap_keymap("evdev");
         *maplen = qemu_input_map_xorgevdev_to_qcode_len;
-        return qemu_input_map_xorgevdev_to_qcode;
+        map = qemu_input_map_xorgevdev_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "xfree86")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x63)) {
         trace_xkeymap_keymap("kbd");
         *maplen = qemu_input_map_xorgkbd_to_qcode_len;
-        return qemu_input_map_xorgkbd_to_qcode;
+        map = qemu_input_map_xorgkbd_to_qcode;
     } else {
         trace_xkeymap_keymap("NULL");
         g_warning("Unknown X11 keycode mapping '%s'.\n"
@@ -109,6 +110,10 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
                   "  - xprop -root\n"
                   "  - xdpyinfo\n",
                   keycodes ? keycodes : "<null>");
-        return NULL;
+        map = NULL;
     }
+    if (keycodes) {
+        XFree((void *)keycodes);
+    }
+    return map;
 }
-- 
2.31.1


