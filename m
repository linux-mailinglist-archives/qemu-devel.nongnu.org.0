Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D46ECEAE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:34:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFu-0008CD-KD; Mon, 24 Apr 2023 09:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEw-0006gG-Ds
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEu-0001SC-5Y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJYXepNCd+IEb9CaUQpf4FPu3H1QdSZpQwj0PKYW06k=;
 b=YlMEkIRsDRKz+IjqzFCePk+8Kam8EmxrCYW6tTDKwiMb6acQ6lIYiww+MhaBl58r2kLk5W
 bQ+YW99RycOGlZCFPHQL1jo3Wob7TxACDrPv0172MaWnwfoi3m5KfM7QfBDiBMfwPsIk02
 Un+/3tmOgRdwMokPYjEx/8RgBrTHRZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-VvbAA6SbPmmBueI1CFNdXw-1; Mon, 24 Apr 2023 09:28:15 -0400
X-MC-Unique: VvbAA6SbPmmBueI1CFNdXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F6B0884EC0;
 Mon, 24 Apr 2023 13:28:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15A3B14171B8;
 Mon, 24 Apr 2023 13:28:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 13/30] migration: Move migrate_use_return() to options.c
Date: Mon, 24 Apr 2023 15:27:13 +0200
Message-Id: <20230424132730.70752-14-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Once that we are there, we rename the function to migrate_return_path()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 11 +----------
 migration/migration.h |  1 -
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/rdma.c      |  6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1f8ba94fc4..b03c4aa650 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2622,15 +2622,6 @@ static int64_t migrate_max_postcopy_bandwidth(void)
     return s->parameters.max_postcopy_bandwidth;
 }
 
-bool migrate_use_return_path(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
-}
-
 bool migrate_use_block_incremental(void)
 {
     MigrationState *s;
@@ -4171,7 +4162,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
      * precopy, only if user specified "return-path" capability would
      * QEMU uses the return path.
      */
-    if (migrate_postcopy_ram() || migrate_use_return_path()) {
+    if (migrate_postcopy_ram() || migrate_return_path()) {
         if (open_return_path_on_source(s, !resume)) {
             error_report("Unable to open return-path for postcopy");
             migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
diff --git a/migration/migration.h b/migration/migration.h
index d4b68b08a5..24184622a8 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -459,7 +459,6 @@ uint64_t migrate_xbzrle_cache_size(void);
 
 bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
-bool migrate_use_return_path(void);
 
 uint64_t ram_get_total_transferred_pages(void);
 
diff --git a/migration/options.c b/migration/options.c
index fe1eadeed6..2003e413da 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -147,6 +147,15 @@ bool migrate_release_ram(void)
     return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
 }
 
+bool migrate_return_path(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
+}
+
 bool migrate_validate_uuid(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index e985a5233e..316efd1063 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -31,6 +31,7 @@ bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
 bool migrate_release_ram(void);
+bool migrate_return_path(void);
 bool migrate_validate_uuid(void);
 bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
diff --git a/migration/rdma.c b/migration/rdma.c
index f35f021963..bf55e2f163 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3373,7 +3373,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
-    if ((migrate_postcopy() || migrate_use_return_path())
+    if ((migrate_postcopy() || migrate_return_path())
         && !rdma->is_return_path) {
         rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
         if (rdma_return_path == NULL) {
@@ -3456,7 +3456,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     }
 
     /* Accept the second connection request for return path */
-    if ((migrate_postcopy() || migrate_use_return_path())
+    if ((migrate_postcopy() || migrate_return_path())
         && !rdma->is_return_path) {
         qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                             NULL,
@@ -4193,7 +4193,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     /* RDMA postcopy need a separate queue pair for return path */
-    if (migrate_postcopy() || migrate_use_return_path()) {
+    if (migrate_postcopy() || migrate_return_path()) {
         rdma_return_path = qemu_rdma_data_init(host_port, errp);
 
         if (rdma_return_path == NULL) {
-- 
2.39.2


