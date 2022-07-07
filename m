Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B546F56AB89
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:10:08 +0200 (CEST)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Wt5-0000tt-JR
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wep-0005u0-4s
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wel-0001d2-08
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=540YHl4vbNEoceJeIl9C/p7RZrCYqlHgo1ki0gch8bM=;
 b=TR6P/xtgBFaG1/uxNYBhaavffsEc3Whg8w1Ri5jXSXyBMZ95PcdXNUgyQlhBEy/9m3aFUF
 OCkimgO+i4LpWJj/+o+qvhNWqmbL7PI+LgUd9awYKsx0NRxI8RtUBXEzn4JA2wCtLrWeSe
 TxTtS70VC0+QB6Yf8aDMWLpyu30Haoo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-u5shTf3HNz6Djzeg83W9Iw-1; Thu, 07 Jul 2022 14:55:16 -0400
X-MC-Unique: u5shTf3HNz6Djzeg83W9Iw-1
Received: by mail-qt1-f198.google.com with SMTP id
 m4-20020aed27c4000000b0031b0ef018aaso16480460qtg.20
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=540YHl4vbNEoceJeIl9C/p7RZrCYqlHgo1ki0gch8bM=;
 b=GPAXqhhnwgfUz397xWW8oDUeh5yfu4nNONuqVguEVPp2cayHxrk+Gnl3+vjcfVZDSL
 YUSNfbsy1q7JAKQWfN1ozxPrjV24/sNrxPkkiNsmrYKjQgrsEF+/uJJLqPJtVd3xBS+X
 y5PW0l3mZDv8yh9l7MdlPa7n60nkk0RlvO9pYeTbTZp9tOwdFo5m3o+5Vq/TzcFfhufM
 7GegkHeTFAQFdOIbEidSGvX8M4RuGIfHKzvELJQV2Ns/O4R3L43JKYibD2c8ZDWZ1ojs
 lh5IVMkjgVdxbk88+jBA5285N4RNQCESKhSrt6wcC09E6oUMvIaQ8QdxR8SJseOxjh80
 zz0Q==
X-Gm-Message-State: AJIora9pGZM1RELj5UtrunE23x1OiLd84l+FY4YeS+kTQSE4hDuwS4t/
 cldBC5KWo1X7MbVYYPrAEGlGXMNJEVpuUzSSs4b82QFW3AmdstSIRFgQNnBAuce6n+kjj47ZZ2W
 Zo41KDHerydky1TFa1spi0i/7TVMRQeuBF2QboYPpFMW4ErkVk+JSxbW1vrafQVh1
X-Received: by 2002:ac8:5fc3:0:b0:31d:2637:7ed6 with SMTP id
 k3-20020ac85fc3000000b0031d26377ed6mr36924165qta.282.1657220115957; 
 Thu, 07 Jul 2022 11:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upbr943NypILa8lQYqoqcNjMTycCEcNXdxgsiLJ788Eo6cfnyvxM76zBZdJ1Db0r4rmZjtuA==
X-Received: by 2002:ac8:5fc3:0:b0:31d:2637:7ed6 with SMTP id
 k3-20020ac85fc3000000b0031d26377ed6mr36924146qta.282.1657220115634; 
 Thu, 07 Jul 2022 11:55:15 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a430400b006a6d7c3a82esm32996749qko.15.2022.07.07.11.55.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 07/14] migration: Add helpers to detect TLS capability
Date: Thu,  7 Jul 2022 14:55:13 -0400
Message-Id: <20220707185513.27421-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS, leveraging the recently introduced migrate_use_tls().  No
functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
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
index e10f0400ef..fe77c7d0ef 100644
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
2.32.0


