Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FC50A767
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:51:59 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhayE-0004sm-Es
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrh-0007lG-9l
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrf-00034a-JL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYEsRpRyTt0t8vJPNbGz0shi/0Y2Z1d0B95LyRAzqwM=;
 b=SZgor5G8Vz2WjwjGIbp9f//CI3HLFxrnAZw3XVLGzb6EKY5rWNJblC5XXryo+N5dl1HVnA
 gfjawrorMK90PTY0JUMEbKe3NtYSJmMFF1RAMpmr73o36GPUZ26o2O66IadjyuTD6wrLP9
 rxb5ELBqZDdSEhJZbFuz23ePJU/Zfec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-kpEfoQu4M1qzKtSEBhzU9A-1; Thu, 21 Apr 2022 12:41:05 -0400
X-MC-Unique: kpEfoQu4M1qzKtSEBhzU9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 795B41E15C04
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:41:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4E3640D016E;
 Thu, 21 Apr 2022 16:41:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 15/18] migration: Move channel setup out of
 postcopy_try_recover()
Date: Thu, 21 Apr 2022 17:40:40 +0100
Message-Id: <20220421164043.209703-16-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

We used to use postcopy_try_recover() to replace migration_incoming_setup() to
setup incoming channels.  That's fine for the old world, but in the new world
there can be more than one channels that need setup.  Better move the channel
setup out of it so that postcopy_try_recover() only handles the last phase of
switching to the recovery phase.

To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
call to be after migration_incoming_setup(), which will setup the channels.
While in migration_ioc_process_incoming(), postpone the recover() routine right
before we'll jump into migration_incoming_process().

A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
anymore.  Remove it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220331150857.74406-7-peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0944ce4825..1405b95b95 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -671,19 +671,20 @@ void migration_incoming_process(void)
 }
 
 /* Returns true if recovered from a paused migration, otherwise false */
-static bool postcopy_try_recover(QEMUFile *f)
+static bool postcopy_try_recover(void)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
         /* Resumed from a paused postcopy migration */
 
-        mis->from_src_file = f;
+        /* This should be set already in migration_incoming_setup() */
+        assert(mis->from_src_file);
         /* Postcopy has standalone thread to do vm load */
-        qemu_file_set_blocking(f, true);
+        qemu_file_set_blocking(mis->from_src_file, true);
 
         /* Re-configure the return path */
-        mis->to_src_file = qemu_file_get_return_path(f);
+        mis->to_src_file = qemu_file_get_return_path(mis->from_src_file);
 
         migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
                           MIGRATION_STATUS_POSTCOPY_RECOVER);
@@ -704,11 +705,10 @@ static bool postcopy_try_recover(QEMUFile *f)
 
 void migration_fd_process_incoming(QEMUFile *f, Error **errp)
 {
-    if (postcopy_try_recover(f)) {
+    if (!migration_incoming_setup(f, errp)) {
         return;
     }
-
-    if (!migration_incoming_setup(f, errp)) {
+    if (postcopy_try_recover()) {
         return;
     }
     migration_incoming_process();
@@ -724,11 +724,6 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         /* The first connection (multifd may have multiple) */
         QEMUFile *f = qemu_fopen_channel_input(ioc);
 
-        /* If it's a recovery, we're done */
-        if (postcopy_try_recover(f)) {
-            return;
-        }
-
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
@@ -749,6 +744,10 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
     }
 
     if (start_migration) {
+        /* If it's a recovery, we're done */
+        if (postcopy_try_recover()) {
+            return;
+        }
         migration_incoming_process();
     }
 }
-- 
2.35.1


