Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77063D0663
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:26:21 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6108-0001hp-SX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vj-0003aR-H3
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vh-0003y6-ME
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626830504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVCGmv6jR/2/IaCTxHNy9cCERfh0z7TA+UiHJWJESTw=;
 b=Qvls33Sk5EINUMI1qPMXVERLALYpuHUVSvlSP1MwPwiy1KuB3lz+H3sro9haA2rrNkGSsz
 Fy1Kkf07RVvTWG2pujmmbVY5qRdAX2ElGgWxr0UCQ+5mso11qqv4ENT8km54o8T4V05tx1
 +v+a4N7oSKeiws6gXAH4ZATEzdhgpcY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-sYhsZjFUOaix7wjw39BzeA-1; Tue, 20 Jul 2021 21:21:43 -0400
X-MC-Unique: sYhsZjFUOaix7wjw39BzeA-1
Received: by mail-qt1-f200.google.com with SMTP id
 l19-20020a05622a1753b0290269bd8044e1so822298qtk.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVCGmv6jR/2/IaCTxHNy9cCERfh0z7TA+UiHJWJESTw=;
 b=Kmy996G6otpiHg8npO6ZyuBXuymOH9ydU9vsJu+Ed4SXjTbPW34SJsrmiIqn4CWIUA
 6tZXtV+ZBqtITaOcxFsPe5Zewkq75vJEWgW/wtKfyNSyeSWv8Ha9PEQIKQTRAt6HHAxH
 YlDkBTeQAtSoAw9eWod7+O2z2Rss4SEGEL2ofh/TJ6LFs5HlPoJEukhxP8cJCbb9jEvS
 BMX06ahDCn9TIBVXVEzLNXUjA+wyj9mZ/TzQu8IC/1Rz4rq02HgBID2X7UHpe1q4cfzE
 7OVHBF/xuG6Xn91cVSehU3cR6w7W1a7WksM3MIsSm8wb8PaBZptMCOq7LCbMCOV92qVi
 eBhQ==
X-Gm-Message-State: AOAM5306Cs3F9AOR/L6RH7JnQo9IRyK6X5fzgBPGOBf/tKCultl2QiuA
 oXDWilCkYwdh+rBje9zEKh8SDZDUhkJzX3Bj9bGRmzJkVRCh+TYeFoU6YuyfLnK2c/u0UJ1LRuG
 cOFbou78fIv3CezS/VEbPe04D/OAA0kWFmulozjE1rfNcSSYfeZWbjkD7VCq7q4B2
X-Received: by 2002:a0c:85a3:: with SMTP id o32mr33850042qva.42.1626830502762; 
 Tue, 20 Jul 2021 18:21:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf7Y43vCLvngzhSq9/mARfEfxSQuiiTgYyKhMKF5F3KltqBAWBfc6Bi0wqop6FL2Ln3TFX5w==
X-Received: by 2002:a0c:85a3:: with SMTP id o32mr33850015qva.42.1626830502502; 
 Tue, 20 Jul 2021 18:21:42 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t26sm8399469qtc.44.2021.07.20.18.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 18:21:42 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] migration: Introduce migration_ioc_[un]register_yank()
Date: Tue, 20 Jul 2021 21:21:32 -0400
Message-Id: <20210721012134.792845-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721012134.792845-1-peterx@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There're plenty of places in migration/* that checks against either socket or
tls typed ioc for yank operations.  Provide two helpers to hide all these
information.

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


