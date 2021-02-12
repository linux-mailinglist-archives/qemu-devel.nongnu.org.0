Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552431A606
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:27:39 +0100 (CET)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf2Q-0000kE-34
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerr-0004RC-Gk
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAern-0003vS-Bq
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZtCvMsXL8J4aFQyPFcujwHjVw+wp+H0ImnLK/amocU=;
 b=PY/GvHQlkAK/5hjaOsM9+4BIaSOv48rUEQvm7W8LmBq/Tbe6rr34hrJQmG02aWyQ1qnteq
 vAkNwjB33qG4PqC/hh+v8EdU7mySh/K+AjeiWlH/1VussFXZ+KOJP4E0uAlfyXn1s1EB2X
 gB4YH+BrvS6pkEzaZ5rbG8RHWgi7ZzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-kilVflvxNMeWFGTwX0erxA-1; Fri, 12 Feb 2021 15:16:36 -0500
X-MC-Unique: kilVflvxNMeWFGTwX0erxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446DB1934116;
 Fri, 12 Feb 2021 20:16:35 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCCCC6B8E5;
 Fri, 12 Feb 2021 20:16:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] iotests/264: add backup-cancel test-case
Date: Fri, 12 Feb 2021 14:16:19 -0600
Message-Id: <20210212201619.1388255-15-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-11-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 21 ++++++++++++++-------
 tests/qemu-iotests/264.out |  4 ++--
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 347e53add51b..4f96825a22c2 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -94,20 +94,27 @@ class TestNbdReconnect(iotests.QMPTestCase):
             result = self.vm.qmp('blockdev-del', node_name='backup0')
             self.assert_qmp(result, 'return', {})

+    def cancel_job(self):
+        result = self.vm.qmp('block-job-cancel', device='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        start_t = time.time()
+        self.vm.event_wait('BLOCK_JOB_CANCELLED')
+        delta_t = time.time() - start_t
+        self.assertTrue(delta_t < 2.0)
+
     def test_mirror_cancel(self):
         # Mirror speed limit doesn't work well enough, it seems that mirror
         # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
         # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
         self.init_vm(20 * 1024 * 1024)
         self.start_job('blockdev-mirror')
+        self.cancel_job()

-        result = self.vm.qmp('block-job-cancel', device='drive0')
-        self.assert_qmp(result, 'return', {})
-
-        start_t = time.time()
-        self.vm.event_wait('BLOCK_JOB_CANCELLED')
-        delta_t = time.time() - start_t
-        self.assertTrue(delta_t < 2.0)
+    def test_backup_cancel(self):
+        self.init_vm(5 * 1024 * 1024)
+        self.start_job('blockdev-backup')
+        self.cancel_job()


 if __name__ == '__main__':
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index fbc63e62f885..8d7e99670093 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,5 +1,5 @@
-..
+...
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 3 tests

 OK
-- 
2.30.1


