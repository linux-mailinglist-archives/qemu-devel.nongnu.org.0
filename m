Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D92F47A6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:33:41 +0100 (CET)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcX6-0007Vs-Nd
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUm-0005mF-UU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUh-0002w7-5j
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610530270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+mhYbQMvbCArKcO6oUbSAe+a6SOuQxc5n96c2USsKo=;
 b=VBb9J4QWtUYRS7OWJenxFj+EPRYSQDZL3Eeiu56lQGixBQzcIUkl4er2al0y0MiP8g310I
 WPr4OVy609gg/zOZPXTO6Altaep+Z18Ztuc2lgRHC+lMaa5fkuAC1K2USPV6FoCc09t1ye
 5TBE3vUdRj6yFCMvXEMKbwS9ijouakw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-V8RSYQyONaOe4lBUV_DyEg-1; Wed, 13 Jan 2021 04:31:08 -0500
X-MC-Unique: V8RSYQyONaOe4lBUV_DyEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CFD800050;
 Wed, 13 Jan 2021 09:31:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1637560938;
 Wed, 13 Jan 2021 09:31:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F8881138617; Wed, 13 Jan 2021 10:31:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] migration: Add yank feature
Date: Wed, 13 Jan 2021 10:30:58 +0100
Message-Id: <20210113093101.550964-5-armbru@redhat.com>
In-Reply-To: <20210113093101.550964-1-armbru@redhat.com>
References: <20210113093101.550964-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, lukasstraub2@web.de,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Register yank functions on sockets to shut them down.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <484c6a14cc2506bebedd5a237259b91363ff8f88.1609167865.git.lukasstraub2@web.de>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/channel.c           | 13 +++++++++++++
 migration/migration.c         | 22 ++++++++++++++++++++++
 migration/multifd.c           | 10 ++++++++++
 migration/qemu-file-channel.c |  7 +++++++
 migration/savevm.c            |  5 +++++
 5 files changed, 57 insertions(+)

diff --git a/migration/channel.c b/migration/channel.c
index 8a783baa0b..35fe234e9c 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -18,6 +18,8 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "io/channel-tls.h"
+#include "io/channel-socket.h"
+#include "qemu/yank.h"
 
 /**
  * @migration_channel_process_incoming - Create new incoming migration channel
@@ -35,6 +37,11 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
+    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
+        yank_register_function(MIGRATION_YANK_INSTANCE, yank_generic_iochannel,
+                               QIO_CHANNEL(ioc));
+    }
+
     if (s->parameters.tls_creds &&
         *s->parameters.tls_creds &&
         !object_dynamic_cast(OBJECT(ioc),
@@ -67,6 +74,12 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
+        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
+            yank_register_function(MIGRATION_YANK_INSTANCE,
+                                   yank_generic_iochannel,
+                                   QIO_CHANNEL(ioc));
+        }
+
         if (s->parameters.tls_creds &&
             *s->parameters.tls_creds &&
             !object_dynamic_cast(OBJECT(ioc),
diff --git a/migration/migration.c b/migration/migration.c
index a5da718baa..d5136419bf 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -57,6 +57,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "qemu/yank.h"
 
 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -255,6 +256,8 @@ void migration_incoming_state_destroy(void)
         qapi_free_SocketAddressList(mis->socket_address_list);
         mis->socket_address_list = NULL;
     }
+
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
 static void migrate_generate_event(int new_state)
@@ -416,6 +419,10 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -430,6 +437,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -1731,6 +1739,7 @@ static void migrate_fd_cleanup(MigrationState *s)
     }
     notifier_list_notify(&migration_state_notifiers, s);
     block_cleanup_parameters(s);
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
 static void migrate_fd_cleanup_schedule(MigrationState *s)
@@ -2005,6 +2014,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
+    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }
 
@@ -2148,6 +2158,12 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         return;
     }
 
+    if (!(has_resume && resume)) {
+        if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+            return;
+        }
+    }
+
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
@@ -2161,6 +2177,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
     } else {
+        if (!(has_resume && resume)) {
+            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        }
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
                    "a valid migration protocol");
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
@@ -2170,6 +2189,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     }
 
     if (local_err) {
+        if (!(has_resume && resume)) {
+            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        }
         migrate_fd_error(s, local_err);
         error_propagate(errp, local_err);
         return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 45c690aa11..1a1e589064 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -25,6 +25,9 @@
 #include "trace.h"
 #include "multifd.h"
 
+#include "qemu/yank.h"
+#include "io/channel-socket.h"
+
 /* Multiple fd's */
 
 #define MULTIFD_MAGIC 0x11223344U
@@ -974,6 +977,13 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
+        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
+            && OBJECT(p->c)->ref == 1) {
+            yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                     yank_generic_iochannel,
+                                     QIO_CHANNEL(p->c));
+        }
+
         object_unref(OBJECT(p->c));
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index d2ce32f4b9..afc3a7f642 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -27,6 +27,7 @@
 #include "qemu-file.h"
 #include "io/channel-socket.h"
 #include "qemu/iov.h"
+#include "qemu/yank.h"
 
 
 static ssize_t channel_writev_buffer(void *opaque,
@@ -104,6 +105,12 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc = QIO_CHANNEL(opaque);
     ret = qio_channel_close(ioc, errp);
+    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
+        && OBJECT(ioc)->ref == 1) {
+        yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                 yank_generic_iochannel,
+                                 QIO_CHANNEL(ioc));
+    }
     object_unref(OBJECT(ioc));
     return ret;
 }
diff --git a/migration/savevm.c b/migration/savevm.c
index 27e842812e..4f3b69ecfc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -62,6 +62,7 @@
 #include "migration/colo.h"
 #include "qemu/bitmap.h"
 #include "net/announce.h"
+#include "qemu/yank.h"
 
 const unsigned int postcopy_ram_discard_version;
 
@@ -3006,6 +3007,10 @@ int load_snapshot(const char *name, Error **errp)
     qemu_system_reset(SHUTDOWN_CAUSE_NONE);
     mis->from_src_file = f;
 
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        ret = -EINVAL;
+        goto err_drain;
+    }
     aio_context_acquire(aio_context);
     ret = qemu_loadvm_state(f);
     migration_incoming_state_destroy();
-- 
2.26.2


