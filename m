Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F66ECF4E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:39:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFx-0008IG-43; Mon, 24 Apr 2023 09:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFb-0007TJ-FV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFZ-0001bN-A7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03i664peNjOruQHOiUPJjbN+JXHLxMgYHGIdIGXbwrU=;
 b=aqQILXbso/k1mqe5nxrFHR4RSCO6Uf4r07t8PRFkj6zWQhY2t7bC5DL/p3Q3lwg+Dl+MkS
 M6RkyBfGTd/PjWI2JduCNC4jKqkXt0ir7I6NVa4AWRWDSV+Tl6Wpi/ThzwxJ0eeZHknBVu
 nAATI1lJ04tAMhhms+Ddh4gbJPQCBfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-cfWzBIJ0Ow6-uAJM_1Y7Lg-1; Mon, 24 Apr 2023 09:28:56 -0400
X-MC-Unique: cfWzBIJ0Ow6-uAJM_1Y7Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88AC62A59579;
 Mon, 24 Apr 2023 13:28:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D126B14171B8;
 Mon, 24 Apr 2023 13:28:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PULL 27/30] migration: Create migrate_cpu_throttle_increment()
 function
Date: Mon, 24 Apr 2023 15:27:27 +0200
Message-Id: <20230424132730.70752-28-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/options.c | 9 +++++++++
 migration/options.h | 1 +
 migration/ram.c     | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/options.c b/migration/options.c
index f7fb6999f7..31435d2b45 100644
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
index 5e855d5c22..5645745a42 100644
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


