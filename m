Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D26E9632
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:47:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUY4-0006yt-7V; Thu, 20 Apr 2023 09:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXX-0006A9-Nw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXS-00066d-FY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NC2U22V7AJz+nbmiLndU2R2KHFuYwTzJx/+4xNKJhE=;
 b=fETAT6c2u1suThsFWULDiotKgJwEQs7Mb6iRM6VVzZ7f8JiGwXz0tCKiJoIASQ80HgzTUc
 kOv4YYwVfgTeJ9mgr1cvZkX0otjYmDJy+fCOY6tD4R3a6MioYPD1F7k64ZdCHhOCs6soe+
 u2xZldUTyNXwkeG5bNhDCfpEPgvuXM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-rpPGmWyoPtGE34QUgEm_vA-1; Thu, 20 Apr 2023 09:41:23 -0400
X-MC-Unique: rpPGmWyoPtGE34QUgEm_vA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DFE8800047;
 Thu, 20 Apr 2023 13:41:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E82BC4020BED;
 Thu, 20 Apr 2023 13:41:19 +0000 (UTC)
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
Subject: [PATCH v2 26/43] migration: Create migrate_cpu_throttle_increment()
 function
Date: Thu, 20 Apr 2023 15:39:45 +0200
Message-Id: <20230420134002.29531-27-quintela@redhat.com>
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
---
 migration/options.c | 9 +++++++++
 migration/options.h | 1 +
 migration/ram.c     | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/options.c b/migration/options.c
index 34a1f58f96..e31d907d3d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -509,6 +509,15 @@ int migrate_compress_wait_thread(void)
     return s->parameters.compress_wait_thread;
 }
 
+uint8_t migrate_cpu_throttle_increment(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.cpu_throttle_increment;
+}
+
 uint8_t migrate_cpu_throttle_initial(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index fd8b91d767..49b29bdafd 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -50,6 +50,7 @@ uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
+uint8_t migrate_cpu_throttle_increment(void);
 uint8_t migrate_cpu_throttle_initial(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
diff --git a/migration/ram.c b/migration/ram.c
index 70576b1f52..c29c47f94d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -713,7 +713,7 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
 {
     MigrationState *s = migrate_get_current();
     uint64_t pct_initial = migrate_cpu_throttle_initial();
-    uint64_t pct_increment = s->parameters.cpu_throttle_increment;
+    uint64_t pct_increment = migrate_cpu_throttle_increment();
     bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
     int pct_max = migrate_max_cpu_throttle();
 
-- 
2.39.2


