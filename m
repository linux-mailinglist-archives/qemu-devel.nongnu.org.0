Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32846E5E0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:46:50 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvG0n-00028Z-W9
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFui-0001EF-74
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuU-0008N0-6b
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfXfBsToD0+qcYWGy5JM4yO2gVY45hZvZa4JsqMhZsk=;
 b=Mw1or5XIOCKjLL2IXLUa72TKfbF7emtO6rMzGxuxwHdkV0nVSxCfPCblTNLVzF0IKs8JGX
 +h+AsmPvNVBZ0f2eVCV+dZHRicezRhkYGKBSIZM6VxwqRJtgNyXUX+WBdY2rviONIjJyBl
 TdGIeIYzVsTESREHyP7uoJpnyfkaiOM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248--EnvzmEONMSXKzz46tAi0g-1; Thu, 09 Dec 2021 04:40:16 -0500
X-MC-Unique: -EnvzmEONMSXKzz46tAi0g-1
Received: by mail-vk1-f199.google.com with SMTP id
 m190-20020a1feec7000000b002fa5912bcd7so2923187vkh.21
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfXfBsToD0+qcYWGy5JM4yO2gVY45hZvZa4JsqMhZsk=;
 b=J1uIgJOSohTZur6GOtdnWVPofgj9SCw3znLxgmNARS2CDolbtq4zGSrFdjBHkHId6d
 4szxKQyhWj4MkFT0fgoVbfBxZ15H/F+1MwV+4a2icDrZk26qh038nAbdBLB4vqkyWr5y
 gcej0MOvUbMZEZ3N9QnlXFtWKQ10BrZjvmlJ3pt8ka81+RvFuurz2D6QIeEGN9/+uN4d
 xxB9+zO7B/UNEZiXM77hLnpI6noltFiDEJ4MQkK3IAU8k85kRvwP3rnfX+dabJrt17Ps
 /GQYj7ODFAbnuzjYgXHr6Bm71bILfrWqwCbF+1VycDFklj5/AlkfihPDZj56CVcXNI/b
 JvsA==
X-Gm-Message-State: AOAM532w1IMd9KSu/iiM2tE65KvvtlLqsN3bZb5g/RBRuJLOQyuGMfEO
 qSWN0uePdLehLbbrd9h7kDdL7EO6VlR8npp4rFDUSv+Ij7WLs4/rZavCIDS4TDC343zRzJdZM+q
 Ku0AelIT8JU/kB2Q=
X-Received: by 2002:a05:6102:3ed1:: with SMTP id
 n17mr5981551vsv.3.1639042815941; 
 Thu, 09 Dec 2021 01:40:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqprxE7tyyxid4tLcY7kQh146rFIr2WEKeXv6gr4pCuReHc2HfhRG17dJdlF/OVShbIytMuQ==
X-Received: by 2002:a05:6102:3ed1:: with SMTP id
 n17mr5981529vsv.3.1639042815796; 
 Thu, 09 Dec 2021 01:40:15 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:15 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 5/6] migration: Add migrate_use_tls() helper
Date: Thu,  9 Dec 2021 06:39:23 -0300
Message-Id: <20211209093923.1293701-6-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209093923.1293701-1-leobras@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
index 109d11e4a1..8e50f7508a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2565,6 +2565,15 @@ bool migrate_use_zero_copy(void)
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
index 7c9deb1921..b32b756147 100644
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


