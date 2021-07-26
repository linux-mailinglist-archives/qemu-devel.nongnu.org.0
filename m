Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0775D3D59C4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:48:53 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m802O-00075W-23
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxf-0000BB-PL
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxd-0007qF-W7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCvocV3T6etOq4LJes8MZHjrv/Und+zoNnSoa2MEPk0=;
 b=hmnctlPb2ASFpu8IxfMKanUn0AVdISf7ex7pUOV/RvwAifUG/JIB+RFW15O221mnoJ7BtQ
 OH5ornBq72b0NqsQtexgvevyhNqyw4A6zP5NOLNqyXV5yqsLXeYMfCU4k6yWfhM+wkz4jd
 tUNMMnVHVauSyMnmJEY0lMsjGj3Vdvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-7OTR-TLpP3anLL5jFZTHRQ-1; Mon, 26 Jul 2021 08:43:54 -0400
X-MC-Unique: 7OTR-TLpP3anLL5jFZTHRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1792487D543;
 Mon, 26 Jul 2021 12:43:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D6160C82;
 Mon, 26 Jul 2021 12:43:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 2/7] migration: Fix missing join() of rp_thread
Date: Mon, 26 Jul 2021 13:43:26 +0100
Message-Id: <20210726124331.124710-3-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It's possible that the migration thread skip the join() of the rp_thread in
below race and crash on src right at finishing migration:

       migration_thread                     rp_thread
       ----------------                     ---------
    migration_completion()
                                        (before rp_thread quits)
                                        from_dst_file=NULL
                                        [thread got scheduled out]
      s->rp_state.from_dst_file==NULL
        (skip join() of rp_thread)
    migrate_fd_cleanup()
      qemu_fclose(s->to_dst_file)
      yank_unregister_instance()
        assert(yank_find_entry())  <------- crash

It could mostly happen with postcopy, but that shouldn't be required, e.g., I
think it could also trigger with MIGRATION_CAPABILITY_RETURN_PATH set.

It's suspected that above race could be the root cause of a recent (but rare)
migration-test break reported by either Dave or PMM:

https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/

The issue is: from_dst_file is reset in the rp_thread, so if the thread reset
it to NULL fast enough then the migration thread will assume there's no
rp_thread at all.

This could potentially cause more severe issue (e.g. crash) after the yank code.

Fix it by using a boolean to keep "whether we've created rp_thread".

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210722175841.938739-2-peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 4 +++-
 migration/migration.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2d306582eb..21b94f75a3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2867,6 +2867,7 @@ static int open_return_path_on_source(MigrationState *ms,
 
     qemu_thread_create(&ms->rp_state.rp_thread, "return path",
                        source_return_path_thread, ms, QEMU_THREAD_JOINABLE);
+    ms->rp_state.rp_thread_created = true;
 
     trace_open_return_path_on_source_continue();
 
@@ -2891,6 +2892,7 @@ static int await_return_path_close_on_source(MigrationState *ms)
     }
     trace_await_return_path_close_on_source_joining();
     qemu_thread_join(&ms->rp_state.rp_thread);
+    ms->rp_state.rp_thread_created = false;
     trace_await_return_path_close_on_source_close();
     return ms->rp_state.error;
 }
@@ -3170,7 +3172,7 @@ static void migration_completion(MigrationState *s)
      * it will wait for the destination to send it's status in
      * a SHUT command).
      */
-    if (s->rp_state.from_dst_file) {
+    if (s->rp_state.rp_thread_created) {
         int rp_error;
         trace_migration_return_path_end_before();
         rp_error = await_return_path_close_on_source(s);
diff --git a/migration/migration.h b/migration/migration.h
index 2ebb740dfa..c302879fad 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -195,6 +195,13 @@ struct MigrationState {
         QEMUFile     *from_dst_file;
         QemuThread    rp_thread;
         bool          error;
+        /*
+         * We can also check non-zero of rp_thread, but there's no "official"
+         * way to do this, so this bool makes it slightly more elegant.
+         * Checking from_dst_file for this is racy because from_dst_file will
+         * be cleared in the rp_thread!
+         */
+        bool          rp_thread_created;
         QemuSemaphore rp_sem;
     } rp_state;
 
-- 
2.31.1


