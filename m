Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087340CC70
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:16:30 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZSP-0002od-JR
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6r-000760-JM
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6m-00070K-3S
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKhGGeL/HQSlt9pmGXMeq7t9aX9YoIvPwLp/0+X6+2Q=;
 b=dnkkFxfVT4ZSs9YhvP/qu54tL1NmwSSXWu1a7COqFKDlvF1qah+GCFbSYCscAeBvHWFkVF
 gGdVVLIz+xd37STNLprABr60W1NQxB5ofDlVTg2MuFS2k+GOZnewleQC+l/7Vg9DgK9L7L
 0+s2OZkpZcXAD0hhz8GdR8cGNgGCUiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-tmNFrr1ZPnaOB8qgNT5mBg-1; Wed, 15 Sep 2021 13:54:04 -0400
X-MC-Unique: tmNFrr1ZPnaOB8qgNT5mBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8697784A5EB;
 Wed, 15 Sep 2021 17:54:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 028381972E;
 Wed, 15 Sep 2021 17:54:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/32] qcow2: handle_dependencies(): relax conflict detection
Date: Wed, 15 Sep 2021 19:53:06 +0200
Message-Id: <20210915175318.853225-21-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

There is no conflict and no dependency if we have parallel writes to
different subclusters of one cluster when the cluster itself is already
allocated. So, relax extra dependency.

Measure performance:
First, prepare build/qemu-img-old and build/qemu-img-new images.

cd scripts/simplebench
./img_bench_templater.py

Paste the following to stdin of running script:

qemu_img=../../build/qemu-img-{old|new}
$qemu_img create -f qcow2 -o extended_l2=on /ssd/x.qcow2 1G
$qemu_img bench -c 100000 -d 8 [-s 2K|-s 2K -o 512|-s $((1024*2+512))] \
        -w -t none -n /ssd/x.qcow2

The result:

All results are in seconds

------------------  ---------  ---------
                    old        new
-s 2K               6.7 ± 15%  6.2 ± 12%
                                 -7%
-s 2K -o 512        13 ± 3%    11 ± 5%
                                 -16%
-s $((1024*2+512))  9.5 ± 4%   8.4
                                 -12%
------------------  ---------  ---------

So small writes are more independent now and that helps to keep deeper
io queue which improves performance.

271 iotest output becomes racy for three allocation in one cluster.
Second and third writes may finish in different order. Second and
third requests don't depend on each other any more. Still they both
depend on first request anyway. Filter out second and third write
offsets to cover both possible outputs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210824101517.59802-4-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
[hreitz: s/ an / and /]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-cluster.c      | 11 +++++++++++
 tests/qemu-iotests/271     |  5 ++++-
 tests/qemu-iotests/271.out |  4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 9917e5c28c..c1c43a891b 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1403,6 +1403,17 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
             continue;
         }
 
+        if (old_alloc->keep_old_clusters &&
+            (end <= l2meta_cow_start(old_alloc) ||
+             start >= l2meta_cow_end(old_alloc)))
+        {
+            /*
+             * Clusters intersect but COW areas don't. And cluster itself is
+             * already allocated. So, there is no actual conflict.
+             */
+            continue;
+        }
+
         /* Conflict */
 
         if (start < old_start) {
diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
index 599b849cc6..2775b4d130 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -893,7 +893,10 @@ EOF
 }
 
 _make_test_img -o extended_l2=on 1M
-_concurrent_io     | $QEMU_IO | _filter_qemu_io
+# Second and third writes in _concurrent_io() are independent and may finish in
+# different order. So, filter offset out to match both possible variants.
+_concurrent_io     | $QEMU_IO | _filter_qemu_io | \
+    $SED -e 's/\(20480\|40960\)/OFFSET/'
 _concurrent_verify | $QEMU_IO | _filter_qemu_io
 
 # success, all done
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 81043ba4d7..5be780de76 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -719,8 +719,8 @@ blkdebug: Suspended request 'A'
 blkdebug: Resuming request 'A'
 wrote 2048/2048 bytes at offset 30720
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-wrote 2048/2048 bytes at offset 20480
+wrote 2048/2048 bytes at offset OFFSET
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-wrote 2048/2048 bytes at offset 40960
+wrote 2048/2048 bytes at offset OFFSET
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.31.1


