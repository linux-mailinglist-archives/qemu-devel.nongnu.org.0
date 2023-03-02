Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E106A86C0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltL-0006ve-PL; Thu, 02 Mar 2023 11:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltJ-0006kh-4Z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltH-0007Jg-Mq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N29sYsRVsE2T8XrRKtIwhOxqpJLcijz8qGaO0Oyn9aE=;
 b=HohazijhNMFdQMTMIwWiZWVb3ypy0zjA/Qug3KMxDq6h5cgXlhivQ3pb1F58bEdRzcl6tG
 hp2Kai5NTvzYcyhm198nlou8iW4QNXGJOfBJrjkYSuIQET/p75pJsBX07Sh5yariKR7a+n
 0QV0OYffVpdSuKYbq2hQCbZyw3OnTWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-q77KDZGEPo-d4hO80sOCDA-1; Thu, 02 Mar 2023 11:34:44 -0500
X-MC-Unique: q77KDZGEPo-d4hO80sOCDA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7903B3C14104;
 Thu,  2 Mar 2023 16:34:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94371492C3E;
 Thu,  2 Mar 2023 16:34:41 +0000 (UTC)
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
Subject: [PATCH 13/43] migration: Create migrate_rdma_pin_all() function
Date: Thu,  2 Mar 2023 17:33:40 +0100
Message-Id: <20230302163410.11399-14-quintela@redhat.com>
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
 migration/options.c | 7 +++++++
 migration/rdma.c    | 6 +++---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 51c7f2a043..eaa2b6d2cb 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -32,6 +32,7 @@ bool migrate_pause_before_switchover(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
+bool migrate_rdma_pin_all(void);
 bool migrate_release_ram(void);
 bool migrate_return_path(void);
 bool migrate_validate_uuid(void);
diff --git a/migration/options.c b/migration/options.c
index c1182bf01a..ddf23ede6f 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -140,6 +140,13 @@ bool migrate_postcopy_ram(void)
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
diff --git a/migration/rdma.c b/migration/rdma.c
index 35f3d6bebe..a13578318c 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -35,6 +35,7 @@
 #include <rdma/rdma_cma.h>
 #include "trace.h"
 #include "qom/object.h"
+#include "options.h"
 #include <poll.h>
 
 /*
@@ -4177,8 +4178,7 @@ void rdma_start_outgoing_migration(void *opaque,
         goto err;
     }
 
-    ret = qemu_rdma_source_init(rdma,
-        s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+    ret = qemu_rdma_source_init(rdma,migrate_rdma_pin_all(), errp);
 
     if (ret) {
         goto err;
@@ -4200,7 +4200,7 @@ void rdma_start_outgoing_migration(void *opaque,
         }
 
         ret = qemu_rdma_source_init(rdma_return_path,
-            s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+                                    migrate_rdma_pin_all(), errp);
 
         if (ret) {
             goto return_path_err;
-- 
2.39.2


