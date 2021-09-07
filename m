Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0A40295B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaoG-0006iQ-I1
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRK-0005lX-BH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRI-0006HP-Q6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGYqADDN8NFfCw32Y1+IKG+VKBatYrFoJ86Z2Mp199Y=;
 b=OdKrAkg1fUlZIZesSddDZqi9RMqSpprlPBovkoOzJT8H9tE/ZxC8GH/wS7Ht3e6AU2mtnC
 0Takm59qDjkj+2p0o1j44OU7kGdFCfhXGINaOfmZspinm6eu3hcs/7ZKzv05QTfd0a5LLc
 56b3V1dnKiA+/Cpeb1TKUPaKjzQVpdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-dh8TXxr3PrOpk8qPMR_COw-1; Tue, 07 Sep 2021 08:42:57 -0400
X-MC-Unique: dh8TXxr3PrOpk8qPMR_COw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FF65122;
 Tue,  7 Sep 2021 12:42:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C31A5D9DE;
 Tue,  7 Sep 2021 12:42:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 04/12] job: Force-cancel jobs in a failed transaction
Date: Tue,  7 Sep 2021 14:42:37 +0200
Message-Id: <20210907124245.143492-5-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a transaction is aborted, no result matters, and so all jobs within
should be force-cancelled.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/job.c b/job.c
index 810e6a2065..e74d81928d 100644
--- a/job.c
+++ b/job.c
@@ -766,7 +766,12 @@ static void job_completed_txn_abort(Job *job)
         if (other_job != job) {
             ctx = other_job->aio_context;
             aio_context_acquire(ctx);
-            job_cancel_async(other_job, false);
+            /*
+             * This is a transaction: If one job failed, no result will matter.
+             * Therefore, pass force=true to terminate all other jobs as quickly
+             * as possible.
+             */
+            job_cancel_async(other_job, true);
             aio_context_release(ctx);
         }
     }
-- 
2.31.1


