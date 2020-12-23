Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8D2E225A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:14:37 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCOy-0006Ah-9c
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLh-0004Id-55
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLf-0001hW-AZ
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65KVX3wzi749mqenwflT3JLvcbbtdlMwdjPCVQj09bo=;
 b=dIE9ETWtGiekPWn16D1MsXpCqer+whHV6QOPUck/UvERzbdhGzhZr5cnP1fjfG2mTy8LsX
 xQIprKN2FHH0Edpc5hno6SZFk920chfWOIMc/dQeaF3V+Q8HnV1ntYYy8dBeJR5sVSoicU
 fWGIIrTUKa1OmMB9SVJPv75QDWuomDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-ZGG6nCfVOkGtENQQsqCldw-1; Wed, 23 Dec 2020 17:11:08 -0500
X-MC-Unique: ZGG6nCfVOkGtENQQsqCldw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BA2801817
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 22:11:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4505D747;
 Wed, 23 Dec 2020 22:11:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] migration: Refactor migrate_cap_add
Date: Wed, 23 Dec 2020 16:10:58 -0600
Message-Id: <20201223221102.390740-4-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: armbru@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of taking a list parameter and returning a new head at a
distance, just return the new item for the caller to insert into a
list via QAPI_LIST_PREPEND.  Update some variable names to avoid long
lines, and drop a useless comment.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e0dbde4091c9..bba6e5148138 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1654,29 +1654,27 @@ void migrate_set_state(int *state, int old_state, int new_state)
     }
 }

-static MigrationCapabilityStatusList *migrate_cap_add(
-    MigrationCapabilityStatusList *list,
-    MigrationCapability index,
-    bool state)
+static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
+                                                  bool state)
 {
-    MigrationCapabilityStatusList *cap;
+    MigrationCapabilityStatus *cap;

-    cap = g_new0(MigrationCapabilityStatusList, 1);
-    cap->value = g_new0(MigrationCapabilityStatus, 1);
-    cap->value->capability = index;
-    cap->value->state = state;
-    cap->next = list;
+    cap = g_new0(MigrationCapabilityStatus, 1);
+    cap->capability = index;
+    cap->state = state;

     return cap;
 }

 void migrate_set_block_enabled(bool value, Error **errp)
 {
-    MigrationCapabilityStatusList *cap;
+    MigrationCapabilityStatusList *caps = NULL;
+    MigrationCapabilityStatus *cap;

-    cap = migrate_cap_add(NULL, MIGRATION_CAPABILITY_BLOCK, value);
-    qmp_migrate_set_capabilities(cap, errp);
-    qapi_free_MigrationCapabilityStatusList(cap);
+    cap = migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value);
+    QAPI_LIST_PREPEND(caps, cap);
+    qmp_migrate_set_capabilities(caps, errp);
+    qapi_free_MigrationCapabilityStatusList(caps);
 }

 static void migrate_set_block_incremental(MigrationState *s, bool value)
@@ -3863,13 +3861,12 @@ static bool migration_object_check(MigrationState *ms, Error **errp)

     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
         if (ms->enabled_capabilities[i]) {
-            head = migrate_cap_add(head, i, true);
+            QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
         }
     }

     ret = migrate_caps_check(cap_list, head, errp);

-    /* It works with head == NULL */
     qapi_free_MigrationCapabilityStatusList(head);

     return ret;
-- 
2.29.2


