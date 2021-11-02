Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93924432CC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:35:41 +0100 (CET)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwl9-0002c7-FT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwch-0006NV-E3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcS-0002aV-FT
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6Ov4Y0MJFmq1qaH7RsUjq1nr4TjTqLuO/wHnfMydGA=;
 b=AvFvNy1So/MZjDSspYYxqJI+ApdrsBdi1SwoSDYINJECC1UHQHZ2x2lNXyPQzYu4r1QOrQ
 Ukmh9/rL0zTf+3o8rteRp+9sRoJN2RgrIoQcD9BPJLanE5g4F51Gtqbkz2Qj/Y9OVVOyuq
 w3A9X3+CGANn2yqKSfepHqa4INeaizk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Lp5JEPzaPLSjj3iafdKykA-1; Tue, 02 Nov 2021 12:26:37 -0400
X-MC-Unique: Lp5JEPzaPLSjj3iafdKykA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB7BEC1A4;
 Tue,  2 Nov 2021 16:26:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C75BE60C05;
 Tue,  2 Nov 2021 16:26:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E6E811801ABD; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] ui/console: replace kbd_timer with chr_accept_input
 callback
Date: Tue,  2 Nov 2021 17:26:16 +0100
Message-Id: <20211102162619.2760593-8-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

There's a ChardevClass chr_accept_input() callback function that
can replace the write retry timer.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210916192239.18742-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index d2433c0636d0..dda1e6861d6a 100644
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


