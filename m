Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F1427803
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 10:01:36 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ7IV-0003A1-5F
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 04:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dr-0005kV-W6
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dq-0002aJ-0M
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633766205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grvQoPFfVCbC/cdjgucE0lRS2FIaC8jLcY6gpdvCkr4=;
 b=OZsziVo3ZBHvwkg4TctpUV3MELVLWIDCA9ILXln4mHEslyU1wLWV35MNuwKhEoGMvLytQF
 zikcgz1lz56cqT7Ohi1nvKKjXgDAoqFjog4vDbpAAWKlFFxkbXGunEArVSfdrTlyjprAy+
 TR3ZvwR5H3dErq1kAlf2jqcpZn3ko+c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-gCRbBPg2OP-bhxll76-AWg-1; Sat, 09 Oct 2021 03:56:44 -0400
X-MC-Unique: gCRbBPg2OP-bhxll76-AWg-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so11279523edi.19
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 00:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grvQoPFfVCbC/cdjgucE0lRS2FIaC8jLcY6gpdvCkr4=;
 b=yTsR1AYVjckG5xHKoYANnEy8MagxAM+y2Lg5+nx3s0s5tWzGu+aqt86aa4TvJEPMqk
 r9DuR+T2MLKdEuugl6WXC+iu3iVPjXF5omxXuxRo4ogOFb6bpQH/5CgL3lrZl73wTzp8
 L/0ZMgvR24+s4qhaorG95R0t4sAoY38rpV9miD1CuYqKxUeB4bWV9glmfhPF+fs8dtVh
 l2NxztnAt2UPOHitytw8A4YCdG/a8FTMu6QEhV3ZVUByJWw1v9KR/LHKc13nKuzupOmI
 YhSXom36/kVKqLJ+LTOry8H1LapXUeZqaqwZbZzUluqzRCCVyY8l0ERucLWCsKYTuQsg
 FbEg==
X-Gm-Message-State: AOAM530nPUuqG5mNopAjoIxXRMeKtsoukF1PgtK4SqyQJW7si1shkR0j
 5cFBpmOAMGVepaRLriO9H+RIeRWBkCEueYcWLETtpnlkU+SnWV0EKKR51QB0g4orpUGX9dBZEqr
 VY2+XvvgDZpVL6Bw=
X-Received: by 2002:a05:6402:16d8:: with SMTP id
 r24mr21593679edx.47.1633766202945; 
 Sat, 09 Oct 2021 00:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC6kp+r7PSHw5num+XzofmHATBaWNN9Oo4Sf1XMqXUtfeIP8xV7vDlL8Fqf3XEGDWmh0Rk+Q==
X-Received: by 2002:a05:6402:16d8:: with SMTP id
 r24mr21593652edx.47.1633766202677; 
 Sat, 09 Oct 2021 00:56:42 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:5307:af36:9661:8efc:9b2c])
 by smtp.gmail.com with ESMTPSA id p23sm782059edw.94.2021.10.09.00.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 00:56:42 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd migration
 (multifd-zerocopy)
Date: Sat,  9 Oct 2021 04:56:13 -0300
Message-Id: <20211009075612.230283-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009075612.230283-1-leobras@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
zerocopy interface.

Change multifd_send_sync_main() so it can distinguish the last sync from
the setup and per-iteration ones, so a flush_zerocopy() can be called
at the last sync in order to make sure all RAM is sent before finishing
the migration.

Also make it return -1 if flush_zerocopy() fails, in order to cancel
the migration process, and avoid resuming the guest in the target host
without receiving all current RAM.

This will work fine on RAM migration because the RAM pages are not usually freed,
and there is no problem on changing the pages content between async_send() and
the actual sending of the buffer, because this change will dirty the page and
cause it to be re-sent on a next iteration anyway.

Given a lot of locked memory may be needed in order to use multid migration
with zerocopy enabled, make it optional by creating a new parameter
multifd-zerocopy on qapi, so low-privileged users can still perform multifd
migrations.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 qapi/migration.json   | 18 ++++++++++++++++++
 migration/migration.h |  1 +
 migration/multifd.h   |  2 +-
 migration/migration.c | 20 ++++++++++++++++++++
 migration/multifd.c   | 33 ++++++++++++++++++++++++++++-----
 migration/ram.c       | 20 +++++++++++++-------
 monitor/hmp-cmds.c    |  4 ++++
 7 files changed, 85 insertions(+), 13 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 88f07baedd..c4890cbb54 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -724,6 +724,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
+#                    When true, enables a zerocopy mechanism for sending memory
+#                    pages, if host does support it.
+#                    Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -758,6 +763,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
+	   'multifd-zerocopy',
            'block-bitmap-mapping' ] }
 
 ##
@@ -884,6 +890,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
+#                    When true, enables a zerocopy mechanism for sending memory
+#                    pages, if host does support it.
+#                    Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -934,6 +945,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+	    '*multifd-zerocopy': 'bool',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1080,6 +1092,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
+#                    When true, enables a zerocopy mechanism for sending memory
+#                    pages, if host does support it.
+#                    Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1128,6 +1145,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+	    '*multifd-zerocopy': 'bool',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fd..860d83cc41 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -338,6 +338,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+int migrate_multifd_zerocopy(void);
 
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..8f5c5a6953 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -20,7 +20,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f, bool last_sync);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
diff --git a/migration/migration.c b/migration/migration.c
index 6ac807ef3d..326f7c515f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -879,6 +879,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+    params->has_multifd_zerocopy = true;
+    params->multifd_zerocopy = s->parameters.multifd_zerocopy;
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1523,6 +1525,9 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
+    if (params->has_multifd_zerocopy) {
+        dest->multifd_zerocopy = params->multifd_zerocopy;
+    }
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1635,6 +1640,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
+    if (params->has_multifd_zerocopy) {
+        s->parameters.multifd_zerocopy = params->multifd_zerocopy;
+    }
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2516,6 +2524,15 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+int migrate_multifd_zerocopy(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.multifd_zerocopy;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4164,6 +4181,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+    DEFINE_PROP_BOOL("multifd-zerocopy", MigrationState,
+                      parameters.multifd_zerocopy, false),
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4261,6 +4280,7 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
+    params->has_multifd_zerocopy = true;
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..17a7d90de3 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -105,7 +105,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    int flags = 0;
+
+    if (migrate_multifd_zerocopy()) {
+        flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
+    }
+
+    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);
 }
 
 /**
@@ -575,19 +581,23 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f, bool last_sync)
 {
     int i;
+    bool flush_zerocopy;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->used) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return 0;
         }
     }
+
+    flush_zerocopy = last_sync && migrate_multifd_zerocopy();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -598,7 +608,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return 0;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -609,6 +619,17 @@ void multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zerocopy) {
+            int ret;
+            Error *err = NULL;
+
+            ret = qio_channel_flush_zerocopy(p->c, &err);
+            if (ret < 0) {
+                error_report_err(err);
+                return -1;
+            }
+        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -617,6 +638,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..ada57846a5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2839,7 +2839,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    multifd_send_sync_main(f, false);
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -2948,7 +2948,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        multifd_send_sync_main(rs->f, false);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_counters.transferred += 8;
@@ -3006,13 +3006,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-    if (ret >= 0) {
-        multifd_send_sync_main(rs->f);
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
+    if (ret < 0) {
+        return ret;
     }
 
-    return ret;
+    ret = multifd_send_sync_main(rs->f, true);
+    if (ret < 0) {
+        return -1;
+    }
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return 0;
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..b04f14ec1e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1364,6 +1364,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
+    case MIGRATION_PARAMETER_MULTIFD_ZEROCOPY:
+        p->has_multifd_zerocopy = true;
+        visit_type_bool(v, param, &p->multifd_zerocopy, &err);
+        break;
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
-- 
2.33.0


