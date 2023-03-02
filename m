Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A16A8711
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvT-0003WN-5w; Thu, 02 Mar 2023 11:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluv-0002Hr-TN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlut-0000XY-Bc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUKeOppjHnGYeP3mtV/jZYBE+OTAYVT+0VlhR+CYztw=;
 b=Y0Nn6UC8pHeid0ViDV9JWuZ+EVHxqqZqx59Cs5mP88nx6EcvrkqiiQcBrApexQXEAuWZs2
 bILh6k1OVkUkKeVccfyiZwhy2YC7Pcrx+F4HE4AgWSl7TA6UakVCKfYO6FkaDSpgrbQbOy
 5TIIvcZqsTASuQFMhRwef4CNCr61VGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-_BT12HPwNEGzTmWChDcdDw-1; Thu, 02 Mar 2023 11:36:23 -0500
X-MC-Unique: _BT12HPwNEGzTmWChDcdDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 257EA29ABA01;
 Thu,  2 Mar 2023 16:36:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3F4492C3E;
 Thu,  2 Mar 2023 16:36:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 40/43] migration: Create migrate_tls_authz() function
Date: Thu,  2 Mar 2023 17:34:07 +0100
Message-Id: <20230302163410.11399-41-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h | 1 +
 migration/options.c | 7 +++++++
 migration/tls.c     | 5 +----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 78cb936aba..31d50cadd0 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -82,6 +82,7 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
+char *migrate_tls_authz(void);
 char *migrate_tls_creds(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
diff --git a/migration/options.c b/migration/options.c
index 41bb2d2959..42ad3e941d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -583,6 +583,13 @@ uint8_t migrate_throttle_trigger_threshold(void)
     return s->parameters.throttle_trigger_threshold;
 }
 
+char *migrate_tls_authz(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_authz;
+}
+
 char *migrate_tls_creds(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/tls.c b/migration/tls.c
index 0d318516de..4c229326fd 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -86,10 +86,7 @@ void migration_tls_channel_process_incoming(MigrationState *s,
         return;
     }
 
-    tioc = qio_channel_tls_new_server(
-        ioc, creds,
-        s->parameters.tls_authz,
-        errp);
+    tioc = qio_channel_tls_new_server(ioc, creds, migrate_tls_authz(), errp);
     if (!tioc) {
         return;
     }
-- 
2.39.2


