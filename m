Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542104CD737
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:08:54 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Y5-0004ZV-4U
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rI-0005Jg-7z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rF-0002fZ-Ck
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98/liyrwCEk/qn6JyeC5cc/WbBQeLoFeN+V78zlxylc=;
 b=MQgizRgmZEKVV1+TuH1TleqfpiuHn7C42E7rn1Xr1nF8+kBa70ftvy5ozaRdKukPWY785l
 69tHQ40Cv+J08Tt09hsZLB+UXf9KzkA84uEQofv6Bk4baRXqw/Yb8qAjU+VjIlwULI6QOv
 tV+cuy9UD3SJdXO0OJXQvxwJDQe/wa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-z3FCljN6OD-x5FKODCbu5Q-1; Fri, 04 Mar 2022 09:24:33 -0500
X-MC-Unique: z3FCljN6OD-x5FKODCbu5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085D31854E26;
 Fri,  4 Mar 2022 14:24:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8417866F5;
 Fri,  4 Mar 2022 14:24:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56CDD18009BB; Fri,  4 Mar 2022 15:21:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] ui/console: fix crash when using gl context with non-gl
 listeners
Date: Fri,  4 Mar 2022 15:21:16 +0100
Message-Id: <20220304142123.956171-29-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214201337.1814787-2-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.35.1


