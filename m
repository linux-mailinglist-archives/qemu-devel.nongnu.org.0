Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CE3D5850
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:10:51 +0200 (CEST)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yVW-0001DN-Cl
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yR2-0001jF-Jq
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQz-0004ka-Jz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AKkA2KvAe9+erkqAVMAYMNJfbKFF5yCSmb/NR6FBCc=;
 b=Xts9ex5LymkRokJsL3/xQJTm03hhAWVbeWBNW4GfG0YJMBt+bWtPH54eOiutvRcRQN8aBK
 dCAUB210MC9GQCgiZvsrUc6Byg9vBOmknsVlP/QtU44cR2trLDwskXqZJwZe3rwnK7n/MI
 i9OgfKwODZuqqTXLanbczScLYA2263A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-lLCIQDj1NfO-kA7FJUgzNw-1; Mon, 26 Jul 2021 07:06:07 -0400
X-MC-Unique: lLCIQDj1NfO-kA7FJUgzNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35466801AEB;
 Mon, 26 Jul 2021 11:06:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C5B19D9B;
 Mon, 26 Jul 2021 11:06:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B908180090F; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] ui/gtk: add a keyboard fifo to the VTE consoles
Date: Mon, 26 Jul 2021 13:05:44 +0200
Message-Id: <20210726110544.1934386-7-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-Id: <20210725165039.5242-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h |  4 ++++
 ui/gtk.c         | 42 +++++++++++++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc87..80d6bbd9b5f3 100644
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
index 18542c763312..974e4dfc0b5b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1640,6 +1640,25 @@ static void gd_vc_adjustment_changed(GtkAdjustment *adjustment, void *opaque)
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
@@ -1649,6 +1668,14 @@ static int gd_vc_chr_write(Chardev *chr, const uint8_t *buf, int len)
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
@@ -1688,6 +1715,7 @@ static void char_gd_vc_class_init(ObjectClass *oc, void *data)
     cc->parse = qemu_chr_parse_vc;
     cc->open = gd_vc_open;
     cc->chr_write = gd_vc_chr_write;
+    cc->chr_accept_input = gd_vc_chr_accept_input;
     cc->chr_set_echo = gd_vc_chr_set_echo;
 }
 
@@ -1702,6 +1730,7 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
                          gpointer user_data)
 {
     VirtualConsole *vc = user_data;
+    uint32_t free;
 
     if (vc->vte.echo) {
         VteTerminal *term = VTE_TERMINAL(vc->vte.terminal);
@@ -1721,16 +1750,10 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
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
 
@@ -1747,6 +1770,7 @@ static GSList *gd_vc_vte_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->s = s;
     vc->vte.echo = vcd->echo;
     vc->vte.chr = chr;
+    fifo8_create(&vc->vte.out_fifo, 4096);
     vcd->console = vc;
 
     snprintf(buffer, sizeof(buffer), "vc%d", idx);
-- 
2.31.1


