Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2A4CD84F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:52:38 +0100 (CET)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAEP-0000P8-Ms
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA0H-0007pN-40
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA0D-0007YV-4T
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646408276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUJRlPBg0dHyb+Wfd94cNo0F8TwLin9Pvxwj5MHh6lE=;
 b=IA41ni21ps0iCQxVVkFd7gCfRdhHlAFi5Rj2E4GwKWf9Isuj5UzHJwejJoGTDTtOV1N9mO
 eXTZdGhol1ozGzSOPFt1ZTvPxVRNPdvGF4CgUKOQ2dSbVO9Ufdwuc0FmJLOhSWHbNrttYK
 w1SIRA8IfeuHCuGO+Z/I0gvMGLtjguI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-PKq6kF6aOcmI27RW_eZnzA-1; Fri, 04 Mar 2022 10:37:52 -0500
X-MC-Unique: PKq6kF6aOcmI27RW_eZnzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C78F11006AA5;
 Fri,  4 Mar 2022 15:37:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B72D1037F22;
 Fri,  4 Mar 2022 15:37:51 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/5] iotests/296: Accept early failure
Date: Fri,  4 Mar 2022 16:37:29 +0100
Message-Id: <20220304153729.711387-6-hreitz@redhat.com>
In-Reply-To: <20220304153729.711387-1-hreitz@redhat.com>
References: <20220304153729.711387-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of "crypto: perform permission checks under BQL", permission failures
occur early in the blockdev-amend job to update a LUKS volume's keys.
Expect them in x-blockdev-amend's QMP reply instead of waiting for the
actual job to fail later.

(Note that the job will still be created, so we need to wait for it to
disappear even when the QMP command failed.  Otherwise, the job ID
"job0" will remain in use and we cannot launch another job with the same
ID.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/296     |  8 ++++++--
 tests/qemu-iotests/296.out | 17 +++++------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 099a3eeaa5..f80ef3434a 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -174,8 +174,12 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
         }
 
         result = vm.qmp('x-blockdev-amend', **args)
-        assert result['return'] == {}
-        vm.run_job('job0')
+        iotests.log(result)
+        # Run the job only if it was created
+        event = ('JOB_STATUS_CHANGE',
+                 {'data': {'id': 'job0', 'status': 'created'}})
+        if vm.events_wait([event], timeout=0.0) is not None:
+            vm.run_job('job0')
 
     # test that when the image opened by two qemu processes,
     # neither of them can update the encryption keys
diff --git a/tests/qemu-iotests/296.out b/tests/qemu-iotests/296.out
index 42205cc981..609826eaa0 100644
--- a/tests/qemu-iotests/296.out
+++ b/tests/qemu-iotests/296.out
@@ -1,11 +1,9 @@
 
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-Job failed: Failed to get shared "consistent read" lock
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -13,14 +11,9 @@ qemu-img: Failed to get shared "consistent read" lock
 Is another process using the image [TEST_DIR/test.img]?
 
 .
-Job failed: Block node is read-only
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
-{"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
-{"return": {}}
-Job failed: Failed to get shared "consistent read" lock
-{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"error": {"class": "GenericError", "desc": "Block node is read-only"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
+{"error": {"class": "GenericError", "desc": "Failed to get shared \"consistent read\" lock"}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-- 
2.34.1


