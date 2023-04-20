Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E266E9604
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWs-0004Bd-Kr; Thu, 20 Apr 2023 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWq-0004Ad-4J
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWo-0005sn-Nu
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxw7eE71bAW2feJPJIGftq669PA9w96E/b1BrG6sSYQ=;
 b=QyVbhQ8YLddiWNdkyscBn8cBJQTikmYZouVt1FlPfD1Am8qWHgljUIaREpjrLjAKvt5R6u
 DBn5YECX5e6VIGZ+ckPC/rMi1QG0wXQpnR3qIG7KvshxwBV/eKNYb1yh9weujo0EABSu0b
 xV33jqyfptdhkOnlAv4ewbjfQeKKMKk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-kqbJL1uXMrWr_X-iPVPqeQ-1; Thu, 20 Apr 2023 09:40:44 -0400
X-MC-Unique: kqbJL1uXMrWr_X-iPVPqeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2557A1C087B3;
 Thu, 20 Apr 2023 13:40:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A59A4020BED;
 Thu, 20 Apr 2023 13:40:41 +0000 (UTC)
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
Subject: [PATCH v2 13/43] migration: Create migrate_rdma_pin_all() function
Date: Thu, 20 Apr 2023 15:39:32 +0200
Message-Id: <20230420134002.29531-14-quintela@redhat.com>
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/options.c | 7 +++++++
 migration/options.h | 1 +
 migration/rdma.c    | 6 +++---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 2003e413da..9c9b8e5863 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -138,6 +138,13 @@ bool migrate_postcopy_ram(void)
     return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 }
 
+bool migrate_rdma_pin_all(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
+}
+
 bool migrate_release_ram(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index 316efd1063..25c002b37a 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -30,6 +30,7 @@ bool migrate_pause_before_switchover(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
+bool migrate_rdma_pin_all(void);
 bool migrate_release_ram(void);
 bool migrate_return_path(void);
 bool migrate_validate_uuid(void);
diff --git a/migration/rdma.c b/migration/rdma.c
index bf55e2f163..3e7b68c482 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -35,6 +35,7 @@
 #include <rdma/rdma_cma.h>
 #include "trace.h"
 #include "qom/object.h"
+#include "options.h"
 #include <poll.h>
 
 /*
@@ -4178,8 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
         goto err;
     }
 
-    ret = qemu_rdma_source_init(rdma,
-        s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+    ret = qemu_rdma_source_init(rdma,migrate_rdma_pin_all(), errp);
 
     if (ret) {
         goto err;
@@ -4201,7 +4201,7 @@ void rdma_start_outgoing_migration(void *opaque,
         }
 
         ret = qemu_rdma_source_init(rdma_return_path,
-            s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+                                    migrate_rdma_pin_all(), errp);
 
         if (ret) {
             goto return_path_err;
-- 
2.39.2


