Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A406A86F3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvK-0003AC-Rz; Thu, 02 Mar 2023 11:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluo-0001qi-6q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlum-0000Vc-5n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0cSUBoBQTEjRwoN1vnfIAl7EwFxbTCNsdqbFuAprqs=;
 b=LoQPg3Nb+zIslRhPrlLlIDbmOY7uY71bmBBI8+5rt3iALo4rwnOpaD6ggiHPNyMb+c95q0
 29Z0wI1Qwf6NmlSDQ/FLb2H9mlsQ2ADSzZ2DPekRKJaynusEvSoFn8h3J/QBUpiefDRsL2
 micgdFKG3x4BYDc5d+5R7jP0E1Frl4o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-y5Bp0AsqNUmQZLH_NGVu7A-1; Thu, 02 Mar 2023 11:36:15 -0500
X-MC-Unique: y5Bp0AsqNUmQZLH_NGVu7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 615A5800B23;
 Thu,  2 Mar 2023 16:36:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E84D492C3E;
 Thu,  2 Mar 2023 16:36:13 +0000 (UTC)
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
Subject: [PATCH 37/43] migration: Move block_cleanup_parameters() to options.c
Date: Thu,  2 Mar 2023 17:34:04 +0100
Message-Id: <20230302163410.11399-38-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   |  1 +
 migration/migration.c | 10 ----------
 migration/options.c   | 10 ++++++++++
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 0fbe294a65..bd1945d3d1 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -92,5 +92,6 @@ void migrate_set_block_incremental(bool value);
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
 void migrate_params_init(MigrationParameters *params);
+void block_cleanup_parameters(MigrationState *s);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f293fb1fd6..5dc0bc86f1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1162,16 +1162,6 @@ void migrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
-static void block_cleanup_parameters(MigrationState *s)
-{
-    if (s->must_remove_block_options) {
-        /* setting to false can never fail */
-        migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
-        migrate_set_block_incremental(false);
-        s->must_remove_block_options = false;
-    }
-}
-
 static void migrate_fd_cleanup(MigrationState *s)
 {
     qemu_bh_delete(s->cleanup_bh);
diff --git a/migration/options.c b/migration/options.c
index 7838515991..f7d46ccfc9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -601,6 +601,16 @@ void migrate_set_block_incremental(bool value)
 
 /* parameters helpers */
 
+void block_cleanup_parameters(MigrationState *s)
+{
+    if (s->must_remove_block_options) {
+        /* setting to false can never fail */
+        migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
+        migrate_set_block_incremental(false);
+        s->must_remove_block_options = false;
+    }
+}
+
 AnnounceParameters *migrate_announce_params(void)
 {
     static AnnounceParameters ap;
-- 
2.39.2


