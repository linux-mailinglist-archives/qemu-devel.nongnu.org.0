Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68F3FE9CB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:11:54 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgt7-0001x1-6S
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgix-0001Nb-4Z
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiu-00006o-Fp
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojj+ZaFHzvapR5Yklu/beV4VWQwhlVBhI7TMjzFMewk=;
 b=PNLJQKLrMRD2hUYP3o1VXSbdp/vp4xy6e+V7XaVPPjYDwwaWtHfFcYXloeRxeL1q5TC5uT
 uwhJNqJS2ACM8woxh3SifDwk4z7EkrSaqtuwDt1LfKgfXOeSA+nSUratWsAdEPruxET3Uv
 86yuCe81rqg1h6hANtYXeFF5+eZRjf4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-zTRHIQSjOAurFUPGEmoz5Q-1; Thu, 02 Sep 2021 03:01:19 -0400
X-MC-Unique: zTRHIQSjOAurFUPGEmoz5Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso214635wrw.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojj+ZaFHzvapR5Yklu/beV4VWQwhlVBhI7TMjzFMewk=;
 b=OC6mM4tdoWpxrSW10fjCyGQOzhrNY6SLXl1yPdmanKsOihQKmAFSqQkKvUK3N2fwrw
 ogMYyjqW4RbmW4mA4ykCY0C3C3qZoQvk2UITIeX9wenIiGMF2auXBD8yOOitMYVyg3MK
 zflMnFQcECiXsfRv5vrkKIXAOOi88VW5GOf4Cutf+W10ldDFNEI9XpB+tUxWWHMO84mi
 9NzNUFhmh93P+KhsJrAja2bHT9sOkL8IV7RXjZWLS5fP1W1j+0iIr5PjjaMHFCdM7skG
 7NTX2tu2QKncKxCtjHj1TrPm1XW33tW6+Q48FSm3ckih9Xo1L31Umelw5t3p6PutEwba
 t4/A==
X-Gm-Message-State: AOAM530jfoKkQZTnk5UHGkSDRgbcssZTzDJ4jcX8/W/+nDmNCyKfSyTS
 erMz0AdZp9jk/177cMoKdtHxV/6sRJNSG1tvES86jxk/M+fmVU4US7ZcAhx85RXpwyyq9xSKZaV
 MVTa7jKbG6n/uhp9i7J8ruxczrEItlAq6sVv5vSk0SPz5d/Mt0Mslv+DkBQWeEkl0
X-Received: by 2002:a1c:2bc6:: with SMTP id r189mr1552974wmr.183.1630566077394; 
 Thu, 02 Sep 2021 00:01:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjPO9+j1p/lKqPtGN0rof7wAaE3gOLxBrOL6tvfx4iDsgGjr5PR5vnT1yie2pRi8nThH0dNQ==
X-Received: by 2002:a1c:2bc6:: with SMTP id r189mr1552943wmr.183.1630566077058; 
 Thu, 02 Sep 2021 00:01:17 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x9sm730430wmi.30.2021.09.02.00.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:01:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/11] block/nvme: Only report VFIO error on failed retry
Date: Thu,  2 Sep 2021 09:00:25 +0200
Message-Id: <20210902070025.197072-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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


