Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B993636E995
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:31:11 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4sw-00029B-QU
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qd-0000Wd-W5
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qU-0003wP-ES
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uBPvYn3+AdNBAv5CiUJ7cT6Cug/y9zuONBG/GzcdC4=;
 b=bCFO0etn2+ENXs8gmpYAZOjX20gyLO4o2RXg5lu+ZwTJKjTq/oEkVN+mwl1VuO0jnWBJh3
 Is9CXU6i5BmPz6P0lWRa5Az0D73GEf8Ht2nWK37atcdg6LG+aGizYrq5JGzueWg8D2pfOF
 oVqA4MpN0jZLrxiEFDfgNHfBXBGJxkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-w-XCiFWiPtugpz8Aic6nfw-1; Thu, 29 Apr 2021 07:28:33 -0400
X-MC-Unique: w-XCiFWiPtugpz8Aic6nfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1538049CB;
 Thu, 29 Apr 2021 11:28:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00C5F679E7;
 Thu, 29 Apr 2021 11:28:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] migration/ram: Simplify host page handling in
 ram_load_postcopy()
Date: Thu, 29 Apr 2021 13:27:05 +0200
Message-Id: <20210429112708.12291-8-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two new helper functions. This will come in come handy once we want to
handle ram block resizes while postcopy is active.

Note that ram_block_from_stream() will already print proper errors.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 55 ++++++++++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 693851d7a0..72df5228ee 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3121,6 +3121,20 @@ static inline void *host_from_ram_block_offset(RAMBlock *block,
     return block->host + offset;
 }
 
+static void *host_page_from_ram_block_offset(RAMBlock *block,
+                                             ram_addr_t offset)
+{
+    /* Note: Explicitly no check against offset_in_ramblock(). */
+    return (void *)QEMU_ALIGN_DOWN((uintptr_t)block->host + offset,
+                                   block->page_size);
+}
+
+static ram_addr_t host_page_offset_from_ram_block_offset(RAMBlock *block,
+                                                         ram_addr_t offset)
+{
+    return ((uintptr_t)block->host + offset) & (block->page_size - 1);
+}
+
 static inline void *colo_cache_from_block_offset(RAMBlock *block,
                              ram_addr_t offset, bool record_bitmap)
 {
@@ -3524,13 +3538,12 @@ static int ram_load_postcopy(QEMUFile *f)
     MigrationIncomingState *mis = migration_incoming_get_current();
     /* Temporary page that is later 'placed' */
     void *postcopy_host_page = mis->postcopy_tmp_page;
-    void *this_host = NULL;
+    void *host_page = NULL;
     bool all_zero = true;
     int target_pages = 0;
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
-        void *host = NULL;
         void *page_buffer = NULL;
         void *place_source = NULL;
         RAMBlock *block = NULL;
@@ -3555,9 +3568,12 @@ static int ram_load_postcopy(QEMUFile *f)
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block = ram_block_from_stream(f, flags);
+            if (!block) {
+                ret = -EINVAL;
+                break;
+            }
 
-            host = host_from_ram_block_offset(block, addr);
-            if (!host) {
+            if (!offset_in_ramblock(block, addr)) {
                 error_report("Illegal RAM offset " RAM_ADDR_FMT, addr);
                 ret = -EINVAL;
                 break;
@@ -3575,19 +3591,17 @@ static int ram_load_postcopy(QEMUFile *f)
              * of a host page in one chunk.
              */
             page_buffer = postcopy_host_page +
-                          ((uintptr_t)host & (block->page_size - 1));
+                          host_page_offset_from_ram_block_offset(block, addr);
+            /* If all TP are zero then we can optimise the place */
             if (target_pages == 1) {
-                this_host = (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
-                                                    block->page_size);
-            } else {
+                host_page = host_page_from_ram_block_offset(block, addr);
+            } else if (host_page != host_page_from_ram_block_offset(block,
+                                                                    addr)) {
                 /* not the 1st TP within the HP */
-                if (QEMU_ALIGN_DOWN((uintptr_t)host, block->page_size) !=
-                    (uintptr_t)this_host) {
-                    error_report("Non-same host page %p/%p",
-                                  host, this_host);
-                    ret = -EINVAL;
-                    break;
-                }
+                error_report("Non-same host page %p/%p", host_page,
+                             host_page_from_ram_block_offset(block, addr));
+                ret = -EINVAL;
+                break;
             }
 
             /*
@@ -3666,16 +3680,11 @@ static int ram_load_postcopy(QEMUFile *f)
         }
 
         if (!ret && place_needed) {
-            /* This gets called at the last target page in the host page */
-            void *place_dest = (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
-                                                       block->page_size);
-
             if (all_zero) {
-                ret = postcopy_place_page_zero(mis, place_dest,
-                                               block);
+                ret = postcopy_place_page_zero(mis, host_page, block);
             } else {
-                ret = postcopy_place_page(mis, place_dest,
-                                          place_source, block);
+                ret = postcopy_place_page(mis, host_page, place_source,
+                                          block);
             }
             place_needed = false;
             target_pages = 0;
-- 
2.30.2


