Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD2407D65
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:54:37 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPP0G-0007Vj-0v
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPOxx-0004pL-JT
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:52:13 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPOxu-00083J-MP
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:52:12 -0400
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout04.t-online.de (Postfix) with SMTP id 9E97A29E7;
 Sun, 12 Sep 2021 14:52:06 +0200 (CEST)
Received: from linpower.localnet ([79.208.16.31]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPOxo-1TmU5Z0; Sun, 12 Sep 2021 14:52:04 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 024C720061B; Sun, 12 Sep 2021 14:52:03 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] ui/console: replace QEMUFIFO with Fifo8
Date: Sun, 12 Sep 2021 14:52:01 +0200
Message-Id: <20210912125203.7114-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1631451124-00004599-DCC95A76/0/0 CLEAN NORMAL
X-TOI-MSGID: 4dcee977-be24-455c-b3ce-41aff26edeb1
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One of the two FIFO implementations QEMUFIFO and Fifo8 is
redundant. Replace QEMUFIFO with Fifo8.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 86 ++++++++++++----------------------------------------
 1 file changed, 20 insertions(+), 66 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index eabbbc951c..e6ce29024c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qemu/fifo8.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/timer.h"
@@ -62,57 +63,6 @@ enum TTYState {
     TTY_STATE_CSI,
 };
 
-typedef struct QEMUFIFO {
-    uint8_t *buf;
-    int buf_size;
-    int count, wptr, rptr;
-} QEMUFIFO;
-
-static int qemu_fifo_write(QEMUFIFO *f, const uint8_t *buf, int len1)
-{
-    int l, len;
-
-    l = f->buf_size - f->count;
-    if (len1 > l)
-        len1 = l;
-    len = len1;
-    while (len > 0) {
-        l = f->buf_size - f->wptr;
-        if (l > len)
-            l = len;
-        memcpy(f->buf + f->wptr, buf, l);
-        f->wptr += l;
-        if (f->wptr >= f->buf_size)
-            f->wptr = 0;
-        buf += l;
-        len -= l;
-    }
-    f->count += len1;
-    return len1;
-}
-
-static int qemu_fifo_read(QEMUFIFO *f, uint8_t *buf, int len1)
-{
-    int l, len;
-
-    if (len1 > f->count)
-        len1 = f->count;
-    len = len1;
-    while (len > 0) {
-        l = f->buf_size - f->rptr;
-        if (l > len)
-            l = len;
-        memcpy(buf, f->buf + f->rptr, l);
-        f->rptr += l;
-        if (f->rptr >= f->buf_size)
-            f->rptr = 0;
-        buf += l;
-        len -= l;
-    }
-    f->count -= len1;
-    return len1;
-}
-
 typedef enum {
     GRAPHIC_CONSOLE,
     TEXT_CONSOLE,
@@ -165,8 +115,7 @@ struct QemuConsole {
 
     Chardev *chr;
     /* fifo for key pressed */
-    QEMUFIFO out_fifo;
-    uint8_t out_fifo_buf[16];
+    Fifo8 out_fifo;
     QEMUTimer *kbd_timer;
     CoQueue dump_queue;
 
@@ -1160,21 +1109,25 @@ static int vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
 static void kbd_send_chars(void *opaque)
 {
     QemuConsole *s = opaque;
-    int len;
-    uint8_t buf[16];
+    uint32_t len, avail;
 
     len = qemu_chr_be_can_write(s->chr);
-    if (len > s->out_fifo.count)
-        len = s->out_fifo.count;
-    if (len > 0) {
-        if (len > sizeof(buf))
-            len = sizeof(buf);
-        qemu_fifo_read(&s->out_fifo, buf, len);
-        qemu_chr_be_write(s->chr, buf, len);
+    avail = fifo8_num_used(&s->out_fifo);
+    if (len > avail) {
+        len = avail;
+    }
+    while (len > 0) {
+        const uint8_t *buf;
+        uint32_t size;
+
+        buf = fifo8_pop_buf(&s->out_fifo, len, &size);
+        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
+        len -= size;
+        avail -= size;
     }
     /* characters are pending: we send them a bit later (XXX:
        horrible, should change char device API) */
-    if (s->out_fifo.count > 0) {
+    if (avail > 0) {
         timer_mod(s->kbd_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 1);
     }
 }
@@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s, int keysym)
     uint8_t buf[16], *q;
     CharBackend *be;
     int c;
+    uint32_t free;
 
     if (!s || (s->console_type == GRAPHIC_CONSOLE))
         return;
@@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int keysym)
         }
         be = s->chr->be;
         if (be && be->chr_read) {
-            qemu_fifo_write(&s->out_fifo, buf, q - buf);
+            free = fifo8_num_free(&s->out_fifo);
+            fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
             kbd_send_chars(s);
         }
         break;
@@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
     int g_width = 80 * FONT_WIDTH;
     int g_height = 24 * FONT_HEIGHT;
 
-    s->out_fifo.buf = s->out_fifo_buf;
-    s->out_fifo.buf_size = sizeof(s->out_fifo_buf);
+    fifo8_create(&s->out_fifo, 16);
     s->kbd_timer = timer_new_ms(QEMU_CLOCK_REALTIME, kbd_send_chars, s);
     s->ds = ds;
 
-- 
2.31.1


