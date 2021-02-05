Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7B310568
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:04:39 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vAU-0004jB-BH
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v36-0001Lf-AD
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v34-0001Cy-Kp
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLUVdXP2FV6oVY2GVzSlffIYDJOXIoNyEi5o8vks5f0=;
 b=akl0jodhYmz5lsLXzKqqC+UY5fuigQAtybhRy5cdC6wIywA2xi5k4wMsbzkhMi/ioQ+d9G
 C8wXbt1nLosJHjmoOK9pVXffV9r1K79z2IZm5C5OXXLl+GVRpTi4IwvRakcaLWp3HOp+In
 aMSH2AxDt2Km0yTB5VGTrdeeQ7ElK6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-h1tvKncnOc6Ayfp4L4ZMYQ-1; Fri, 05 Feb 2021 01:56:56 -0500
X-MC-Unique: h1tvKncnOc6Ayfp4L4ZMYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 603065B378
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F3E5D9CD;
 Fri,  5 Feb 2021 06:56:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 535C918003BD; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] ui: check hw requirements during DCL registration
Date: Fri,  5 Feb 2021 07:56:13 +0100
Message-Id: <20210205065620.1726554-18-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-14-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index a645418adad5..d8cc640c28db 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1476,12 +1476,37 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
     return false;
 }
 
+static bool dpy_compatible_with(QemuConsole *con,
+                                DisplayChangeListener *dcl, Error **errp)
+{
+    ERRP_GUARD();
+    int flags;
+
+    flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
+
+    if (flags & GRAPHIC_FLAGS_GL &&
+        !console_has_gl(con)) {
+        error_setg(errp, "The console requires a GL context.");
+        return false;
+
+    }
+
+    if (flags & GRAPHIC_FLAGS_DMABUF &&
+        !displaychangelistener_has_dmabuf(dcl)) {
+        error_setg(errp, "The console requires display DMABUF support.");
+        return false;
+    }
+
+    return true;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
         "This VM has no graphic display device.";
     static DisplaySurface *dummy;
     QemuConsole *con;
+    Error *err = NULL;
 
     assert(!dcl->ds);
 
@@ -1496,6 +1521,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
         dcl->con->gl = dcl;
     }
 
+    if (dcl->con && !dpy_compatible_with(dcl->con, dcl, &err)) {
+        error_report_err(err);
+        exit(1);
+    }
+
     trace_displaychangelistener_register(dcl, dcl->ops->dpy_name);
     dcl->ds = get_alloc_displaystate();
     QLIST_INSERT_HEAD(&dcl->ds->listeners, dcl, next);
-- 
2.29.2


