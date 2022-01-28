Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBE4A01C9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:21:51 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDXkj-0008VK-UE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCy-0001zK-Il
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDWCr-0002VR-4K
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643395338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qKHJ+kz44DX+SXjXAxR04KqrnALWnZetuh9UunKmNQ=;
 b=YCCliEhEFVQddPfm3tkEvlyRqouGo/FGHVn1HIiMk2ZvPcFDvXMomt5GuXQS1Ui/GHphmt
 2H9nh7gCN8zsoGOyFP6Fj9fBcpNU/2HKzgXhQyQlzs/CKFSYNYpj2kkAijYMMI/XHQxgJo
 oz/RDwEgIFffGx2dpuPtSwPneWyJ5SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-_C0uVfzHOVeLDThVN2JNpw-1; Fri, 28 Jan 2022 13:42:16 -0500
X-MC-Unique: _C0uVfzHOVeLDThVN2JNpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD349101F7A4;
 Fri, 28 Jan 2022 18:42:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4669E12E25;
 Fri, 28 Jan 2022 18:42:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Fri, 28 Jan 2022 19:30:28 +0100
Message-Id: <20220128183033.31998-32-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Provide information on the number of bytes copied in the pre-copy,
downtime and post-copy phases of migration.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 13 ++++++++++++-
 migration/migration.c |  3 +++
 migration/ram.c       |  7 +++++++
 monitor/hmp-cmds.c    | 12 ++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..5975a0e104 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -46,6 +46,15 @@
 # @pages-per-second: the number of memory pages transferred per second
 #                    (Since 4.0)
 #
+# @precopy-bytes: The number of bytes sent in the pre-copy phase
+#                 (since 7.0).
+#
+# @downtime-bytes: The number of bytes sent while the guest is paused
+#                  (since 7.0).
+#
+# @postcopy-bytes: The number of bytes sent during the post-copy phase
+#                  (since 7.0).
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -54,7 +63,9 @@
            'normal-bytes': 'int', 'dirty-pages-rate' : 'int',
            'mbps' : 'number', 'dirty-sync-count' : 'int',
            'postcopy-requests' : 'int', 'page-size' : 'int',
-           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64' } }
+           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
+           'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
+           'postcopy-bytes' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
diff --git a/migration/migration.c b/migration/migration.c
index 771f3e2bec..bcc385b94b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1014,6 +1014,9 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
     info->ram->pages_per_second = s->pages_per_second;
+    info->ram->precopy_bytes = ram_counters.precopy_bytes;
+    info->ram->downtime_bytes = ram_counters.downtime_bytes;
+    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/ram.c b/migration/ram.c
index 619a1d9a6b..ca879c744f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -389,6 +389,13 @@ MigrationStats ram_counters;
 
 static void ram_transferred_add(uint64_t bytes)
 {
+    if (runstate_is_running()) {
+        ram_counters.precopy_bytes += bytes;
+    } else if (migration_in_postcopy()) {
+        ram_counters.postcopy_bytes += bytes;
+    } else {
+        ram_counters.downtime_bytes += bytes;
+    }
     ram_counters.transferred += bytes;
 }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156b28..8c384dc1b2 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -293,6 +293,18 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy request count: %" PRIu64 "\n",
                            info->ram->postcopy_requests);
         }
+        if (info->ram->precopy_bytes) {
+            monitor_printf(mon, "precopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->precopy_bytes >> 10);
+        }
+        if (info->ram->downtime_bytes) {
+            monitor_printf(mon, "downtime ram: %" PRIu64 " kbytes\n",
+                           info->ram->downtime_bytes >> 10);
+        }
+        if (info->ram->postcopy_bytes) {
+            monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->postcopy_bytes >> 10);
+        }
     }
 
     if (info->has_disk) {
-- 
2.34.1


