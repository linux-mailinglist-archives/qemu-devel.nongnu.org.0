Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963322816E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 15:57:10 +0200 (CEST)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxslZ-0006sO-57
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 09:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jxsk0-0005YE-7a
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:55:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52895
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jxsjy-0007dM-Ls
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595339729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKcGHN9BiCQRQAAgwMmB3i4OhnaN31yh4S3mMqcJVPM=;
 b=XiYqy5VzhglXvBEiaHsB8yX0naNzfVTOFn4DKnOLLtoJSsIYMKANRr332WDBW8j7zA1wb9
 k7HK8+HM43wKL4IkUs6KTov0nER+5vmBdcrUJO3QNfsTo+ChqrtrokMMKkOlzzEAqeFqGC
 aa+U4FIGj07UpDYp+0A4g6p9Ntblk2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-b2QjUC6aMrKwAC7ojI3q1Q-1; Tue, 21 Jul 2020 09:55:28 -0400
X-MC-Unique: b2QjUC6aMrKwAC7ojI3q1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B41F1083FA5;
 Tue, 21 Jul 2020 13:55:27 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40E7E59;
 Tue, 21 Jul 2020 13:55:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.1 v2 1/2] qcow2: Implement v2 zero writes with discard
 if possible
Date: Tue, 21 Jul 2020 15:55:19 +0200
Message-Id: <20200721135520.72355-2-kwolf@redhat.com>
In-Reply-To: <20200721135520.72355-1-kwolf@redhat.com>
References: <20200721135520.72355-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:30:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2 version 2 images don't support the zero flag for clusters, so for
write_zeroes requests, we return -ENOTSUP and get explicit zero buffer
writes. If the image doesn't have a backing file, we can do better: Just
discard the respective clusters.

This is relevant for 'qemu-img convert -O qcow2 -n', where qemu-img has
to assume that the existing target image may contain any data, so it has
to write zeroes. Without this patch, this results in a fully allocated
target image, even if the source image was empty.

Reported-by: Nir Soffer <nsoffer@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-cluster.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 4b5fc8c4a7..a677ba9f5c 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1797,8 +1797,15 @@ int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
     assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
            end_offset >= bs->total_sectors << BDRV_SECTOR_BITS);
 
-    /* The zero flag is only supported by version 3 and newer */
+    /*
+     * The zero flag is only supported by version 3 and newer. However, if we
+     * have no backing file, we can resort to discard in version 2.
+     */
     if (s->qcow_version < 3) {
+        if (!bs->backing) {
+            return qcow2_cluster_discard(bs, offset, bytes,
+                                         QCOW2_DISCARD_REQUEST, false);
+        }
         return -ENOTSUP;
     }
 
-- 
2.25.4


