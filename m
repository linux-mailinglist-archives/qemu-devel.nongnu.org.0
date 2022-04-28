Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C596D51396B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:09:36 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6hz-0005cU-G3
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KW-00064K-1S
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KU-0006ah-Cb
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651156873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3oxzf4qJrlVIMhiFC7+YceYdGNc77SZiKBD4CeCD7U=;
 b=gZQTF5F4C+0sSSD54hpPdFqvSu1ISnZWg+kcjx4vggXLWI+MUqbUFNzG8kNDiC++gRUybt
 alr4OGrlzZmLmqPgEd2Q/ChBSjrY76dB1CIVDxx+qqV0nPP4fXACvuQGKK5k18SS7fZ9xJ
 yZV8mrzbVnAYZX9DKjLrGurTFmzdUkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-Vh1RijtjMPyqt2-L-NNHow-1; Thu, 28 Apr 2022 10:41:12 -0400
X-MC-Unique: Vh1RijtjMPyqt2-L-NNHow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0834880005D
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:41:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21271407DEC3;
 Thu, 28 Apr 2022 14:41:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 08/11] migration: Add migrate_use_tls() helper
Date: Thu, 28 Apr 2022 15:40:49 +0100
Message-Id: <20220428144052.263382-9-dgilbert@redhat.com>
In-Reply-To: <20220428144052.263382-1-dgilbert@redhat.com>
References: <20220428144052.263382-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

A lot of places check parameters.tls_creds in order to evaluate if TLS is
in use, and sometimes call migrate_get_current() just for that test.

Add new helper function migrate_use_tls() in order to simplify testing
for TLS usage.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426230654.637939-5-leobras@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c   | 3 +--
 migration/migration.c | 9 +++++++++
 migration/migration.h | 1 +
 migration/multifd.c   | 5 +----
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index c6a8dcf1d7..a162d00fea 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,8 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (s->parameters.tls_creds &&
-        *s->parameters.tls_creds &&
+    if (migrate_use_tls() &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
diff --git a/migration/migration.c b/migration/migration.c
index 3e91f4b5e2..4b6df2eb5e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2588,6 +2588,15 @@ bool migrate_use_zero_copy_send(void)
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
diff --git a/migration/migration.h b/migration/migration.h
index e8f2941a55..485d58b95f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -380,6 +380,7 @@ bool migrate_use_zero_copy_send(void);
 #else
 #define migrate_use_zero_copy_send() (false)
 #endif
+int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index 9ea4f581e2..2a8c8570c3 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -782,15 +782,12 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)),
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
+        if (migrate_use_tls() &&
             !object_dynamic_cast(OBJECT(ioc),
                                  TYPE_QIO_CHANNEL_TLS)) {
             multifd_tls_channel_connect(p, ioc, &error);
-- 
2.35.1


