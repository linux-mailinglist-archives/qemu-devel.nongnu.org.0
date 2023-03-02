Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68896A86CB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvU-0003Zv-7s; Thu, 02 Mar 2023 11:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlux-0002OJ-2j
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluv-0000Y3-BT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LXmdsMsgNnjvzFaoGDGP0u/tQxuno6CQ8JNr/iNBLo=;
 b=VvBpkFoWSHoSKteR3MymQQVrI3N6IZeHajL86wJR/Au4TUqqxs9oG9SE2pBTCKFQWiVAs2
 yAOghK47mbd6Sig50aHePRWdtjohtQWkuKOMFQA7w+9dDnsYcwwOD1dpW+hm9A13mXQAky
 0aKJohg9P4bEthxTiPn5Vj6JEU3+3ww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-rWuiFKKBPkGGvY_VuBKxQw-1; Thu, 02 Mar 2023 11:36:18 -0500
X-MC-Unique: rWuiFKKBPkGGvY_VuBKxQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE18100F908;
 Thu,  2 Mar 2023 16:36:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9023492C3E;
 Thu,  2 Mar 2023 16:36:15 +0000 (UTC)
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
Subject: [PATCH 38/43] migration: Remove MigrationState from
 block_cleanup_parameters()
Date: Thu,  2 Mar 2023 17:34:05 +0100
Message-Id: <20230302163410.11399-39-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This makes the function more regular with everything else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   | 2 +-
 migration/migration.c | 4 ++--
 migration/options.c   | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index bd1945d3d1..1d63c4069c 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -92,6 +92,6 @@ void migrate_set_block_incremental(bool value);
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
 void migrate_params_init(MigrationParameters *params);
-void block_cleanup_parameters(MigrationState *s);
+void block_cleanup_parameters(void);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 5dc0bc86f1..71fc360240 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1216,7 +1216,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         error_report_err(error_copy(s->error));
     }
     notifier_list_notify(&migration_state_notifiers, s);
-    block_cleanup_parameters(s);
+    block_cleanup_parameters();
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
@@ -1710,7 +1710,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
                    "a valid migration protocol");
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_FAILED);
-        block_cleanup_parameters(s);
+        block_cleanup_parameters();
         return;
     }
 
diff --git a/migration/options.c b/migration/options.c
index f7d46ccfc9..79187c3be0 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -601,8 +601,10 @@ void migrate_set_block_incremental(bool value)
 
 /* parameters helpers */
 
-void block_cleanup_parameters(MigrationState *s)
+void block_cleanup_parameters(void)
 {
+    MigrationState *s = migrate_get_current();
+
     if (s->must_remove_block_options) {
         /* setting to false can never fail */
         migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
-- 
2.39.2


