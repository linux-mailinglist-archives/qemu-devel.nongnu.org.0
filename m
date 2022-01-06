Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A120486D1F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:19:59 +0100 (CET)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b70-0006AZ-3p
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1X-0005J9-6Z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1V-0006Hg-Gk
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coX2FGYNMRllSAimppdKkvpvVQ/fdZp6MWppRXlcVBo=;
 b=BQiJLRNlkUresv5e5kHuOg+QLXqAjPmk8Rrsk6qDUsh2nQ3USmOZNZKEj7EZ5iuS7x0eML
 y32vfry9YmulqtJpMe9ldgzDsNKA5gJ+ssBdBAXUktYLOfd3ao5Fej14FY3+34v0q6S0Xk
 oHLkvqazfABCsI854s7rzo+6R62UbfM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-ReXnwYyjNu6gNrtlDfG-mw-1; Thu, 06 Jan 2022 17:14:15 -0500
X-MC-Unique: ReXnwYyjNu6gNrtlDfG-mw-1
Received: by mail-vk1-f198.google.com with SMTP id
 az31-20020a0561220d1f00b003147de426a4so1081344vkb.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coX2FGYNMRllSAimppdKkvpvVQ/fdZp6MWppRXlcVBo=;
 b=lMoEY4wFLVZT+UrpdNO4k/a571yl5fEkJD9EOO4+u5LN9u6Juz5NyemlCQZje/uCwb
 XEr4K+0n0zUpS9eYRG0Ue6wSwN0+G/4HBPCJsSj0JAqrbxXFL7p6G3Wlrb3muHcOtI15
 6gUldqoYm55cqg+TMP3cz6q23kv+sS2Ht6spAGFrmmhgHuJpKPaPuL7BUdsmGC/ukylK
 ErenEKy9qj5NfqhLliM/8Z126g/sPQVMQeuLBCDwhaPWQ2aHekCepWkHoDWl3meaA6vQ
 P7OR8xNV3qiAgKEJxQ7THgdL/tyL9u99xyl48Cy2jW8lf88cn7bDJo3wasBLB8hgR3kd
 rLcQ==
X-Gm-Message-State: AOAM533GF/yrcWnUB1qrSnIED0zvfGtFB04LWcv5Y3QWbQLyWj3dYWPr
 OW77JuCPoYKvLxD0CGVPeIbJL8gPpDI2fKEwQRrcTaeu0knqCDF7+1M0L/PLAr6ApgJovBiBSv8
 jn8VQgTTMW1Qm+M4=
X-Received: by 2002:ac5:ce8c:: with SMTP id 12mr22364138vke.0.1641507254820;
 Thu, 06 Jan 2022 14:14:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY6ZpephSrqrRYmWKhNH0LcixnKo2eUVDbZGjcTryGE5XwmXaBNBj+uBO73tQoA8K+cejWMA==
X-Received: by 2002:ac5:ce8c:: with SMTP id 12mr22364131vke.0.1641507254666;
 Thu, 06 Jan 2022 14:14:14 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:cc01:fae1:7982:b010:d91])
 by smtp.gmail.com with ESMTPSA id c15sm2098831uaj.13.2022.01.06.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:14:14 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
Date: Thu,  6 Jan 2022 19:13:41 -0300
Message-Id: <20220106221341.8779-5-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106221341.8779-1-leobras@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h | 1 +
 migration/channel.c   | 6 +++---
 migration/migration.c | 9 +++++++++
 migration/multifd.c   | 5 +----
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 1489eeb165..445d95bbf2 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -344,6 +344,7 @@ bool migrate_use_zero_copy(void);
 #else
 #define migrate_use_zero_copy() (false)
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
index aa8f1dc835..7bcb800890 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2573,6 +2573,15 @@ bool migrate_use_zero_copy(void)
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
index 3242f688e5..677e942747 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -796,14 +796,11 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
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
2.34.1


