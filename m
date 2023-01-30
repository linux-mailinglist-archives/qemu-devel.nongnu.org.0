Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C6680BEC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSIm-00088Y-N7; Mon, 30 Jan 2023 06:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSIH-0006r1-8K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSIC-0008Ov-6N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0279tsYaFiBEs2+IccnKxGOwTiEOv91cmFd0uo/o4E=;
 b=SOfRn2jd5AHaT8cIMKN95r7Ob3TuXaV5euFVmX6ijBEjccXSVpLEpEx8CUYKb8zf/aPQ8J
 OwfMKpeSYTtZvzmmz+HV3plY3OTA4UhKXc7wPBBoUV2leH0rqP1kYsdcKmrMqUWf13w1N1
 XX6niPi3iSxX6WqIaDgwgCZwo9ADSyc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-gUEk5bedP3OdSDzW3ZhDaw-1; Mon, 30 Jan 2023 06:25:39 -0500
X-MC-Unique: gUEk5bedP3OdSDzW3ZhDaw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DABB23C025D9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:25:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8209A492B01;
 Mon, 30 Jan 2023 11:25:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 10/11] ui: set cursor position upon listener registration
Date: Mon, 30 Jan 2023 15:24:30 +0400
Message-Id: <20230130112431.69559-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
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
---
 ui/console.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index 3fc8bf2fbc..6f87158c2d 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -94,6 +94,7 @@ struct QemuConsole {
     QemuUIInfo ui_info;
     QEMUTimer *ui_timer;
     QEMUCursor *cursor;
+    int cursor_x, cursor_y, cursor_on;
     const GraphicHwOps *hw_ops;
     void *hw;
 
@@ -1664,6 +1665,9 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     if (con->cursor && dcl->ops->dpy_cursor_define) {
         dcl->ops->dpy_cursor_define(dcl, con->cursor);
     }
+    if (dcl->ops->dpy_mouse_set) {
+        dcl->ops->dpy_mouse_set(dcl, con->cursor_x, con->cursor_y, con->cursor_on);
+    }
     text_console_update_cursor(NULL);
 }
 
@@ -1908,6 +1912,9 @@ void dpy_mouse_set(QemuConsole *con, int x, int y, int on)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    con->cursor_x = x;
+    con->cursor_y = y;
+    con->cursor_on = on;
     if (!qemu_console_is_visible(con)) {
         return;
     }
-- 
2.39.1


