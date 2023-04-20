Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976056E9611
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUY9-0007PS-0k; Thu, 20 Apr 2023 09:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXd-0006KT-Q0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXb-0006CU-E2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqTo9T60Fl3Am0B1FUKFeGUo4JJzZmYdLOt4yNT5HTU=;
 b=MALJTs9OmlMmKzkxU+Mf7G7ZB9WAoOM003wUiGc2bIqUKCbp3FKhFivvzgpLpS7g5EqyvR
 TLDaCQiFzKr5F4VgeeN3zQR4FdJPW2xZaUsyYnnpChiOFuRYkMbrV2JGRZAQDv+DMJzt1V
 hrUX2aI3ccgpTFLLMR8YQdHx8ySACQo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-6qrGD3wuMky_NnhCyi47cg-1; Thu, 20 Apr 2023 09:41:35 -0400
X-MC-Unique: 6qrGD3wuMky_NnhCyi47cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 061EE1C0514B;
 Thu, 20 Apr 2023 13:41:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 638954020BED;
 Thu, 20 Apr 2023 13:41:31 +0000 (UTC)
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
Subject: [PATCH v2 30/43] migration: Create migrate_max_bandwidth() function
Date: Thu, 20 Apr 2023 15:39:49 +0200
Message-Id: <20230420134002.29531-31-quintela@redhat.com>
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
 migration/migration.c | 2 +-
 migration/options.c   | 9 +++++++++
 migration/options.h   | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index efb098c4e4..2bbb4e888b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3767,7 +3767,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
             XFER_LIMIT_RATIO;
     } else {
         /* This is a fresh new migration */
-        rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
+        rate_limit = migrate_max_bandwidth() / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
         notifier_list_notify(&migration_state_notifiers, s);
diff --git a/migration/options.c b/migration/options.c
index 360faf53ca..0f4862b822 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -573,6 +573,15 @@ uint8_t migrate_max_cpu_throttle(void)
     return s->parameters.max_cpu_throttle;
 }
 
+uint64_t migrate_max_bandwidth(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.max_bandwidth;
+}
+
 int64_t migrate_max_postcopy_bandwidth(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index c1413c0e85..41d7c75662 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -65,6 +65,7 @@ uint8_t migrate_cpu_throttle_initial(void);
 bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
+uint64_t migrate_max_bandwidth(void);
 int64_t migrate_max_postcopy_bandwidth(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
-- 
2.39.2


