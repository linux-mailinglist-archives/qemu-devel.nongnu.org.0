Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F3304148
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:01:57 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pqu-0006zE-Os
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEG-0001Av-Pq
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEE-0006We-LP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8jL5sWeb4yoKWUk/pvXVnfkiQKNDT7RI83GC3PDncM=;
 b=EqRmkzDDxBSZGeTxnaSBKSmTPuDavzRFXCvvhTku5NJwVmSKu1yZy2s9b90dAjHGwYCg0z
 oTgfu3vYZI1l+SFE8RuoWDPFsh5VVI9wX4CCv4i3cBbYbKuEjNZxH1Lwb2gLTbB8zmqYHX
 0w4Kd13wmdy0IFf3QsgizrwuDqeuTp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-UZ7L8UqaPHa-nnnk_ODcGw-1; Tue, 26 Jan 2021 09:21:55 -0500
X-MC-Unique: UZ7L8UqaPHa-nnnk_ODcGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7EB61005504;
 Tue, 26 Jan 2021 14:21:54 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BF460C67;
 Tue, 26 Jan 2021 14:21:54 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 42/53] block/backup: drop extra gotos from backup_run()
Date: Tue, 26 Jan 2021 15:20:05 +0100
Message-Id: <20210126142016.806073-43-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-17-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 5522c0f3fe..466608ee55 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -236,7 +236,7 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
 static int coroutine_fn backup_run(Job *job, Error **errp)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
-    int ret = 0;
+    int ret;
 
     backup_init_bcs_bitmap(s);
 
@@ -246,13 +246,12 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
 
         for (offset = 0; offset < s->len; ) {
             if (yield_and_check(s)) {
-                ret = -ECANCELED;
-                goto out;
+                return -ECANCELED;
             }
 
             ret = block_copy_reset_unallocated(s->bcs, offset, &count);
             if (ret < 0) {
-                goto out;
+                return ret;
             }
 
             offset += count;
@@ -273,11 +272,10 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
             job_yield(job);
         }
     } else {
-        ret = backup_loop(s);
+        return backup_loop(s);
     }
 
- out:
-    return ret;
+    return 0;
 }
 
 static const BlockJobDriver backup_job_driver = {
-- 
2.29.2


