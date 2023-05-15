Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BE702E05
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYBN-0000M5-Hn; Mon, 15 May 2023 09:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYBJ-0000Lw-NL
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYBA-0005PT-WF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684157034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jjS4WNOgBCkBwjlG5As3yYV02ewC5fgq+aSGmOk3k28=;
 b=ek9bPnROgdGG5pA0CaS2XM6U6yKzkmlQHbZq5BmWeOoAH/y7KZHxaaGlEs9Uq0B1Al8g+w
 zs68wuNOcDcG655itHl6hnVy/d+13cFSEk5TkDhpyaAVt9Z6HNYZa4nCnzeBbbekTGlMPh
 kIRxHNbo7Ynj70xRCzzeaG7d3ooMLTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-zpThg5ZqOru_B7EpWoQihg-1; Mon, 15 May 2023 09:23:53 -0400
X-MC-Unique: zpThg5ZqOru_B7EpWoQihg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2EA5101A54F
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 13:23:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41AC01121314;
 Mon, 15 May 2023 13:23:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] ui/dbus: fix compilation when GBM && !OPENGL
Date: Mon, 15 May 2023 17:23:48 +0400
Message-Id: <20230515132348.1024663-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

commit 4814d3cbf ("ui/dbus: restrict opengl to gbm-enabled config")
assumes that whenever GBM is available, OpenGL is. This is not always
the case, let's further restrict opengl-related paths and fix some
compilation issues.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-listener.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 911acdc529..defe2220c0 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -50,7 +50,7 @@ struct _DBusDisplayListener {
 
 G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
 
-#ifdef CONFIG_GBM
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
 static void dbus_update_gl_cb(GObject *source_object,
                            GAsyncResult *res,
                            gpointer user_data)
@@ -239,7 +239,7 @@ static void dbus_refresh(DisplayChangeListener *dcl)
     graphic_hw_update(dcl->con);
 }
 
-#ifdef CONFIG_GBM
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
 static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
                                int x, int y, int w, int h)
 {
@@ -302,7 +302,7 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
         DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
 }
 
-#ifdef CONFIG_GBM
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
 static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
                                struct DisplaySurface *new_surface)
 {
@@ -369,7 +369,7 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
         NULL);
 }
 
-#ifdef CONFIG_GBM
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
 const DisplayChangeListenerOps dbus_gl_dcl_ops = {
     .dpy_name                = "dbus-gl",
     .dpy_gfx_update          = dbus_gl_gfx_update,
@@ -417,7 +417,7 @@ dbus_display_listener_constructed(GObject *object)
     DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
 
     ddl->dcl.ops = &dbus_dcl_ops;
-#ifdef CONFIG_GBM
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
     if (display_opengl) {
         ddl->dcl.ops = &dbus_gl_dcl_ops;
     }
-- 
2.40.1


