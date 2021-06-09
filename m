Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FE3A17EB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:51:28 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzYF-0006Mt-G4
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSl-00034p-1f
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSh-0005Nb-Q6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vghlMDGG5TpIGy/P4pElI/Q9CxDqkT3r/xWcpPz2mW0=;
 b=ZUctg8DUdPoLIEytwRazrSKucHpMKfhx6sodk4jSk/llUgKMWka1c6gdw+9v87Bt8LTQWy
 NZMzfzRT5zxxaxBgzLEPoCYddVbLkAnTyylvhLM4uJfQumN4Gy9lEEufkyn5dH4odIPacv
 Za5Cc7wPGr0c/ybWZB84FTg8+yF+UbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-YLlcsxRyMpyVXCW3-uzWAA-1; Wed, 09 Jun 2021 10:45:41 -0400
X-MC-Unique: YLlcsxRyMpyVXCW3-uzWAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96DC31934100;
 Wed,  9 Jun 2021 14:45:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0345410016F4;
 Wed,  9 Jun 2021 14:45:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 6/9] migration/socket: Close the listener at the end
Date: Wed,  9 Jun 2021 15:45:09 +0100
Message-Id: <20210609144512.211746-7-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Delay closing the listener until the cleanup hook at the end; mptcp
needs the listener to stay open while the other paths come in.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210421112834.107651-5-dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c |  5 +++++
 migration/socket.c  | 24 ++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 2e8f001bc0..ab41590e71 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1166,6 +1166,11 @@ bool multifd_recv_all_channels_created(void)
         return true;
     }
 
+    if (!multifd_recv_state) {
+        /* Called before any connections created */
+        return false;
+    }
+
     return thread_count == qatomic_read(&multifd_recv_state->count);
 }
 
diff --git a/migration/socket.c b/migration/socket.c
index 6016642e04..05705a32d8 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -126,22 +126,31 @@ static void socket_accept_incoming_migration(QIONetListener *listener,
 {
     trace_migration_socket_incoming_accepted();
 
-    qio_channel_set_name(QIO_CHANNEL(cioc), "migration-socket-incoming");
-    migration_channel_process_incoming(QIO_CHANNEL(cioc));
-
     if (migration_has_all_channels()) {
-        /* Close listening socket as its no longer needed */
-        qio_net_listener_disconnect(listener);
-        object_unref(OBJECT(listener));
+        error_report("%s: Extra incoming migration connection; ignoring",
+                     __func__);
+        return;
     }
+
+    qio_channel_set_name(QIO_CHANNEL(cioc), "migration-socket-incoming");
+    migration_channel_process_incoming(QIO_CHANNEL(cioc));
 }
 
+static void
+socket_incoming_migration_end(void *opaque)
+{
+    QIONetListener *listener = opaque;
+
+    qio_net_listener_disconnect(listener);
+    object_unref(OBJECT(listener));
+}
 
 static void
 socket_start_incoming_migration_internal(SocketAddress *saddr,
                                          Error **errp)
 {
     QIONetListener *listener = qio_net_listener_new();
+    MigrationIncomingState *mis = migration_incoming_get_current();
     size_t i;
     int num = 1;
 
@@ -156,6 +165,9 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
         return;
     }
 
+    mis->transport_data = listener;
+    mis->transport_cleanup = socket_incoming_migration_end;
+
     qio_net_listener_set_client_func_full(listener,
                                           socket_accept_incoming_migration,
                                           NULL, NULL,
-- 
2.31.1


