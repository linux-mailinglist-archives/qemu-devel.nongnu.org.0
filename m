Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D36ED490
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:38:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr100-0000N4-77; Mon, 24 Apr 2023 14:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zr-0000IZ-RA
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zj-0005fP-Pt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682361176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E64Tn40zeWovsq6afcHVPSfGlPhrtCj7a7by9LoPZNg=;
 b=cDn1qqBvaxXTcp6CS9389GlPYqqqa/CH3M+5AAl/D/UY+rjBURDxoYRFz66OHWdiqz8ThE
 fnu3VPHswXVoNjC16n27A/84ko6GTg4YVIHWHHMV7qfPetaVIR4NSy/LaY40o1Q2YEAybf
 VU9kzBG4DHfsjUcSg0zLDji26cq621w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-Y6MK6emwN2yXrscCbccmMQ-1; Mon, 24 Apr 2023 14:32:53 -0400
X-MC-Unique: Y6MK6emwN2yXrscCbccmMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1034858F09;
 Mon, 24 Apr 2023 18:32:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404DAC15BA0;
 Mon, 24 Apr 2023 18:32:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 07/13] migration: Move block_cleanup_parameters() to
 options.c
Date: Mon, 24 Apr 2023 20:32:30 +0200
Message-Id: <20230424183236.74561-8-quintela@redhat.com>
In-Reply-To: <20230424183236.74561-1-quintela@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
 migration/migration.c | 10 ----------
 migration/options.c   | 10 ++++++++++
 migration/options.h   |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9a42f73aeb..cefe6da2b8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1164,16 +1164,6 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
index 37f7051d9d..26fe00799b 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -597,6 +597,16 @@ void migrate_set_block_incremental(bool value)
 
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
index d261a25441..1fc8d341dd 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -90,5 +90,6 @@ void migrate_set_block_incremental(bool value);
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
 void migrate_params_init(MigrationParameters *params);
+void block_cleanup_parameters(MigrationState *s);
 
 #endif
-- 
2.39.2


