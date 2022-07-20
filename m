Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0657B583
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:30:49 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7ui-0007U5-Ua
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kQ-00052R-Rz
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kN-0000Rf-Lj
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658316006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygJfG344v2gd23UY2aZAuOgm2rvDNGZInXvjcm6cSV8=;
 b=SmvArZa766zxAwyMUFshuA+KBrq74h5Izw4vOxPnHWya+Wt47ssnTvTT51kB6VpK4WSv2o
 b+16fLlh9TJ0rNOqSktEcaSabGzR7XF5kIDLsEjnGauqIGZy5nKRX0ef61rj3Xei96HzyB
 PHJzH70JAKELXNReamgahuMwgdflGJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-bdYhAdW6Nk6NZv_osMJBOQ-1; Wed, 20 Jul 2022 07:20:04 -0400
X-MC-Unique: bdYhAdW6Nk6NZv_osMJBOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E6A8037AA;
 Wed, 20 Jul 2022 11:20:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 999CF2166B26;
 Wed, 20 Jul 2022 11:20:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 26/30] Add dirty-sync-missed-zero-copy migration stat
Date: Wed, 20 Jul 2022 12:19:22 +0100
Message-Id: <20220720111926.107055-27-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Leonardo Bras <leobras@redhat.com>

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220711211112.18951-3-leobras@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 2 ++
 monitor/hmp-cmds.c    | 5 +++++
 qapi/migration.json   | 7 ++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 7c7e529ca7..15ae48b209 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1057,6 +1057,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->normal_bytes = ram_counters.normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
+    info->ram->dirty_sync_missed_zero_copy =
+            ram_counters.dirty_sync_missed_zero_copy;
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ca98df0495..a6dc79e0d5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -307,6 +307,11 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
                            info->ram->postcopy_bytes >> 10);
         }
+        if (info->ram->dirty_sync_missed_zero_copy) {
+            monitor_printf(mon,
+                           "Zero-copy-send fallbacks happened: %" PRIu64 " times\n",
+                           info->ram->dirty_sync_missed_zero_copy);
+        }
     }
 
     if (info->has_disk) {
diff --git a/qapi/migration.json b/qapi/migration.json
index 7586df3dea..81185d4311 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -55,6 +55,10 @@
 # @postcopy-bytes: The number of bytes sent during the post-copy phase
 #                  (since 7.0).
 #
+# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
+#                               not avoid copying dirty pages. This is between
+#                               0 and @dirty-sync-count * @multifd-channels.
+#                               (since 7.1)
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -65,7 +69,8 @@
            'postcopy-requests' : 'int', 'page-size' : 'int',
            'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
            'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
-           'postcopy-bytes' : 'uint64' } }
+           'postcopy-bytes' : 'uint64',
+           'dirty-sync-missed-zero-copy' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
-- 
2.36.1


