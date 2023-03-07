Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709956ADE21
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVwk-0002hN-Fl; Tue, 07 Mar 2023 06:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwh-0002dZ-SM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwg-00036S-Iy
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VU2GS+OJItwdmT7dr8MxEEEEbWfKF5GqYz/ZMnZtEzw=;
 b=TFFa2nTor60fmXz8pN6kt4/5qaw9yXfqO72eFkkj2zQvMN0Hr8nv0/S+PIuP8TXUtbMoFN
 qGk8vz6iN3Zw7aijOu9qkxtn91G1oUlIKEvkOcq1QiGCHRjene1sNPI0cEAUv4XAGVCyS0
 VoxQGF2mlkN0poaqYZxnCpRou1X5T90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-ztbGUdpVP7SLgKeZDZaiEw-1; Tue, 07 Mar 2023 06:57:26 -0500
X-MC-Unique: ztbGUdpVP7SLgKeZDZaiEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57415280AA24;
 Tue,  7 Mar 2023 11:57:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D46F400DFA1;
 Tue,  7 Mar 2023 11:57:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 10/18] ui: set cursor position upon listener registration
Date: Tue,  7 Mar 2023 15:56:29 +0400
Message-Id: <20230307115637.2464377-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
---
 ui/console.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index 7b808f080e..8fc18c44bf 100644
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
     if (con->cursor && dcl->ops->dpy_cursor_define) {
         dcl->ops->dpy_cursor_define(dcl, con->cursor);
     }
+    if (dcl->ops->dpy_mouse_set) {
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


