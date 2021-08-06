Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B53E279B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:44:11 +0200 (CEST)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwOg-0001Lz-6W
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJw-0006al-2u
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJu-0003i1-Db
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdR5iSP0RrhwY9/zPKffgCiNq0TmKkikJ+O2jrljI98=;
 b=EtGkdw1YeKNpgCdNk7eDRufM8phmWYie6tTzJBKbMDnFF2Z5HxxzNW02hNeazYwegdZuaf
 7DfiKX1vBXaaagIVBNWjPXre1v0cQ6Sm/40eCOqJSCHWsETZMFiepE44LAx9r1xU2lvLKW
 6xmq4Qq5VGGB4lCEKbXSkP4BHgQqKPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-oce3T8w0NbW1h5yigP1V1A-1; Fri, 06 Aug 2021 05:39:11 -0400
X-MC-Unique: oce3T8w0NbW1h5yigP1V1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8E9801AC0;
 Fri,  6 Aug 2021 09:39:10 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD2CF19D9D;
 Fri,  6 Aug 2021 09:39:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 04/12] job: Force-cancel jobs in a failed
 transaction
Date: Fri,  6 Aug 2021 11:38:51 +0200
Message-Id: <20210806093859.706464-5-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a transaction is aborted, no result matters, and so all jobs within
should be force-cancelled.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 job.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/job.c b/job.c
index 3fe23bb77e..24e7c4fcb7 100644
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


