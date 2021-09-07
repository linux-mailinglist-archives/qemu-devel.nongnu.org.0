Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E294840251E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:28:18 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWSo-00050L-1F
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFe-0005Cm-SA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFd-00062W-1N
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGJG/Cv2iUbtf3xyS49RMJu5hUyBKS31W5r+ddrVYUo=;
 b=QdIHNxO/dia6HMb/QNV6sqVEe/eDNy44QKqVeYh2zv84URbSX7f7U4G8yDt78Jw+nGpxPa
 fDh8qEKi5HSZh5f7tSd67JDbyCSufHAfpNEGnwVXyl9IPwtBuIL/5c9zeiQHwOXmq51jG1
 sVPeRam0twIiJmQvp3vVISMx/4uZOwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-7MG771uWMHWFu50t4sX1fA-1; Tue, 07 Sep 2021 04:14:39 -0400
X-MC-Unique: 7MG771uWMHWFu50t4sX1fA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07BA81020C53;
 Tue,  7 Sep 2021 08:14:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A61EF1B5C1;
 Tue,  7 Sep 2021 08:14:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/11] block/nvme: Only report VFIO error on failed retry
Date: Tue,  7 Sep 2021 09:14:03 +0100
Message-Id: <20210907081403.816404-12-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Tingting Mao <timao@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We expect the first qemu_vfio_dma_map() to fail (indicating
DMA mappings exhaustion, see commit 15a730e7a3a). Do not
report the first failure as error, since we are going to
flush the mappings and retry.

This removes spurious error message displayed on the monitor:

  (qemu) c
  (qemu) qemu-kvm: VFIO_MAP_DMA failed: No space left on device
  (qemu) info status
  VM status: running

Reported-by: Tingting Mao <timao@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-12-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nvme.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 80546b0bab..abfe305baf 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1019,6 +1019,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
     uint64_t *pagelist = req->prp_list_page;
     int i, j, r;
     int entries = 0;
+    Error *local_err = NULL, **errp = NULL;
 
     assert(qiov->size);
     assert(QEMU_IS_ALIGNED(qiov->size, s->page_size));
@@ -1031,7 +1032,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
 try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
-                              len, true, &iova, NULL);
+                              len, true, &iova, errp);
         if (r == -ENOSPC) {
             /*
              * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
@@ -1066,6 +1067,8 @@ try_map:
                     goto fail;
                 }
             }
+            errp = &local_err;
+
             goto try_map;
         }
         if (r) {
@@ -1109,6 +1112,9 @@ fail:
      * because they are already mapped before calling this function; for
      * temporary mappings, a later nvme_cmd_(un)map_qiov will reclaim by
      * calling qemu_vfio_dma_reset_temporary when necessary. */
+    if (local_err) {
+        error_reportf_err(local_err, "Cannot map buffer for DMA: ");
+    }
     return r;
 }
 
-- 
2.31.1


