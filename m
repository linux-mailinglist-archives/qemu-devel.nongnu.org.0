Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A776F0891
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:45:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3nw-0001jL-35; Thu, 27 Apr 2023 11:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3ns-0001iY-9i
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3nn-0004W4-Fa
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682610298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IJ7Dhy9FpdFSc2wzLnlGqo4QmLJny/q8vlZoSt/qEA=;
 b=YJzY6pf+teZ0p22cDxCjxQ7tjESVkWF9zT04b5od+36xSLMsu4Anvh70V395LP9So+ozAb
 RZur8ab5CGSQNNSd/oLRnh8WneQ3Znx5eUvSLhcQ8HPDXGk+SXhlVKgTezHhv9vTkTAhB8
 Gwaom/2hq2oexQCdxNmdxeqidPKiRm0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-mbKBgUOlNIqh-H7SimALww-1; Thu, 27 Apr 2023 11:25:21 -0400
X-MC-Unique: mbKBgUOlNIqh-H7SimALww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A1EF8A011C;
 Thu, 27 Apr 2023 15:22:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E235140C2064;
 Thu, 27 Apr 2023 15:22:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 02/18] migration: Create migrate_params_init() function
Date: Thu, 27 Apr 2023 17:22:18 +0200
Message-Id: <20230427152234.25400-3-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 29 +----------------------------
 migration/options.c   | 31 +++++++++++++++++++++++++++++++
 migration/options.h   |  1 +
 3 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 22e8586623..45fc5be93a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3470,7 +3470,6 @@ static void migration_instance_finalize(Object *obj)
 static void migration_instance_init(Object *obj)
 {
     MigrationState *ms = MIGRATION_OBJ(obj);
-    MigrationParameters *params = &ms->parameters;
 
     ms->state = MIGRATION_STATUS_NONE;
     ms->mbps = -1;
@@ -3478,33 +3477,7 @@ static void migration_instance_init(Object *obj)
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
index c6030587cf..552e8d8e5c 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -741,6 +741,37 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
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
diff --git a/migration/options.h b/migration/options.h
index 89067e59a0..86bcbb738c 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -84,5 +84,6 @@ uint64_t migrate_xbzrle_cache_size(void);
 /* parameters helpers */
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
+void migrate_params_init(MigrationParameters *params);
 
 #endif
-- 
2.40.0


