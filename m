Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0724432E9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:36:46 +0100 (CET)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwmD-00044N-Lm
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwci-0006Og-9I
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcR-0002aL-3u
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnuyxSC9Hd75TnRtGuijJ3AaAdsHqZa/sQ+weo7o7Ng=;
 b=DgGzmzBQaePvXbHPjlkm2PLBO0M9X94PvqaH7reNA1S3Jiko+sBL6P/vcXPClhfDEqLmeO
 7G7K767spSqysz/awER+IWewTzYcO5Jiuz1evJ7tL+H67qYStkbDLr2Px6/5sURJ4if+59
 T1eG/POggXxy9RlgtFcSHRT2XU0NaY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43--Hl6IzM5OuWV6JphZ1ddlQ-1; Tue, 02 Nov 2021 12:26:35 -0400
X-MC-Unique: -Hl6IzM5OuWV6JphZ1ddlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 029AF1B2C989;
 Tue,  2 Nov 2021 16:26:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B83E060BE5;
 Tue,  2 Nov 2021 16:26:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB8741801ABC; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] ui/console: replace QEMUFIFO with Fifo8
Date: Tue,  2 Nov 2021 17:26:15 +0100
Message-Id: <20211102162619.2760593-7-kraxel@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

One of the two FIFO implementations QEMUFIFO and Fifo8 is
redundant. Replace QEMUFIFO with Fifo8.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210916192239.18742-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 86 ++++++++++++----------------------------------------
 1 file changed, 20 insertions(+), 66 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index eabbbc951c5f..d2433c0636d0 100644
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
+    uint32_t num_free;
 
     if (!s || (s->console_type == GRAPHIC_CONSOLE))
         return;
@@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int keysym)
         }
         be = s->chr->be;
         if (be && be->chr_read) {
-            qemu_fifo_write(&s->out_fifo, buf, q - buf);
+            num_free = fifo8_num_free(&s->out_fifo);
+            fifo8_push_all(&s->out_fifo, buf, MIN(num_free, q - buf));
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


