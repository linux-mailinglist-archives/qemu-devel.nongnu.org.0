Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA53BF95F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:53:43 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sb8-0003gJ-MD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV7-0003v2-Hf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV4-0001Rv-1Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625744845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tttWUckygg3NEPKNtz8ctJtdFGgk9p1pQ6dqttriVps=;
 b=iID01xoGAo5RzkeqrbPj8O53lzegT/SJevBilzQISE/X9SM6RqAY3e6NPPtGMTL6KqJ4qd
 rqXSI0IAr6kAVN2UwBOKrIVttK1pdhbRzEwK1zWxA93sh0wSdmksDyAPIx2sOQuxgQjtkI
 pbhI9v1F0n/ltafdZXoMYsjnMH+Pgdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-se-XjPvHOeOg1SkPflwPCQ-1; Thu, 08 Jul 2021 07:47:23 -0400
X-MC-Unique: se-XjPvHOeOg1SkPflwPCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17BFF8015F5;
 Thu,  8 Jul 2021 11:47:22 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE7AE60843;
 Thu,  8 Jul 2021 11:47:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 5/6] iotests: Test reopening multiple devices at the same
 time
Date: Thu,  8 Jul 2021 13:47:08 +0200
Message-Id: <20210708114709.206487-6-kwolf@redhat.com>
In-Reply-To: <20210708114709.206487-1-kwolf@redhat.com>
References: <20210708114709.206487-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

This test swaps the images used by two active block devices.

This is now possible thanks to the new ability to run
x-blockdev-reopen on multiple devices at the same time.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/245     | 47 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/245.out |  4 ++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index ca08955207..8bc8101e6d 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -649,6 +649,53 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                                          '-c', 'read -P 0x40 0x40008 1',
                                          '-c', 'read -P 0x80 0x40010 1', hd_path[0])
 
+    # Swap the disk images of two active block devices
+    def test_swap_files(self):
+        # Add hd0 and hd2 (none of them with backing files)
+        opts0 = hd_opts(0)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts0)
+        self.assert_qmp(result, 'return', {})
+
+        opts2 = hd_opts(2)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts2)
+        self.assert_qmp(result, 'return', {})
+
+        # Write different data to both block devices
+        self.run_qemu_io("hd0", "write -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "write -P 0xa2 0 1k")
+
+        # Check that the data reads correctly
+        self.run_qemu_io("hd0", "read  -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa2 0 1k")
+
+        # It's not possible to make a block device use an image that
+        # is already being used by the other device.
+        self.reopen(opts0, {'file': 'hd2-file'},
+                    "Permission conflict on node 'hd2-file': permissions "
+                    "'write, resize' are both required by node 'hd2' (uses "
+                    "node 'hd2-file' as 'file' child) and unshared by node "
+                    "'hd0' (uses node 'hd2-file' as 'file' child).")
+        self.reopen(opts2, {'file': 'hd0-file'},
+                    "Permission conflict on node 'hd0-file': permissions "
+                    "'write, resize' are both required by node 'hd0' (uses "
+                    "node 'hd0-file' as 'file' child) and unshared by node "
+                    "'hd2' (uses node 'hd0-file' as 'file' child).")
+
+        # But we can swap the images if we reopen both devices at the
+        # same time
+        opts0['file'] = 'hd2-file'
+        opts2['file'] = 'hd0-file'
+        self.reopenMultiple([opts0, opts2])
+        self.run_qemu_io("hd0", "read  -P 0xa2 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa0 0 1k")
+
+        # And we can of course come back to the original state
+        opts0['file'] = 'hd0-file'
+        opts2['file'] = 'hd2-file'
+        self.reopenMultiple([opts0, opts2])
+        self.run_qemu_io("hd0", "read  -P 0xa0 0 1k")
+        self.run_qemu_io("hd2", "read  -P 0xa2 0 1k")
+
     # Misc reopen tests with different block drivers
     @iotests.skip_if_unsupported(['quorum', 'throttle'])
     def test_misc_drivers(self):
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index daf1e51922..4eced19294 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -17,8 +17,8 @@ read 1/1 bytes at offset 262152
 read 1/1 bytes at offset 262160
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
-..............
+...............
 ----------------------------------------------------------------------
-Ran 24 tests
+Ran 25 tests
 
 OK
-- 
2.31.1


