Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972186E9641
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUXH-0005QB-A2; Thu, 20 Apr 2023 09:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXC-0005Lt-N8
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXB-00063H-6T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dd1qpIg5EosZRg1/iERllcRBSzXOoLMPBthcseLXCU=;
 b=B+A2BhJo8Z1IvdIgh27r0jW/TNH6RyoqNvubZgTcpSCSC3OYs2SKleeg40kyPUgzvMnccd
 lalNpgggTrtrcBPnW2gepXK2/XzgboCJxf0PD97W1Fo5MCdmFJxu6Ojvwbe4qd+FFxH75g
 nfkPy8/kzthPuxc1BOmlnceghz10XYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-Vhv7msquOOqcuzz8yjo-LA-1; Thu, 20 Apr 2023 09:41:08 -0400
X-MC-Unique: Vhv7msquOOqcuzz8yjo-LA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05CB9811E7E;
 Thu, 20 Apr 2023 13:41:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AAC64020BED;
 Thu, 20 Apr 2023 13:41:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 21/43] migration: Create
 migrate_throttle_trigger_threshold()
Date: Thu, 20 Apr 2023 15:39:40 +0200
Message-Id: <20230420134002.29531-22-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.c | 9 +++++++++
 migration/options.h | 1 +
 migration/ram.c     | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 2b6d88b4b9..b9f3815f7e 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -554,6 +554,15 @@ int migrate_multifd_zstd_level(void)
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
diff --git a/migration/options.h b/migration/options.h
index 96d5a8e6e4..aa54443353 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -55,6 +55,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 7f28588dde..68801012ba 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1179,8 +1179,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
 
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


