Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9963CC81B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:50:00 +0200 (CEST)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51Yl-00077i-Gc
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m51X2-0005FV-7v
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:48:12 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:46454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m51X0-0002sL-CK
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:48:12 -0400
Received: from fwd20.aul.t-online.de (fwd20.aul.t-online.de [172.20.26.140])
 by mailout01.t-online.de (Postfix) with SMTP id AFA2C9232;
 Sun, 18 Jul 2021 09:48:05 +0200 (CEST)
Received: from linpower.localnet
 (ExTfWsZlYh4ra4GQ7C2DAlw-PN-6q3H6FwVNsfruPgFoOL-WfYigMD1jLLRKYdcgq6@[79.208.26.7])
 by fwd20.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m51Wo-2Qhts80; Sun, 18 Jul 2021 09:47:58 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id EF7DD20044E; Sun, 18 Jul 2021 09:47:57 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE consoles
Date: Sun, 18 Jul 2021 09:47:56 +0200
Message-Id: <20210718074757.22489-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ExTfWsZlYh4ra4GQ7C2DAlw-PN-6q3H6FwVNsfruPgFoOL-WfYigMD1jLLRKYdcgq6
X-TOI-EXPURGATEID: 150726::1626594478-00000BA7-DB7DAB97/0/0 CLEAN NORMAL
X-TOI-MSGID: d67671f5-8a6d-4bfd-ba99-5b44e8ea1799
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
characeters") it's very easy to lock up QEMU with the gtk ui.
If you configure a guest with a serial device and the guest
doesn't listen on this device, QEMU will lock up after
entering two characters in the serial console.

To fix this problem copy the function kbd_send_chars() and
related code from ui/console.c to ui/gtk.c. kbd_send_chars()
doesn't lock up because it uses a timer instead of a busy loop
for the write retries.

Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 include/ui/gtk.h |  5 +++++
 ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc..4714218376 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -25,6 +25,9 @@
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
 #endif
+#ifdef CONFIG_VTE
+#include "qemu/fifo8.h"
+#endif
 
 #define MAX_VCS 10
 
@@ -62,6 +65,8 @@ typedef struct VirtualVteConsole {
     GtkWidget *scrollbar;
     GtkWidget *terminal;
     Chardev *chr;
+    QEMUTimer *kbd_timer;
+    Fifo8 out_fifo;
     bool echo;
 } VirtualVteConsole;
 #endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 376b4d528d..b95b077b65 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -48,6 +48,7 @@
 #include <locale.h>
 #if defined(CONFIG_VTE)
 #include <vte/vte.h>
+#include "chardev/char-fe.h"
 #endif
 #include <math.h>
 
@@ -1710,10 +1711,46 @@ static const TypeInfo char_gd_vc_type_info = {
     .class_init = char_gd_vc_class_init,
 };
 
+static void gd_vc_send_chars(VirtualConsole *vc)
+{
+    uint32_t len, avail;
+    const uint8_t *buf;
+
+    len = qemu_chr_be_can_write(vc->vte.chr);
+    avail = fifo8_num_used(&vc->vte.out_fifo);
+    if (len > avail) {
+        len = avail;
+    }
+    while (len > 0) {
+        uint32_t size;
+
+        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
+        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
+        len -= size;
+        avail -= size;
+    }
+    /*
+     * characters are pending: we send them a bit later (XXX:
+     * horrible, should change char device API)
+     */
+    if (avail > 0) {
+        timer_mod(vc->vte.kbd_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1);
+    }
+}
+
+static void gd_vc_timer_send_chars(void *opaque)
+{
+    VirtualConsole *vc = opaque;
+
+    gd_vc_send_chars(vc);
+}
+
 static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
                          gpointer user_data)
 {
     VirtualConsole *vc = user_data;
+    CharBackend *be = vc->vte.chr->be;
 
     if (vc->vte.echo) {
         VteTerminal *term = VTE_TERMINAL(vc->vte.terminal);
@@ -1733,16 +1770,13 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
         }
     }
 
-    int remaining = size;
-    uint8_t* p = (uint8_t *)text;
-    while (remaining > 0) {
-        int can_write = qemu_chr_be_can_write(vc->vte.chr);
-        int written = MIN(remaining, can_write);
-        qemu_chr_be_write(vc->vte.chr, p, written);
+    if (be && be->chr_read) {
+        uint32_t free = fifo8_num_free(&vc->vte.out_fifo);
 
-        remaining -= written;
-        p += written;
+        fifo8_push_all(&vc->vte.out_fifo, (uint8_t *)text, MIN(free, size));
+        gd_vc_send_chars(vc);
     }
+
     return TRUE;
 }
 
@@ -1759,6 +1793,9 @@ static GSList *gd_vc_vte_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->s = s;
     vc->vte.echo = vcd->echo;
     vc->vte.chr = chr;
+    fifo8_create(&vc->vte.out_fifo, 16);
+    vc->vte.kbd_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                     gd_vc_timer_send_chars, vc);
     vcd->console = vc;
 
     snprintf(buffer, sizeof(buffer), "vc%d", idx);
-- 
2.26.2


