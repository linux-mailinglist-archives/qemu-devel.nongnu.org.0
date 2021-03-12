Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CD338A28
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:32:33 +0100 (CET)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf5s-0000vM-Mj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKegB-00043S-BC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeg8-0004i6-7i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ew4o0fCxQ1bs3uawov35sEUBDjwdabNRDce1/V/7Zk=;
 b=jTAVXycjq9nms/HVOm+8IKaKFCW0cvrp+INoqQkB0tztY6X2MzrpvasEdvJLCjrK+1WWDq
 +9RhPHjxKc2Rm3lkl7IBo+eJBlUIrTsjyxDsNwiyYEIvVLIXWwHQiV8GQ7GXcTY/2VJ2Wy
 VWoxC3LzGwEbRwz4fp+L+STWiJc5BWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-DmZezW-aNi60ndqaZk9Bpw-1; Fri, 12 Mar 2021 05:05:53 -0500
X-MC-Unique: DmZezW-aNi60ndqaZk9Bpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A103B18460E2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:05:52 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3704F5DAA5;
 Fri, 12 Mar 2021 10:05:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 24/27] ui: add GraphicHwOps.register_dbus_listener()
Date: Fri, 12 Mar 2021 14:01:05 +0400
Message-Id: <20210312100108.2706195-25-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/console.c         | 11 +++++++++++
 ui/dbus-console.c    |  5 ++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 31141955d9..0ad0d3ad66 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -429,6 +429,7 @@ typedef struct GraphicHwOps {
     void (*update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
+    bool (*register_dbus_listener)(void *opaque, QemuConsole *console, int fd);
 } GraphicHwOps;
 
 QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
@@ -444,6 +445,7 @@ void graphic_hw_update_done(QemuConsole *con);
 void graphic_hw_invalidate(QemuConsole *con);
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata);
 void graphic_hw_gl_block(QemuConsole *con, bool block);
+bool graphic_hw_register_dbus_listener(QemuConsole *con, int fd);
 
 void qemu_console_early_init(void);
 
diff --git a/ui/console.c b/ui/console.c
index 3c3be032ad..8c2a29a5d8 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -320,6 +320,17 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
     }
 }
 
+bool graphic_hw_register_dbus_listener(QemuConsole *con, int fd)
+{
+    assert(con != NULL);
+
+    if (con->hw_ops->register_dbus_listener) {
+        return con->hw_ops->register_dbus_listener(con->hw, con, fd);
+    }
+
+    return false;
+}
+
 int qemu_console_get_window_id(QemuConsole *con)
 {
     return con->window_id;
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 3487a8f5cb..eaae914199 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -242,10 +242,13 @@ dbus_console_register_listener(DBusDisplayConsole *self,
         close(fd);
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
-    socket_conn = g_socket_connection_factory_create_connection(socket);
     /* return now: easier for the other end, as it may handle priv dbus synchronously */
     dbus_display_display1_console_complete_register_listener(self->iface, invocation, NULL);
 
+    if (graphic_hw_register_dbus_listener(self->con, fd)) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+    socket_conn = g_socket_connection_factory_create_connection(socket);
     listener_conn = g_dbus_connection_new_sync(G_IO_STREAM(socket_conn),
                                                guid,
                                                G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
-- 
2.29.0


