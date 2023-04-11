Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A56DE404
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:37:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIrk-0004vX-3z; Tue, 11 Apr 2023 14:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pmIrb-0004h1-LI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pmIrZ-000089-Oj
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681238224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MbUP86u5G6X3wJBncw1IyxOBGVvV1RhTqSFdCGeOl24=;
 b=RQwR2xr1aAR8qjQJnqAGBR4aAxSAnTGfZCXfH1TNhf5OBkX2tiKKFIWqmmM8dxwybcakzM
 s6IGFMuhK2RHnJno2c11ODmUc8WXNH7nq214W9QIMRarJf9Q4RXxe6prFa9/Sa/WG/F6go
 y4Upy9X29tuUjZVLO3e63/rZwHZtfs4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-g_IwjO4COlug29rYMlxAyA-1; Tue, 11 Apr 2023 14:37:03 -0400
X-MC-Unique: g_IwjO4COlug29rYMlxAyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C95BF280D585;
 Tue, 11 Apr 2023 18:37:02 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562C440BC797;
 Tue, 11 Apr 2023 18:37:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH] migration: Handle block device inactivation failures
 better
Date: Tue, 11 Apr 2023 13:36:54 -0500
Message-Id: <20230411183654.1229293-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

Consider what happens when performing a migration between two host
machines connected to an NFS server serving multiple block devices to
the guest, when the NFS server becomes unavailable.  The migration
attempts to inactivate all block devices on the source (a necessary
step before the destination can take over); but if the NFS server is
non-responsive, the attempt to inactivate can itself fail.  When that
happens, the destination fails to get the migrated guest (good,
because the source wasn't able to flush everything properly):

  (qemu) qemu-kvm: load of migration failed: Input/output error

at which point, our only hope for the guest is for the source to take
back control.  With the current code base, the host outputs a message, but then appears to resume:

  (qemu) qemu-kvm: qemu_savevm_state_complete_precopy_non_iterable: bdrv_inactivate_all() failed (-1)

  (src qemu)info status
   VM status: running

but a second migration attempt now asserts:

  (src qemu) qemu-kvm: ../block.c:6738: int bdrv_inactivate_recurse(BlockDriverState *): Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed.

Whether the guest is recoverable on the source after the first failure
is debatable, but what we do not want is to have qemu itself fail due
to an assertion.  It looks like the problem is as follows:

In migration.c:migration_completion(), the source sets 'inactivate' to
true (since COLO is not enabled), then tries
savevm.c:qemu_savevm_state_complete_precopy() with a request to
inactivate block devices.  In turn, this calls
block.c:bdrv_inactivate_all(), which fails when flushing runs up
against the non-responsive NFS server.  With savevm failing, we are
now left in a state where some, but not all, of the block devices have
been inactivated; the 'fail_invalidate' label of
migration_completion() then wants to reclaim those disks by calling
bdrv_activate_all() - but this too can fail, yet nothing takes note of
that failure.

Thus, we have reached a state where the migration engine has forgotten
all state about whether a block device is inactive, because we did not
set s->block_inactive; so migration allows the source to reach
vm_start() and resume execution, violating the block layer invariant
that the guest CPUs should not be restarted while a device is
inactive.  Note that the code in migration.c:migrate_fd_cancel() will
also try to reactivate all block devices if s->block_inactive was set,
but because we failed to set that flag after the first failure, the
source assumes it has reclaimed all devices, even though it still has
remaining inactivated devices and does not try again.  Normally,
qmp_cont() will also try to reactivate all disks (or correctly fail if
the disks are not reclaimable because NFS is not yet back up), but the
auto-resumption of the source after a migration failure does not go
through qmp_cont().  And because we have left the block layer in an
inconsistent state with devices still inactivated, the later migration
attempt is hitting the assertion failure.

Since it is important to not resume the source with inactive disks,
this patch tries harder at tracking whether migration attempted to
inactivate any devices, in order to prevent any vm_start() until it
has successfully reactivated all devices.

See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982

Signed-off-by: Eric Blake <eblake@redhat.com>

---

RFC because it may also be worth teaching vm_prepare_start() to call
bdrv_activate_all() (instead of or in addition to qmp_cont and
migration).  But that feels like a bigger sledgehammer compared to
just tweaking the migration code that got us in the situation in the
first place, hence I'm trying this patch first.

---
 migration/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8d..8fb778ca171 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3427,6 +3427,7 @@ static void migration_completion(MigrationState *s)
 {
     int ret;
     int current_active_state = s->state;
+    bool inactivate = false;

     if (s->state == MIGRATION_STATUS_ACTIVE) {
         qemu_mutex_lock_iothread();
@@ -3436,7 +3437,7 @@ static void migration_completion(MigrationState *s)
         ret = global_state_store();

         if (!ret) {
-            bool inactivate = !migrate_colo_enabled();
+            inactivate = !migrate_colo_enabled();
             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
             trace_migration_completion_vm_stop(ret);
             if (ret >= 0) {
@@ -3518,6 +3519,7 @@ fail_invalidate:
         bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
+            s->block_inactive = inactivate;
         } else {
             s->block_inactive = false;
         }

base-commit: f1426881a827a6d3f31b65616c4a8db1e9e7c45e
-- 
2.39.2


