Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34804A9859
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:24:17 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwhM-00062R-Ia
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwU6-0003Ro-RA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwU4-0004Wc-DG
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SDBrYGgBAEP1GIzJv2QShNv3zV8hieQEbr2gcKMCbc=;
 b=EDcoUrkwfkG8Aoy/znCNhL9NapBN25VSwHkOzayLiXXMc6Vnsdj7MWN+B10qTTnTB1qomo
 L7WkbVG6X4dPODaIYIVAmx1Su7zsqvs+BUA37xQ838tIg3yfkZ4ZJYAfvMF12FZY2rzkRC
 5awrEtqZj2XwrWZcgdg1VHY3JCJ9JPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-CgHSOvqzOkGGblNoIj-dhw-1; Fri, 04 Feb 2022 06:10:31 -0500
X-MC-Unique: CgHSOvqzOkGGblNoIj-dhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D97F83E744;
 Fri,  4 Feb 2022 11:10:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CE77D71B;
 Fri,  4 Feb 2022 11:10:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 7/7] iotests/281: Let NBD connection yield in iothread
Date: Fri,  4 Feb 2022 12:10:12 +0100
Message-Id: <20220204111012.34720-8-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put an NBD block device into an I/O thread, and then read data from it,
hoping that the NBD connection will yield during that read.  When it
does, the coroutine must be reentered in the block device's I/O thread,
which will only happen if the NBD block driver attaches the connection's
QIOChannel to the new AioContext.  It did not do that after 4ddb5d2fde
("block/nbd: drop connection_co") and prior to "block/nbd: Move s->ioc
on AioContext change", which would cause an assertion failure.

To improve our chances of yielding, the NBD server is throttled to
reading 64 kB/s, and the NBD client reads 128 kB, so it should yield at
some point.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/281     | 28 +++++++++++++++++++++++++---
 tests/qemu-iotests/281.out |  4 ++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 4fb3cd30dd..5e1339bd75 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -253,8 +253,9 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
         self.create_nbd_export()
 
         # Simple VM with an NBD block device connected to the NBD export
-        # provided by the QSD
+        # provided by the QSD, and an (initially unused) iothread
         self.vm = iotests.VM()
+        self.vm.add_object('iothread,id=iothr')
         self.vm.add_blockdev('nbd,node-name=nbd,server.type=unix,' +
                              f'server.path={self.sock},export=exp,' +
                              'reconnect-delay=1,open-timeout=1')
@@ -299,19 +300,40 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
         # thus not see the error, and so the test will pass.)
         time.sleep(2)
 
+    def test_yield_in_iothread(self):
+        # Move the NBD node to the I/O thread; the NBD block driver should
+        # attach the connection's QIOChannel to that thread's AioContext, too
+        result = self.vm.qmp('x-blockdev-set-iothread',
+                             node_name='nbd', iothread='iothr')
+        self.assert_qmp(result, 'return', {})
+
+        # Do some I/O that will be throttled by the QSD, so that the network
+        # connection hopefully will yield here.  When it is resumed, it must
+        # then be resumed in the I/O thread's AioContext.
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io nbd "read 0 128K"')
+        self.assert_qmp(result, 'return', '')
+
     def create_nbd_export(self):
         assert self.qsd is None
 
-        # Simple NBD export of a null-co BDS
+        # Export a throttled null-co BDS: Reads are throttled (max 64 kB/s),
+        # writes are not.
         self.qsd = QemuStorageDaemon(
+            '--object',
+            'throttle-group,id=thrgr,x-bps-read=65536,x-bps-read-max=65536',
+
             '--blockdev',
             'null-co,node-name=null,read-zeroes=true',
 
+            '--blockdev',
+            'throttle,node-name=thr,file=null,throttle-group=thrgr',
+
             '--nbd-server',
             f'addr.type=unix,addr.path={self.sock}',
 
             '--export',
-            'nbd,id=exp,node-name=null,name=exp,writable=true'
+            'nbd,id=exp,node-name=thr,name=exp,writable=true'
         )
 
     def stop_nbd_export(self):
diff --git a/tests/qemu-iotests/281.out b/tests/qemu-iotests/281.out
index 914e3737bd..3f8a935a08 100644
--- a/tests/qemu-iotests/281.out
+++ b/tests/qemu-iotests/281.out
@@ -1,5 +1,5 @@
-.....
+......
 ----------------------------------------------------------------------
-Ran 5 tests
+Ran 6 tests
 
 OK
-- 
2.34.1


