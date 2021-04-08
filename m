Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897433589D1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:33:43 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXbC-0000Gc-Jo
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXWw-0006Eu-TG
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXOv-0002BF-2A
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617898860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joSw4jwTLU8DYiFScDGknK1n4nE5TiMPrAyJTZ43A0M=;
 b=HZwGe5jo3E72nxP9tKg9vFyz/16FZIT44lGh9IQqt75yff+d0YJFCBJbncJ2q5NNNaUQa4
 RBbC56b8FM7TkvwsQQervmeIypRmMYBx06bkNAEX/AF4S8OXN3MyfCPFgsSO56b9g+/EHl
 77PJR8heLG2EuK7MdN3rBICQqVVlK28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-q_P27Qx3NK6vtYXToEb-vg-1; Thu, 08 Apr 2021 12:20:58 -0400
X-MC-Unique: q_P27Qx3NK6vtYXToEb-vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59337107ACC7;
 Thu,  8 Apr 2021 16:20:57 +0000 (UTC)
Received: from localhost (ovpn-114-123.ams2.redhat.com [10.36.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C4519701;
 Thu,  8 Apr 2021 16:20:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.0? 3/3] iotests/041: block-job-complete on user-paused
 job
Date: Thu,  8 Apr 2021 18:20:39 +0200
Message-Id: <20210408162039.242670-4-mreitz@redhat.com>
In-Reply-To: <20210408162039.242670-1-mreitz@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
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


