Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A711299292
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:36:43 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5UA-0000EA-5p
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Ew-00057t-HV
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Eu-0000N4-GM
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603729253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecw+/l7luLc7WvskempfGO0Am9K8TfzYcmpD33bw7Uo=;
 b=KUpweo0kTAbXLcqTx+1lN+pX63D6EvZMHLdfZ3CzoDYhl3HbTfYhlFwl/KIKHwMyFirDc6
 9F5hGDVa/vUvtjnUr3UlqRBPiO2cwPd+MLuDY2wbzRMfqAQN+hhLquKXKk/ZlrUnZAQTBO
 pCA1MAoolnWMDvQM1zPx4CojIDwB31U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Mu7haeCWPqCcNjGGoTa9CA-1; Mon, 26 Oct 2020 12:20:50 -0400
X-MC-Unique: Mu7haeCWPqCcNjGGoTa9CA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A93B2106B26C;
 Mon, 26 Oct 2020 16:20:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79B4C5D9E4;
 Mon, 26 Oct 2020 16:20:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, yubihong@huawei.com, peterx@redhat.com,
 peter.maydell@linaro.org
Subject: [PULL 15/16] migration/postcopy: Release fd before going into
 'postcopy-pause'
Date: Mon, 26 Oct 2020 16:19:51 +0000
Message-Id: <20201026161952.149188-16-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
References: <20201026161952.149188-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Logically below race could trigger with the old code:

          test program                        migration thread
          ------------                        ----------------
       wait_until('postcopy-pause')
                                          postcopy_pause()
                                            set_state('postcopy-pause')
       do_postcopy_recover()
         arm s->to_dst_file with new fd
                                            release s->to_dst_file [1]

Here [1] could have released the just-installed recoverying channel.  Then the
migration could hang without really resuming.

Instead, it should be very safe to release the fd before setting the state into
'postcopy-pause', because there's no reason for any other thread to touch it
during 'postcopy-active'.

Dave reported a very rare postcopy recovery hang that the migration-test
program waited for the migration to complete in migrate_postcopy_complete().
We do suspect it's the same thing that we're gonna fix here.  Hard to tell.
However since we've noticed this, fix this irrelevant of the hang report.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201021212721.440373-6-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5421042d4a..627f194b8b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3178,9 +3178,6 @@ static MigThrError postcopy_pause(MigrationState *s)
     while (true) {
         QEMUFile *file;
 
-        migrate_set_state(&s->state, s->state,
-                          MIGRATION_STATUS_POSTCOPY_PAUSED);
-
         /* Current channel is possibly broken. Release it. */
         assert(s->to_dst_file);
         qemu_mutex_lock(&s->qemu_file_lock);
@@ -3191,6 +3188,9 @@ static MigThrError postcopy_pause(MigrationState *s)
         qemu_file_shutdown(file);
         qemu_fclose(file);
 
+        migrate_set_state(&s->state, s->state,
+                          MIGRATION_STATUS_POSTCOPY_PAUSED);
+
         error_report("Detected IO failure for postcopy. "
                      "Migration paused.");
 
-- 
2.28.0


