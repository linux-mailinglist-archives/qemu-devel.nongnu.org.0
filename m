Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA54462C3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:34:02 +0100 (CET)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixTs-0002jz-UP
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRK-0000rW-O6
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRI-0005sm-SP
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lODvWHawrxeefp7Sfh3pVLwboPKJFLzIPyItZpDI+xo=;
 b=QdHD2LimiArB/mBo3bdufQ7ClhwOd/N0igs+69+PcnetNqgC9qAqpuj+r/nhhtXqsGdaHV
 RuDHWxFDY0AVAIoIp1LzaNBoVaitjvfoEkYiDym7Zg2xcaGzX1HRuA5JT12/jKzLmRyLEE
 zriLCSyuyfl3QdkTeWaL7mhk3Vt+n9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419--pgRH9-xOGinLvLhzTnnyQ-1; Fri, 05 Nov 2021 07:31:16 -0400
X-MC-Unique: -pgRH9-xOGinLvLhzTnnyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B8410A8E00;
 Fri,  5 Nov 2021 11:31:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A222367841;
 Fri,  5 Nov 2021 11:30:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E58831805C88; Fri,  5 Nov 2021 12:30:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] ui/gtk-egl: un-tab and re-tab should destroy egl surface
 and context
Date: Fri,  5 Nov 2021 12:30:39 +0100
Message-Id: <20211105113043.4059361-3-kraxel@redhat.com>
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

An old esurface should be destroyed and set to be NULL when doing
un-tab and re-tab so that a new esurface an context can be created
for the window widget that those will be bound to.

v2: enabling opengl specific routines only when CONFIG_OPENGL is set

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
Message-Id: <20211104065153.28897-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index b0564d80c191..8da673c18c72 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1242,6 +1242,16 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
                                     vc->tab_item, vc->label);
     gtk_widget_destroy(vc->window);
     vc->window = NULL;
+#if defined(CONFIG_OPENGL)
+    if (vc->gfx.esurface) {
+        eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+        vc->gfx.esurface = NULL;
+    }
+    if (vc->gfx.ectx) {
+        eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+        vc->gfx.ectx = NULL;
+    }
+#endif
     return TRUE;
 }
 
@@ -1271,6 +1281,16 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     if (!vc->window) {
         gtk_widget_set_sensitive(vc->menu_item, false);
         vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
+#if defined(CONFIG_OPENGL)
+        if (vc->gfx.esurface) {
+            eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+            vc->gfx.esurface = NULL;
+        }
+        if (vc->gfx.esurface) {
+            eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+            vc->gfx.ectx = NULL;
+        }
+#endif
         gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
 
         g_signal_connect(vc->window, "delete-event",
-- 
2.31.1


