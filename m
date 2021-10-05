Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FC422F70
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:54:59 +0200 (CEST)
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoeY-0008NZ-AQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXn3k-00026W-Q6
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXn3j-0005l4-0t
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633450368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcSZjNZhG+c3Xqv5iXOYAxh44UTb490iibbjmEm5nDE=;
 b=AlAGbqDRgiJUi5OoaW1dIDn9h/I7rEW8KsEMJ1vUwX6KqkTtwtOrh2BL4GfApRcsp/NtNt
 yGqesRUWUhd/WYSygr29AoGcDNep98d3Oac4jOvITt2sXoSjGWfY5i945DIJ3RVDWyV3iV
 FOsXb97OtumevAl68ZaWyNHqYBN+wm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-mNyVatAyN02cMuZHwtkQug-1; Tue, 05 Oct 2021 12:12:47 -0400
X-MC-Unique: mNyVatAyN02cMuZHwtkQug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A20CC8015C7;
 Tue,  5 Oct 2021 16:12:43 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 003105D9DE;
 Tue,  5 Oct 2021 16:12:24 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block/backup: avoid integer overflow of `max-workers`
Date: Tue,  5 Oct 2021 18:11:56 +0200
Message-Id: <20211005161157.282396-2-sgarzare@redhat.com>
In-Reply-To: <20211005161157.282396-1-sgarzare@redhat.com>
References: <20211005161157.282396-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPI generates `struct BackupPerf` where `max-workers` value is stored
in an `int64_t` variable.
But block_copy_async(), and the underlying code, uses an `int` parameter.

At the end that variable is used to initialize `max_busy_tasks` in
block/aio_task.c causing the following assertion failure if a value
greater than INT_MAX(2147483647) is used:

  ../block/aio_task.c:63: aio_task_pool_wait_one: Assertion `pool->busy_tasks > 0' failed.

Let's check that `max-workers` doesn't exceed INT_MAX and print an
error in that case.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2009310
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/backup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 687d2882bc..8b072db5d9 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,8 +407,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    if (perf->max_workers < 1) {
-        error_setg(errp, "max-workers must be greater than zero");
+    if (perf->max_workers < 1 || perf->max_workers > INT_MAX) {
+        error_setg(errp, "max-workers must be between 1 and %d", INT_MAX);
         return NULL;
     }
 
-- 
2.31.1


