Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E250A6F9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:20:47 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaU2-0007cw-Fb
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrk-0007xQ-G4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZri-00035L-No
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApW4qVpP2Nu965fs9sRm9eFco3kKlCBirraLRRCJ5wQ=;
 b=A8KPmabJrglXx5s6SIjXA9KMm/cWktLDA15enU7X4aXZ5lk5YRsWXwOPhedZFziybAfzms
 FrAZorHCILK3wuw1kI426bVwY+T+wXqRT+qVWHkVPHubXjV5IwvnRAubVLc3aOgi8hRgnK
 CajvU+yFadBhNROhV3dCm9gsqKqFtWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-eGFWuaiDOKmbv9-PeuMjdg-1; Thu, 21 Apr 2022 12:41:08 -0400
X-MC-Unique: eGFWuaiDOKmbv9-PeuMjdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80524381A833
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:41:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B786840D016E;
 Thu, 21 Apr 2022 16:41:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 18/18] migration: Read state once
Date: Thu, 21 Apr 2022 17:40:43 +0100
Message-Id: <20220421164043.209703-19-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
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
Message-Id: <20220413113329.103696-1-dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 03ae53074b..4bc68100b4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1084,6 +1084,7 @@ static void populate_disk_info(MigrationInfo *info)
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
+    int state = qatomic_read(&s->state);
     GSList *cur_blocker = migration_blockers;
 
     info->blocked_reasons = NULL;
@@ -1103,7 +1104,7 @@ static void fill_source_migration_info(MigrationInfo *info)
     }
     info->has_blocked_reasons = info->blocked_reasons != NULL;
 
-    switch (s->state) {
+    switch (state) {
     case MIGRATION_STATUS_NONE:
         /* no migration has happened ever */
         /* do not overwrite destination migration status */
@@ -1148,7 +1149,7 @@ static void fill_source_migration_info(MigrationInfo *info)
         info->has_status = true;
         break;
     }
-    info->status = s->state;
+    info->status = state;
 }
 
 typedef enum WriteTrackingSupport {
-- 
2.35.1


