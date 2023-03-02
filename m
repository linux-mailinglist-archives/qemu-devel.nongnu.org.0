Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9406A86C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvF-0002xV-Jp; Thu, 02 Mar 2023 11:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlud-0001X0-3x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlua-0008WP-G5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIqp5G7ertyq/PCIurRIiNVROHJnsldBL1HAvk8RPsM=;
 b=U6vcE/WiH5gTkGOordq+Ydb48SOas1feg4Cd6Mt5/Wgn97QfKknkwZv1Sb2ShXypGR3C5Q
 fZEpQOmB+edEQc88CKYcqrzKI7ajChEaJw57AcPl1WHJ8o/eF48LjzgSAby2L2McvLe2xC
 ylI/R/xVgQcPivHZx5m1aWTiWILBfgk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-0uOKDKgFM0691cVp56HjQw-1; Thu, 02 Mar 2023 11:36:06 -0500
X-MC-Unique: 0uOKDKgFM0691cVp56HjQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 143A31C3D38C;
 Thu,  2 Mar 2023 16:36:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6AC492C3E;
 Thu,  2 Mar 2023 16:36:03 +0000 (UTC)
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
Subject: [PATCH 33/43] migration: Create migrate_params_init() function
Date: Thu,  2 Mar 2023 17:34:00 +0100
Message-Id: <20230302163410.11399-34-quintela@redhat.com>
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
 migration/options.h   |  1 +
 migration/migration.c | 29 +----------------------------
 migration/options.c   | 31 +++++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 95338d1efd..c7c9a4002b 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -86,5 +86,6 @@ uint64_t migrate_xbzrle_cache_size(void);
 /* parameters helpers */
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
+void migrate_params_init(MigrationParameters *params);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 5d43e815ed..62a6f29647 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3455,7 +3455,6 @@ static void migration_instance_finalize(Object *obj)
 static void migration_instance_init(Object *obj)
 {
     MigrationState *ms = MIGRATION_OBJ(obj);
-    MigrationParameters *params = &ms->parameters;
 
     ms->state = MIGRATION_STATUS_NONE;
     ms->mbps = -1;
@@ -3463,33 +3462,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->pause_sem, 0);
     qemu_mutex_init(&ms->error_mutex);
 
-    params->tls_hostname = g_strdup("");
-    params->tls_creds = g_strdup("");
-
-    /* Set has_* up only for parameter checks */
-    params->has_compress_level = true;
-    params->has_compress_threads = true;
-    params->has_compress_wait_thread = true;
-    params->has_decompress_threads = true;
-    params->has_throttle_trigger_threshold = true;
-    params->has_cpu_throttle_initial = true;
-    params->has_cpu_throttle_increment = true;
-    params->has_cpu_throttle_tailslow = true;
-    params->has_max_bandwidth = true;
-    params->has_downtime_limit = true;
-    params->has_x_checkpoint_delay = true;
-    params->has_block_incremental = true;
-    params->has_multifd_channels = true;
-    params->has_multifd_compression = true;
-    params->has_multifd_zlib_level = true;
-    params->has_multifd_zstd_level = true;
-    params->has_xbzrle_cache_size = true;
-    params->has_max_postcopy_bandwidth = true;
-    params->has_max_cpu_throttle = true;
-    params->has_announce_initial = true;
-    params->has_announce_max = true;
-    params->has_announce_rounds = true;
-    params->has_announce_step = true;
+    migrate_params_init(&ms->parameters);
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
diff --git a/migration/options.c b/migration/options.c
index efa9c6788d..15ee1aa922 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -742,6 +742,37 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     return params;
 }
 
+void migrate_params_init(MigrationParameters *params)
+{
+    params->tls_hostname = g_strdup("");
+    params->tls_creds = g_strdup("");
+
+    /* Set has_* up only for parameter checks */
+    params->has_compress_level = true;
+    params->has_compress_threads = true;
+    params->has_compress_wait_thread = true;
+    params->has_decompress_threads = true;
+    params->has_throttle_trigger_threshold = true;
+    params->has_cpu_throttle_initial = true;
+    params->has_cpu_throttle_increment = true;
+    params->has_cpu_throttle_tailslow = true;
+    params->has_max_bandwidth = true;
+    params->has_downtime_limit = true;
+    params->has_x_checkpoint_delay = true;
+    params->has_block_incremental = true;
+    params->has_multifd_channels = true;
+    params->has_multifd_compression = true;
+    params->has_multifd_zlib_level = true;
+    params->has_multifd_zstd_level = true;
+    params->has_xbzrle_cache_size = true;
+    params->has_max_postcopy_bandwidth = true;
+    params->has_max_cpu_throttle = true;
+    params->has_announce_initial = true;
+    params->has_announce_max = true;
+    params->has_announce_rounds = true;
+    params->has_announce_step = true;
+}
+
 /*
  * Check whether the parameters are valid. Error will be put into errp
  * (if provided). Return true if valid, otherwise false.
-- 
2.39.2


