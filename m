Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E608D6E9616
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUZ0-0001pJ-35; Thu, 20 Apr 2023 09:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXy-0006q7-6c
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXw-0006Iz-RA
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkVECC+q0xpvQKSEknRAnpj+dGeec35NbQ06BMiGQYo=;
 b=hcDGVczRhtKu3cNZ3FuDxBOLjEPVg0rPPSb+a+3T9mucQqOu3fUfqtZzTX4Njkzwbjrq9c
 7vyjt+/kP51tRw3PULBi3qnUaP68ktqgG39IsZlGBM6r0T5IQCtwDXAdx2rabevaKbbgQz
 ZvDl4uBwk6NSuIF0Y3NGoCB4kHAjqUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-gKu9W329OiSWOws9QMUOjQ-1; Thu, 20 Apr 2023 09:41:55 -0400
X-MC-Unique: gKu9W329OiSWOws9QMUOjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52AFC3C10696;
 Thu, 20 Apr 2023 13:41:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAA034020BED;
 Thu, 20 Apr 2023 13:41:52 +0000 (UTC)
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
Subject: [PATCH v2 37/43] migration: Move block_cleanup_parameters() to
 options.c
Date: Thu, 20 Apr 2023 15:39:56 +0200
Message-Id: <20230420134002.29531-38-quintela@redhat.com>
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
 migration/migration.c | 10 ----------
 migration/options.c   | 10 ++++++++++
 migration/options.h   |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d31e987d1a..f12ab54ae0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1165,16 +1165,6 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
index 0ca2ad4fab..8fae79c2c9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -599,6 +599,16 @@ void migrate_set_block_incremental(bool value)
 
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
diff --git a/migration/options.h b/migration/options.h
index 61b559ff3f..7476f814c9 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -90,5 +90,6 @@ void migrate_set_block_incremental(bool value);
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
 void migrate_params_init(MigrationParameters *params);
+void block_cleanup_parameters(MigrationState *s);
 
 #endif
-- 
2.39.2


