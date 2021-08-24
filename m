Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763983F602B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXKB-0007DI-QK
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXAH-00064u-7L
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXAF-0005al-2m
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iERganKRZ2P65/BHVYzLPkJwsOXEHjYEJ8zC3s7dmRE=;
 b=T9M2zM8UOx5dV3B1qAsG4tDasXgZIxLsN1NJK+yfl9+1A5sCAHktRqOwET0oSAhVodPRTw
 sErgj+Urc/f8NYXfbbzvZhtREjRlHi1jKz5fKyqYX5OOX/KnrTjTSkohtKgOva4GddWCFc
 +8oho5vh2l/yxecJvSZMoB/OUQibIEU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-6V4X6VVOPfmiu8AIVQdq3A-1; Tue, 24 Aug 2021 10:12:29 -0400
X-MC-Unique: 6V4X6VVOPfmiu8AIVQdq3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 m20-20020a7bce14000000b002e6fd85b6dfso4158485wmc.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iERganKRZ2P65/BHVYzLPkJwsOXEHjYEJ8zC3s7dmRE=;
 b=D4/iDFqOZisk6UriXh44LX+mgC149mLod0AXkg3ZRaiHnGXeh1ETvtMppKraNqdIU1
 R4/Z5xUgClOxGb0gFy9ZYTRRM6LuDEjspVpndWsUDyKNKbRmROGMoaGGJKArofdBF/1j
 RYqXQGxSY+6z6u1f4+BRC+xeNg0VFasGarr2yvAvAdYhFxp5omknHd7Y4sGH1uRKHFIc
 BAxx4I/MYodZsRR2PHz7DyaWrLvC0BNeAvFlm6pQMC2zAcRF2oxx7ZupDuszaldQrKV8
 kb6/2dX1P9EGn1hSjIpBVD021TgOT5fJ3YO4wj+KPl8GAzWpxlpHMmzk76PmeniyzfA8
 5xsA==
X-Gm-Message-State: AOAM531FNlG5vvkIT/PAZFWbBoSui/csMFzJcDHPCXUzY1WRHacYXvKG
 QF+N9TtXkJw7ws36eXyp+lwv9X+JmO7z3OeMpWdNLXOfr5N5xABDEekEKjZ1fR1scsrvo6sQyMj
 sxzlrpBK2YIOzXjCiSJwz2zTcC4nylifa4XRroULR9dsDzK6OK4LaijV9Faci8Ue3
X-Received: by 2002:adf:cd10:: with SMTP id w16mr20305385wrm.404.1629814347918; 
 Tue, 24 Aug 2021 07:12:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeSROUKjC22xINvDw4ImyIwWBMB4OHLuyKqKW+X/Aww8SiwGMKRzJu4jYhEdmLCEmZVlhAkw==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr20305347wrm.404.1629814347704; 
 Tue, 24 Aug 2021 07:12:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t14sm2731627wmj.2.2021.08.24.07.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] block/nvme: Only report VFIO error on failed retry
Date: Tue, 24 Aug 2021 16:11:42 +0200
Message-Id: <20210824141142.1165291-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Tingting Mao <timao@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 80546b0babd..abfe305baf2 100644
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


