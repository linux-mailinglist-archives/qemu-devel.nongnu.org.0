Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAC5C4E8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:19:03 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi34c-0006sL-Qa
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 16:38:50 -0400
Received: from [2001:470:142:3::10] (port=54346 helo=eggs.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hi2zB-0003wj-De
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hi2z1-0002Q5-MD
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:33:11 -0400
Received: from [209.132.183.28] (port=57596 helo=mx1.redhat.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hi2yd-0002It-Jh; Mon, 01 Jul 2019 16:32:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F5C53087955;
 Mon,  1 Jul 2019 20:13:44 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B037A4C3;
 Mon,  1 Jul 2019 20:13:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 16:13:30 -0400
Message-Id: <20190701201330.29718-4-jsnow@redhat.com>
In-Reply-To: <20190701201330.29718-1-jsnow@redhat.com>
References: <20190701201330.29718-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 20:13:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/3] iotests: test bitmap moving inside 254
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Test persistent bitmap copying with and without removal of original
bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/254     | 30 +++++++++++++-
 tests/qemu-iotests/254.out | 82 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 8edba91c5d..9a57bccc26 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -1,6 +1,6 @@
 #!/usr/bin/env python
 #
-# Test external snapshot with bitmap copying.
+# Test external snapshot with bitmap copying and moving.
 #
 # Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
 #
@@ -32,6 +32,10 @@ vm =3D iotests.VM().add_drive(disk, opts=3D'node-name=3D=
base')
 vm.launch()
=20
 vm.qmp_log('block-dirty-bitmap-add', node=3D'drive0', name=3D'bitmap0')
+vm.qmp_log('block-dirty-bitmap-add', node=3D'drive0', name=3D'bitmap1',
+           persistent=3DTrue)
+vm.qmp_log('block-dirty-bitmap-add', node=3D'drive0', name=3D'bitmap2',
+           persistent=3DTrue)
=20
 vm.hmp_qemu_io('drive0', 'write 0 512K')
=20
@@ -39,16 +43,38 @@ vm.qmp_log('transaction', indent=3D2, actions=3D[
     {'type': 'blockdev-snapshot-sync',
      'data': {'device': 'drive0', 'snapshot-file': top,
               'snapshot-node-name': 'snap'}},
+
+    # copy non-persistent bitmap0
     {'type': 'block-dirty-bitmap-add',
      'data': {'node': 'snap', 'name': 'bitmap0'}},
     {'type': 'block-dirty-bitmap-merge',
      'data': {'node': 'snap', 'target': 'bitmap0',
-              'bitmaps': [{'node': 'base', 'name': 'bitmap0'}]}}
+              'bitmaps': [{'node': 'base', 'name': 'bitmap0'}]}},
+
+    # copy persistent bitmap1, original will be saved to base image
+    {'type': 'block-dirty-bitmap-add',
+     'data': {'node': 'snap', 'name': 'bitmap1', 'persistent': True}},
+    {'type': 'block-dirty-bitmap-merge',
+     'data': {'node': 'snap', 'target': 'bitmap1',
+              'bitmaps': [{'node': 'base', 'name': 'bitmap1'}]}},
+
+    # move persistent bitmap1, original will be removed and not saved
+    # to base image
+    {'type': 'block-dirty-bitmap-add',
+     'data': {'node': 'snap', 'name': 'bitmap2', 'persistent': True}},
+    {'type': 'block-dirty-bitmap-merge',
+     'data': {'node': 'snap', 'target': 'bitmap2',
+              'bitmaps': [{'node': 'base', 'name': 'bitmap2'}]}},
+    {'type': 'block-dirty-bitmap-remove',
+     'data': {'node': 'base', 'name': 'bitmap2'}}
 ], filters=3D[iotests.filter_qmp_testfiles])
=20
 result =3D vm.qmp('query-block')['return'][0]
 log("query-block: device =3D {}, node-name =3D {}, dirty-bitmaps:".forma=
t(
     result['device'], result['inserted']['node-name']))
 log(result['dirty-bitmaps'], indent=3D2)
+log("\nbitmaps in backing image:")
+log(result['inserted']['image']['backing-image']['format-specific'] \
+    ['data']['bitmaps'], indent=3D2)
=20
 vm.shutdown()
diff --git a/tests/qemu-iotests/254.out b/tests/qemu-iotests/254.out
index d7394cf002..d185c0532f 100644
--- a/tests/qemu-iotests/254.out
+++ b/tests/qemu-iotests/254.out
@@ -1,5 +1,9 @@
 {"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0", "=
node": "drive0"}}
 {"return": {}}
+{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap1", "=
node": "drive0", "persistent": true}}
+{"return": {}}
+{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap2", "=
node": "drive0", "persistent": true}}
+{"return": {}}
 {
   "execute": "transaction",
   "arguments": {
@@ -31,6 +35,55 @@
           "target": "bitmap0"
         },
         "type": "block-dirty-bitmap-merge"
+      },
+      {
+        "data": {
+          "name": "bitmap1",
+          "node": "snap",
+          "persistent": true
+        },
+        "type": "block-dirty-bitmap-add"
+      },
+      {
+        "data": {
+          "bitmaps": [
+            {
+              "name": "bitmap1",
+              "node": "base"
+            }
+          ],
+          "node": "snap",
+          "target": "bitmap1"
+        },
+        "type": "block-dirty-bitmap-merge"
+      },
+      {
+        "data": {
+          "name": "bitmap2",
+          "node": "snap",
+          "persistent": true
+        },
+        "type": "block-dirty-bitmap-add"
+      },
+      {
+        "data": {
+          "bitmaps": [
+            {
+              "name": "bitmap2",
+              "node": "base"
+            }
+          ],
+          "node": "snap",
+          "target": "bitmap2"
+        },
+        "type": "block-dirty-bitmap-merge"
+      },
+      {
+        "data": {
+          "name": "bitmap2",
+          "node": "base"
+        },
+        "type": "block-dirty-bitmap-remove"
       }
     ]
   }
@@ -40,6 +93,24 @@
 }
 query-block: device =3D drive0, node-name =3D snap, dirty-bitmaps:
 [
+  {
+    "busy": false,
+    "count": 524288,
+    "granularity": 65536,
+    "name": "bitmap2",
+    "persistent": true,
+    "recording": true,
+    "status": "active"
+  },
+  {
+    "busy": false,
+    "count": 524288,
+    "granularity": 65536,
+    "name": "bitmap1",
+    "persistent": true,
+    "recording": true,
+    "status": "active"
+  },
   {
     "busy": false,
     "count": 524288,
@@ -50,3 +121,14 @@ query-block: device =3D drive0, node-name =3D snap, d=
irty-bitmaps:
     "status": "active"
   }
 ]
+
+bitmaps in backing image:
+[
+  {
+    "flags": [
+      "auto"
+    ],
+    "granularity": 65536,
+    "name": "bitmap1"
+  }
+]
--=20
2.21.0


