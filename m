Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02D570C8C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:14:05 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0jE-0007hB-Lj
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0h5-0003cQ-Gj
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0h4-0004bZ-0F
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657573909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EnfjwoFu5gXzhfioZUD23J5aySyG4aYgh7E7ECoRy0=;
 b=PlR86hOxAigvdMxffGvF0HlOreOgA3mNveX0qjTloFvrMs/ckjuWYFsLmUIWJXlFjiXFWm
 VykliyqfjJetsHenT5x/ZsL2Ta1QZTSZM2FIgy8RAbfDXUq9ntxmwDsL6UA5LtgRJJZNk0
 XVciybKGnD96A95bEgrXfHOg5/PDL1Q=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-bMybbfg6OQiTJDXwVH9fFw-1; Mon, 11 Jul 2022 17:11:40 -0400
X-MC-Unique: bMybbfg6OQiTJDXwVH9fFw-1
Received: by mail-oi1-f199.google.com with SMTP id
 w1-20020aca3001000000b00335750b9a50so4342014oiw.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EnfjwoFu5gXzhfioZUD23J5aySyG4aYgh7E7ECoRy0=;
 b=gOv2UMMkAmCEGF+7l6yEzUtQBV0alDmq11c4Im+lSyAtDAu4mHySJOEJ+UMjH9IOaR
 EGge98Aych6loADfZzYZ7+mDLQ7dGuOvzpX4tIDBnKxfZUwASNiBjiOibpX7kTwtg3HY
 BaJg/THeI0mrh9hnI9pPpzdWdSkq/CUdUrF4peyZv/S8aByo81XY2hcLvo0om4rnqvnM
 +A3rW81d2pmGEHQDBXVj/K8+azSDbWG/VS08V5PcczhDvXltDv/p7Xod1SFg9rxLlbNn
 uUAQMMU5BvbIFqyfbXJDJ0i/VYZv/1tufbe2yLNQW/37AZtp6hhyMh7tAEV00rhL1Uwn
 Rv5w==
X-Gm-Message-State: AJIora9topofxMfNxCH3JgeDucs00s6+80nMUVBw5wWaeUGPNR4Bbq2Y
 0754fiFVD3bw4utmL3O4hQppgOR/oX/2wc7JgaHh4PcLMELz1qhsOhzym9ief2teRIlqdOGwzPo
 o883AMYAUlymRfKU=
X-Received: by 2002:a05:6808:114b:b0:337:ab89:d5be with SMTP id
 u11-20020a056808114b00b00337ab89d5bemr185811oiu.299.1657573899890; 
 Mon, 11 Jul 2022 14:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5gqwUJYmDwpxwZiAs7Ksc92L+1ljVheFBGg2v2npqOgSwfuTGBCb55aVPvQQ+PDRKHMgWjg==
X-Received: by 2002:a05:6808:114b:b0:337:ab89:d5be with SMTP id
 u11-20020a056808114b00b00337ab89d5bemr185800oiu.299.1657573899723; 
 Mon, 11 Jul 2022 14:11:39 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:d647:bb68:29a5:e512:2c8b])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a0568080a8700b00339eb701c6csm3140343oij.41.2022.07.11.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 14:11:39 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] Add dirty-sync-missed-zero-copy migration stat
Date: Mon, 11 Jul 2022 18:11:12 -0300
Message-Id: <20220711211112.18951-3-leobras@redhat.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711211112.18951-1-leobras@redhat.com>
References: <20220711211112.18951-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/migration.json   | 7 ++++++-
 migration/migration.c | 2 ++
 monitor/hmp-cmds.c    | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 7102e474a6..4a03e8f173 100644
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
diff --git a/migration/migration.c b/migration/migration.c
index 78f5057373..048f7f8bdb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1027,6 +1027,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
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
-- 
2.37.0


