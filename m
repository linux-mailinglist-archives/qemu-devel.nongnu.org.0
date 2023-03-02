Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2096A86EF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvI-00034s-Ry; Thu, 02 Mar 2023 11:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlv4-0002Wo-Ag
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlv1-0000ZZ-N6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGDJDGvYoAS5sYzA4QVueh5Hf/hO6bmc6hVYTJA//Jg=;
 b=ZMvynbj766EzxarSM2tVWaoL7XnVHgrBV2aPMQKS8cSwzRSulhDUNdEAmHchAXbtpjnoq6
 sR+ipHQ1KUf3HSoyx2W2l9GUVwCSJA7FNgFGgKLAaY+knu3oAmlaAGrm52PBs45tEe/qP3
 icFGUfd/LCIBKaNHUtQ9DgG/u+WZSr4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-L6Hoz2g_MEa3tHuRVsa0bw-1; Thu, 02 Mar 2023 11:36:29 -0500
X-MC-Unique: L6Hoz2g_MEa3tHuRVsa0bw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06FE8381078E;
 Thu,  2 Mar 2023 16:36:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D13E4492C3E;
 Thu,  2 Mar 2023 16:36:26 +0000 (UTC)
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
Subject: [PATCH 43/43] migration: Move migration_properties to options.c
Date: Thu,  2 Mar 2023 17:34:10 +0100
Message-Id: <20230302163410.11399-44-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 migration/options.h   |   7 ++
 migration/migration.c | 155 ------------------------------------------
 migration/options.c   | 153 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+), 155 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 698514cf76..f5ce35c018 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -16,6 +16,9 @@
 #ifndef QEMU_MIGRATION_OPTIONS_H
 #define QEMU_MIGRATION_OPTIONS_H
 
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+
 /* constants */
 
 /* Amount of time to allocate to each "chunk" of bandwidth-throttled
@@ -23,6 +26,10 @@
 #define BUFFER_DELAY     100
 #define XFER_LIMIT_RATIO (1000 / BUFFER_DELAY)
 
+/* migration properties */
+
+extern Property migration_properties[];
+
 /* capabilities */
 
 bool migrate_auto_converge(void);
diff --git a/migration/migration.c b/migration/migration.c
index 71fc360240..d94811a152 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -52,8 +52,6 @@
 #include "io/channel-tls.h"
 #include "migration/colo.h"
 #include "hw/boards.h"
-#include "hw/qdev-properties.h"
-#include "hw/qdev-properties-system.h"
 #include "monitor/monitor.h"
 #include "net/announce.h"
 #include "qemu/queue.h"
@@ -65,51 +63,6 @@
 #include "sysemu/qtest.h"
 #include "options.h"
 
-#define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
-
-/* Time in milliseconds we are allowed to stop the source,
- * for sending the last part */
-#define DEFAULT_MIGRATE_SET_DOWNTIME 300
-
-/* Default compression thread count */
-#define DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT 8
-/* Default decompression thread count, usually decompression is at
- * least 4 times as fast as compression.*/
-#define DEFAULT_MIGRATE_DECOMPRESS_THREAD_COUNT 2
-/*0: means nocompress, 1: best speed, ... 9: best compress ratio */
-#define DEFAULT_MIGRATE_COMPRESS_LEVEL 1
-/* Define default autoconverge cpu throttle migration parameters */
-#define DEFAULT_MIGRATE_THROTTLE_TRIGGER_THRESHOLD 50
-#define DEFAULT_MIGRATE_CPU_THROTTLE_INITIAL 20
-#define DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT 10
-#define DEFAULT_MIGRATE_MAX_CPU_THROTTLE 99
-
-/* Migration XBZRLE default cache size */
-#define DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE (64 * 1024 * 1024)
-
-/* The delay time (in ms) between two COLO checkpoints */
-#define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
-#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
-#define DEFAULT_MIGRATE_MULTIFD_COMPRESSION MULTIFD_COMPRESSION_NONE
-/* 0: means nocompress, 1: best speed, ... 9: best compress ratio */
-#define DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL 1
-/* 0: means nocompress, 1: best speed, ... 20: best compress ratio */
-#define DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL 1
-
-/* Background transfer rate for postcopy, 0 means unlimited, note
- * that page requests can still exceed this limit.
- */
-#define DEFAULT_MIGRATE_MAX_POSTCOPY_BANDWIDTH 0
-
-/*
- * Parameters for self_announce_delay giving a stream of RARP/ARP
- * packets after migration.
- */
-#define DEFAULT_MIGRATE_ANNOUNCE_INITIAL  50
-#define DEFAULT_MIGRATE_ANNOUNCE_MAX     550
-#define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
-#define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
-
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
 
@@ -3304,114 +3257,6 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     s->migration_thread_running = true;
 }
 
-#define DEFINE_PROP_MIG_CAP(name, x)             \
-    DEFINE_PROP_BOOL(name, MigrationState, capabilities[x], false)
-
-static Property migration_properties[] = {
-    DEFINE_PROP_BOOL("store-global-state", MigrationState,
-                     store_global_state, true),
-    DEFINE_PROP_BOOL("send-configuration", MigrationState,
-                     send_configuration, true),
-    DEFINE_PROP_BOOL("send-section-footer", MigrationState,
-                     send_section_footer, true),
-    DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
-                      decompress_error_check, true),
-    DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
-                      clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
-
-    /* Migration parameters */
-    DEFINE_PROP_UINT8("x-compress-level", MigrationState,
-                      parameters.compress_level,
-                      DEFAULT_MIGRATE_COMPRESS_LEVEL),
-    DEFINE_PROP_UINT8("x-compress-threads", MigrationState,
-                      parameters.compress_threads,
-                      DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT),
-    DEFINE_PROP_BOOL("x-compress-wait-thread", MigrationState,
-                      parameters.compress_wait_thread, true),
-    DEFINE_PROP_UINT8("x-decompress-threads", MigrationState,
-                      parameters.decompress_threads,
-                      DEFAULT_MIGRATE_DECOMPRESS_THREAD_COUNT),
-    DEFINE_PROP_UINT8("x-throttle-trigger-threshold", MigrationState,
-                      parameters.throttle_trigger_threshold,
-                      DEFAULT_MIGRATE_THROTTLE_TRIGGER_THRESHOLD),
-    DEFINE_PROP_UINT8("x-cpu-throttle-initial", MigrationState,
-                      parameters.cpu_throttle_initial,
-                      DEFAULT_MIGRATE_CPU_THROTTLE_INITIAL),
-    DEFINE_PROP_UINT8("x-cpu-throttle-increment", MigrationState,
-                      parameters.cpu_throttle_increment,
-                      DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT),
-    DEFINE_PROP_BOOL("x-cpu-throttle-tailslow", MigrationState,
-                      parameters.cpu_throttle_tailslow, false),
-    DEFINE_PROP_SIZE("x-max-bandwidth", MigrationState,
-                      parameters.max_bandwidth, MAX_THROTTLE),
-    DEFINE_PROP_UINT64("x-downtime-limit", MigrationState,
-                      parameters.downtime_limit,
-                      DEFAULT_MIGRATE_SET_DOWNTIME),
-    DEFINE_PROP_UINT32("x-checkpoint-delay", MigrationState,
-                      parameters.x_checkpoint_delay,
-                      DEFAULT_MIGRATE_X_CHECKPOINT_DELAY),
-    DEFINE_PROP_UINT8("multifd-channels", MigrationState,
-                      parameters.multifd_channels,
-                      DEFAULT_MIGRATE_MULTIFD_CHANNELS),
-    DEFINE_PROP_MULTIFD_COMPRESSION("multifd-compression", MigrationState,
-                      parameters.multifd_compression,
-                      DEFAULT_MIGRATE_MULTIFD_COMPRESSION),
-    DEFINE_PROP_UINT8("multifd-zlib-level", MigrationState,
-                      parameters.multifd_zlib_level,
-                      DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL),
-    DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
-                      parameters.multifd_zstd_level,
-                      DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
-    DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
-                      parameters.xbzrle_cache_size,
-                      DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
-    DEFINE_PROP_SIZE("max-postcopy-bandwidth", MigrationState,
-                      parameters.max_postcopy_bandwidth,
-                      DEFAULT_MIGRATE_MAX_POSTCOPY_BANDWIDTH),
-    DEFINE_PROP_UINT8("max-cpu-throttle", MigrationState,
-                      parameters.max_cpu_throttle,
-                      DEFAULT_MIGRATE_MAX_CPU_THROTTLE),
-    DEFINE_PROP_SIZE("announce-initial", MigrationState,
-                      parameters.announce_initial,
-                      DEFAULT_MIGRATE_ANNOUNCE_INITIAL),
-    DEFINE_PROP_SIZE("announce-max", MigrationState,
-                      parameters.announce_max,
-                      DEFAULT_MIGRATE_ANNOUNCE_MAX),
-    DEFINE_PROP_SIZE("announce-rounds", MigrationState,
-                      parameters.announce_rounds,
-                      DEFAULT_MIGRATE_ANNOUNCE_ROUNDS),
-    DEFINE_PROP_SIZE("announce-step", MigrationState,
-                      parameters.announce_step,
-                      DEFAULT_MIGRATE_ANNOUNCE_STEP),
-    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
-    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
-    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
-
-    /* Migration capabilities */
-    DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
-    DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
-    DEFINE_PROP_MIG_CAP("x-auto-converge", MIGRATION_CAPABILITY_AUTO_CONVERGE),
-    DEFINE_PROP_MIG_CAP("x-zero-blocks", MIGRATION_CAPABILITY_ZERO_BLOCKS),
-    DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
-    DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
-    DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
-    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
-                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
-    DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
-    DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
-    DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
-    DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
-    DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
-    DEFINE_PROP_MIG_CAP("x-background-snapshot",
-            MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
-#ifdef CONFIG_LINUX
-    DEFINE_PROP_MIG_CAP("x-zero-copy-send",
-            MIGRATION_CAPABILITY_ZERO_COPY_SEND),
-#endif
-
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void migration_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/migration/options.c b/migration/options.c
index e7f66cfc26..ca4771cf1d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -33,6 +33,159 @@
 #define MAX_MIGRATE_DOWNTIME_SECONDS 2000
 #define MAX_MIGRATE_DOWNTIME (MAX_MIGRATE_DOWNTIME_SECONDS * 1000)
 
+#define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
+
+/* Time in milliseconds we are allowed to stop the source,
+ * for sending the last part */
+#define DEFAULT_MIGRATE_SET_DOWNTIME 300
+
+/* Default compression thread count */
+#define DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT 8
+/* Default decompression thread count, usually decompression is at
+ * least 4 times as fast as compression.*/
+#define DEFAULT_MIGRATE_DECOMPRESS_THREAD_COUNT 2
+/*0: means nocompress, 1: best speed, ... 9: best compress ratio */
+#define DEFAULT_MIGRATE_COMPRESS_LEVEL 1
+/* Define default autoconverge cpu throttle migration parameters */
+#define DEFAULT_MIGRATE_THROTTLE_TRIGGER_THRESHOLD 50
+#define DEFAULT_MIGRATE_CPU_THROTTLE_INITIAL 20
+#define DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT 10
+#define DEFAULT_MIGRATE_MAX_CPU_THROTTLE 99
+
+/* Migration XBZRLE default cache size */
+#define DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE (64 * 1024 * 1024)
+
+/* The delay time (in ms) between two COLO checkpoints */
+#define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
+#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
+#define DEFAULT_MIGRATE_MULTIFD_COMPRESSION MULTIFD_COMPRESSION_NONE
+/* 0: means nocompress, 1: best speed, ... 9: best compress ratio */
+#define DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL 1
+/* 0: means nocompress, 1: best speed, ... 20: best compress ratio */
+#define DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL 1
+
+/* Background transfer rate for postcopy, 0 means unlimited, note
+ * that page requests can still exceed this limit.
+ */
+#define DEFAULT_MIGRATE_MAX_POSTCOPY_BANDWIDTH 0
+
+/*
+ * Parameters for self_announce_delay giving a stream of RARP/ARP
+ * packets after migration.
+ */
+#define DEFAULT_MIGRATE_ANNOUNCE_INITIAL  50
+#define DEFAULT_MIGRATE_ANNOUNCE_MAX     550
+#define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
+#define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
+
+#define DEFINE_PROP_MIG_CAP(name, x)             \
+    DEFINE_PROP_BOOL(name, MigrationState, capabilities[x], false)
+
+Property migration_properties[] = {
+    DEFINE_PROP_BOOL("store-global-state", MigrationState,
+                     store_global_state, true),
+    DEFINE_PROP_BOOL("send-configuration", MigrationState,
+                     send_configuration, true),
+    DEFINE_PROP_BOOL("send-section-footer", MigrationState,
+                     send_section_footer, true),
+    DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
+                      decompress_error_check, true),
+    DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
+                      clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
+
+    /* Migration parameters */
+    DEFINE_PROP_UINT8("x-compress-level", MigrationState,
+                      parameters.compress_level,
+                      DEFAULT_MIGRATE_COMPRESS_LEVEL),
+    DEFINE_PROP_UINT8("x-compress-threads", MigrationState,
+                      parameters.compress_threads,
+                      DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT),
+    DEFINE_PROP_BOOL("x-compress-wait-thread", MigrationState,
+                      parameters.compress_wait_thread, true),
+    DEFINE_PROP_UINT8("x-decompress-threads", MigrationState,
+                      parameters.decompress_threads,
+                      DEFAULT_MIGRATE_DECOMPRESS_THREAD_COUNT),
+    DEFINE_PROP_UINT8("x-throttle-trigger-threshold", MigrationState,
+                      parameters.throttle_trigger_threshold,
+                      DEFAULT_MIGRATE_THROTTLE_TRIGGER_THRESHOLD),
+    DEFINE_PROP_UINT8("x-cpu-throttle-initial", MigrationState,
+                      parameters.cpu_throttle_initial,
+                      DEFAULT_MIGRATE_CPU_THROTTLE_INITIAL),
+    DEFINE_PROP_UINT8("x-cpu-throttle-increment", MigrationState,
+                      parameters.cpu_throttle_increment,
+                      DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT),
+    DEFINE_PROP_BOOL("x-cpu-throttle-tailslow", MigrationState,
+                      parameters.cpu_throttle_tailslow, false),
+    DEFINE_PROP_SIZE("x-max-bandwidth", MigrationState,
+                      parameters.max_bandwidth, MAX_THROTTLE),
+    DEFINE_PROP_UINT64("x-downtime-limit", MigrationState,
+                      parameters.downtime_limit,
+                      DEFAULT_MIGRATE_SET_DOWNTIME),
+    DEFINE_PROP_UINT32("x-checkpoint-delay", MigrationState,
+                      parameters.x_checkpoint_delay,
+                      DEFAULT_MIGRATE_X_CHECKPOINT_DELAY),
+    DEFINE_PROP_UINT8("multifd-channels", MigrationState,
+                      parameters.multifd_channels,
+                      DEFAULT_MIGRATE_MULTIFD_CHANNELS),
+    DEFINE_PROP_MULTIFD_COMPRESSION("multifd-compression", MigrationState,
+                      parameters.multifd_compression,
+                      DEFAULT_MIGRATE_MULTIFD_COMPRESSION),
+    DEFINE_PROP_UINT8("multifd-zlib-level", MigrationState,
+                      parameters.multifd_zlib_level,
+                      DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL),
+    DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
+                      parameters.multifd_zstd_level,
+                      DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+    DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
+                      parameters.xbzrle_cache_size,
+                      DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
+    DEFINE_PROP_SIZE("max-postcopy-bandwidth", MigrationState,
+                      parameters.max_postcopy_bandwidth,
+                      DEFAULT_MIGRATE_MAX_POSTCOPY_BANDWIDTH),
+    DEFINE_PROP_UINT8("max-cpu-throttle", MigrationState,
+                      parameters.max_cpu_throttle,
+                      DEFAULT_MIGRATE_MAX_CPU_THROTTLE),
+    DEFINE_PROP_SIZE("announce-initial", MigrationState,
+                      parameters.announce_initial,
+                      DEFAULT_MIGRATE_ANNOUNCE_INITIAL),
+    DEFINE_PROP_SIZE("announce-max", MigrationState,
+                      parameters.announce_max,
+                      DEFAULT_MIGRATE_ANNOUNCE_MAX),
+    DEFINE_PROP_SIZE("announce-rounds", MigrationState,
+                      parameters.announce_rounds,
+                      DEFAULT_MIGRATE_ANNOUNCE_ROUNDS),
+    DEFINE_PROP_SIZE("announce-step", MigrationState,
+                      parameters.announce_step,
+                      DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
+
+    /* Migration capabilities */
+    DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
+    DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
+    DEFINE_PROP_MIG_CAP("x-auto-converge", MIGRATION_CAPABILITY_AUTO_CONVERGE),
+    DEFINE_PROP_MIG_CAP("x-zero-blocks", MIGRATION_CAPABILITY_ZERO_BLOCKS),
+    DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
+    DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
+    DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
+    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
+                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
+    DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
+    DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
+    DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
+    DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
+    DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
+    DEFINE_PROP_MIG_CAP("x-background-snapshot",
+            MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_MIG_CAP("x-zero-copy-send",
+            MIGRATION_CAPABILITY_ZERO_COPY_SEND),
+#endif
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 bool migrate_auto_converge(void)
 {
     MigrationState *s = migrate_get_current();
-- 
2.39.2


