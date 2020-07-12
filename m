Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AB21CA9B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jul 2020 19:18:21 +0200 (CEST)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jufcJ-0003ci-Ky
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 13:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbO-0002j7-Gy; Sun, 12 Jul 2020 13:17:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:52518 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbL-00063s-VN; Sun, 12 Jul 2020 13:17:22 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbA-0005DF-0X; Sun, 12 Jul 2020 20:17:08 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/3] scripts/simplebench: add unaligned data case to
 bench_write_req
Date: Sun, 12 Jul 2020 20:17:14 +0300
Message-Id: <1594574234-73535-4-git-send-email-andrey.shinkevich@virtuozzo.com>
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

Add a test case with writhing data unaligned to the image clusters.
This case does not involve the COW optimization introduced with the
patch "qcow2: skip writing zero buffers to empty COW areas"
(git commit ID: c8bb23cbdbe32f5).

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 scripts/simplebench/bench_write_req.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench_write_req.py b/scripts/simplebench/bench_write_req.py
index ceb0ab6..9f3a520 100755
--- a/scripts/simplebench/bench_write_req.py
+++ b/scripts/simplebench/bench_write_req.py
@@ -58,7 +58,7 @@ def bench_write_req(qemu_img, image_name, block_size, block_offset, requests,
     image_name   -- QCOW2 image name to create
     block_size   -- size of a block to write to clusters
     block_offset -- offset of the block in clusters
-    requests     -- number of write requests per cluster
+    requests     -- number of write requests per cluster, customize if zero
     empty_image  -- if not True, fills image with random data
 
     Returns {'seconds': int} on success and {'error': str} on failure.
@@ -176,6 +176,13 @@ if __name__ == '__main__':
             'requests': 2,
             'empty_image': True
         },
+        {
+            'id': '<unaligned>',
+            'block_size': 104857600,
+            'block_offset': 524288,
+            'requests': 0,
+            'empty_image': False
+        },
     ]
 
     # Test-envs are "columns" in benchmark resulting table, 'id is a caption
-- 
1.8.3.1


