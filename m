Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A43C7321
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:26:14 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KIX-0005pl-9j
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGX-00034R-NR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGW-0001vO-7V
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYkl2IofeyeQumPRxRyNIkr/pAekVpIOtEyuFrgduXI=;
 b=AqAFoOzcKHru9nSZeOGPiVmGc6AZ5mgSUqpE8OKVIopaMWAmqIaFaQuzHiTPuwQMYTT3Sz
 fp1cXsgW4lQ1sQBnPmaYoaB4lgs5ei+J9bMFHfL+HCYS0Z3zlcByf3IvOOPsyt0VPCkaUi
 bxxQwvmJXw7M/zo1ND36rtbgs6HmM9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-ldUujXumO5qKE9XG5ZiJQg-1; Tue, 13 Jul 2021 11:24:06 -0400
X-MC-Unique: ldUujXumO5qKE9XG5ZiJQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4B9804141;
 Tue, 13 Jul 2021 15:24:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 092D45D9CA;
 Tue, 13 Jul 2021 15:24:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 4/6] migration: Don't do migrate cleanup if during postcopy
 resume
Date: Tue, 13 Jul 2021 16:23:22 +0100
Message-Id: <20210713152324.217255-5-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Below process could crash qemu with postcopy recovery:

  1. (hmp) migrate -d ..
  2. (hmp) migrate_start_postcopy
  3. [network down, postcopy paused]
  4. (hmp) migrate -r $WRONG_PORT
     when try the recover on an invalid $WRONG_PORT, cleanup_bh will be cleared
  5. (hmp) migrate -r $RIGHT_PORT
     [qemu crash on assert(cleanup_bh)]

The thing is we shouldn't cleanup if it's postcopy resume; the error is set
mostly because the channel is wrong, so we return directly waiting for the user
to retry.

migrate_fd_cleanup() should only be called when migration is cancelled or
completed.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210708190653.252961-3-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 38ebc6c1ab..20c48cfff1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3979,7 +3979,18 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     }
     if (error_in) {
         migrate_fd_error(s, error_in);
-        migrate_fd_cleanup(s);
+        if (resume) {
+            /*
+             * Don't do cleanup for resume if channel is invalid, but only dump
+             * the error.  We wait for another channel connect from the user.
+             * The error_report still gives HMP user a hint on what failed.
+             * It's normally done in migrate_fd_cleanup(), but call it here
+             * explicitly.
+             */
+            error_report_err(error_copy(s->error));
+        } else {
+            migrate_fd_cleanup(s);
+        }
         return;
     }
 
-- 
2.31.1


