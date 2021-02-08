Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8249313B77
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:49:57 +0100 (CET)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Afc-00052u-ON
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kB-0001fT-Cc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94k4-0002Jm-QB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26Mtuo57Y1Oel1+39shSBQglrhSQaNbIdpDb4ZX1OS4=;
 b=VlpVbbxc12GJnY2rPdOxUSSZbDFmZLjACSWtU2WeQ2xrjz7QnjjjO4I5eiUEmhHyG5vY9K
 z/yEGxBbKNmcs1+ZiA2yKI1Rpm36NgUIhcZjphQLvJ11/x3PfE8Ux00Mf2B5B91yEswNBq
 hM4bJIyJzBFVkaOvt+wBza0cuHoZ2oU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-xCGN8_YnPk-0gRuqt01gbA-1; Mon, 08 Feb 2021 06:30:04 -0500
X-MC-Unique: xCGN8_YnPk-0gRuqt01gbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC31192AB79;
 Mon,  8 Feb 2021 11:30:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B040B1002388;
 Mon,  8 Feb 2021 11:30:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 10/27] migration: Clean up signed vs. unsigned XBZRLE cache-size
Date: Mon,  8 Feb 2021 11:29:01 +0000
Message-Id: <20210208112918.185058-11-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

73af8dd8d7 "migration: Make xbzrle_cache_size a migration
parameter" (v2.11.0) made the new parameter unsigned (QAPI type
'size', uint64_t in C).  It neglected to update existing code, which
continues to use int64_t.

migrate_xbzrle_cache_size() returns the new parameter.  Adjust its
return type.

QMP query-migrate-cache-size returns migrate_xbzrle_cache_size().
Adjust its return type.

migrate-set-parameters passes the new parameter to
xbzrle_cache_resize().  Adjust its parameter type.

xbzrle_cache_resize() passes it on to cache_init().  Adjust its
parameter type.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210202141734.2488076-3-armbru@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c  | 4 ++--
 migration/migration.h  | 2 +-
 migration/page_cache.c | 2 +-
 migration/page_cache.h | 2 +-
 migration/ram.c        | 2 +-
 migration/ram.h        | 2 +-
 qapi/migration.json    | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ecb4115d68..77b0c39b50 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2308,7 +2308,7 @@ void qmp_migrate_set_cache_size(int64_t value, Error **errp)
     qmp_migrate_set_parameters(&p, errp);
 }
 
-int64_t qmp_query_migrate_cache_size(Error **errp)
+uint64_t qmp_query_migrate_cache_size(Error **errp)
 {
     return migrate_xbzrle_cache_size();
 }
@@ -2538,7 +2538,7 @@ int migrate_use_xbzrle(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_XBZRLE];
 }
 
-int64_t migrate_xbzrle_cache_size(void)
+uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s;
 
diff --git a/migration/migration.h b/migration/migration.h
index 0723955cd7..db6708326b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -327,7 +327,7 @@ int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
 int migrate_use_xbzrle(void);
-int64_t migrate_xbzrle_cache_size(void);
+uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
 
 bool migrate_use_block(void);
diff --git a/migration/page_cache.c b/migration/page_cache.c
index 098b436223..b384f265fb 100644
--- a/migration/page_cache.c
+++ b/migration/page_cache.c
@@ -38,7 +38,7 @@ struct PageCache {
     size_t num_items;
 };
 
-PageCache *cache_init(int64_t new_size, size_t page_size, Error **errp)
+PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
 {
     int64_t i;
     size_t num_pages = new_size / page_size;
diff --git a/migration/page_cache.h b/migration/page_cache.h
index 0cb94498a0..8733b4df6e 100644
--- a/migration/page_cache.h
+++ b/migration/page_cache.h
@@ -28,7 +28,7 @@ typedef struct PageCache PageCache;
  * @page_size: cache page size
  * @errp: set *errp if the check failed, with reason
  */
-PageCache *cache_init(int64_t cache_size, size_t page_size, Error **errp);
+PageCache *cache_init(uint64_t cache_size, size_t page_size, Error **errp);
 /**
  * cache_fini: free all cache resources
  * @cache pointer to the PageCache struct
diff --git a/migration/ram.c b/migration/ram.c
index 26adb55aa9..46e9d4d145 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -131,7 +131,7 @@ static void XBZRLE_cache_unlock(void)
  * @new_size: new cache size
  * @errp: set *errp if the check failed, with reason
  */
-int xbzrle_cache_resize(int64_t new_size, Error **errp)
+int xbzrle_cache_resize(uint64_t new_size, Error **errp)
 {
     PageCache *new_cache;
     int64_t ret = 0;
diff --git a/migration/ram.h b/migration/ram.h
index c25540cb93..6378bb3ebc 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -47,7 +47,7 @@ bool ramblock_is_ignored(RAMBlock *block);
     INTERNAL_RAMBLOCK_FOREACH(block)                   \
         if (!qemu_ram_is_migratable(block)) {} else
 
-int xbzrle_cache_resize(int64_t new_size, Error **errp);
+int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
 
diff --git a/qapi/migration.json b/qapi/migration.json
index 37026643ab..797f9edbc2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -78,7 +78,7 @@
 # Since: 1.2
 ##
 { 'struct': 'XBZRLECacheStats',
-  'data': {'cache-size': 'int', 'bytes': 'int', 'pages': 'int',
+  'data': {'cache-size': 'size', 'bytes': 'int', 'pages': 'int',
            'cache-miss': 'int', 'cache-miss-rate': 'number',
            'encoding-rate': 'number', 'overflow': 'int' } }
 
@@ -1470,7 +1470,7 @@
 # <- { "return": 67108864 }
 #
 ##
-{ 'command': 'query-migrate-cache-size', 'returns': 'int',
+{ 'command': 'query-migrate-cache-size', 'returns': 'size',
   'features': [ 'deprecated' ] }
 
 ##
-- 
2.29.2


