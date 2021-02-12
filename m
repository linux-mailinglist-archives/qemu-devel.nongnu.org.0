Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3A31A3BA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:37:59 +0100 (CET)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcOE-0001Rj-HV
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcL4-0007WI-2o
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcL2-0005mf-Eb
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613151279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJhYx9mR3cgdynjG+SxzoRa+zGx4gUR64+nUb3i0FPU=;
 b=PIzHnCx4lB64BW8lT818DQ8x1A0HJNMO4XSNRzRPBPSOABaxn+NSIEPR0kaJ+GSQSR5vn4
 4ow1iEuKHbr9fi+lXRC+9fxwTtmEZkoXxx/zFTPrJ6OhKrSbdrM8lS/PA8ltFWa1WpGNFf
 3E6VXh2KnC4DHDywE0HAC32I7uTSpVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-b6bT18tvOPaNSLGMrETOCg-1; Fri, 12 Feb 2021 12:34:36 -0500
X-MC-Unique: b6bT18tvOPaNSLGMrETOCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0789E1936B60;
 Fri, 12 Feb 2021 17:34:34 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4555C3E0;
 Fri, 12 Feb 2021 17:34:32 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] qemu-iotests: 300: Add test case for modifying
 persistence of bitmap
Date: Fri, 12 Feb 2021 18:34:25 +0100
Message-Id: <d9c8e9827e9b6001b2dd1b92e64aab858e6d2a86.1613150869.git.pkrempa@redhat.com>
In-Reply-To: <cover.1613150869.git.pkrempa@redhat.com>
References: <cover.1613150869.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that the modification of the bitmap persistence over migration
which is controlled via BitmapMigrationBitmapAliasTransform works
properly.

Based on TestCrossAliasMigration

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 tests/qemu-iotests/300     | 91 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/300.out |  4 +-
 2 files changed, 93 insertions(+), 2 deletions(-)

v3: new in series

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 43264d883d..9d4ec6a381 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -600,6 +600,97 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
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
+                               node_name='node-b', driver='null-co')
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm_b.qmp('blockdev-add',
+                               node_name='node-a', driver='null-co')
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
index cafb8161f7..12e9ab7d57 100644
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
2.29.2


