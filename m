Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006E4FF5CA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 13:35:22 +0200 (CEST)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nebHN-0003BJ-45
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 07:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nebFk-0002UM-I3
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 07:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nebFh-0002iR-VU
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 07:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649849616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4TaEgiUn5QrpLauDqLHQ5RbLCk/wBYK6Ok5lmEEY470=;
 b=Sk+j5+O4twcX/Dzx2WIsUmIj+v+nyrsOrtGmsKnGkt5DJRyEsj7F1JCqzU7Zzfvjh7EgJM
 G1WMAMlY2VwkvLjCwMqaYJTr1KRLs7AjAlrk9K03HuGPQ569XpvLpRpI4YKtGodhuXves4
 mm6BzrKJj5OAJxYP7osvNdNJOvJxwUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-lPSWXmdXNH-SlU_75WiRqg-1; Wed, 13 Apr 2022 07:33:35 -0400
X-MC-Unique: lPSWXmdXNH-SlU_75WiRqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82075802803
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 11:33:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 939744229B9;
 Wed, 13 Apr 2022 11:33:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com
Subject: [PATCH] migration: Read state once
Date: Wed, 13 Apr 2022 12:33:29 +0100
Message-Id: <20220413113329.103696-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The 'status' field for the migration is updated normally using
an atomic operation from the migration thread.
Most readers of it aren't that careful, and in most cases it doesn't
matter.

In query_migrate->fill_source_migration_info the 'state'
is read twice; the first time to decide which state fields to fill in,
and then secondly to copy the state to the status field; that can end up
with a status that's inconsistent; e.g. setting up the fields
for 'setup' and then having an 'active' status.  In that case
libvirt gets upset by the lack of ram info.
The symptom is:
   libvirt.libvirtError: internal error: migration was active, but no RAM info was set

Read the state exactly once in fill_source_migration_info.

This is a possible fix for:
https://bugzilla.redhat.com/show_bug.cgi?id=2074205

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2900..811c584619 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1073,6 +1073,7 @@ static void populate_disk_info(MigrationInfo *info)
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
+    int state = qatomic_read(&s->state);
     GSList *cur_blocker = migration_blockers;
 
     info->blocked_reasons = NULL;
@@ -1092,7 +1093,7 @@ static void fill_source_migration_info(MigrationInfo *info)
     }
     info->has_blocked_reasons = info->blocked_reasons != NULL;
 
-    switch (s->state) {
+    switch (state) {
     case MIGRATION_STATUS_NONE:
         /* no migration has happened ever */
         /* do not overwrite destination migration status */
@@ -1137,7 +1138,7 @@ static void fill_source_migration_info(MigrationInfo *info)
         info->has_status = true;
         break;
     }
-    info->status = s->state;
+    info->status = state;
 }
 
 typedef enum WriteTrackingSupport {
-- 
2.35.1


