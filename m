Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630286E9625
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:44:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUYr-0000fK-4v; Thu, 20 Apr 2023 09:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUYA-0007j0-Gb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUY8-0006NY-Fq
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnBemTGpJBwq3+eccXAvoL56joreF+/xlYaUeKbvlkc=;
 b=i4FtdKB6HhxUS7lXRC1+bqyqUrrgPFmZ/Qz6/cKz4izv1MEZc9fZHO4D9KnudGmhKhbmC4
 /Su1MdP8G2WxlG/VG4EYunDC+YEefseAPw6lCmw3nFYCzxtmrSp0EAptCABKzEMqS3VEwu
 p78K94OD3S//aZgL7M+/7P654UZ+2eo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-FWetV6zXOySjjABgLOFhtA-1; Thu, 20 Apr 2023 09:42:07 -0400
X-MC-Unique: FWetV6zXOySjjABgLOFhtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09EC4811E7B;
 Thu, 20 Apr 2023 13:42:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 384F04020BED;
 Thu, 20 Apr 2023 13:42:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 41/43] migration: Create migrate_tls_hostname() function
Date: Thu, 20 Apr 2023 15:40:00 +0200
Message-Id: <20230420134002.29531-42-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 migration/options.c | 7 +++++++
 migration/options.h | 1 +
 migration/tls.c     | 6 ++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 303a493388..8f0bf1ece6 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -595,6 +595,13 @@ char *migrate_tls_creds(void)
     return s->parameters.tls_creds;
 }
 
+char *migrate_tls_hostname(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_hostname;
+}
+
 uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/options.h b/migration/options.h
index 72b0f3cf62..2f21837094 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -82,6 +82,7 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 char *migrate_tls_authz(void);
 char *migrate_tls_creds(void);
+char *migrate_tls_hostname(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 /* parameters setters */
diff --git a/migration/tls.c b/migration/tls.c
index 4c229326fd..3cae1a06e7 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -123,6 +123,7 @@ QIOChannelTLS *migration_tls_client_create(MigrationState *s,
                                            Error **errp)
 {
     QCryptoTLSCreds *creds;
+    char *tls_hostname;
 
     creds = migration_tls_get_creds(
         s, QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT, errp);
@@ -130,8 +131,9 @@ QIOChannelTLS *migration_tls_client_create(MigrationState *s,
         return NULL;
     }
 
-    if (s->parameters.tls_hostname && *s->parameters.tls_hostname) {
-        hostname = s->parameters.tls_hostname;
+    tls_hostname = migrate_tls_hostname();
+    if (tls_hostname && *tls_hostname) {
+        hostname = tls_hostname;
     }
 
     return qio_channel_tls_new_client(ioc, creds, hostname, errp);
-- 
2.39.2


