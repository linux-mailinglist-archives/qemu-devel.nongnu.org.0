Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33B4A986D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:31:08 +0100 (CET)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwny-0000tK-MF
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:31:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwX0-0006Da-JS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwWy-0005L9-Ig
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bz5OhrpbA/CWtrIRk90IFaFqtjJtvUXWnmHjKl1Hi6Q=;
 b=KDLttnyOMMJDAnezDd3yJRnnIPd/JL86AmGle+ERNqzj3H8cQsrzIAJlHz8afFnFKWQ8GL
 8O5DqlGTbRCWv0jiLuO9yCULJp9nT6NC9nYW8ggT6P4+IKgAW0BpE3NWb4XqgMv55gMCG6
 rBsw28osWcCcap9IrZV8I1dQkfwL+c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-dmiAZWgGPDyhOAd8_LD9kQ-1; Fri, 04 Feb 2022 06:10:26 -0500
X-MC-Unique: dmiAZWgGPDyhOAd8_LD9kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA21A83DD28;
 Fri,  4 Feb 2022 11:10:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2586B7B6F3;
 Fri,  4 Feb 2022 11:10:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/7] iotests/281: Test lingering timers
Date: Fri,  4 Feb 2022 12:10:10 +0100
Message-Id: <20220204111012.34720-6-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to "block/nbd: Delete reconnect delay timer when done" and
"block/nbd: Delete open timer when done", both of those timers would
remain scheduled even after successfully (re-)connecting to the server,
and they would not even be deleted when the BDS is deleted.

This test constructs exactly this situation:
(1) Configure an @open-timeout, so the open timer is armed, and
(2) Configure a @reconnect-delay and trigger a reconnect situation
    (which succeeds immediately), so the reconnect delay timer is armed.
Then we immediately delete the BDS, and sleep for longer than the
@open-timeout and @reconnect-delay.  Prior to said patches, this caused
one (or both) of the timer CBs to access already-freed data.

Accessing freed data may or may not crash, so this test can produce
false successes, but I do not know how to show the problem in a better
or more reliable way.  If you run this test on "block/nbd: Assert there
are no timers when closed" and without the fix patches mentioned above,
you should reliably see an assertion failure.
(But all other tests that use the reconnect delay timer (264 and 277)
will fail in that configuration, too; as will nbd-reconnect-on-open,
which uses the open timer.)

Remove this test from the quick group because of the two second sleep
this patch introduces.

(I decided to put this test case into 281, because the main bug this
series addresses is in the interaction of the NBD block driver and I/O
threads, which is precisely the scope of 281.  The test case for that
other bug will also be put into the test class added here.

Also, excuse the test class's name, I couldn't come up with anything
better.  The "yield" part will make sense two patches from now.)

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/281     | 79 +++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/281.out |  4 +-
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 318e333939..4fb3cd30dd 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: rw quick
+# group: rw
 #
 # Test cases for blockdev + IOThread interactions
 #
@@ -20,8 +20,9 @@
 #
 
 import os
+import time
 import iotests
-from iotests import qemu_img
+from iotests import qemu_img, QemuStorageDaemon
 
 image_len = 64 * 1024 * 1024
 
@@ -243,6 +244,80 @@ class TestBlockdevBackupAbort(iotests.QMPTestCase):
         # Hangs on failure, we expect this error.
         self.assert_qmp(result, 'error/class', 'GenericError')
 
+# Test for RHBZ#2033626
+class TestYieldingAndTimers(iotests.QMPTestCase):
+    sock = os.path.join(iotests.sock_dir, 'nbd.sock')
+    qsd = None
+
+    def setUp(self):
+        self.create_nbd_export()
+
+        # Simple VM with an NBD block device connected to the NBD export
+        # provided by the QSD
+        self.vm = iotests.VM()
+        self.vm.add_blockdev('nbd,node-name=nbd,server.type=unix,' +
+                             f'server.path={self.sock},export=exp,' +
+                             'reconnect-delay=1,open-timeout=1')
+
+        self.vm.launch()
+
+    def tearDown(self):
+        self.stop_nbd_export()
+        self.vm.shutdown()
+
+    def test_timers_with_blockdev_del(self):
+        # The NBD BDS will have had an active open timer, because setUp() gave
+        # a positive value for @open-timeout.  It should be gone once the BDS
+        # has been opened.
+        # (But there used to be a bug where it remained active, which will
+        # become important below.)
+
+        # Stop and restart the NBD server, and do some I/O on the client to
+        # trigger a reconnect and start the reconnect delay timer
+        self.stop_nbd_export()
+        self.create_nbd_export()
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io nbd "write 0 512"')
+        self.assert_qmp(result, 'return', '')
+
+        # Reconnect is done, so the reconnect delay timer should be gone.
+        # (This is similar to how the open timer should be gone after open,
+        # and similarly there used to be a bug where it was not gone.)
+
+        # Delete the BDS to see whether both timers are gone.  If they are not,
+        # they will remain active, fire later, and then access freed data.
+        # (Or, with "block/nbd: Assert there are no timers when closed"
+        # applied, the assertions added in that patch will fail.)
+        result = self.vm.qmp('blockdev-del', node_name='nbd')
+        self.assert_qmp(result, 'return', {})
+
+        # Give the timers some time to fire (both have a timeout of 1 s).
+        # (Sleeping in an iotest may ring some alarm bells, but note that if
+        # the timing is off here, the test will just always pass.  If we kill
+        # the VM too early, then we just kill the timers before they can fire,
+        # thus not see the error, and so the test will pass.)
+        time.sleep(2)
+
+    def create_nbd_export(self):
+        assert self.qsd is None
+
+        # Simple NBD export of a null-co BDS
+        self.qsd = QemuStorageDaemon(
+            '--blockdev',
+            'null-co,node-name=null,read-zeroes=true',
+
+            '--nbd-server',
+            f'addr.type=unix,addr.path={self.sock}',
+
+            '--export',
+            'nbd,id=exp,node-name=null,name=exp,writable=true'
+        )
+
+    def stop_nbd_export(self):
+        self.qsd.stop()
+        self.qsd = None
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'],
diff --git a/tests/qemu-iotests/281.out b/tests/qemu-iotests/281.out
index 89968f35d7..914e3737bd 100644
--- a/tests/qemu-iotests/281.out
+++ b/tests/qemu-iotests/281.out
@@ -1,5 +1,5 @@
-....
+.....
 ----------------------------------------------------------------------
-Ran 4 tests
+Ran 5 tests
 
 OK
-- 
2.34.1


