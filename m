Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01E30C145
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:19:27 +0100 (CET)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wWb-0005Og-Me
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUy-00047U-D9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUw-0006nA-EA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eljWpLCXVhsfrtFV3KUx7VzKLQqZdLTrmrUo7dYaLOY=;
 b=U0Xh066u5PsZTEHGw/T15KjEzor12uTxS9egc25/LqHj8ZsFPrqRgO6xUML8I1dhr9JAly
 HPELICzRBR7dSZ3OPCNZPaocsXdMKtHSSSVMXjEmrl0cAhh5edujl5CxRDkVl7dW4NKlar
 nJMQlfM/PdIk7J/yfWPSp67PL3w3tnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-cNNZXgQEPniuWVd8JpTiFg-1; Tue, 02 Feb 2021 09:17:37 -0500
X-MC-Unique: cNNZXgQEPniuWVd8JpTiFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E6E8030B3
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:17:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3486EF41;
 Tue,  2 Feb 2021 14:17:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 434451138461; Tue,  2 Feb 2021 15:17:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] migration: Clean up signed vs. unsigned XBZRLE
 cache-size
Date: Tue,  2 Feb 2021 15:17:32 +0100
Message-Id: <20210202141734.2488076-3-armbru@redhat.com>
In-Reply-To: <20210202141734.2488076-1-armbru@redhat.com>
References: <20210202141734.2488076-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 qapi/migration.json    | 4 ++--
 migration/migration.h  | 2 +-
 migration/page_cache.h | 2 +-
 migration/ram.h        | 2 +-
 migration/migration.c  | 4 ++--
 migration/page_cache.c | 2 +-
 migration/ram.c        | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 2c101eb0eb..fd04123ddf 100644
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
 
@@ -1465,7 +1465,7 @@
 # <- { "return": 67108864 }
 #
 ##
-{ 'command': 'query-migrate-cache-size', 'returns': 'int',
+{ 'command': 'query-migrate-cache-size', 'returns': 'size',
   'features': [ 'deprecated' ] }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index d096b77f74..0387dc40d6 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -324,7 +324,7 @@ int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
 int migrate_use_xbzrle(void);
-int64_t migrate_xbzrle_cache_size(void);
+uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
 
 bool migrate_use_block(void);
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
diff --git a/migration/ram.h b/migration/ram.h
index 011e85414e..016eaa3378 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -47,7 +47,7 @@ bool ramblock_is_ignored(RAMBlock *block);
     INTERNAL_RAMBLOCK_FOREACH(block)                   \
         if (!qemu_ram_is_migratable(block)) {} else
 
-int xbzrle_cache_resize(int64_t new_size, Error **errp);
+int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
 
diff --git a/migration/migration.c b/migration/migration.c
index 1986cb8573..8f28e0af99 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2216,7 +2216,7 @@ void qmp_migrate_set_cache_size(int64_t value, Error **errp)
     qmp_migrate_set_parameters(&p, errp);
 }
 
-int64_t qmp_query_migrate_cache_size(Error **errp)
+uint64_t qmp_query_migrate_cache_size(Error **errp)
 {
     return migrate_xbzrle_cache_size();
 }
@@ -2446,7 +2446,7 @@ int migrate_use_xbzrle(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_XBZRLE];
 }
 
-int64_t migrate_xbzrle_cache_size(void)
+uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s;
 
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
diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..fd7e9d2295 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -126,7 +126,7 @@ static void XBZRLE_cache_unlock(void)
  * @new_size: new cache size
  * @errp: set *errp if the check failed, with reason
  */
-int xbzrle_cache_resize(int64_t new_size, Error **errp)
+int xbzrle_cache_resize(uint64_t new_size, Error **errp)
 {
     PageCache *new_cache;
     int64_t ret = 0;
-- 
2.26.2


