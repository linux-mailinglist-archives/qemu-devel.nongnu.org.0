Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675743389B5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:11:21 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKelM-0002tB-DE
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecN-0006wk-CK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecJ-0002OW-Kq
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s72+FnV7ci5SGKLY9sLo0/QMvHq/wCtUPb4EGHuCu3M=;
 b=Dy6RPL0hHcCbSTz0J8j0ozxw+iM+TILB7xJv1c5pJBWd2F9PLhqhGleMDO3gE/2D1K8dAP
 NpthgxmaBsLjfFiahcdpHesq7q11udQXtiDFRfsspOjF55lpc38tLgEUYNjMIn1LMKezlB
 SA0Ku4ZFFiQZNqtRe2tcfoLVxxTNC1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-1EkBv_IIPFu3DIgK-z1D9A-1; Fri, 12 Mar 2021 05:01:56 -0500
X-MC-Unique: 1EkBv_IIPFu3DIgK-z1D9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93FF5107ACCD
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:01:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9963110016FD;
 Fri, 12 Mar 2021 10:01:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 05/27] ui: factor out qemu_console_set_display_gl_ctx()
Date: Fri, 12 Mar 2021 14:00:46 +0400
Message-Id: <20210312100108.2706195-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next patch will make use of this function to dissociate
DisplayChangeListener from GL context.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/console.c         | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index c960b7066c..9391fb052b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -413,6 +413,8 @@ void graphic_hw_gl_flushed(QemuConsole *con);
 
 void qemu_console_early_init(void);
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayChangeListener *dcl);
+
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
 QemuConsole *qemu_console_lookup_by_device_name(const char *device_id,
diff --git a/ui/console.c b/ui/console.c
index bab32723b5..83475bd8c3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1502,6 +1502,18 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con, DisplayChangeListener *dcl)
+{
+    /* display has opengl support */
+    assert(dcl->con);
+    if (dcl->con->gl) {
+        fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
+                dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
+        exit(1);
+    }
+    dcl->con->gl = dcl;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
@@ -1513,14 +1525,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     assert(!dcl->ds);
 
     if (dcl->ops->dpy_gl_ctx_create) {
-        /* display has opengl support */
-        assert(dcl->con);
-        if (dcl->con->gl) {
-            fprintf(stderr, "can't register two opengl displays (%s, %s)\n",
-                    dcl->ops->dpy_name, dcl->con->gl->ops->dpy_name);
-            exit(1);
-        }
-        dcl->con->gl = dcl;
+        qemu_console_set_display_gl_ctx(dcl->con, dcl);
     }
 
     if (dcl->con && !dpy_compatible_with(dcl->con, dcl, &err)) {
-- 
2.29.0


