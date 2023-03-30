Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FE6D0D64
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdy-00045I-6g; Thu, 30 Mar 2023 14:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdv-0003wW-Hu
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:59 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdr-0002CS-1x
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC8941F85D;
 Thu, 30 Mar 2023 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtULdrZbNmgeG+8GbFopzbhmF1MwlpcwBBoHGMhsoDI=;
 b=alQn+VKXxNLFtMa3bWIiZTHrvnJnBWuT7EmgJ870A8adEcA/3ZXRB9l4wvIprMjd0ej8rB
 +44niIwUomaz2JBUflKiUH9UA07WFPzDsZFkfN2TmNaSv7xx89v32nqo2zSzTS9NQD6wjs
 2vr98Y8gRQcHxx9jLXHQJeN8lCTosAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtULdrZbNmgeG+8GbFopzbhmF1MwlpcwBBoHGMhsoDI=;
 b=g/GzmAJagWpu4gYvj/WTG7Bp8xm2LPLvxWzzhtJ1IcCsEqjp3+0X/z7zDdhdt+L0wYqFoz
 3hNQG/O9TDlqmdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CD981348E;
 Thu, 30 Mar 2023 18:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCn0DELPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH v1 25/26] migration: Add direct-io parameter
Date: Thu, 30 Mar 2023 15:03:35 -0300
Message-Id: <20230330180336.2791-26-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Add the direct-io migration parameter that tells the migration code to
use O_DIRECT when opening the migration stream file whenever possible.

This is currently only used for the secondary channels of fixed-ram
migration, which can guarantee that writes are page aligned.

However the parameter could be made to affect other types of
file-based migrations in the future.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 include/qemu/osdep.h           |  2 ++
 migration/file.c               | 13 +++++++++++--
 migration/migration-hmp-cmds.c |  9 +++++++++
 migration/migration.c          | 32 ++++++++++++++++++++++++++++++++
 migration/migration.h          |  1 +
 qapi/migration.json            | 17 ++++++++++++++---
 util/osdep.c                   |  9 +++++++++
 7 files changed, 78 insertions(+), 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9eff0be95b..19c1d5f999 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -570,6 +570,8 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
 bool qemu_has_ofd_lock(void);
 #endif
 
+bool qemu_has_direct_io(void);
+
 #if defined(__HAIKU__) && defined(__i386__)
 #define FMT_pid "%ld"
 #elif defined(WIN64)
diff --git a/migration/file.c b/migration/file.c
index 6f40894488..1a40da097d 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -43,9 +43,18 @@ void file_send_channel_create(QIOTaskFunc f, void *data)
     QIOChannelFile *ioc;
     QIOTask *task;
     Error *errp = NULL;
+    int flags = outgoing_args.flags;
 
-    ioc = qio_channel_file_new_path(outgoing_args.fname,
-                                    outgoing_args.flags,
+    if (migrate_use_direct_io() && qemu_has_direct_io()) {
+        /*
+         * Enable O_DIRECT for the secondary channels. These are used
+         * for sending ram pages and writes should be guaranteed to be
+         * aligned to at least page size.
+         */
+        flags |= O_DIRECT;
+    }
+
+    ioc = qio_channel_file_new_path(outgoing_args.fname, flags,
                                     outgoing_args.mode, &errp);
     if (!ioc) {
         file_migration_cancel(errp);
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 72519ea99f..c9a8d84714 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -344,6 +344,11 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
                 }
             }
         }
+        if (params->has_direct_io) {
+            monitor_printf(mon, "%s: %s\n",
+                           MigrationParameter_str(MIGRATION_PARAMETER_DIRECT_IO),
+                           params->direct_io ? "on" : "off");
+        }
     }
 
     qapi_free_MigrationParameters(params);
@@ -600,6 +605,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         error_setg(&err, "The block-bitmap-mapping parameter can only be set "
                    "through QMP");
         break;
+    case MIGRATION_PARAMETER_DIRECT_IO:
+        p->has_direct_io = true;
+        visit_type_bool(v, param, &p->direct_io, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/migration/migration.c b/migration/migration.c
index 77d24a5114..65798171e4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1022,6 +1022,11 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
                        s->parameters.block_bitmap_mapping);
     }
 
+    if (s->parameters.has_direct_io) {
+        params->has_direct_io = true;
+        params->direct_io = s->parameters.direct_io;
+    }
+
     return params;
 }
 
@@ -1782,6 +1787,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->has_block_bitmap_mapping = true;
         dest->block_bitmap_mapping = params->block_bitmap_mapping;
     }
+
+    if (params->has_direct_io) {
+        dest->direct_io = params->direct_io;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1904,6 +1913,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
             QAPI_CLONE(BitmapMigrationNodeAliasList,
                        params->block_bitmap_mapping);
     }
+
+    if (params->has_direct_io) {
+        s->parameters.direct_io = params->direct_io;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -2885,6 +2898,24 @@ bool migrate_postcopy_preempt(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
 }
 
+bool migrate_use_direct_io(void)
+{
+    MigrationState *s;
+
+    /* For now O_DIRECT is only supported with fixed-ram */
+    if (!migrate_fixed_ram()) {
+        return false;
+    }
+
+    s = migrate_get_current();
+
+    if (s->parameters.has_direct_io) {
+        return s->parameters.direct_io;
+    }
+
+    return false;
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -4666,6 +4697,7 @@ static void migration_instance_init(Object *obj)
     params->has_announce_max = true;
     params->has_announce_rounds = true;
     params->has_announce_step = true;
+    params->has_direct_io = qemu_has_direct_io();
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
diff --git a/migration/migration.h b/migration/migration.h
index 8459201958..e0c9c78570 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -422,6 +422,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 int migrate_fixed_ram(void);
 bool migrate_multifd_use_packets(void);
+bool migrate_use_direct_io(void);
 bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
diff --git a/qapi/migration.json b/qapi/migration.json
index 22eea58ce3..2190d98ded 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -776,6 +776,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @direct-io: Open migration files with O_DIRECT when possible. Not
+#             all migration transports support this. (since 8.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -796,7 +799,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
-           'block-bitmap-mapping' ] }
+           'block-bitmap-mapping', 'direct-io' ] }
 
 ##
 # @MigrateSetParameters:
@@ -941,6 +944,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @direct-io: Open migration files with O_DIRECT when possible. Not
+#             all migration transports support this. (since 8.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -976,7 +982,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*direct-io': 'bool' } }
 
 ##
 # @migrate-set-parameters:
@@ -1141,6 +1148,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @direct-io: Open migration files with O_DIRECT when possible. Not
+#             all migration transports support this. (since 8.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -1174,7 +1184,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*direct-io': 'bool' } }
 
 ##
 # @query-migrate-parameters:
diff --git a/util/osdep.c b/util/osdep.c
index e996c4744a..d0227a60ab 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -277,6 +277,15 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
 }
 #endif
 
+bool qemu_has_direct_io(void)
+{
+#ifdef O_DIRECT
+    return true;
+#else
+    return false;
+#endif
+}
+
 static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
 {
     int ret;
-- 
2.35.3


