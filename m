Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68721CA9D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jul 2020 19:19:19 +0200 (CEST)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jufdG-0005C9-Uy
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 13:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbP-0002jI-Mj; Sun, 12 Jul 2020 13:17:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:52516 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbM-00063t-14; Sun, 12 Jul 2020 13:17:23 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufb9-0005DF-Vb; Sun, 12 Jul 2020 20:17:07 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/3] scripts/simplebench: allow writing to non-empty image
Date: Sun, 12 Jul 2020 20:17:13 +0300
Message-Id: <1594574234-73535-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594574234-73535-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1594574234-73535-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 13:17:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'empty_image' parameter to the function bench_write_req() and to
the test cases that will allow writing to the non-empty clusters of the
image if the 'empty_image' parameter set to False.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 scripts/simplebench/bench_write_req.py | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/scripts/simplebench/bench_write_req.py b/scripts/simplebench/bench_write_req.py
index c61c8d2..ceb0ab6 100755
--- a/scripts/simplebench/bench_write_req.py
+++ b/scripts/simplebench/bench_write_req.py
@@ -29,7 +29,7 @@ def bench_func(env, case):
     """ Handle one "cell" of benchmarking table. """
     return bench_write_req(env['qemu_img'], env['image_name'],
                            case['block_size'], case['block_offset'],
-                           case['requests'])
+                           case['requests'], case['empty_image'])
 
 
 def qemu_img_pipe(*args):
@@ -45,7 +45,8 @@ def qemu_img_pipe(*args):
     return subp.communicate()[0]
 
 
-def bench_write_req(qemu_img, image_name, block_size, block_offset, requests):
+def bench_write_req(qemu_img, image_name, block_size, block_offset, requests,
+                    empty_image):
     """Benchmark write requests
 
     The function creates a QCOW2 image with the given path/name and fills it
@@ -58,6 +59,7 @@ def bench_write_req(qemu_img, image_name, block_size, block_offset, requests):
     block_size   -- size of a block to write to clusters
     block_offset -- offset of the block in clusters
     requests     -- number of write requests per cluster
+    empty_image  -- if not True, fills image with random data
 
     Returns {'seconds': int} on success and {'error': str} on failure.
     Return value is compatible with simplebench lib.
@@ -107,6 +109,15 @@ def bench_write_req(qemu_img, image_name, block_size, block_offset, requests):
 
     try:
         qemu_img_pipe(*args_create)
+
+        if not empty_image:
+            dd = ['dd', 'if=/dev/urandom', f'of={image_name}',
+                  f'bs={cluster_size}', f'seek={seek}',
+                  f'count={dd_count}']
+            devnull = open('/dev/null', 'w')
+            subprocess.run(dd, stderr=devnull, stdout=devnull)
+            subprocess.run('sync')
+
     except OSError as e:
         os.remove(image_name)
         return {'error': 'qemu_img create failed: ' + str(e)}
@@ -141,25 +152,29 @@ if __name__ == '__main__':
             'id': '<simple case>',
             'block_size': 0,
             'block_offset': 0,
-            'requests': 10
+            'requests': 10,
+            'empty_image': True
         },
         {
             'id': '<general case>',
             'block_size': 4096,
             'block_offset': 0,
-            'requests': 10
+            'requests': 10,
+            'empty_image': True
         },
         {
             'id': '<cluster middle>',
             'block_size': 4096,
             'block_offset': 524288,
-            'requests': 10
+            'requests': 10,
+            'empty_image': True
         },
         {
             'id': '<cluster overlap>',
             'block_size': 524288,
             'block_offset': 4096,
-            'requests': 2
+            'requests': 2,
+            'empty_image': True
         },
     ]
 
-- 
1.8.3.1


