Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798256F0836
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:26:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3VZ-0004nu-RK; Thu, 27 Apr 2023 11:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3VS-00042G-DO
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3VQ-0000oc-Rm
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfCoqVaK033WOQO+UgvXOcU/Q1wZAphrF0sXCzWC3Hw=;
 b=CYCaU0REET/xOMdY1tioB2+CwW957BYwHFv3UWA9N+ch0IIfl+aBevAmcpYuna5bmvVY88
 xBMMVOlD9S1ElMdx+lcoemLUBAEDQ+uH7OA7fOo3y447w7zis17y2Ny1hbc3jozpV6Zuqx
 6bqJIM4hSATGc4/hc3GTL0xJZFCsN8w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-kW97KUGcOiuQnqEU8syMiw-1; Thu, 27 Apr 2023 11:25:48 -0400
X-MC-Unique: kW97KUGcOiuQnqEU8syMiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E0133827318;
 Thu, 27 Apr 2023 15:22:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9977D40C2064;
 Thu, 27 Apr 2023 15:22:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 07/18] migration: Remove MigrationState from
 block_cleanup_parameters()
Date: Thu, 27 Apr 2023 17:22:23 +0200
Message-Id: <20230427152234.25400-8-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

This makes the function more regular with everything else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 4 ++--
 migration/options.c   | 4 +++-
 migration/options.h   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index cefe6da2b8..ef8caa79b9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1218,7 +1218,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         error_report_err(error_copy(s->error));
     }
     notifier_list_notify(&migration_state_notifiers, s);
-    block_cleanup_parameters(s);
+    block_cleanup_parameters();
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
@@ -1712,7 +1712,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
                    "a valid migration protocol");
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_FAILED);
-        block_cleanup_parameters(s);
+        block_cleanup_parameters();
         return;
     }
 
diff --git a/migration/options.c b/migration/options.c
index 82adbf35b0..da99c6298f 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -600,8 +600,10 @@ void migrate_set_block_incremental(bool value)
 
 /* parameters helpers */
 
-void block_cleanup_parameters(MigrationState *s)
+void block_cleanup_parameters(void)
 {
+    MigrationState *s = migrate_get_current();
+
     if (s->must_remove_block_options) {
         /* setting to false can never fail */
         migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
diff --git a/migration/options.h b/migration/options.h
index 1fc8d341dd..3948218dbe 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -90,6 +90,6 @@ void migrate_set_block_incremental(bool value);
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
 void migrate_params_init(MigrationParameters *params);
-void block_cleanup_parameters(MigrationState *s);
+void block_cleanup_parameters(void);
 
 #endif
-- 
2.40.0


