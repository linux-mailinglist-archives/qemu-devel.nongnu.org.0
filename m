Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ADE3D2B99
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:00:37 +0200 (CEST)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6czs-0007xc-LK
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyF-0005As-Av
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyC-00068K-Qg
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKMAloDbSrO635HHxiPXxMG2SXVNhWvMxDfE+ax/uns=;
 b=OnTJ+xlksZggKC57HVsWsedaZ66WhRx/SQY5I0kCfAiORfv71lKGmqbYHSiJvuv606nzW0
 jWNEFiFhbb3vYnLQJN16QfGlYxDtSdrjHGEHJxsM/qYyb+fsb4Ca+nNUNo7pUco4Wxsrlp
 4H9B/f+ln+5R00wqeJxJ4EWwDSgL/Qs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-rbzGdDOlMHyBn2dNyZoVtg-1; Thu, 22 Jul 2021 13:58:51 -0400
X-MC-Unique: rbzGdDOlMHyBn2dNyZoVtg-1
Received: by mail-qv1-f70.google.com with SMTP id
 ff14-20020a0562140bceb02902fc3fd31414so65098qvb.16
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKMAloDbSrO635HHxiPXxMG2SXVNhWvMxDfE+ax/uns=;
 b=rjsByx/4+fzO+FKNsihsnGHCuoVjNOdPxwkt8BQhcwgOW0xkm+STC47/RUTEnkZ3GY
 1BrNwXBHfg/qNogvj5GJmxKZRZur7WZId/z6XEclFNlzcEaW1b5vzIvlHlqmGNiUzE1f
 Z9UEjBY03+xKJDsbPSg+qfqIOgYYzAjn+oiCbvVKH2dk/NLeVX0/mbVLKGtM/U6YKo0q
 fiZlL7UKnJvKazQo/PtUJ7cpSAuhzDQSkgousKqD8rTT1x75kmOoVanV/HYhxuYSYEwa
 mPTn8u7FdRLnEM5vLvk+pXLhd8ZFCztDV1zsdHds/S4KqndNSMA/Xcqs9Ttc1NIIrUjC
 vc2A==
X-Gm-Message-State: AOAM5312zpllqsXQC5xEQQvY721LRBK30SFV4aoTzuaot/IVDgIdOdTW
 /fXcR3+Kvg1cbuv4aj3yhrKT3SbjcYsJKngv/J8SYe7cFyUkaUn5yGJtHu2Rvz49HQtB05KH1Sv
 tp6idfmCAVh27776aheG2s3ICxrhPM33RfWyWygjDAH/0waWNuSJ8nPNYdkTzledF
X-Received: by 2002:a37:54f:: with SMTP id 76mr800295qkf.479.1626976730338;
 Thu, 22 Jul 2021 10:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztKipqOOvI0jY2llxpDVRbnGxi96GI55t11oHVeYT/485XOcAuIw83q8EQ9L84Hd9DePGTMw==
X-Received: by 2002:a37:54f:: with SMTP id 76mr800267qkf.479.1626976730073;
 Thu, 22 Jul 2021 10:58:50 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j20sm10418018qtq.14.2021.07.22.10.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:58:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] migration: Introduce migration_ioc_[un]register_yank()
Date: Thu, 22 Jul 2021 13:58:39 -0400
Message-Id: <20210722175841.938739-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722175841.938739-1-peterx@redhat.com>
References: <20210722175841.938739-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There're plenty of places in migration/* that checks against either socket or
tls typed ioc for yank operations.  Provide two helpers to hide all these
information.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
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


