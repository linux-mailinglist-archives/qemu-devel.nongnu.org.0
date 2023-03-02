Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E116A86F2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlus-00020W-Lp; Thu, 02 Mar 2023 11:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluo-0001sC-NN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlum-0000Vh-7G
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Q2lznzHZ4hgf3BA9vxp6E05x+gcbSqvJyM8M3w5N1M=;
 b=EL+KSOQbgrH22pzQVuw1QBap2lg64Fm4C9lGWSvOw9nPQ6UczBsPg0idTLeQowRp0+ufjU
 IXroyDnFb8P0s7rgMd1HNtSNSuVPWkcemqNEW83n5lnhhMgEDXp1DrTZaADyzIVTFUqOuZ
 NGa58cCcOMdunouxAsZJl7OWAK5KwoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-Is5rggRJOOqt3vztdaWhZg-1; Thu, 02 Mar 2023 11:36:08 -0500
X-MC-Unique: Is5rggRJOOqt3vztdaWhZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64FB885A5B1;
 Thu,  2 Mar 2023 16:36:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5711F492B01;
 Thu,  2 Mar 2023 16:36:06 +0000 (UTC)
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
Subject: [PATCH 34/43] migration: Make all functions check have the same format
Date: Thu,  2 Mar 2023 17:34:01 +0100
Message-Id: <20230302163410.11399-35-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 15ee1aa922..350cd24e28 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -35,27 +35,21 @@
 
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
@@ -63,95 +57,76 @@ bool migrate_block(void)
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
@@ -165,54 +140,42 @@ bool migrate_rdma_pin_all(void)
 
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
@@ -226,9 +189,7 @@ bool migrate_postcopy(void)
 
 bool migrate_tls(void)
 {
-    MigrationState *s;
-
-    s = migrate_get_current();
+    MigrationState *s = migrate_get_current();
 
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
@@ -497,126 +458,98 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 
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
@@ -624,36 +557,28 @@ MultiFDCompression migrate_multifd_compression(void)
 
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


