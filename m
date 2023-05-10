Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3826FDDCC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiqI-0003sI-5p; Wed, 10 May 2023 08:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipO-0002C3-Uf
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipH-0007eo-Pu
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvKW2OuouZ46xuFzokD/lmO75krMaQgi8ET/8yU3aoc=;
 b=QTeclRDF8pbmEHpE9/GhqnWfxheEmQRA/a0UcmbaA9bqAv4vpfkl71oGg/hszj3+j6TJrK
 0dpy7a8M84IrQ+E0Db3jUj5m+RkDmKwBhuASwLYXLT/VuWIxhNIzTFfTXIBNX9P7WQVBlH
 Rr394xVPpHVxLwO/Pg1Fat70a/SBmSI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-wtHP0wogO2-E-QKG2d5jEw-1; Wed, 10 May 2023 08:21:42 -0400
X-MC-Unique: wtHP0wogO2-E-QKG2d5jEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8067D3C0CF0E;
 Wed, 10 May 2023 12:21:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C25F518EC1;
 Wed, 10 May 2023 12:21:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/28] migration: Attempt disk reactivation in more failure
 scenarios
Date: Wed, 10 May 2023 14:20:49 +0200
Message-Id: <20230510122111.46566-7-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Eric Blake <eblake@redhat.com>

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
Message-Id: <20230502205212.134680-1-eblake@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 migration/migration.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0ee07802a5..f9f12a17b5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2309,6 +2309,11 @@ static void migration_completion(MigrationState *s)
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
@@ -2353,13 +2358,13 @@ static void migration_completion(MigrationState *s)
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
@@ -2373,26 +2378,25 @@ static void migration_completion(MigrationState *s)
 
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
-- 
2.40.1


