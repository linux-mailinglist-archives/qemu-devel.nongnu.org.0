Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED62B13BB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:16:09 +0100 (CET)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNhA-0003fx-Qn
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNf8-0001uN-6x
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNf6-00036S-64
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605230039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6eLL2NGvIaRgdI+2iw6npwBjc+h7GCl/XuFkvE6b4I=;
 b=XwDQUqJwFR9kwdGmcPAe8RKCDkPThVOs1q43/AmOxQ88Yp4k80oi3di/A/0jLil/BZBLPH
 E3O3I5I7Omm1Uj6pNdzUPijQAhWQI39CZCefUrvm5Fco58lh0Ewzqi5MLehXmbyZPPyIjm
 GHEwIa+RTYmfU846OcLvAFi65umvtUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-lJw2R6ywMAGiuPQyd07txw-1; Thu, 12 Nov 2020 20:13:57 -0500
X-MC-Unique: lJw2R6ywMAGiuPQyd07txw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67B385F9D1
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:13:56 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C264419C59;
 Fri, 13 Nov 2020 01:13:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] migration: Refactor migrate_cap_add
Date: Thu, 12 Nov 2020 19:13:36 -0600
Message-Id: <20201113011340.463563-4-eblake@redhat.com>
In-Reply-To: <20201113011340.463563-1-eblake@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
list via QAPI_LIST_PREPEND.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 migration/migration.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3263aa55a9da..e8c414a7b8f0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1667,27 +1667,23 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
@@ -3874,7 +3870,7 @@ static bool migration_object_check(MigrationState *ms, Error **errp)

     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
         if (ms->enabled_capabilities[i]) {
-            head = migrate_cap_add(head, i, true);
+            QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
         }
     }

-- 
2.28.0


