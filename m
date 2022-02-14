Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52154B5AE5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 21:16:46 +0100 (CET)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhm9-0002tW-Fx
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 15:16:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjg-0000is-Cx
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjc-0003j4-Tt
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644869647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+72i9z7e73MgY074con63qdOaJdfDGS5Fa4BUnZPh50=;
 b=D4evfPyKNSit0dBHzZuqifSGcLEcICasnxGDVhIctj7tnbi1s8vuO6Lc2Y4rDUajQBlBJn
 aOXx++4PLaHiGaM/Z5zcMufJ75ZjpFOMYcidBlj+7MAMF5G5i36yuy/Q6In8P1sxOj3usa
 1NdtHyqi6O3dagm6JrmjmlSwN09yTl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-iPNfmxf4OyueKduob9C3jA-1; Mon, 14 Feb 2022 15:14:06 -0500
X-MC-Unique: iPNfmxf4OyueKduob9C3jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F26281DFAA;
 Mon, 14 Feb 2022 20:14:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E842345C93;
 Mon, 14 Feb 2022 20:14:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] ui/console: fix crash when using gl context with non-gl
 listeners
Date: Tue, 15 Feb 2022 00:13:35 +0400
Message-Id: <20220214201337.1814787-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
References: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The commit 7cc712e98 ("ui: dispatch GL events to all listener")
mechanically replaced the dpy_gl calls with a dispatch loop, using the
same pre-conditions. However, it didn't take into account that all
listeners do not have to implement the GL callbacks.

Add the missing pre-conditions before calling the callbacks.

Fix crash when running a GL-enabled VM with "-device virtio-gpu-gl-pci
-display egl-headless -vnc :0".

Fixes: 7cc712e98 ("ui: dispatch GL events to all listener")
Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2cc2..79a01afd1ea7 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1860,7 +1860,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
         con->scanout.kind = SCANOUT_NONE;
     }
     QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_disable(dcl);
+        if (dcl->ops->dpy_gl_scanout_disable) {
+            dcl->ops->dpy_gl_scanout_disable(dcl);
+        }
     }
 }
 
@@ -1881,10 +1883,12 @@ void dpy_gl_scanout_texture(QemuConsole *con,
         x, y, width, height
     };
     QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
-                                         backing_y_0_top,
-                                         backing_width, backing_height,
-                                         x, y, width, height);
+        if (dcl->ops->dpy_gl_scanout_texture) {
+            dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
+                                             backing_y_0_top,
+                                             backing_width, backing_height,
+                                             x, y, width, height);
+        }
     }
 }
 
@@ -1897,7 +1901,9 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     con->scanout.kind = SCANOUT_DMABUF;
     con->scanout.dmabuf = dmabuf;
     QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
+        if (dcl->ops->dpy_gl_scanout_dmabuf) {
+            dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
+        }
     }
 }
 
@@ -1951,7 +1957,9 @@ void dpy_gl_update(QemuConsole *con,
 
     graphic_hw_gl_block(con, true);
     QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_update(dcl, x, y, w, h);
+        if (dcl->ops->dpy_gl_update) {
+            dcl->ops->dpy_gl_update(dcl, x, y, w, h);
+        }
     }
     graphic_hw_gl_block(con, false);
 }
-- 
2.34.1.428.gdcc0cd074f0c


