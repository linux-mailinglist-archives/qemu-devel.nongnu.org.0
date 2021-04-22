Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7DD3682DC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:57:48 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZam3-0000U2-5h
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajp-0007u0-Hh
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajn-0000cY-Mb
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619103327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBzUI7pOfyMxlNSariLd6PJx0o111oBRF0F5uT7g7Bg=;
 b=iRSLkrTCPjHHh1qZVRMEYne/y3iy4q0iZptNkXHzhjV81Gx/cq+UbLHvFQe29NZqs917Y3
 PFh5eI0o5qB/NMWjaGSpa/Uv11uM5YbpnbmBmgOf3M4w5j+3ekrr8WxMl+8T2t9GqEUbTe
 dgJ8pkI4gTMaWrPbcFvuDD6/ZgwpaLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-a2_Q9jYIM66pqdPMnDsIfQ-1; Thu, 22 Apr 2021 10:55:23 -0400
X-MC-Unique: a2_Q9jYIM66pqdPMnDsIfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 794D4108442F;
 Thu, 22 Apr 2021 14:53:52 +0000 (UTC)
Received: from localhost (ovpn-113-187.ams2.redhat.com [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4A4719C71;
 Thu, 22 Apr 2021 14:53:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests/307: Test iothread conflict for exports
Date: Thu, 22 Apr 2021 16:53:35 +0200
Message-Id: <20210422145335.65814-3-mreitz@redhat.com>
In-Reply-To: <20210422145335.65814-1-mreitz@redhat.com>
References: <20210422145335.65814-1-mreitz@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing fixed-iothread=true should make iothread conflicts fatal,
whereas fixed-iothread=false should not.

Combine the second case with an error condition that is checked after
the iothread is handled, to verify that qemu does not crash if there is
such an error after changing the iothread failed.

Signed-off-by: Max Reitz <mreitz@redhat.com>
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
index daa8ad2da0..69439d96ff 100644
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
+{"error": {"class": "GenericError", "desc": "Conflicts with use by sdb as 'root', which does not allow 'write' on null"}}
+
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
 {"error": {"class": "GenericError", "desc": "Conflicts with use by sda as 'root', which does not allow 'write' on fmt"}}
-- 
2.30.2


