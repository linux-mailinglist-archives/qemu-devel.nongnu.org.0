Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14033F8F55
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:58:09 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLVo-0002g6-T4
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLP5-00066e-Q1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLP4-0003Qn-48
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojj+ZaFHzvapR5Yklu/beV4VWQwhlVBhI7TMjzFMewk=;
 b=KO1r4c0L61+A6h1y63AbLja0lFoTOzGONYVi3D0GFmxqcGVUvg/Cye6ZH5VQIBR1Irs8LW
 jFs9TVKDwkaAxKBKLLSqi6OihTZo832bOVJBzzrpfB3mAgp61hU+C5XwTit/CDJqTUcNm5
 h85vu8rOP6A3jeQSFx+QDaEIG2h/X1Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-7u7YnMPVPlSSxsbTNVlDuA-1; Thu, 26 Aug 2021 15:51:06 -0400
X-MC-Unique: 7u7YnMPVPlSSxsbTNVlDuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so1272581wme.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojj+ZaFHzvapR5Yklu/beV4VWQwhlVBhI7TMjzFMewk=;
 b=MMT7YHp8lpqhFwqPlL9IenVDtry1HZ+d5BLTugjQ9opky9NBcoj2TtlzJvfAgR+LbT
 sE8UrnMLS9V148rVKxiJfUzfCrKmI+5+k12KSiWpawZpqwRVJra3oXsdkHJOoOjPUiKJ
 Bwv2DoJgYZeT6Hpfjv6mHirGo8+OHfSnK7hRSttfvbYeCrDK618qQk2Xr/ntF9y7mUPd
 O92cSwOkcyzP93qUkBD2Ysbs55t1ZQQDF9x2P+1xc1zce6z5hl+iRkoRkFuno3IIz7ER
 91Wg96azoNgHQUDItuD+zh2IoGmuTAfsIhWixvf6y/z8F02HUoBdHDVUKYXbv4zcDr7/
 bchQ==
X-Gm-Message-State: AOAM531qF9CxnYCl/SbiTA0Pc62A+xVnjKjnRkBhzBOtWRleNtVkA5ej
 8rxIdsax+0yslemq+XeZtUKeFrt6za+xvqIOAOir10snAnsP+DiaHMpq0mv+FH1PxmYZYt9l+eM
 OHvBlZ5T6u4mXu85Z2K5kLRFIXb+F0k4fWDinEL90e+hWUORkhwxYGdkwWt8NrFPK
X-Received: by 2002:adf:cd10:: with SMTP id w16mr6241784wrm.404.1630007464861; 
 Thu, 26 Aug 2021 12:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjO3MWn5XqzJXC8a9xrkH5+1XNA08ELP3LEdYLLAhn9/odMsvXYAepVGX+0yMy92TKIe9uig==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr6241756wrm.404.1630007464640; 
 Thu, 26 Aug 2021 12:51:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l26sm80749wmi.13.2021.08.26.12.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:51:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] block/nvme: Only report VFIO error on failed retry
Date: Thu, 26 Aug 2021 21:50:14 +0200
Message-Id: <20210826195014.2180369-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
 Klaus Jensen <k.jensen@samsung.com>, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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


