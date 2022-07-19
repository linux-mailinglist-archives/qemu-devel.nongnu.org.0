Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4757A529
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:25:44 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqyc-0004gV-Mh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcY-0006gI-9p
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcW-0002wJ-Kn
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fETS35dlykFZMiHBXWl0FQ64NCM6fQprBKJi3bIY6Ig=;
 b=BFXek7ut0iEarKu0oueiinYNB2d+WldxVsrXEyLjZn5iL7lvLvBpemrR2iyNGM0AEBZm2W
 UVuwe9un2XFz0ii2Oj+wajNmI3O47q9lha4ndhEmDd+MLensrtRju/pxkdjemxu7DbRXAP
 LXmP9qd148+O+Kd9v+Rs2+lIvTZ6P3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-wJmVRCmcNMGq9In4CEjnMA-1; Tue, 19 Jul 2022 13:02:46 -0400
X-MC-Unique: wJmVRCmcNMGq9In4CEjnMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C08E811E81;
 Tue, 19 Jul 2022 17:02:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 420FA40CFD0B;
 Tue, 19 Jul 2022 17:02:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 16/29] migration: Add helpers to detect TLS capability
Date: Tue, 19 Jul 2022 18:02:08 +0100
Message-Id: <20220719170221.576190-17-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
References: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Peter Xu <peterx@redhat.com>

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS, leveraging the recently introduced migrate_use_tls().  No
functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220707185513.27421-1-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c   | 9 ++-------
 migration/migration.c | 1 +
 migration/multifd.c   | 4 +---
 migration/tls.c       | 9 +++++++++
 migration/tls.h       | 4 ++++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 90087d8986..1b0815039f 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,9 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (migrate_use_tls() &&
-        !object_dynamic_cast(OBJECT(ioc),
-                             TYPE_QIO_CHANNEL_TLS)) {
+    if (migrate_channel_requires_tls_upgrade(ioc)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
@@ -70,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls_upgrade(ioc)) {
             migration_tls_channel_connect(s, ioc, hostname, &error);
 
             if (!error) {
diff --git a/migration/migration.c b/migration/migration.c
index 864164ad96..cc41787079 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -48,6 +48,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "io/channel-buffer.h"
+#include "io/channel-tls.h"
 #include "migration/colo.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..1e49594b02 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -831,9 +831,7 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (migrate_use_tls() &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls_upgrade(ioc)) {
             multifd_tls_channel_connect(p, ioc, &error);
             if (!error) {
                 /*
diff --git a/migration/tls.c b/migration/tls.c
index 32c384a8b6..73e8c9d3c2 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
                               NULL,
                               NULL);
 }
+
+bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc)
+{
+    if (!migrate_use_tls()) {
+        return false;
+    }
+
+    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
diff --git a/migration/tls.h b/migration/tls.h
index de4fe2cafd..98e23c9b0e 100644
--- a/migration/tls.h
+++ b/migration/tls.h
@@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
                                    QIOChannel *ioc,
                                    const char *hostname,
                                    Error **errp);
+
+/* Whether the QIO channel requires further TLS handshake? */
+bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc);
+
 #endif
-- 
2.36.1


