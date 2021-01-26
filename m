Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A0304092
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:39:08 +0100 (CET)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PUp-0004Aq-P0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDb-0000BG-Fv
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDU-00069L-Ur
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1t2vuJmC7hEAVvJVtv7AbFrdpg7A3zfcjGtyewloZVE=;
 b=WP64+gBFvyptmKj/QcV7iMVz5kWQ/cmoiAe0Yxdbk73QhbGu8xUPzbbTVZGhMOg/0WJ4D8
 iDYlhy5FLIEmRPEVW2K4Lu5i+L7DIe63WAYI6K54c7De9RzqYktNsElt/TzKXFssz2VXp6
 pALvBcWcA0E9AVAQ9CvCxx5KA6zO+MA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-S_TjTLmXPa6iWjfNrMZZWw-1; Tue, 26 Jan 2021 09:21:09 -0500
X-MC-Unique: S_TjTLmXPa6iWjfNrMZZWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6BA100F37B;
 Tue, 26 Jan 2021 14:21:04 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D975D9C2;
 Tue, 26 Jan 2021 14:21:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/53] iotests/129: Use throttle node
Date: Tue, 26 Jan 2021 15:19:43 +0100
Message-Id: <20210126142016.806073-21-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Throttling on the BB has not affected block jobs in a while, so it is
possible that one of the jobs in 129 finishes before the VM is stopped.
We can fix that by running the job from a throttle node.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-7-mreitz@redhat.com>
---
 tests/qemu-iotests/129 | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 0f2e5418ef..14c057f8ad 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -33,20 +33,18 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
                          "-b", self.base_img, '-F', iotests.imgfmt)
         iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
-        self.vm = iotests.VM().add_drive(self.test_img)
+        self.vm = iotests.VM()
+        self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
+
+        source_drive = 'driver=throttle,' \
+                       'throttle-group=tg0,' \
+                       f'file.driver={iotests.imgfmt},' \
+                       f'file.file.filename={self.test_img}'
+
+        self.vm.add_drive(None, source_drive)
         self.vm.launch()
 
     def tearDown(self):
-        params = {"device": "drive0",
-                  "bps": 0,
-                  "bps_rd": 0,
-                  "bps_wr": 0,
-                  "iops": 0,
-                  "iops_rd": 0,
-                  "iops_wr": 0,
-                 }
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
-                             **params)
         self.vm.shutdown()
         for img in (self.test_img, self.target_img, self.base_img):
             iotests.try_remove(img)
@@ -54,33 +52,24 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
     def do_test_stop(self, cmd, **args):
         """Test 'stop' while block job is running on a throttled drive.
         The 'stop' command shouldn't drain the job"""
-        params = {"device": "drive0",
-                  "bps": 1024,
-                  "bps_rd": 0,
-                  "bps_wr": 0,
-                  "iops": 0,
-                  "iops_rd": 0,
-                  "iops_wr": 0,
-                 }
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
-                             **params)
-        self.assert_qmp(result, 'return', {})
         result = self.vm.qmp(cmd, **args)
         self.assert_qmp(result, 'return', {})
+
         result = self.vm.qmp("stop")
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp("query-block-jobs")
+
         self.assert_qmp(result, 'return[0]/status', 'running')
         self.assert_qmp(result, 'return[0]/ready', False)
 
     def test_drive_mirror(self):
         self.do_test_stop("drive-mirror", device="drive0",
-                          target=self.target_img,
+                          target=self.target_img, format=iotests.imgfmt,
                           sync="full")
 
     def test_drive_backup(self):
         self.do_test_stop("drive-backup", device="drive0",
-                          target=self.target_img,
+                          target=self.target_img, format=iotests.imgfmt,
                           sync="full")
 
     def test_block_commit(self):
-- 
2.29.2


