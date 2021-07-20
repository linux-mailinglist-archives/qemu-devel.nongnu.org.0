Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79E3CFD51
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:21:34 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rYq-0006PB-PV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPP-0003mz-0y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPM-0001Ho-Q5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwDnr1scLHKk1yC0voUx5cmuGdkFvDiDPdPL4eE710w=;
 b=CcvbJ0ehxnukr9C2EVm7HOBTlNZZQlT/7H0CRhEIqitduJM5sQIm8f7LiQaIJdrrQEZYOP
 u3RXmJfcCJGtTTIRCMVDrp491bIU9nvMmD2UI9Y+qWyJ6atHuM9+cb0AYgYjsHtd5qtwfY
 l3j8Lx9fiygrSZO0zxnwR9X0vyer740=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-CjutzKoXMZaobgQt_144-w-1; Tue, 20 Jul 2021 11:11:42 -0400
X-MC-Unique: CjutzKoXMZaobgQt_144-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD345193F561;
 Tue, 20 Jul 2021 15:11:15 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C723960843;
 Tue, 20 Jul 2021 15:11:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/11] iotests/307: Test iothread conflict for exports
Date: Tue, 20 Jul 2021 17:10:53 +0200
Message-Id: <20210720151053.226144-12-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Passing fixed-iothread=true should make iothread conflicts fatal,
whereas fixed-iothread=false should not.

Combine the second case with an error condition that is checked after
the iothread is handled, to verify that qemu does not crash if there is
such an error after changing the iothread failed.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210624083825.29224-3-mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/307     | 15 +++++++++++++++
 tests/qemu-iotests/307.out |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/tests/qemu-iotests/307 b/tests/qemu-iotests/307
index c7685347bc..b429b5aa50 100755
--- a/tests/qemu-iotests/307
+++ b/tests/qemu-iotests/307
@@ -41,9 +41,11 @@ with iotests.FilePath('image') as img, \
     iotests.log('=== Launch VM ===')
 
     vm.add_object('iothread,id=iothread0')
+    vm.add_object('iothread,id=iothread1')
     vm.add_blockdev(f'file,filename={img},node-name=file')
     vm.add_blockdev(f'{iotests.imgfmt},file=file,node-name=fmt')
     vm.add_blockdev('raw,file=file,node-name=ro,read-only=on')
+    vm.add_blockdev('null-co,node-name=null')
     vm.add_device(f'id=scsi0,driver=virtio-scsi,iothread=iothread0')
     vm.launch()
 
@@ -74,6 +76,19 @@ with iotests.FilePath('image') as img, \
     vm.qmp_log('query-block-exports')
     iotests.qemu_nbd_list_log('-k', socket)
 
+    iotests.log('\n=== Add export with conflicting iothread ===')
+
+    vm.qmp_log('device_add', id='sdb', driver='scsi-hd', drive='null')
+
+    # Should fail because of fixed-iothread
+    vm.qmp_log('block-export-add', id='export1', type='nbd', node_name='null',
+               iothread='iothread1', fixed_iothread=True, writable=True)
+
+    # Should ignore the iothread conflict, but then fail because of the
+    # permission conflict (and not crash)
+    vm.qmp_log('block-export-add', id='export1', type='nbd', node_name='null',
+               iothread='iothread1', fixed_iothread=False, writable=True)
+
     iotests.log('\n=== Add a writable export ===')
 
     # This fails because share-rw=off
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 4b0c7e155a..ec8d2be0e0 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -51,6 +51,14 @@ exports available: 1
    base:allocation
 
 
+=== Add export with conflicting iothread ===
+{"execute": "device_add", "arguments": {"drive": "null", "driver": "scsi-hd", "id": "sdb"}}
+{"return": {}}
+{"execute": "block-export-add", "arguments": {"fixed-iothread": true, "id": "export1", "iothread": "iothread1", "node-name": "null", "type": "nbd", "writable": true}}
+{"error": {"class": "GenericError", "desc": "Cannot change iothread of active block backend"}}
+{"execute": "block-export-add", "arguments": {"fixed-iothread": false, "id": "export1", "iothread": "iothread1", "node-name": "null", "type": "nbd", "writable": true}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'null': permissions 'write' are both required by an unnamed block device (uses node 'null' as 'root' child) and unshared by block device 'sdb' (uses node 'null' as 'root' child)."}}
+
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
 {"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': permissions 'write' are both required by an unnamed block device (uses node 'fmt' as 'root' child) and unshared by block device 'sda' (uses node 'fmt' as 'root' child)."}}
-- 
2.31.1


