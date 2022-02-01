Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C304A622C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:18:19 +0100 (CET)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwnK-0000RN-Iw
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyQ-0002jn-3Q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyN-00041c-Ez
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQK+3U52XZ6l1GTnpFZywTk78EoaRBZzHQS8RCJGM8Q=;
 b=I9z7kSziAW3az1aHweBTK84Pwht9G0FaCSqqmB/kvsfGnxrIhz3MznYUlw8p0rYw30HlT+
 uXYw1GhrD4ZpE/JhV3FSpwW0DRbBY8qZZtJobyedgDtw/9khfoqU5SBsTdObE1Jn01iy48
 hexvjHMHzSssd103ACH4nqVMTuPFX34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-ey5geFvzP-y6JTRGxaqr7Q-1; Tue, 01 Feb 2022 10:21:30 -0500
X-MC-Unique: ey5geFvzP-y6JTRGxaqr7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D5984DA47;
 Tue,  1 Feb 2022 15:21:29 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EFD874E98;
 Tue,  1 Feb 2022 15:21:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/10] block/rbd: workaround for ceph issue #53784
Date: Tue,  1 Feb 2022 16:21:08 +0100
Message-Id: <20220201152108.171898-11-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

librbd had a bug until early 2022 that affected all versions of ceph that
supported fast-diff. This bug results in reporting of incorrect offsets
if the offset parameter to rbd_diff_iterate2 is not object aligned.

This patch works around this bug for pre Quincy versions of librbd.

Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
Message-Id: <20220113144426.4036493-3-pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 20bb896c4a..8f183eba2a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1320,6 +1320,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
     int status, r;
     RBDDiffIterateReq req = { .offs = offset };
     uint64_t features, flags;
+    uint64_t head = 0;
 
     assert(offset + bytes <= s->image_size);
 
@@ -1347,7 +1348,43 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         return status;
     }
 
-    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
+#if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 17, 0)
+    /*
+     * librbd had a bug until early 2022 that affected all versions of ceph that
+     * supported fast-diff. This bug results in reporting of incorrect offsets
+     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
+     * Work around this bug by rounding down the offset to object boundaries.
+     * This is OK because we call rbd_diff_iterate2 with whole_object = true.
+     * However, this workaround only works for non cloned images with default
+     * striping.
+     *
+     * See: https://tracker.ceph.com/issues/53784
+     */
+
+    /* check if RBD image has non-default striping enabled */
+    if (features & RBD_FEATURE_STRIPINGV2) {
+        return status;
+    }
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+    /*
+     * check if RBD image is a clone (= has a parent).
+     *
+     * rbd_get_parent_info is deprecated from Nautilus onwards, but the
+     * replacement rbd_get_parent is not present in Luminous and Mimic.
+     */
+    if (rbd_get_parent_info(s->image, NULL, 0, NULL, 0, NULL, 0) != -ENOENT) {
+        return status;
+    }
+#pragma GCC diagnostic pop
+
+    head = req.offs & (s->object_size - 1);
+    req.offs -= head;
+    bytes += head;
+#endif
+
+    r = rbd_diff_iterate2(s->image, NULL, req.offs, bytes, true, true,
                           qemu_rbd_diff_iterate_cb, &req);
     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
         return status;
@@ -1366,7 +1403,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
     }
 
-    *pnum = req.bytes;
+    assert(req.bytes > head);
+    *pnum = req.bytes - head;
     return status;
 }
 
-- 
2.31.1


