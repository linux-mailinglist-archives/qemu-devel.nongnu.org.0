Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAABC6F4BA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:53:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwz6-0002du-4a; Tue, 02 May 2023 16:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ptwz4-0002dX-74
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ptwz2-0001Ri-J5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683060743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tCAYn2clvMAf9GgIG4lc9ECvM9mqgVU1sR06/rJDV9w=;
 b=TCCVoWBUVVGUxeeCxglYO2TDszaZx2zdrI0Xohs+bkYQEflyWYCYZdc0ANXuc/kr2JldkW
 iXTm40KQdnnip6/Qq93kft+HDT/IinKi0Rtly3YYeSbC9pOLeuXnjVvi2Cmf9Hgkxmn3cg
 rD+Kvnuex8j49EFQad6rC6/qKYUIVes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-p0QYkhE4NtWFdROHwZdYTg-1; Tue, 02 May 2023 16:52:22 -0400
X-MC-Unique: p0QYkhE4NtWFdROHwZdYTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4E4C185A78B
 for <qemu-devel@nongnu.org>; Tue,  2 May 2023 20:52:21 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6249B492B03;
 Tue,  2 May 2023 20:52:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH] migration: Attempt disk reactivation in more failure scenarios
Date: Tue,  2 May 2023 15:52:12 -0500
Message-Id: <20230502205212.134680-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

Commit fe904ea824 added a fail_inactivate label, which tries to
reactivate disks on the source after a failure while s->state ==
MIGRATION_STATUS_ACTIVE, but didn't actually use the label if
qemu_savevm_state_complete_precopy() failed.  This failure to
reactivate is also present in commit 6039dd5b1c (also covering the new
s->state == MIGRATION_STATUS_DEVICE state) and 403d18ae (ensuring
s->block_inactive is set more reliably).

Consolidate the two labels back into one - no matter HOW migration is
failed, if there is any chance we can reach vm_start() after having
attempted inactivation, it is essential that we have tried to restart
disks before then.  This also makes the cleanup more like
migrate_fd_cancel().

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 migration/migration.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index abcadbb619e..7f982bd2c80 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2299,6 +2299,11 @@ static void migration_completion(MigrationState *s)
                                             MIGRATION_STATUS_DEVICE);
             }
             if (ret >= 0) {
+                /*
+                 * Inactivate disks except in COLO, and track that we
+                 * have done so in order to remember to reactivate
+                 * them if migration fails or is cancelled.
+                 */
                 s->block_inactive = !migrate_colo();
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
@@ -2343,13 +2348,13 @@ static void migration_completion(MigrationState *s)
         rp_error = await_return_path_close_on_source(s);
         trace_migration_return_path_end_after(rp_error);
         if (rp_error) {
-            goto fail_invalidate;
+            goto fail;
         }
     }

     if (qemu_file_get_error(s->to_dst_file)) {
         trace_migration_completion_file_err();
-        goto fail_invalidate;
+        goto fail;
     }

     if (migrate_colo() && s->state == MIGRATION_STATUS_ACTIVE) {
@@ -2363,26 +2368,25 @@ static void migration_completion(MigrationState *s)

     return;

-fail_invalidate:
-    /* If not doing postcopy, vm_start() will be called: let's regain
-     * control on images.
-     */
-    if (s->state == MIGRATION_STATUS_ACTIVE ||
-        s->state == MIGRATION_STATUS_DEVICE) {
+fail:
+    if (s->block_inactive && (s->state == MIGRATION_STATUS_ACTIVE ||
+                              s->state == MIGRATION_STATUS_DEVICE)) {
+        /*
+         * If not doing postcopy, vm_start() will be called: let's
+         * regain control on images.
+         */
         Error *local_err = NULL;

         qemu_mutex_lock_iothread();
         bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
-            s->block_inactive = true;
         } else {
             s->block_inactive = false;
         }
         qemu_mutex_unlock_iothread();
     }

-fail:
     migrate_set_state(&s->state, current_active_state,
                       MIGRATION_STATUS_FAILED);
 }

base-commit: b5f47ba73b7c1457d2f18d71c00e1a91a76fe60b
-- 
2.40.1


