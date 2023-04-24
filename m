Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985756ECF46
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:39:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwG6-0000DV-PN; Mon, 24 Apr 2023 09:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFe-0007VX-E6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFc-0001d0-PJ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POIHjn/hGnJJjweM4fpqFFuKQqc53WvakhnGWxLjUu8=;
 b=gUfVereGSe0U9BcsJ9V3x9UKxTV68M8Z5Ar47YOKVyNzjDvDHwYFDm5PrbC9G3HUCHQbqg
 ukSV/zhu1u85ylGhPM3p4+4QX3DkmUfAkmCYGzsiQtK6cXNP9bZOA5H1/LtcwTYr6vClnm
 fPBDnx6ygnkJWFKHtvC+OZAkGeEYD7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-uhp62Og7NUK5pTQT5AxKrw-1; Mon, 24 Apr 2023 09:28:59 -0400
X-MC-Unique: uhp62Og7NUK5pTQT5AxKrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 817F7185A78F;
 Mon, 24 Apr 2023 13:28:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7CDA14171BA;
 Mon, 24 Apr 2023 13:28:55 +0000 (UTC)
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
Subject: [PULL 28/30] migration: Create migrate_cpu_throttle_tailslow()
 function
Date: Mon, 24 Apr 2023 15:27:28 +0200
Message-Id: <20230424132730.70752-29-quintela@redhat.com>
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
 migration/ram.c     | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 31435d2b45..615534c151 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -527,6 +527,15 @@ uint8_t migrate_cpu_throttle_initial(void)
     return s->parameters.cpu_throttle_initial;
 }
 
+bool migrate_cpu_throttle_tailslow(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.cpu_throttle_tailslow;
+}
+
 int migrate_decompress_threads(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index 49b29bdafd..99f6bbd7a1 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -52,6 +52,7 @@ int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 uint8_t migrate_cpu_throttle_increment(void);
 uint8_t migrate_cpu_throttle_initial(void);
+bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
 int64_t migrate_max_postcopy_bandwidth(void);
diff --git a/migration/ram.c b/migration/ram.c
index 5645745a42..01356f60a4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -711,10 +711,9 @@ static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
 static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
                                     uint64_t bytes_dirty_threshold)
 {
-    MigrationState *s = migrate_get_current();
     uint64_t pct_initial = migrate_cpu_throttle_initial();
     uint64_t pct_increment = migrate_cpu_throttle_increment();
-    bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
+    bool pct_tailslow = migrate_cpu_throttle_tailslow();
     int pct_max = migrate_max_cpu_throttle();
 
     uint64_t throttle_now = cpu_throttle_get_percentage();
-- 
2.39.2


