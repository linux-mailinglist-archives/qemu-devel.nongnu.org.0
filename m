Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E26A8703
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXluO-0000RO-7R; Thu, 02 Mar 2023 11:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltn-0000G2-Ha
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltm-000828-09
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n58oOHqvhbanlic4JG+WVIIG11yqcC7BcHYEYeeQkdM=;
 b=I7JRi7HkcA6LeacbTlzZJ0f16oMfDv9XxsHosvJb5lcI/8DXQcTX8Wm1E43AgsYmGDqlzz
 KJHd1clFmdi33tXtZnG8YTo5fRiD6jRT1DRCzi6n+8nIt5QRUf+GiT75A7O2R5RNfaECXN
 w+M0tCxDr/RPx45PuSmTg9+xiCbFHro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-NxvD68uyNyObd5VY8Z6psA-1; Thu, 02 Mar 2023 11:35:15 -0500
X-MC-Unique: NxvD68uyNyObd5VY8Z6psA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7924800050;
 Thu,  2 Mar 2023 16:35:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8ECC492C3E;
 Thu,  2 Mar 2023 16:35:12 +0000 (UTC)
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
Subject: [PATCH 21/43] migration: Create migrate_throttle_trigger_threshold()
Date: Thu,  2 Mar 2023 17:33:48 +0100
Message-Id: <20230302163410.11399-22-quintela@redhat.com>
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
 migration/options.h | 1 +
 migration/options.c | 9 +++++++++
 migration/ram.c     | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index ea45c87cfe..c9955e87f8 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -57,6 +57,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 #endif
diff --git a/migration/options.c b/migration/options.c
index b2f15eda6c..50d982673c 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -556,6 +556,15 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+uint8_t migrate_throttle_trigger_threshold(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.throttle_trigger_threshold;
+}
+
 uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s;
diff --git a/migration/ram.c b/migration/ram.c
index 93c9d016c4..fc456074ee 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1184,8 +1184,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
 
 static void migration_trigger_throttle(RAMState *rs)
 {
-    MigrationState *s = migrate_get_current();
-    uint64_t threshold = s->parameters.throttle_trigger_threshold;
+    uint64_t threshold = migrate_throttle_trigger_threshold();
     uint64_t bytes_xfer_period =
         stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
-- 
2.39.2


