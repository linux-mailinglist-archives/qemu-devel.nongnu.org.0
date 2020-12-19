Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEF2DEE63
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:05:50 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa3Z-0000Dl-J2
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtq-0004kI-18
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtj-0007FI-Vs
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ig0zE5llWu6s4iWlo9lQbO/vom8IbDvTtRmRvkVQrQQ=;
 b=e3N6sNPmImQmqzDLKvw9rNXHzoH6VoGSRMfFwcQmc4xojG3ia0cFvdrkRxC6C2ccuPqP6H
 zE/XynKB+S+NreVIMUSVLZKTBGvtO0X62lFG44yVbiBaBLttAKyY/ZptCxGzssl+Jr7oAj
 BzyJKt1eiGwTv5u2oCFkILs0IsLkfsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-aP8dOV3XOgKgmNwCXuMkUw-1; Sat, 19 Dec 2020 05:55:35 -0500
X-MC-Unique: aP8dOV3XOgKgmNwCXuMkUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 096AB51B6;
 Sat, 19 Dec 2020 10:55:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F3B2BCCD;
 Sat, 19 Dec 2020 10:55:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D162114200A; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] migration: Refactor migrate_cap_add
Date: Sat, 19 Dec 2020 11:55:01 +0100
Message-Id: <20201219105532.1734134-3-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Instead of taking a list parameter and returning a new head at a
distance, just return the new item for the caller to insert into a
list via QAPI_LIST_PREPEND.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20201113011340.463563-4-eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e0dbde4091..ccf969a62e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1654,27 +1654,23 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
+    MigrationCapabilityStatusList *cap = NULL;
 
-    cap = migrate_cap_add(NULL, MIGRATION_CAPABILITY_BLOCK, value);
+    QAPI_LIST_PREPEND(cap, migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value));
     qmp_migrate_set_capabilities(cap, errp);
     qapi_free_MigrationCapabilityStatusList(cap);
 }
@@ -3863,7 +3859,7 @@ static bool migration_object_check(MigrationState *ms, Error **errp)
 
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
         if (ms->enabled_capabilities[i]) {
-            head = migrate_cap_add(head, i, true);
+            QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
         }
     }
 
-- 
2.26.2


