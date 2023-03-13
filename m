Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE96B8231
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboNP-0001Vp-Lb; Mon, 13 Mar 2023 16:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboNJ-0001Nx-4Y
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboNH-0004k4-LE
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678737746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdP5gRcsEXjybNHL8Kw4avnd9SE2GNjqPSyoRCSKez8=;
 b=D/8JXKSHSTmI5YXtw6VTcwq7wraxI0SfWYdxgC5LYHfY3GcjfGvs8cDHQgHUyLLTttL/f1
 fFQWayj+i+pfnwXD5BdpJHXElAbuT9cQSsaYt140r8bfZ/Itftem10xBPhZM2fPxdpXZ80
 hy7Q0xl171fE5StDBTM2gYTnmRRm+MA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-AjW_toLDNTqAExucKQwScA-1; Mon, 13 Mar 2023 16:02:24 -0400
X-MC-Unique: AjW_toLDNTqAExucKQwScA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9EE38123A3;
 Mon, 13 Mar 2023 20:02:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3C981731B;
 Mon, 13 Mar 2023 20:02:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 10/18] ui: set cursor position upon listener registration
Date: Tue, 14 Mar 2023 00:01:26 +0400
Message-Id: <20230313200134.503083-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230313200134.503083-1-marcandre.lureau@redhat.com>
References: <20230313200134.503083-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/console.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index 35f8274aab..f3783021e5 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -95,6 +95,7 @@ struct QemuConsole {
     QemuUIInfo ui_info;
     QEMUTimer *ui_timer;
     QEMUCursor *cursor;
+    int cursor_x, cursor_y, cursor_on;
     const GraphicHwOps *hw_ops;
     void *hw;
 
@@ -1665,6 +1666,9 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     if (con && con->cursor && dcl->ops->dpy_cursor_define) {
         dcl->ops->dpy_cursor_define(dcl, con->cursor);
     }
+    if (con && dcl->ops->dpy_mouse_set) {
+        dcl->ops->dpy_mouse_set(dcl, con->cursor_x, con->cursor_y, con->cursor_on);
+    }
     text_console_update_cursor(NULL);
 }
 
@@ -1909,6 +1913,9 @@ void dpy_mouse_set(QemuConsole *con, int x, int y, int on)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->cursor_x = x;
+    con->cursor_y = y;
+    con->cursor_on = on;
     if (!qemu_console_is_visible(con)) {
         return;
     }
-- 
2.39.2


