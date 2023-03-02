Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD676A86EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXluf-0000xH-4V; Thu, 02 Mar 2023 11:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltv-0000bw-49
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltr-00085B-Rv
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMzGNaSobuOBHSnKt+YhSzVSMN5z96etunxXMWAhEts=;
 b=GB+aOu8vfdQTDaIPeRruWf5JrdYaVpQ5qwe0xLGe85W/TIKz+5AJoSMNW88jfSA9ppCWIL
 NjwHEWZTsyKloYVil+XUeiewQoCMzO9pFe2NBUwc7lRfqbhu77OaGt+C3MFlWB11mSGsNr
 hVXCqfKNWjNBUATb1Dq4Jk14ut2M3ps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-BimmcHtjP4yYwQl9CS-ykA-1; Thu, 02 Mar 2023 11:35:22 -0500
X-MC-Unique: BimmcHtjP4yYwQl9CS-ykA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723C829A9CA9;
 Thu,  2 Mar 2023 16:35:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69FC5492C3E;
 Thu,  2 Mar 2023 16:35:19 +0000 (UTC)
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
Subject: [PATCH 24/43] migration: Move migrate_announce_params() to option.c
Date: Thu,  2 Mar 2023 17:33:51 +0100
Message-Id: <20230302163410.11399-25-quintela@redhat.com>
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
 migration/migration.c | 14 --------------
 migration/options.c   | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 62478ac8c1..176ddb51f1 100644
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
index 472982f91e..afb7794cec 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -18,6 +18,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/runstate.h"
+#include "migration/misc.h"
 #include "migration.h"
 #include "ram.h"
 #include "options.h"
@@ -591,3 +592,21 @@ uint64_t migrate_xbzrle_cache_size(void)
 
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


