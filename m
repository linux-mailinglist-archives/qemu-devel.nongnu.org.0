Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9291359FE1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:35:01 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrHo-00080k-Ny
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrD4-00033a-2I
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:30:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrD1-0006Mr-Be
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617975002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joSw4jwTLU8DYiFScDGknK1n4nE5TiMPrAyJTZ43A0M=;
 b=PwcV5uYNBS+iHVguCOWIk1+M4IEnZzqAJYGpzxo4JSSlXN/RzXtmzwc26uTXNSMx5d4rxk
 9SaW7y2fgs6Mzh7dLB2veiHpbycCZAcJ7t5UzcCMeBuobGtMGWGCWynAZkJqBTaATBOs8r
 4F/BWExk91pDOqf07alri/NRpuLzzYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-PlGxF8EROSCIjNYndxGvfw-1; Fri, 09 Apr 2021 09:29:59 -0400
X-MC-Unique: PlGxF8EROSCIjNYndxGvfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2AE100A8FF;
 Fri,  9 Apr 2021 13:29:58 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 024E560C05;
 Fri,  9 Apr 2021 13:29:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/3] iotests/041: block-job-complete on user-paused job
Date: Fri,  9 Apr 2021 15:29:47 +0200
Message-Id: <20210409132948.195511-4-mreitz@redhat.com>
In-Reply-To: <20210409132948.195511-1-mreitz@redhat.com>
References: <20210409132948.195511-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand test_pause() to check what happens when issuing
block-job-complete on a job that is on STANDBY because it has been
paused by the user.  (This should be an error, and in particular not
hang job_wait_unpaused().)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/041 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 5cc02b24fc..d2c9669741 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -120,7 +120,18 @@ class TestSingleDrive(iotests.QMPTestCase):
         result = self.vm.qmp('block-job-resume', device='drive0')
         self.assert_qmp(result, 'return', {})
 
-        self.complete_and_wait()
+        self.wait_ready()
+
+        # Check that a job on STANDBY cannot be completed
+        self.pause_job('drive0')
+        result = self.vm.qmp('block-job-complete', device='drive0')
+        self.assert_qmp(result, 'error/desc',
+                        "Job 'drive0' has been paused by the user")
+
+        result = self.vm.qmp('block-job-resume', device='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        self.complete_and_wait(wait_ready=False)
         self.vm.shutdown()
         self.assertTrue(iotests.compare_images(test_img, target_img),
                         'target image does not match source after mirroring')
-- 
2.29.2


