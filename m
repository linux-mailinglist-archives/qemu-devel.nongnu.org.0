Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D883A6E964D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUXY-0005vU-LL; Thu, 20 Apr 2023 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXL-0005jj-1G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXJ-00065N-GY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9azH+M8impGZXeualRkRQS2DjUArd/2vTFLjxBFkkUw=;
 b=PnmLeKMxyfGT9tplOeBI6srtiVnJwYiiTTC/VcurqWpLr0vWzGsdMoH4CdmfLuFC3QqnrA
 EnyONen+52CNjOMH8655FHXRc7sP1VzAJIBsVNnpNwRYnrlARqd5LvFBVfqlsqcO4uJNQh
 2YmTR/+/IKbM5yfkV1p38ZC0zmtLBZs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-Iz8B_8LvM_-N7XkNscy0ow-1; Thu, 20 Apr 2023 09:41:17 -0400
X-MC-Unique: Iz8B_8LvM_-N7XkNscy0ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C854D858F0E;
 Thu, 20 Apr 2023 13:41:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 040804020BEE;
 Thu, 20 Apr 2023 13:41:13 +0000 (UTC)
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
Subject: [PATCH v2 24/43] migration: Move migrate_announce_params() to option.c
Date: Thu, 20 Apr 2023 15:39:43 +0200
Message-Id: <20230420134002.29531-25-quintela@redhat.com>
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
 migration/migration.c | 14 --------------
 migration/options.c   | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index dbb89c2e7b..2191437b15 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -954,20 +954,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     return params;
 }
 
-AnnounceParameters *migrate_announce_params(void)
-{
-    static AnnounceParameters ap;
-
-    MigrationState *s = migrate_get_current();
-
-    ap.initial = s->parameters.announce_initial;
-    ap.max = s->parameters.announce_max;
-    ap.rounds = s->parameters.announce_rounds;
-    ap.step = s->parameters.announce_step;
-
-    return &ap;
-}
-
 /*
  * Return true if we're already in the middle of a migration
  * (i.e. any of the active or setup states)
diff --git a/migration/options.c b/migration/options.c
index 2cb04fbbd1..ed9d2a226f 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -16,6 +16,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/runstate.h"
+#include "migration/misc.h"
 #include "migration.h"
 #include "ram.h"
 #include "options.h"
@@ -589,3 +590,21 @@ uint64_t migrate_xbzrle_cache_size(void)
 
     return s->parameters.xbzrle_cache_size;
 }
+
+/* parameters helpers */
+
+AnnounceParameters *migrate_announce_params(void)
+{
+    static AnnounceParameters ap;
+
+    MigrationState *s = migrate_get_current();
+
+    ap.initial = s->parameters.announce_initial;
+    ap.max = s->parameters.announce_max;
+    ap.rounds = s->parameters.announce_rounds;
+    ap.step = s->parameters.announce_step;
+
+    return &ap;
+}
+
+
-- 
2.39.2


