Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C04CF323
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:03:58 +0100 (CET)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8LS-0003YM-VL
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:03:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87k-0000vr-8t
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87i-0007VS-Ss
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIZIs52K+h456UbaY84eeeb9zwuo3G9+dwv/vb8jIOk=;
 b=PxFdlnQSXGN98PdZRcSJncL8RibcBqyDy5b2cEG0cS3Pn7WLg7GAUZ//pOCB/yq6ISVILn
 PKHW54KejtKqBpik+BgM5mL7dUAJzTWgXcw9Y8CMbCZ4pGOwY6LRo1pnkc//NgdQhay8kD
 MLjumbd7HKNpvCSpNzrByinbkno6qlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-BhGzXFJrPt6BkC1XDKf6vA-1; Mon, 07 Mar 2022 02:49:39 -0500
X-MC-Unique: BhGzXFJrPt6BkC1XDKf6vA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8298145F6;
 Mon,  7 Mar 2022 07:49:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15CDE83163;
 Mon,  7 Mar 2022 07:49:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/12] ui/dbus: do not send 2d scanout until gfx_update
Date: Mon,  7 Mar 2022 11:46:31 +0400
Message-Id: <20220307074632.238049-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

gfx_switch() is called to set the new_surface, not necessarily to
display it. It should be displayed after gfx_update(). Send the whole
scanout only in this case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-listener.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index a287edd2fc15..f9fc8eda519a 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -255,6 +255,26 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
 
     trace_dbus_update(x, y, w, h);
 
+    if (x == 0 && y == 0 && w == surface_width(ddl->ds) && h == surface_height(ddl->ds)) {
+        v_data = g_variant_new_from_data(
+            G_VARIANT_TYPE("ay"),
+            surface_data(ddl->ds),
+            surface_stride(ddl->ds) * surface_height(ddl->ds),
+            TRUE,
+            (GDestroyNotify)pixman_image_unref,
+            pixman_image_ref(ddl->ds->image));
+        qemu_dbus_display1_listener_call_scanout(
+            ddl->proxy,
+            surface_width(ddl->ds),
+            surface_height(ddl->ds),
+            surface_stride(ddl->ds),
+            surface_format(ddl->ds),
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+        return;
+    }
+
     /* make a copy, since gvariant only handles linear data */
     img = pixman_image_create_bits(surface_format(ddl->ds),
                                    w, h, NULL, stride);
@@ -295,29 +315,12 @@ static void dbus_gfx_switch(DisplayChangeListener *dcl,
                             struct DisplaySurface *new_surface)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
-    GVariant *v_data = NULL;
 
     ddl->ds = new_surface;
     if (!ddl->ds) {
         /* why not call disable instead? */
         return;
     }
-
-    v_data = g_variant_new_from_data(
-        G_VARIANT_TYPE("ay"),
-        surface_data(ddl->ds),
-        surface_stride(ddl->ds) * surface_height(ddl->ds),
-        TRUE,
-        (GDestroyNotify)pixman_image_unref,
-        pixman_image_ref(ddl->ds->image));
-    qemu_dbus_display1_listener_call_scanout(ddl->proxy,
-        surface_width(ddl->ds),
-        surface_height(ddl->ds),
-        surface_stride(ddl->ds),
-        surface_format(ddl->ds),
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
 }
 
 static void dbus_mouse_set(DisplayChangeListener *dcl,
-- 
2.35.1.273.ge6ebfd0e8cbb


