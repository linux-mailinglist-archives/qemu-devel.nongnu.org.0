Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CE4D85D6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:23:15 +0100 (CET)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkfJ-00043r-Jb
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:23:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbQ-0001KS-LY
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbN-0006YI-N2
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8v4Xqz+zZbbdTOb7FglAEK9Z53MaTWMkndnnenw4Zg=;
 b=deZAIDWDr8sjpos9ER4x4gkuTpyP9FK0AGbXxvxLCNNh25bF/ey0KZnk0WiZiSOcAp46Cj
 qcobjHDx9Wm5of8aaztSAcQEDdWzRlmLZcC0YalDbD7MMcsFyiQXy5DjIQE1VMayDPHKLR
 F+IAKX9lzNcnPwyo74r4z81Wk+fo0Jg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-LyqC_mlSON2njIHnRdedlg-1; Mon, 14 Mar 2022 09:19:07 -0400
X-MC-Unique: LyqC_mlSON2njIHnRdedlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3915C811E80;
 Mon, 14 Mar 2022 13:19:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB8261686D;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 10/10] tests/qemu-iotests/030: test_stream_parallel should
 use auto_finalize=False
Date: Mon, 14 Mar 2022 09:18:54 -0400
Message-Id: <20220314131854.2202651-11-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, use run_job() instead of the current logic to run the
stream job. Then, use auto_finalize=False to be sure that
the job is not automatically deleted once it is done.

In this way, if the job finishes before we want, it is not
finalized yet so the other commands can still execute
without failing. run_job() will then take care of calling
job-finalize.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/030 | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 567bf1da67..951c28878c 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -248,7 +248,7 @@ class TestParallelOps(iotests.QMPTestCase):
             pending_jobs.append(job_id)
             result = self.vm.qmp('block-stream', device=node_name,
                                  job_id=job_id, bottom=f'node{i-1}',
-                                 speed=1024)
+                                 speed=1024, auto_finalize=False)
             self.assert_qmp(result, 'return', {})
 
         # Do this in reverse: After unthrottling them, some jobs may finish
@@ -264,14 +264,8 @@ class TestParallelOps(iotests.QMPTestCase):
             result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
             self.assert_qmp(result, 'return', {})
 
-        # Wait for all jobs to be finished.
-        while len(pending_jobs) > 0:
-            for event in self.vm.get_qmp_events(wait=True):
-                if event['event'] == 'BLOCK_JOB_COMPLETED':
-                    job_id = self.dictpath(event, 'data/device')
-                    self.assertTrue(job_id in pending_jobs)
-                    self.assert_qmp_absent(event, 'data/error')
-                    pending_jobs.remove(job_id)
+        for job in pending_jobs:
+            self.vm.run_job(job=job, auto_finalize=False)
 
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
-- 
2.31.1


