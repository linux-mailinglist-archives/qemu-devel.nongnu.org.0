Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E23CC81A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:49:54 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51Yf-0006ri-Sk
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m51X4-0005HO-K1
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:48:14 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:54284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m51X2-0002vG-Ji
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:48:14 -0400
Received: from fwd33.aul.t-online.de (fwd33.aul.t-online.de [172.20.27.144])
 by mailout08.t-online.de (Postfix) with SMTP id 555164380;
 Sun, 18 Jul 2021 09:48:05 +0200 (CEST)
Received: from linpower.localnet
 (ExTgZZZQwhTdfvh3hEOGAMLKCM-rdo+oFRahncigUbNR48DYAzAnUxRrTdJiFqtgpy@[79.208.26.7])
 by fwd33.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m51Wr-48wYLo0; Sun, 18 Jul 2021 09:48:01 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id F16922000A1; Sun, 18 Jul 2021 09:47:57 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH for 6.2 2/2] ui/gtk: drop chars if the chardev frontend makes
 no progress
Date: Sun, 18 Jul 2021 09:47:57 +0200
Message-Id: <20210718074757.22489-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ExTgZZZQwhTdfvh3hEOGAMLKCM-rdo+oFRahncigUbNR48DYAzAnUxRrTdJiFqtgpy
X-TOI-EXPURGATEID: 150726::1626594481-00013209-AD406C60/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b44b172-fef3-418d-8d20-c28e4b823a00
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there is no limit how long the virtual console chardev
backend retries to send remaining characters in the buffer.

Drop the characters after a timeout if the chardev frontend
doesn't accept characters.

The timeout was calculated from arbitrarily selected constants.
It was assumed that 50 baud is the slowest bit rate and that a
character has at maximum one start bit, eight data bits, one
parity bit and two stop bits. For a good safety margin, this
time was multiplied by eight. This results in a timeout of
1 / (50 bits / s) * 12 bits * 8 = 1.92 s.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 include/ui/gtk.h |  2 ++
 ui/gtk.c         | 47 +++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 4714218376..2771b1aa91 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -67,6 +67,8 @@ typedef struct VirtualVteConsole {
     Chardev *chr;
     QEMUTimer *kbd_timer;
     Fifo8 out_fifo;
+    int64_t be_last_write;
+    bool be_can_write;
     bool echo;
 } VirtualVteConsole;
 #endif
diff --git a/ui/gtk.c b/ui/gtk.c
index b95b077b65..c22f4a0329 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1711,8 +1711,20 @@ static const TypeInfo char_gd_vc_type_info = {
     .class_init = char_gd_vc_class_init,
 };
 
+static uint32_t gd_vc_send_backoff(uint32_t elapsed)
+{
+    if (elapsed <= 500) {
+        return 1000;
+    } else if (elapsed >= 50000) {
+        return 100000;
+    }
+
+    return elapsed * 2;
+}
+
 static void gd_vc_send_chars(VirtualConsole *vc)
 {
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint32_t len, avail;
     const uint8_t *buf;
 
@@ -1721,21 +1733,39 @@ static void gd_vc_send_chars(VirtualConsole *vc)
     if (len > avail) {
         len = avail;
     }
-    while (len > 0) {
+    if (len > 0) {
         uint32_t size;
 
-        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
-        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
-        len -= size;
-        avail -= size;
+        do {
+            buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
+            qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
+            len -= size;
+            avail -= size;
+        } while (len > 0);
+
+        vc->vte.be_can_write = true;
+        vc->vte.be_last_write = now;
     }
     /*
      * characters are pending: we send them a bit later (XXX:
      * horrible, should change char device API)
      */
     if (avail > 0) {
-        timer_mod(vc->vte.kbd_timer,
-                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1);
+        if (vc->vte.be_can_write) {
+            uint64_t elapsed = (now - vc->vte.be_last_write) / SCALE_US;
+
+            if (elapsed < 1920000) {
+                timer_mod(vc->vte.kbd_timer,
+                          now / SCALE_US + gd_vc_send_backoff(elapsed));
+            } else {
+                /* no progress since 1.92s */
+                vc->vte.be_can_write = false;
+                fifo8_reset(&vc->vte.out_fifo);
+            }
+        } else {
+            /* the chardev frontend hasn't accepted chars in a long time */
+            fifo8_reset(&vc->vte.out_fifo);
+        }
     }
 }
 
@@ -1794,7 +1824,8 @@ static GSList *gd_vc_vte_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->vte.echo = vcd->echo;
     vc->vte.chr = chr;
     fifo8_create(&vc->vte.out_fifo, 16);
-    vc->vte.kbd_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+    vc->vte.be_can_write = false;
+    vc->vte.kbd_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
                                      gd_vc_timer_send_chars, vc);
     vcd->console = vc;
 
-- 
2.26.2


