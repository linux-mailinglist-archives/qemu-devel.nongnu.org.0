Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19F407D71
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:03:37 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPP8y-0008ME-OM
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPP0R-0001Wb-Di
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:54:49 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mPP0N-0000S3-My
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:54:45 -0400
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout09.t-online.de (Postfix) with SMTP id 5FE301A213;
 Sun, 12 Sep 2021 14:52:14 +0200 (CEST)
Received: from linpower.localnet ([79.208.16.31]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPOxq-2p2jE90; Sun, 12 Sep 2021 14:52:07 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 040DF200627; Sun, 12 Sep 2021 14:52:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/3] ui/console: replace kbd_timer with chr_accept_input
 callback
Date: Sun, 12 Sep 2021 14:52:02 +0200
Message-Id: <20210912125203.7114-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1631451127-0000EB0E-89DEB23D/0/0 CLEAN NORMAL
X-TOI-MSGID: fd73928f-ef55-412b-864e-2f06937839c5
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
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

There's a ChardevClass chr_accept_input() callback function that
can replace the write retry timer.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index e6ce29024c..7b276bfc6c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -116,7 +116,6 @@ struct QemuConsole {
     Chardev *chr;
     /* fifo for key pressed */
     Fifo8 out_fifo;
-    QEMUTimer *kbd_timer;
     CoQueue dump_queue;
 
     QTAILQ_ENTRY(QemuConsole) next;
@@ -1106,30 +1105,21 @@ static int vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
     return len;
 }
 
-static void kbd_send_chars(void *opaque)
+static void kbd_send_chars(QemuConsole *s)
 {
-    QemuConsole *s = opaque;
     uint32_t len, avail;
 
     len = qemu_chr_be_can_write(s->chr);
     avail = fifo8_num_used(&s->out_fifo);
-    if (len > avail) {
-        len = avail;
-    }
-    while (len > 0) {
+    while (len > 0 && avail > 0) {
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&s->out_fifo, len, &size);
+        buf = fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
         qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
-        len -= size;
+        len = qemu_chr_be_can_write(s->chr);
         avail -= size;
     }
-    /* characters are pending: we send them a bit later (XXX:
-       horrible, should change char device API) */
-    if (avail > 0) {
-        timer_mod(s->kbd_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 1);
-    }
 }
 
 /* called when an ascii key is pressed */
@@ -2141,6 +2131,14 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
     return con ? surface_height(con->surface) : fallback;
 }
 
+static void vc_chr_accept_input(Chardev *chr)
+{
+    VCChardev *drv = VC_CHARDEV(chr);
+    QemuConsole *s = drv->console;
+
+    kbd_send_chars(s);
+}
+
 static void vc_chr_set_echo(Chardev *chr, bool echo)
 {
     VCChardev *drv = VC_CHARDEV(chr);
@@ -2189,7 +2187,6 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
     int g_height = 24 * FONT_HEIGHT;
 
     fifo8_create(&s->out_fifo, 16);
-    s->kbd_timer = timer_new_ms(QEMU_CLOCK_REALTIME, kbd_send_chars, s);
     s->ds = ds;
 
     s->y_displayed = 0;
@@ -2439,6 +2436,7 @@ static void char_vc_class_init(ObjectClass *oc, void *data)
     cc->parse = qemu_chr_parse_vc;
     cc->open = vc_chr_open;
     cc->chr_write = vc_chr_write;
+    cc->chr_accept_input = vc_chr_accept_input;
     cc->chr_set_echo = vc_chr_set_echo;
 }
 
-- 
2.31.1


