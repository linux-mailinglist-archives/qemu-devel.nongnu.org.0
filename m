Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631C4432AF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:29:28 +0100 (CET)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwf9-0007vr-44
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwId-0007nE-3B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIW-0004K5-Qa
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgGTJ/f84lxZ/vwiO/DxnsG/FmLFrXSGA8ZhR7WxWpA=;
 b=RfX73Rj2zI9oSzvw+bnuUzcwjmUo+2GMKjbc9hAK0v09VZPB5U2XijuHd6BBa4ogFC5Mfh
 Kk6lYcRQIXzntM93+QOED0YeJ5axIEcevWl2pZbNIJ3NvjnH6tmecLWpNB57S2gHU0LuhZ
 siDBweMK6iHU06MevwRodTx9kJaxDko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-s91uYTHcNKWPYRw6oLcKKw-1; Tue, 02 Nov 2021 12:05:59 -0400
X-MC-Unique: s91uYTHcNKWPYRw6oLcKKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D0219200C1;
 Tue,  2 Nov 2021 16:05:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C045D9D3;
 Tue,  2 Nov 2021 16:05:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/12] block/nvme: Automatically free qemu_memalign() with
 QEMU_AUTO_VFREE
Date: Tue,  2 Nov 2021 17:05:26 +0100
Message-Id: <20211102160528.206766-11-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 4d324c0bf65 ("introduce QEMU_AUTO_VFREE") buffers
allocated by qemu_memalign() can automatically freed when using
the QEMU_AUTO_VFREE macro. Use it to simplify a bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211006164931.172349-2-philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 1cc7b62bb4..fefcc04abe 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -514,10 +514,10 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
 {
     BDRVNVMeState *s = bs->opaque;
     bool ret = false;
-    union {
+    QEMU_AUTO_VFREE union {
         NvmeIdCtrl ctrl;
         NvmeIdNs ns;
-    } *id;
+    } *id = NULL;
     NvmeLBAF *lbaf;
     uint16_t oncs;
     int r;
@@ -595,7 +595,6 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
     s->blkshift = lbaf->ds;
 out:
     qemu_vfio_dma_unmap(s->vfio, id);
-    qemu_vfree(id);
 
     return ret;
 }
@@ -1219,7 +1218,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 {
     BDRVNVMeState *s = bs->opaque;
     int r;
-    uint8_t *buf = NULL;
+    QEMU_AUTO_VFREE uint8_t *buf = NULL;
     QEMUIOVector local_qiov;
     size_t len = QEMU_ALIGN_UP(bytes, qemu_real_host_page_size);
     assert(QEMU_IS_ALIGNED(offset, s->page_size));
@@ -1246,7 +1245,6 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     if (!r && !is_write) {
         qemu_iovec_from_buf(qiov, 0, buf, bytes);
     }
-    qemu_vfree(buf);
     return r;
 }
 
@@ -1365,7 +1363,7 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
     NVMeRequest *req;
-    NvmeDsmRange *buf;
+    QEMU_AUTO_VFREE NvmeDsmRange *buf = NULL;
     QEMUIOVector local_qiov;
     int ret;
 
@@ -1440,7 +1438,6 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
     trace_nvme_dsm_done(s, offset, bytes, ret);
 out:
     qemu_iovec_destroy(&local_qiov);
-    qemu_vfree(buf);
     return ret;
 
 }
-- 
2.31.1


