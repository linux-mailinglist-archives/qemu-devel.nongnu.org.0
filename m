Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA644E1B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:48:03 +0100 (CET)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPPu-0008GI-FS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHg-0006JT-Mx
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHe-0005PB-R9
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OkdTiv3J2pePe4KSIQPKnUIrz83JJ+uC2UUHOjg05k=;
 b=ZmlBTHdkL/v2Vxb6iaGwwgi4jPyXYJMv/zqacJlvJpgge0NyvuBK07NL5sRr4gEShyGJ+8
 i6FzCHLKu2+VHzasay4ssX9fypzgcOa/JW4mH+HcK10ty6n+lY4IQswiaCwrCQY/wO+LvR
 fkxbsqWAsEQve6YZkShA/GOlYbffiJo=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-MRNyESCHM2a421lrb8JJZA-1; Fri, 12 Nov 2021 00:39:28 -0500
X-MC-Unique: MRNyESCHM2a421lrb8JJZA-1
Received: by mail-ua1-f71.google.com with SMTP id
 43-20020a9f25ae000000b002cf28d7afd2so4183118uaf.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OkdTiv3J2pePe4KSIQPKnUIrz83JJ+uC2UUHOjg05k=;
 b=nb158R0dI1Gb1g3zy1FRaI7U7NU6A9AYIw+Aa+6eO8Zob4DcloqtcprqYBHXzd6e6S
 liZUKLC4sxzKla1eH/nIAXJ8Af77BH1/jtgq7XfQLqcFjYYif0aX+6LPw5bHX/cCdecq
 q4suLaveUoDShi0Zgynzsb9v8PwGOCaDkumFXIixc5UXsBJx4ytwIMlP/RefgNxsrKgR
 3/72Y8vfViK1pmpAJwPRkL75WNxstRVmk8X5SrFrIB3/EEjtIbeIi9RZ2J/AQLwA0m3O
 834m8mN8owZYXxW2ot2qtuicP/xy2N8NGpq7GUMI45nP6J5MuQ4oQABeGtAdoWl/BWPE
 2rhg==
X-Gm-Message-State: AOAM533gVqMcRPP4b4pRaR5F17atAh93fJ8B+RqqZVZvZU13FT4aqOE7
 ky2jpLzmlVnDVfokA/wOXkNGCnQrq8ojTjCdZuFOz2z+x6KWnDDMgJPBucnziZTztEhjDlqhLBC
 1HsmF9V+jliKGeGs=
X-Received: by 2002:a05:6122:786:: with SMTP id
 k6mr19107150vkr.26.1636695568229; 
 Thu, 11 Nov 2021 21:39:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8Jq0LncCxfT3WHoaFZKob17ghs9HYBjcql7gnurGZwyif0CGjOpFr05eK+kTkuk3KHRzg3w==
X-Received: by 2002:a05:6122:786:: with SMTP id
 k6mr19107121vkr.26.1636695568074; 
 Thu, 11 Nov 2021 21:39:28 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:27 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 5/6] migration: Add migrate_use_tls() helper
Date: Fri, 12 Nov 2021 02:10:40 -0300
Message-Id: <20211112051040.923746-6-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112051040.923746-1-leobras@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A lot of places check parameters.tls_creds in order to evaluate if TLS is
in use, and sometimes call migrate_get_current() just for that test.

Add new helper function migrate_use_tls() in order to simplify testing
for TLS usage.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/migration.h | 1 +
 migration/channel.c   | 6 +++---
 migration/migration.c | 9 +++++++++
 migration/multifd.c   | 5 +----
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index e61ef81f26..9f38419312 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -344,6 +344,7 @@ int migrate_use_zerocopy(void);
 #else
 #define migrate_use_zerocopy() (0)
 #endif
+int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/channel.c b/migration/channel.c
index c4fc000a1a..1a45b75d29 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -32,16 +32,16 @@
  */
 void migration_channel_process_incoming(QIOChannel *ioc)
 {
-    MigrationState *s = migrate_get_current();
     Error *local_err = NULL;
 
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (s->parameters.tls_creds &&
-        *s->parameters.tls_creds &&
+    if (migrate_use_tls() &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
+        MigrationState *s = migrate_get_current();
+
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
diff --git a/migration/migration.c b/migration/migration.c
index add3dabc56..20ca99d726 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2565,6 +2565,15 @@ int migrate_use_zerocopy(void)
 }
 #endif
 
+int migrate_use_tls(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
diff --git a/migration/multifd.c b/migration/multifd.c
index ab8f0f97be..3d9dc8cb58 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -794,14 +794,11 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
+        if (migrate_use_tls() &&
             !object_dynamic_cast(OBJECT(ioc),
                                  TYPE_QIO_CHANNEL_TLS)) {
             multifd_tls_channel_connect(p, ioc, &error);
-- 
2.33.1


