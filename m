Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B86667B94
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0gk-0004Iz-EW; Thu, 12 Jan 2023 11:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gf-0004HI-O9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0ge-0000eD-7C
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fr6vZEWjOiuIoqkKICxG0tEOOGAmYLsqV4pK5w0WGo=;
 b=AT/GUuvJiPYbHvHzHMt9znua7HS5z3ivzKa7uSRLzJ2hgsAbhzzRAlvopN1TpcKDZdiKVW
 v4qfT81vBVuKGTpDc69QUAbdZisXHxIoiD7RFjhOGNGU1g50PDbqx8k48U9MQ9GD92OHBm
 5wLekBz96w0pvgM3HkCus9qcdX57A68=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-9wfzhtezMSqlPKLfuj8PDQ-1; Thu, 12 Jan 2023 11:44:18 -0500
X-MC-Unique: 9wfzhtezMSqlPKLfuj8PDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB9323C0D84F
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:17 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA63E4078903;
 Thu, 12 Jan 2023 16:44:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 5/8] migration/ram: Factor out check for advised postcopy
Date: Thu, 12 Jan 2023 17:44:00 +0100
Message-Id: <20230112164403.105085-6-david@redhat.com>
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

Let's factor out this check, to be used in virtio-mem context next.

While at it, fix a spelling error in a related comment.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/migration/misc.h | 4 +++-
 migration/migration.c    | 7 +++++++
 migration/ram.c          | 8 +-------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index 465906710d..8b49841016 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -67,8 +67,10 @@ bool migration_has_failed(MigrationState *);
 /* ...and after the device transmission */
 bool migration_in_postcopy_after_devices(MigrationState *);
 void migration_global_dump(Monitor *mon);
-/* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
+/* True if incoming migration entered POSTCOPY_INCOMING_DISCARD */
 bool migration_in_incoming_postcopy(void);
+/* True if incoming migration entered POSTCOPY_INCOMING_ADVISE */
+bool migration_incoming_postcopy_advised(void);
 /* True if background snapshot is active */
 bool migration_in_bg_snapshot(void);
 
diff --git a/migration/migration.c b/migration/migration.c
index 1d33a7efa0..b7677c14a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2094,6 +2094,13 @@ bool migration_in_incoming_postcopy(void)
     return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
 }
 
+bool migration_incoming_postcopy_advised(void)
+{
+    PostcopyState ps = postcopy_state_get();
+
+    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
+}
+
 bool migration_in_bg_snapshot(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..e51a7ee0ce 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4091,12 +4091,6 @@ int ram_load_postcopy(QEMUFile *f, int channel)
     return ret;
 }
 
-static bool postcopy_is_advised(void)
-{
-    PostcopyState ps = postcopy_state_get();
-    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
-}
-
 static bool postcopy_is_running(void)
 {
     PostcopyState ps = postcopy_state_get();
@@ -4167,7 +4161,7 @@ static int ram_load_precopy(QEMUFile *f)
     MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
-    bool postcopy_advised = postcopy_is_advised();
+    bool postcopy_advised = migration_incoming_postcopy_advised();
     if (!migrate_use_compression()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
-- 
2.39.0


