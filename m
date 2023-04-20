Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7A6E9642
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUYp-0000UY-CM; Thu, 20 Apr 2023 09:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXr-0006eN-F5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXo-0006FX-DP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eV7+EHuN4H42iHZQoDrrTjwfNGiE2P0rRmQKUOSs6M=;
 b=U2uyIIoKc4uw8BuNvtfy40NtFMtGAk0zym7tj4AjYURnEtmSGF+N3uWgzQ9pXEROQYcfG8
 /1LSknPxnHTyc16SGmzUV5zJeqaWaIK/AdWnCBTa2Bn2KxcsbJvQHxZqBhX8p1edM93Pgq
 jpgEFIDqKxt/sanPPol/nInlaIlFpjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-VJF-CJ5tOfWEKyAH1nFaVw-1; Thu, 20 Apr 2023 09:41:46 -0400
X-MC-Unique: VJF-CJ5tOfWEKyAH1nFaVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA4A9886C61;
 Thu, 20 Apr 2023 13:41:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A54A4020BED;
 Thu, 20 Apr 2023 13:41:43 +0000 (UTC)
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
Subject: [PATCH v2 34/43] migration: Make all functions check have the same
 format
Date: Thu, 20 Apr 2023 15:39:53 +0200
Message-Id: <20230420134002.29531-35-quintela@redhat.com>
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
 migration/options.c | 153 +++++++++++---------------------------------
 1 file changed, 39 insertions(+), 114 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 6fa6666308..fa99e397d0 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -33,27 +33,21 @@
 
 bool migrate_auto_converge(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
 }
 
 bool migrate_background_snapshot(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
 bool migrate_block(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_BLOCK];
 }
@@ -61,95 +55,76 @@ bool migrate_block(void)
 bool migrate_colo(void)
 {
     MigrationState *s = migrate_get_current();
+
     return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
 }
 
 bool migrate_compress(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
 }
 
 bool migrate_dirty_bitmaps(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
 }
 
 bool migrate_events(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_EVENTS];
 }
 
 bool migrate_ignore_shared(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
 }
 
 bool migrate_late_block_activate(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
 }
 
 bool migrate_multifd(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
 bool migrate_pause_before_switchover(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
 }
 
 bool migrate_postcopy_blocktime(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
 }
 
 bool migrate_postcopy_preempt(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
 }
 
 bool migrate_postcopy_ram(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 }
@@ -163,54 +138,42 @@ bool migrate_rdma_pin_all(void)
 
 bool migrate_release_ram(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
 }
 
 bool migrate_return_path(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
 }
 
 bool migrate_validate_uuid(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
 }
 
 bool migrate_xbzrle(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_XBZRLE];
 }
 
 bool migrate_zero_blocks(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
 }
 
 bool migrate_zero_copy_send(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
@@ -224,9 +187,7 @@ bool migrate_postcopy(void)
 
 bool migrate_tls(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
@@ -495,126 +456,98 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 
 bool migrate_block_incremental(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.block_incremental;
 }
 
 uint32_t migrate_checkpoint_delay(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.x_checkpoint_delay;
 }
 
 int migrate_compress_level(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.compress_level;
 }
 
 int migrate_compress_threads(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.compress_threads;
 }
 
 int migrate_compress_wait_thread(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.compress_wait_thread;
 }
 
 uint8_t migrate_cpu_throttle_increment(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.cpu_throttle_increment;
 }
 
 uint8_t migrate_cpu_throttle_initial(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.cpu_throttle_initial;
 }
 
 bool migrate_cpu_throttle_tailslow(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.cpu_throttle_tailslow;
 }
 
 int migrate_decompress_threads(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.decompress_threads;
 }
 
 uint8_t migrate_max_cpu_throttle(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.max_cpu_throttle;
 }
 
 uint64_t migrate_max_bandwidth(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.max_bandwidth;
 }
 
 int64_t migrate_max_postcopy_bandwidth(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.max_postcopy_bandwidth;
 }
 
 int migrate_multifd_channels(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.multifd_channels;
 }
 
 MultiFDCompression migrate_multifd_compression(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     assert(s->parameters.multifd_compression < MULTIFD_COMPRESSION__MAX);
     return s->parameters.multifd_compression;
@@ -622,36 +555,28 @@ MultiFDCompression migrate_multifd_compression(void)
 
 int migrate_multifd_zlib_level(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.multifd_zlib_level;
 }
 
 int migrate_multifd_zstd_level(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.multifd_zstd_level;
 }
 
 uint8_t migrate_throttle_trigger_threshold(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.throttle_trigger_threshold;
 }
 
 uint64_t migrate_xbzrle_cache_size(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.xbzrle_cache_size;
 }
-- 
2.39.2


