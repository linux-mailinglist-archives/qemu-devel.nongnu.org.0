Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABE54517E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:03:13 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKcp-00021Q-NO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nzK3r-0006la-DG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nzK3p-0000eE-GQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fHUR3mBsZkn4Z5H5KmLKNpVXQmMut9sF7EYLdAcPnMs=;
 b=X34kEjUa4GH8C1kPTARgSUkoeJyNtDZf1yZ4SkSwR5+uKq4lqCbjwiDdhNJ17PB0VsbdrL
 AuusjLTZAqNsBAxXAfFLFO+acgHnXBB68pIggU0w2vKERpaDrJoSC319eWQfB6RL3RXBN3
 JUNH3KE0cSt8CCMLltmjOUzAi3OEydE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-zhxfPvhOO1yQ8wLdgcYkKA-1; Thu, 09 Jun 2022 11:26:53 -0400
X-MC-Unique: zhxfPvhOO1yQ8wLdgcYkKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7602804194
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 15:26:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B7D1415102;
 Thu,  9 Jun 2022 15:26:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: crobinso@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] dbus-display: fix test race when initializing p2p connection
Date: Thu,  9 Jun 2022 19:26:47 +0400
Message-Id: <20220609152647.870373-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The D-Bus connection starts processing messages before QEMU has the time
to set the object manager server. This is causing dbus-display-test to
fail randomly with:

ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
assertion failed
(qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) ==
"dbus-test"): (NULL == "dbus-test") ERROR

Use the delayed message processing flag and method to avoid that
situation.

(the bus connection doesn't need a fix, as the initialization is done
synchronously)

Reported-by: Robinson, Cole <crobinso@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/dbus.c b/ui/dbus.c
index 7a87612379e8..70dd4be210e4 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -268,6 +268,7 @@ dbus_display_add_client_ready(GObject *source_object,
     }
 
     g_dbus_object_manager_server_set_connection(dbus_display->server, conn);
+    g_dbus_connection_start_message_processing(conn);
 }
 
 
@@ -300,7 +301,8 @@ dbus_display_add_client(int csock, Error **errp)
 
     g_dbus_connection_new(G_IO_STREAM(conn),
                           guid,
-                          G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+                          G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER|
+                          G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING,
                           NULL,
                           dbus_display->add_client_cancellable,
                           dbus_display_add_client_ready,
-- 
2.36.0.44.g0f828332d5ac


