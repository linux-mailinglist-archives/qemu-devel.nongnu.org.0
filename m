Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99D3D4ED2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 18:52:24 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7hMV-0004nZ-L9
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 12:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m7hLj-000480-2s
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 12:51:35 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1m7hLh-00050P-1K
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 12:51:34 -0400
Received: from fwd15.aul.t-online.de (fwd15.aul.t-online.de [172.20.27.63])
 by mailout01.t-online.de (Postfix) with SMTP id 210937399E;
 Sun, 25 Jul 2021 18:50:40 +0200 (CEST)
Received: from linpower.localnet
 (S8lyNmZfYhjT1auAr1OWO5WGcBnD6UgXz5nse0LAs6wkUlpH35lVm7ZZX4yYs6mg21@[79.208.26.7])
 by fwd15.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m7hKp-1KoC9I0; Sun, 25 Jul 2021 18:50:39 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 410152001F9; Sun, 25 Jul 2021 18:50:39 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH for 6.1 v2 1/1] ui/gtk: add a keyboard fifo to the VTE consoles
Date: Sun, 25 Jul 2021 18:50:39 +0200
Message-Id: <20210725165039.5242-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d06fa203-5a89-b454-8b01-8711aaafeea2@t-online.de>
References: <d06fa203-5a89-b454-8b01-8711aaafeea2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: S8lyNmZfYhjT1auAr1OWO5WGcBnD6UgXz5nse0LAs6wkUlpH35lVm7ZZX4yYs6mg21
X-TOI-EXPURGATEID: 150726::1627231839-0001577D-DAAE0966/0/0 CLEAN NORMAL
X-TOI-MSGID: 15cc0740-d1da-404e-9ace-26a7b9efa31c
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
characeters") it's very easy to lock up QEMU with the GTK ui.
If you configure a guest with a serial device and the guest
doesn't listen on this device, QEMU will lock up after
entering two characters in the serial console. That's because
current code uses a busy loop for the chardev write retries
and the busy loop doesn't terminate in this case.

To fix this problem add a fifo to the VTE consoles and use the
chr_accept_input() callback function to write the remaining
characters in the queue to the chardev.

The fifo has a size of 4096 bytes, so one can copy and paste
a fairly large URL or file path.

Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 include/ui/gtk.h |  4 ++++
 ui/gtk.c         | 42 +++++++++++++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc..80d6bbd9b5 100644
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
 
@@ -62,6 +65,7 @@ typedef struct VirtualVteConsole {
     GtkWidget *scrollbar;
     GtkWidget *terminal;
     Chardev *chr;
+    Fifo8 out_fifo;
     bool echo;
 } VirtualVteConsole;
 #endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 376b4d528d..6cbcceda12 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1652,6 +1652,25 @@ static void gd_vc_adjustment_changed(GtkAdjustment *adjustment, void *opaque)
     }
 }
 
+static void gd_vc_send_chars(VirtualConsole *vc)
+{
+    uint32_t len, avail;
+
+    len = qemu_chr_be_can_write(vc->vte.chr);
+    avail = fifo8_num_used(&vc->vte.out_fifo);
+    if (len > avail) {
+        len = avail;
+    }
+    while (len > 0) {
+        const uint8_t *buf;
+        uint32_t size;
+
+        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
+        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
+        len -= size;
+    }
+}
+
 static int gd_vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     VCChardev *vcd = VC_CHARDEV(chr);
@@ -1661,6 +1680,14 @@ static int gd_vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
     return len;
 }
 
+static void gd_vc_chr_accept_input(Chardev *chr)
+{
+    VCChardev *vcd = VC_CHARDEV(chr);
+    VirtualConsole *vc = vcd->console;
+
+    gd_vc_send_chars(vc);
+}
+
 static void gd_vc_chr_set_echo(Chardev *chr, bool echo)
 {
     VCChardev *vcd = VC_CHARDEV(chr);
@@ -1700,6 +1727,7 @@ static void char_gd_vc_class_init(ObjectClass *oc, void *data)
     cc->parse = qemu_chr_parse_vc;
     cc->open = gd_vc_open;
     cc->chr_write = gd_vc_chr_write;
+    cc->chr_accept_input = gd_vc_chr_accept_input;
     cc->chr_set_echo = gd_vc_chr_set_echo;
 }
 
@@ -1714,6 +1742,7 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
                          gpointer user_data)
 {
     VirtualConsole *vc = user_data;
+    uint32_t free;
 
     if (vc->vte.echo) {
         VteTerminal *term = VTE_TERMINAL(vc->vte.terminal);
@@ -1733,16 +1762,10 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
         }
     }
 
-    int remaining = size;
-    uint8_t* p = (uint8_t *)text;
-    while (remaining > 0) {
-        int can_write = qemu_chr_be_can_write(vc->vte.chr);
-        int written = MIN(remaining, can_write);
-        qemu_chr_be_write(vc->vte.chr, p, written);
+    free = fifo8_num_free(&vc->vte.out_fifo);
+    fifo8_push_all(&vc->vte.out_fifo, (uint8_t *)text, MIN(free, size));
+    gd_vc_send_chars(vc);
 
-        remaining -= written;
-        p += written;
-    }
     return TRUE;
 }
 
@@ -1759,6 +1782,7 @@ static GSList *gd_vc_vte_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->s = s;
     vc->vte.echo = vcd->echo;
     vc->vte.chr = chr;
+    fifo8_create(&vc->vte.out_fifo, 4096);
     vcd->console = vc;
 
     snprintf(buffer, sizeof(buffer), "vc%d", idx);
-- 
2.26.2


