Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AA31A84E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:30:16 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAht9-0002Ro-9B
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhkz-000402-7h
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhkx-0005o3-6p
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YStRyw6rkOpcj3BTBnkNzMA84120O4F+Rp95ueaU2yg=;
 b=T8hZexWxZaZloJhVBeVP1yJ2eozTvUmD/mW7qcJUg3JM/d1yb/aKkHYNwJv6uHSE9SFY+b
 W9K/ubf5OY2SZQsNvChJVKiL9EkrwOfkQmmV5eqpaaNPFBd9ZGrqqrht4l6NnGjK0VlpWm
 Zux78tgQDUvaqJNg1rPWFiMTIjDMT3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-_Hnoux4aNw2slcvWK9wSKw-1; Fri, 12 Feb 2021 18:21:43 -0500
X-MC-Unique: _Hnoux4aNw2slcvWK9wSKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D03803F47;
 Fri, 12 Feb 2021 23:21:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5010C1F04C;
 Fri, 12 Feb 2021 23:21:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] qemu-iotests: 300: Add test case for modifying persistence
 of bitmap
Date: Fri, 12 Feb 2021 17:21:32 -0600
Message-Id: <20210212232134.1462756-4-eblake@redhat.com>
In-Reply-To: <20210212232134.1462756-1-eblake@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

Verify that the modification of the bitmap persistence over migration
which is controlled via BitmapMigrationBitmapAliasTransform works
properly.

Based on TestCrossAliasMigration

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Message-Id: <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: Adjust test for explicit read_zeroes=False]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/300     | 93 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/300.out |  4 +-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 43264d883d79..63036f6a6e13 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -600,6 +600,99 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
         self.verify_dest_has_all_bitmaps()
         self.verify_dest_error(None)

+class TestAliasTransformMigration(TestDirtyBitmapMigration):
+    """
+    Tests the 'transform' option which modifies bitmap persistence on migration.
+    """
+
+    src_node_name = 'node-a'
+    dst_node_name = 'node-b'
+    src_bmap_name = 'bmap-a'
+    dst_bmap_name = 'bmap-b'
+
+    def setUp(self) -> None:
+        TestDirtyBitmapMigration.setUp(self)
+
+        # Now create another block device and let both have two bitmaps each
+        result = self.vm_a.qmp('blockdev-add',
+                               node_name='node-b', driver='null-co',
+                               read_zeroes=False)
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm_b.qmp('blockdev-add',
+                               node_name='node-a', driver='null-co',
+                               read_zeroes=False)
+        self.assert_qmp(result, 'return', {})
+
+        bmaps_to_add = (('node-a', 'bmap-b'),
+                        ('node-b', 'bmap-a'),
+                        ('node-b', 'bmap-b'))
+
+        for (node, bmap) in bmaps_to_add:
+            result = self.vm_a.qmp('block-dirty-bitmap-add',
+                                   node=node, name=bmap)
+            self.assert_qmp(result, 'return', {})
+
+    @staticmethod
+    def transform_mapping() -> BlockBitmapMapping:
+        return [
+            {
+                'node-name': 'node-a',
+                'alias': 'node-a',
+                'bitmaps': [
+                    {
+                        'name': 'bmap-a',
+                        'alias': 'bmap-a',
+                        'transform':
+                            {
+                                'persistent': True
+                            }
+                    },
+                    {
+                        'name': 'bmap-b',
+                        'alias': 'bmap-b'
+                    }
+                ]
+            },
+            {
+                'node-name': 'node-b',
+                'alias': 'node-b',
+                'bitmaps': [
+                    {
+                        'name': 'bmap-a',
+                        'alias': 'bmap-a'
+                    },
+                    {
+                        'name': 'bmap-b',
+                        'alias': 'bmap-b'
+                    }
+                ]
+            }
+        ]
+
+    def verify_dest_bitmap_state(self) -> None:
+        bitmaps = self.vm_b.query_bitmaps()
+
+        for node in bitmaps:
+            bitmaps[node] = sorted(((bmap['name'], bmap['persistent']) for bmap in bitmaps[node]))
+
+        self.assertEqual(bitmaps,
+                         {'node-a': [('bmap-a', True), ('bmap-b', False)],
+                          'node-b': [('bmap-a', False), ('bmap-b', False)]})
+
+    def test_transform_on_src(self) -> None:
+        self.set_mapping(self.vm_a, self.transform_mapping())
+
+        self.migrate()
+        self.verify_dest_bitmap_state()
+        self.verify_dest_error(None)
+
+    def test_transform_on_dst(self) -> None:
+        self.set_mapping(self.vm_b, self.transform_mapping())
+
+        self.migrate()
+        self.verify_dest_bitmap_state()
+        self.verify_dest_error(None)

 if __name__ == '__main__':
     iotests.main(supported_protocols=['file'])
diff --git a/tests/qemu-iotests/300.out b/tests/qemu-iotests/300.out
index cafb8161f7b1..12e9ab7d571b 100644
--- a/tests/qemu-iotests/300.out
+++ b/tests/qemu-iotests/300.out
@@ -1,5 +1,5 @@
-.....................................
+.......................................
 ----------------------------------------------------------------------
-Ran 37 tests
+Ran 39 tests

 OK
-- 
2.30.1


