Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D52B15F8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:54:06 +0100 (CET)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdSyC-0004rj-Ln
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSwt-0003cU-PE
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSwr-0006EA-Qk
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r34988DNBTpFNOk9EIdt1tJzaGPoIlQa3XjvfuNUiC0=;
 b=C8tfAfR+i1Jnh7YIV7vqIj/sywsHDiBBbZNNy3TzUwimKGXADnyPDVNqlYp2hH0A7DVpMh
 WH+92K5sK5gzOuo2mp6ZPctrmhyv5WCW5d5/CE5+85omkEphSNIKZIwhJqJJ6wTP6vfBkX
 u7OPSfjAq/n7u0svEPJrYkd9jau0PEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Q3yxXE_PPZSeEr7e-PwOig-1; Fri, 13 Nov 2020 01:52:38 -0500
X-MC-Unique: Q3yxXE_PPZSeEr7e-PwOig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83F7106B819
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 06:52:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 989A260C15;
 Fri, 13 Nov 2020 06:52:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C1C911385C9; Fri, 13 Nov 2020 07:52:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] migration: Check xbzrle-cache-size more carefully
Date: Fri, 13 Nov 2020 07:52:34 +0100
Message-Id: <20201113065236.2644169-5-armbru@redhat.com>
In-Reply-To: <20201113065236.2644169-1-armbru@redhat.com>
References: <20201113065236.2644169-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migrate-set-parameters passes the size to xbzrle_cache_resize().
xbzrle_cache_resize() checks it fits into size_t before it passes it
on to cache_init().  cache_init() checks it is a power of two no
smaller than @page_size.

cache_init() is also called from xbzrle_init(), bypassing
xbzrle_cache_resize()'s check.

Drop xbzrle_cache_resize()'s check, and check more carefully in
cache_init().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/page_cache.c | 15 ++++-----------
 migration/ram.c        |  7 -------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/migration/page_cache.c b/migration/page_cache.c
index b384f265fb..e07f4ad1dc 100644
--- a/migration/page_cache.c
+++ b/migration/page_cache.c
@@ -41,17 +41,10 @@ struct PageCache {
 PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
 {
     int64_t i;
-    size_t num_pages = new_size / page_size;
+    uint64_t num_pages = new_size / page_size;
     PageCache *cache;
 
-    if (new_size < page_size) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
-                   "is smaller than one target page size");
-        return NULL;
-    }
-
-    /* round down to the nearest power of 2 */
-    if (!is_power_of_2(num_pages)) {
+    if (num_pages != (size_t)num_pages || !is_power_of_2(num_pages)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
                    "is not a power of two number of pages");
         return NULL;
@@ -71,8 +64,8 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
     trace_migration_pagecache_init(cache->max_num_items);
 
     /* We prefer not to abort if there is no memory */
-    cache->page_cache = g_try_malloc((cache->max_num_items) *
-                                     sizeof(*cache->page_cache));
+    cache->page_cache = g_try_malloc_n(cache->max_num_items,
+                                       sizeof(*cache->page_cache));
     if (!cache->page_cache) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
                    "Failed to allocate page cache");
diff --git a/migration/ram.c b/migration/ram.c
index a84425d04f..d632ae694c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -131,13 +131,6 @@ int xbzrle_cache_resize(uint64_t new_size, Error **errp)
     PageCache *new_cache;
     int64_t ret = 0;
 
-    /* Check for truncation */
-    if (new_size != (size_t)new_size) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
-                   "exceeding address space");
-        return -1;
-    }
-
     if (new_size == migrate_xbzrle_cache_size()) {
         /* nothing to do */
         return 0;
-- 
2.26.2


