Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A93358E56
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:28:04 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbFz-0003r6-MH
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbEp-0002yc-Pl
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUbEe-0007Va-HC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617913599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKFQOns4Uybc/3ZXVdsQzg+/YitpDdAbNmwhDNQJtBo=;
 b=EXJ0SMjlqbw/cSPIBTjUkAt38IO5x+US8Zf203PvNgtzUOSCyHazr405Y4xQ0RvMBlNcSX
 ktZ6F+iD7ba4zbxUC3Cg2D+Mj/dSd3gLem3TfC5Gm8r1lFdyP56/zzmanyuULEe6BI+yDP
 EruFJHejXlVJ5KJad7XyFMWlpgIOzjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-AOWM5ij7PhGirSOT8Kkytg-1; Thu, 08 Apr 2021 16:26:37 -0400
X-MC-Unique: AOWM5ij7PhGirSOT8Kkytg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B469A19A9A20
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 19:12:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-38.ams2.redhat.com
 [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67CB25D9E3;
 Thu,  8 Apr 2021 19:12:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [RFC PATCH 4/5] migration/socket: Close the listener at the end
Date: Thu,  8 Apr 2021 20:11:58 +0100
Message-Id: <20210408191159.133644-5-dgilbert@redhat.com>
In-Reply-To: <20210408191159.133644-1-dgilbert@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Delay closing the listener until the cleanup hook at the end; mptcp
needs the listener to stay open while the other paths come in.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c |  5 +++++
 migration/socket.c  | 24 ++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index a6677c45c8..cebd9029b9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1165,6 +1165,11 @@ bool multifd_recv_all_channels_created(void)
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


