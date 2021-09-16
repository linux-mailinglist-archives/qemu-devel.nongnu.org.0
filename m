Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05C40EACB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 21:28:03 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQx3C-0003NG-Po
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 15:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mQwyB-0006ig-Cb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:51 -0400
Received: from mailout11.t-online.de ([194.25.134.85]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mQwy7-0005sh-QV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:51 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout11.t-online.de (Postfix) with SMTP id 3FCC11294D;
 Thu, 16 Sep 2021 21:22:45 +0200 (CEST)
Received: from linpower.localnet ([79.208.16.31]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mQwy2-0c5Y130; Thu, 16 Sep 2021 21:22:42 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id CE9502006DF; Thu, 16 Sep 2021 21:22:39 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 2/4] ui/console: replace kbd_timer with chr_accept_input
 callback
Date: Thu, 16 Sep 2021 21:22:37 +0200
Message-Id: <20210916192239.18742-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
References: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1631820162-000100A4-568E3CDF/0/0 CLEAN NORMAL
X-TOI-MSGID: d71079d8-64be-43b6-a8ad-050eadccf06b
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a ChardevClass chr_accept_input() callback function that
can replace the write retry timer.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index d2433c0636..dda1e6861d 100644
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


