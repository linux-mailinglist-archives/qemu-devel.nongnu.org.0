Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F743D59CB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:51:10 +0200 (CEST)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m804b-0003r6-TA
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxm-0000Jw-9S
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxf-0007rn-Ns
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/gl5wfsyWRK+zKZ13uSTxhB2b9wzq8TiiOdh9by1cI=;
 b=dq1qmJEqFMArLHhbqtrMV6cvRTm7laWdtc9wwmmi+kdct/WfE118DFfOvNPLILwhlCdlgc
 y62gtMjIX9FBi2X7wj8chcLLThYt46JENPvPiJxAtf9O8dAXyNI7YxZT6hrCYfKaiFI/2N
 DAn66/kj4xlQCNXjO/8HQA5DWSAdqi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-ZTxtfoenNn2-ywjqX18gnQ-1; Mon, 26 Jul 2021 08:43:57 -0400
X-MC-Unique: ZTxtfoenNn2-ywjqX18gnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A974F80292B;
 Mon, 26 Jul 2021 12:43:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35A3A60C4A;
 Mon, 26 Jul 2021 12:43:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 4/7] migration: Introduce migration_ioc_[un]register_yank()
Date: Mon, 26 Jul 2021 13:43:28 +0100
Message-Id: <20210726124331.124710-5-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

There're plenty of places in migration/* that checks against either socket or
tls typed ioc for yank operations.  Provide two helpers to hide all these
information.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210722175841.938739-4-peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c           | 15 ++-------------
 migration/multifd.c           |  8 ++------
 migration/qemu-file-channel.c |  8 ++------
 migration/yank_functions.c    | 28 ++++++++++++++++++++++++++++
 migration/yank_functions.h    |  2 ++
 5 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 01275a9162..c4fc000a1a 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -44,13 +44,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
-        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
-            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
-            yank_register_function(MIGRATION_YANK_INSTANCE,
-                                   migration_yank_iochannel,
-                                   QIO_CHANNEL(ioc));
-        }
-
+        migration_ioc_register_yank(ioc);
         migration_ioc_process_incoming(ioc, &local_err);
     }
 
@@ -94,12 +88,7 @@ void migration_channel_connect(MigrationState *s,
         } else {
             QEMUFile *f = qemu_fopen_channel_output(ioc);
 
-            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
-                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
-                yank_register_function(MIGRATION_YANK_INSTANCE,
-                                       migration_yank_iochannel,
-                                       QIO_CHANNEL(ioc));
-            }
+            migration_ioc_register_yank(ioc);
 
             qemu_mutex_lock(&s->qemu_file_lock);
             s->to_dst_file = f;
diff --git a/migration/multifd.c b/migration/multifd.c
index ab41590e71..377da78f5b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -987,12 +987,8 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
-             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
-            && OBJECT(p->c)->ref == 1) {
-            yank_unregister_function(MIGRATION_YANK_INSTANCE,
-                                     migration_yank_iochannel,
-                                     QIO_CHANNEL(p->c));
+        if (OBJECT(p->c)->ref == 1) {
+            migration_ioc_unregister_yank(p->c);
         }
 
         object_unref(OBJECT(p->c));
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index fad340ea7a..867a5ed0c3 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -107,12 +107,8 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc = QIO_CHANNEL(opaque);
     ret = qio_channel_close(ioc, errp);
-    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
-         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
-        && OBJECT(ioc)->ref == 1) {
-        yank_unregister_function(MIGRATION_YANK_INSTANCE,
-                                 migration_yank_iochannel,
-                                 QIO_CHANNEL(ioc));
+    if (OBJECT(ioc)->ref == 1) {
+        migration_ioc_unregister_yank(ioc);
     }
     object_unref(OBJECT(ioc));
     return ret;
diff --git a/migration/yank_functions.c b/migration/yank_functions.c
index 96c90e17dc..23697173ae 100644
--- a/migration/yank_functions.c
+++ b/migration/yank_functions.c
@@ -11,6 +11,9 @@
 #include "qapi/error.h"
 #include "io/channel.h"
 #include "yank_functions.h"
+#include "qemu/yank.h"
+#include "io/channel-socket.h"
+#include "io/channel-tls.h"
 
 void migration_yank_iochannel(void *opaque)
 {
@@ -18,3 +21,28 @@ void migration_yank_iochannel(void *opaque)
 
     qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
 }
+
+/* Return whether yank is supported on this ioc */
+static bool migration_ioc_yank_supported(QIOChannel *ioc)
+{
+    return object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+        object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
+
+void migration_ioc_register_yank(QIOChannel *ioc)
+{
+    if (migration_ioc_yank_supported(ioc)) {
+        yank_register_function(MIGRATION_YANK_INSTANCE,
+                               migration_yank_iochannel,
+                               QIO_CHANNEL(ioc));
+    }
+}
+
+void migration_ioc_unregister_yank(QIOChannel *ioc)
+{
+    if (migration_ioc_yank_supported(ioc)) {
+        yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                 migration_yank_iochannel,
+                                 QIO_CHANNEL(ioc));
+    }
+}
diff --git a/migration/yank_functions.h b/migration/yank_functions.h
index 055ea22523..74c7f18c91 100644
--- a/migration/yank_functions.h
+++ b/migration/yank_functions.h
@@ -15,3 +15,5 @@
  * @opaque: QIOChannel to shutdown
  */
 void migration_yank_iochannel(void *opaque);
+void migration_ioc_register_yank(QIOChannel *ioc);
+void migration_ioc_unregister_yank(QIOChannel *ioc);
-- 
2.31.1


