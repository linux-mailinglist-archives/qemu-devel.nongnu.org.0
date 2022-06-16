Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B554DF6D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:48:14 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n2m-0006OO-O3
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjc-0001Yj-EK
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:20 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mja-0001sk-FC
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:20 -0400
Received: by mail-lj1-x234.google.com with SMTP id h23so1010679ljl.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7tNdbLBzRKOlUlgc8g7K1sMB89Nl+L+jwQpxvFRcsBc=;
 b=SpgcQLwaX0AeEce1nwBSNmHN6UxPq7YrDQ+TaQYXr3NEnbh99yFQrapylvjw+BRW7i
 R9bO9C16d7OOuAXRPFDuGaz4KSovSEy+mgXt3s15+plzG5sjr3idnVKbtWCc3pDtN1Xl
 VNre9/VAA9Md7V1crfktBaUNGck0qcSPtzZWQm6OXshib1ETrLcEhPXjXHIF92aFZN+0
 WPfsY9RDUKkUJlHDd26F1ms5NCQh69y9DxtLN+hd9xP0duw8QJB3X0RJ+lRnOhK2rN1A
 K/4XBAF5ICdSAWQSp+1LONGbqLPEgqaumjH4pedA1TiyBdSfbM9EX1pAcmKkY/3bz4BY
 62MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7tNdbLBzRKOlUlgc8g7K1sMB89Nl+L+jwQpxvFRcsBc=;
 b=39TNcDN4JTizEXFjwvD4uzG86aJgX+dvekvwRnpJSFxgAa1kOy/gb/+yfoRI9AXRmF
 JduL581UhimRVExMo9q0wLSHMly2FC0mQFQepdzZjQt1VHR5SnSL3T3GnW1Or1bUjxw4
 GuvBvmWuM4qLWvS+od1KnlwoKHRVIoB7aZz/l42moOW/MvOBayz8tzK1BQNbWY2hBRnB
 1NcxTKtFZddYcu9Rht3Yn26Xb1+V5m+rRCab/QoQntELjt/HB+NKQlo8weQ5jjY5Feat
 7rxDIJYHhBDftP/Wvw6h0gMOBZHr+FUZJjEFwAdB0yDTK+vd0HB0arN9VHe9+1qxelex
 mZqA==
X-Gm-Message-State: AJIora9lylaRU9cvMZdPGmgK7JCuH7ZMFKYAnl7TH7NdmkSi+BZV+WF9
 hXf/kL+KyWFlfb+ojHd69Q3lxU7ypzRE6RjO
X-Google-Smtp-Source: AGRyM1sy6TKK5U/ZlxPmqodnE/huwnOmO+EuppB4lwusAdREYCHCy0ief+4dCulU/so5dkabgI5rgA==
X-Received: by 2002:a05:651c:1a20:b0:25a:2f43:1d2 with SMTP id
 by32-20020a05651c1a2000b0025a2f4301d2mr2140996ljb.65.1655375296150; 
 Thu, 16 Jun 2022 03:28:16 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:15 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 01/17] migration: Implemented new parameter stream_content
Date: Thu, 16 Jun 2022 13:27:55 +0300
Message-Id: <20220616102811.219007-2-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This new optional parameter contains inormation about migration
stream parts to be sent (such as RAM, block, bitmap). This looks
better than using capabilities to solve problem of dividing
migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
 migration/migration.h |  2 ++
 qapi/migration.json   | 21 ++++++++++++++++---
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2900..4adcc87d1d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1334,6 +1334,12 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     }
 }
 
+static bool check_stream_parts(strList *stream_content_list)
+{
+    /* To be implemented in ext commits */
+    return true;
+}
+
 /*
  * Check whether the parameters are valid. Error will be put into errp
  * (if provided). Return true if valid, otherwise false.
@@ -1482,7 +1488,12 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         return false;
     }
 
-    return true;
+    if (params->has_stream_content_list &&
+        !check_stream_parts(params->stream_content_list)) {
+        error_setg(errp, "Invalid parts of stream given for stream-content");
+    }
+
+   return true;
 }
 
 static void migrate_params_test_apply(MigrateSetParameters *params,
@@ -1581,6 +1592,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->has_block_bitmap_mapping = true;
         dest->block_bitmap_mapping = params->block_bitmap_mapping;
     }
+
+    if (params->has_stream_content_list) {
+        dest->has_stream_content_list = true;
+        dest->stream_content_list = params->stream_content_list;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1703,6 +1719,13 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
             QAPI_CLONE(BitmapMigrationNodeAliasList,
                        params->block_bitmap_mapping);
     }
+
+    if (params->has_stream_content_list) {
+        qapi_free_strList(s->parameters.stream_content_list);
+        s->parameters.has_stream_content_list = true;
+        s->parameters.stream_content_list =
+            QAPI_CLONE(strList, params->stream_content_list);
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -2620,6 +2643,28 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+/* Checks if stream-content parameter has section_name in list */
+bool migrate_find_stream_content(const char *section_name)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    if (!s->parameters.has_stream_content_list) {
+        return false;
+    }
+
+    strList *list = s->parameters.stream_content_list;
+
+    for (; list; list = list->next) {
+        if (!strcmp(list->value, section_name)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/migration.h b/migration/migration.h
index 2de861df01..411c58e919 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -396,6 +396,8 @@ bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
 
+bool migrate_find_stream_content(const char *section_name);
+
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
                           uint32_t value);
diff --git a/qapi/migration.json b/qapi/migration.json
index 18e2610e88..80acf6dbc3 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -760,6 +760,12 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @stream-content-list: Parameter control content of migration stream such as RAM,
+#                       vmstate, block and dirty-bitmaps. This is optional parameter
+#                       so migration will work correctly without it.
+#                       This parameter takes string list as description of content
+#                       and include that part of migration stream. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -780,7 +786,8 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
-           'block-bitmap-mapping' ] }
+           'block-bitmap-mapping',
+           'stream-content-list' ] }
 
 ##
 # @MigrateSetParameters:
@@ -925,6 +932,12 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @stream-content-list: Parameter control content of migration stream such as RAM,
+#                       vmstate, block and dirty-bitmaps. This is optional parameter
+#                       so migration will work correctly without it.
+#                       This parameter takes string list as description of content
+#                       and include that part of migration stream. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -960,7 +973,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*stream-content-list': [ 'str' ] } }
 
 ##
 # @migrate-set-parameters:
@@ -1158,7 +1172,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*stream-content-list': [ 'str' ] } }
 
 ##
 # @query-migrate-parameters:
-- 
2.31.1


