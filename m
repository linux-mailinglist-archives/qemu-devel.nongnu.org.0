Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4B3669F0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:32:16 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZB5b-0006A5-5c
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB3L-0004c1-Sz
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB3K-0000fo-7A
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619004593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0ULvFUc+8wygy2rEDUBjdOaQWsj2vdAkDbIIEwVpSA=;
 b=Ii6mCOTv4yDjCwcb8VBA1X825owqMvyVR3dAglfqWPIwSMQJiyoJpQxS+IJBfLHm80d6KF
 UBLmyhSCfhg0GK/8nb+ufa5lIqzb9ewQDHIDxTWHfUrjvcWDwOLJloeaKUy7GaYjy/Q1Oi
 liaP0yaDzQk11AEfnGSBH2HlunZdCSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-lyS0vncjN_WVwg_qyZxwWQ-1; Wed, 21 Apr 2021 07:29:46 -0400
X-MC-Unique: lyS0vncjN_WVwg_qyZxwWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 807E48BAB73
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:28:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-29.ams2.redhat.com
 [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34CF5B6BE;
 Wed, 21 Apr 2021 11:28:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [PATCH v2 4/5] migration/socket: Close the listener at the end
Date: Wed, 21 Apr 2021 12:28:33 +0100
Message-Id: <20210421112834.107651-5-dgilbert@redhat.com>
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Delay closing the listener until the cleanup hook at the end; mptcp
needs the listener to stay open while the other paths come in.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


