Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46EF427D94
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:17:38 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJir-000118-QV
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJd1-0001cy-1N
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJcz-00007a-Fm
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeUva/Y26/C5tNNrKn3F2YJhjltyg+xWFW1hdLpJuN0=;
 b=d5tE8C0LiRTtM0En4KRbrL4vAjLfjgNrFvR2qrIiVtB6OLLIQpttrTLMU4vaAiHhfXo0uQ
 nLvzaEJ9w9yrwR3XMD8bkKtbJZpLSIUuKOta0dlA9ac69exXlwGUx0U0ihxpfwvEIuzMHx
 IMGmG19iBhvzR98UlyvnfjwbjXMEAHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-nOnLOAfIMqSO4JyPlsQRrA-1; Sat, 09 Oct 2021 17:11:31 -0400
X-MC-Unique: nOnLOAfIMqSO4JyPlsQRrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A65FF1006AA3
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:11:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A04E60C13;
 Sat,  9 Oct 2021 21:11:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/37] ui: factor out qemu_console_set_display_gl_ctx()
Date: Sun, 10 Oct 2021 01:08:12 +0400
Message-Id: <20211009210838.2219430-12-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next patch will make use of this function to dissociate
DisplayChangeListener from GL context.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  3 +++
 ui/console.c         | 22 ++++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 7b2f624e93..1617b4c59a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -406,6 +406,9 @@ void graphic_hw_gl_flushed(QemuConsole *con);
 
 void qemu_console_early_init(void);
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl);
+
 QemuConsole *qemu_console_lookup_by_index(unsigned int index);
 QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
 QemuConsole *qemu_console_lookup_by_device_name(const char *device_id,
diff --git a/ui/console.c b/ui/console.c
index 7eea1fc641..64f35e163c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1501,6 +1501,19 @@ static bool dpy_compatible_with(QemuConsole *con,
     return true;
 }
 
+void qemu_console_set_display_gl_ctx(QemuConsole *con,
+                                     DisplayChangeListener *dcl)
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
@@ -1511,14 +1524,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
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
 
     if (dcl->con) {
-- 
2.33.0.721.g106298f7f9


