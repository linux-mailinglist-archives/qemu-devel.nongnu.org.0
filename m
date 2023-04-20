Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE76E962A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:45:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUYt-0001F3-R4; Thu, 20 Apr 2023 09:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUYF-0007pa-Px
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUYC-0006Oy-L7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwXicgA+WCPVmWgL49bV8ttqeRykD2CW+tSCOk0AB7A=;
 b=KJ5anws7FSvk4qUKD1W4pzrq+x8oxu7ADAZ6Qtmcc9txv9J2SY4dzlC8I8ScfeyhugpauK
 n9vqYAkqSpVnrQKv2Rm6IglE3qoHAhDPeW2JwXl3K5QKAhiaK3fPiT+SP+37CHFxZj8HXn
 JAZSfLeaT2LIhH5uccf0OQSKwHTXdS0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Lu-ENAkZNaWRuMT5eN04bg-1; Thu, 20 Apr 2023 09:42:04 -0400
X-MC-Unique: Lu-ENAkZNaWRuMT5eN04bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E99DC1C0512E;
 Thu, 20 Apr 2023 13:42:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51EEB4020BED;
 Thu, 20 Apr 2023 13:42:01 +0000 (UTC)
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
Subject: [PATCH v2 40/43] migration: Create migrate_tls_authz() function
Date: Thu, 20 Apr 2023 15:39:59 +0200
Message-Id: <20230420134002.29531-41-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 migration/tls.c     | 5 +----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index bb5e055004..303a493388 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -581,6 +581,13 @@ uint8_t migrate_throttle_trigger_threshold(void)
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
diff --git a/migration/options.h b/migration/options.h
index acd48feabb..72b0f3cf62 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -80,6 +80,7 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
+char *migrate_tls_authz(void);
 char *migrate_tls_creds(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
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


