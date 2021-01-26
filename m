Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E391A3040E0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:51:04 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PgN-0007yS-VQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE9-00015o-2D
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE7-0006U8-Ao
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=At1Fcxbu9NJ2wQVnkBixr2M1RSxFIi1rD8YZ8k3c3LY=;
 b=G2zLk3cEvmJvvGV53iQakPNAQUbJnA9zBBS5LYD3KHoSy3we1ZbWT/cMg4iCBYFgZQ2cx1
 M+N3QIjJdWN8IVnHOi28CwQ6zHqBB79GpcYilwgAFFpAvQE8xYT9TXJFG0vy1nGLHb1vAK
 aBATHxOycJh+7ieLE0n5omePctAdA44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-ozHRD6j9Psu7viVKqD75RQ-1; Tue, 26 Jan 2021 09:21:48 -0500
X-MC-Unique: ozHRD6j9Psu7viVKqD75RQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E0E559;
 Tue, 26 Jan 2021 14:21:47 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4DAA5D739;
 Tue, 26 Jan 2021 14:21:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 39/53] iotests: 219: prepare for backup over block-copy
Date: Tue, 26 Jan 2021 15:20:02 +0100
Message-Id: <20210126142016.806073-40-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The further change of moving backup to be a one block-copy call will
make copying chunk-size and cluster-size two separate things. So, even
with 64k cluster sized qcow2 image, default chunk would be 1M.
Test 219 depends on specified chunk-size. Update it for explicit
chunk-size for backup as for mirror.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-14-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/219 | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
index 16c3ca7fff..d1757e9e6f 100755
--- a/tests/qemu-iotests/219
+++ b/tests/qemu-iotests/219
@@ -204,13 +204,13 @@ with iotests.FilePath('disk.img') as disk_path, \
     # but related to this also automatic state transitions like job
     # completion), but still get pause points often enough to avoid making this
     # test very slow, it's important to have the right ratio between speed and
-    # buf_size.
+    # copy-chunk-size.
     #
-    # For backup, buf_size is hard-coded to the source image cluster size (64k),
-    # so we'll pick the same for mirror. The slice time, i.e. the granularity
-    # of the rate limiting is 100ms. With a speed of 256k per second, we can
-    # get four pause points per second. This gives us 250ms per iteration,
-    # which should be enough to stay deterministic.
+    # Chose 64k copy-chunk-size both for mirror (by buf_size) and backup (by
+    # x-max-chunk). The slice time, i.e. the granularity of the rate limiting
+    # is 100ms. With a speed of 256k per second, we can get four pause points
+    # per second. This gives us 250ms per iteration, which should be enough to
+    # stay deterministic.
 
     test_job_lifecycle(vm, 'drive-mirror', has_ready=True, job_args={
         'device': 'drive0-node',
@@ -227,6 +227,7 @@ with iotests.FilePath('disk.img') as disk_path, \
                 'target': copy_path,
                 'sync': 'full',
                 'speed': 262144,
+                'x-perf': {'max-chunk': 65536},
                 'auto-finalize': auto_finalize,
                 'auto-dismiss': auto_dismiss,
             })
-- 
2.29.2


