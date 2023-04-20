Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B76E9647
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUXp-0006I4-Nr; Thu, 20 Apr 2023 09:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXV-00063Z-8m
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXK-00065c-2l
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhpFrw/MA9nliITLVARe4P2rJwAbLQ6NAkK/cKfneY0=;
 b=iETL9VtlCx80YiYEduQvBV9uJBtVqFgb7MaTuJuCCn+8ejsBgdUNESLbJHhd+c6Ky8OLCH
 eH6Al2XRra7DvPEsZ1xXviGEhi87NPCepDcXycK1+hVDMkWbefkDHum0CDqCGklGnRgn2n
 o3ebdAmrUZEKpB7HI1DnKl0KMzv8YYI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-cCOEwktQMhy5bm0AjDe_Gg-1; Thu, 20 Apr 2023 09:41:14 -0400
X-MC-Unique: cCOEwktQMhy5bm0AjDe_Gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4030381D4C3;
 Thu, 20 Apr 2023 13:41:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B7F4020BED;
 Thu, 20 Apr 2023 13:41:11 +0000 (UTC)
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
Subject: [PATCH v2 23/43] migration: Create migrate_max_cpu_throttle()
Date: Thu, 20 Apr 2023 15:39:42 +0200
Message-Id: <20230420134002.29531-24-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
 migration/migration.h | 2 --
 migration/options.c   | 9 +++++++++
 migration/options.h   | 1 +
 migration/ram.c       | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 86051af132..3ae938b19c 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -451,8 +451,6 @@ bool migrate_postcopy(void);
 
 int migrate_use_tls(void);
 
-int migrate_max_cpu_throttle(void);
-
 uint64_t ram_get_total_transferred_pages(void);
 
 /* Sending on the return path - generic and then for each message type */
diff --git a/migration/options.c b/migration/options.c
index 0e102e5700..2cb04fbbd1 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -517,6 +517,15 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
+uint8_t migrate_max_cpu_throttle(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.max_cpu_throttle;
+}
+
 int64_t migrate_max_postcopy_bandwidth(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index adc2879bbb..72b1a320b7 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -51,6 +51,7 @@ int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
+uint8_t migrate_max_cpu_throttle(void);
 int64_t migrate_max_postcopy_bandwidth(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
diff --git a/migration/ram.c b/migration/ram.c
index 68801012ba..2ab678bb45 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -715,7 +715,7 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
     uint64_t pct_initial = s->parameters.cpu_throttle_initial;
     uint64_t pct_increment = s->parameters.cpu_throttle_increment;
     bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
-    int pct_max = s->parameters.max_cpu_throttle;
+    int pct_max = migrate_max_cpu_throttle();
 
     uint64_t throttle_now = cpu_throttle_get_percentage();
     uint64_t cpu_now, cpu_ideal, throttle_inc;
-- 
2.39.2


