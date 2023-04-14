Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18576E271E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:34:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLRA-0002vs-7U; Fri, 14 Apr 2023 11:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pnLR8-0002vj-Aa
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pnLR6-0000BH-CE
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681486442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ecr8Pl5c5WrYsQe6lfrPk6sil/m2DY+XMoqVtLPzXyk=;
 b=SaqtG5oYRabW0jGQRWVEafGbOnv/xoPdvYPq8U+OqEZL3zqRoxX61bW9hBBmmJOt1F/Qzb
 iwVfPT5vYdeVqoYq/7jca+r8YtsF9zQLsUYQbF3rpVYXlxIF5Sa1fL7VCADJMWrKTgtMaD
 7d8tFqmQ0LP+J6GttSfg3VuQf2Utplo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-AQnC9paRMb6UrCTD3CPgLA-1; Fri, 14 Apr 2023 11:34:01 -0400
X-MC-Unique: AQnC9paRMb6UrCTD3CPgLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0958B1C1300E
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 15:34:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6BD2BC88;
 Fri, 14 Apr 2023 15:34:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com
Subject: [PATCH v2] migration: Handle block device inactivation failures better
Date: Fri, 14 Apr 2023 10:33:58 -0500
Message-Id: <20230414153358.1452040-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
been inactivated; but migration_completion() then jumps to 'fail'
rather than 'fail_invalidate' and skips an attempt to reclaim those
those disks by calling bdrv_activate_all().  Even if we do attempt to
reclaim disks, we aren't taking note of failure there, either.

Thus, we have reached a state where the migration engine has forgotten
all state about whether a block device is inactive, because we did not
set s->block_inactive in enough places; so migration allows the source
to reach vm_start() and resume execution, violating the block layer
invariant that the guest CPUs should not be restarted while a device
is inactive.  Note that the code in migration.c:migrate_fd_cancel()
will also try to reactivate all block devices if s->block_inactive was
set, but because we failed to set that flag after the first failure,
the source assumes it has reclaimed all devices, even though it still
has remaining inactivated devices and does not try again.  Normally,
qmp_cont() will also try to reactivate all disks (or correctly fail if
the disks are not reclaimable because NFS is not yet back up), but the
auto-resumption of the source after a migration failure does not go
through qmp_cont().  And because we have left the block layer in an
inconsistent state with devices still inactivated, the later migration
attempt is hitting the assertion failure.

Since it is important to not resume the source with inactive disks,
this patch marks s->block_inactive before attempting inactivation,
rather than after succeeding, in order to prevent any vm_start() until
it has successfully reactivated all devices.

See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982

Signed-off-by: Eric Blake <eblake@redhat.com>

---

v2: Set s->block_inactive sooner [Juan]
---
 migration/migration.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bda47891933..cb0d42c0610 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3444,13 +3444,11 @@ static void migration_completion(MigrationState *s)
                                             MIGRATION_STATUS_DEVICE);
             }
             if (ret >= 0) {
+                s->block_inactive = inactivate;
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                          inactivate);
             }
-            if (inactivate && ret >= 0) {
-                s->block_inactive = true;
-            }
         }
         qemu_mutex_unlock_iothread();

@@ -3522,6 +3520,7 @@ fail_invalidate:
         bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
+            s->block_inactive = true;
         } else {
             s->block_inactive = false;
         }

base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
-- 
2.39.2


