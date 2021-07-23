Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2A53D4136
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:59:58 +0200 (CEST)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71Kv-0002Pq-OA
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m71Jt-0001LE-If
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m71Jq-0001Os-He
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627070329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M21HEs2+wKWVDBeRSP0S+SbBwVj4R2HaqJi7xPG/Bxc=;
 b=Fb7H91MKi0Q3rpq2bfB7APYSB91ueotTZ99iESBMYiVjAfccvDiyxJZpGweM92zeX9FT4W
 M3uTh+qx6V63NCOjap1bcn3ePK4rsAQFdXGi/uWg+JriEx+bcz0y2OEFY9SerShdbaIv8P
 vEnV7U5ZqokJpW3ni5YqbMspC/bRigo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-2GqRCLwnM4utbBCB_CXmWA-1; Fri, 23 Jul 2021 15:58:46 -0400
X-MC-Unique: 2GqRCLwnM4utbBCB_CXmWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so1170577wmj.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M21HEs2+wKWVDBeRSP0S+SbBwVj4R2HaqJi7xPG/Bxc=;
 b=OiQVXba6njKIUMhBZ7RGfq0lpaswecA3fetIftNFw0HTlD9LjxoNj8VnP9NlsYgDqO
 qW5gqmkqhONWw2uquOLEUJu0m9cbH2YAxR8bSZdsLmmnJVZJ5e1Xqe81uIojrbCNcI1o
 IJE2m4lhEoahIPy+dJsrjgov0mygOFGedKMiGdN4Z823LtMflGGMNPuqcRJ13DKLIxfc
 YlensAtYANKb+Uk0sp/pD4On3TH3ktJ3lAzRcosSw5FHMy+ILZIdrX430+dowP5uVRVZ
 BD6Gn8amE7GFJunR9hPDyZG8ZF57IwGECId8mP9rw4DOOp0IorPMOJowcRW9sXp93UI5
 FpBA==
X-Gm-Message-State: AOAM533JZlZMeP+AxHHk3K+Y8EDteH2TwJsPNkjcPyZl29YBzWc43wz7
 B9MGMW3VrfRZcedIkT2Be0+SC7vByYh0WVV7ER4BrnmgtKuw1DPDAxvysWG0Uo2NPKn/+EmiL0k
 O/WPHdMVIJZk+yy2Tq/V3OwhD+WSdvsUHp1l9YUzu4Zf4gF83vxL7BiKZNMaSnWt3
X-Received: by 2002:a5d:608c:: with SMTP id w12mr7071485wrt.53.1627070325521; 
 Fri, 23 Jul 2021 12:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3T0yCH6T3c7QoLEFmdnbC8cj4lvLKKlLT9H+qCAu4ZsJKY8qcJuX6viE7D2lpjwA3TvMLGg==
X-Received: by 2002:a5d:608c:: with SMTP id w12mr7071456wrt.53.1627070325264; 
 Fri, 23 Jul 2021 12:58:45 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 u2sm27627257wmc.42.2021.07.23.12.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:58:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3] block/nvme: Fix VFIO_MAP_DMA failed: No space left
 on device
Date: Fri, 23 Jul 2021 21:58:43 +0200
Message-Id: <20210723195843.1032825-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the NVMe block driver was introduced (see commit bdd6a90a9e5,
January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
-ENOMEM in case of error. The driver was correctly handling the
error path to recycle its volatile IOVA mappings.

To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
DMA mappings per container", April 2019) added the -ENOSPC error to
signal the user exhausted the DMA mappings available for a container.

The block driver started to mis-behave:

  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
  (qemu)
  (qemu) info status
  VM status: paused (io-error)
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device

(The VM is not resumable from here, hence stuck.)

Fix by handling the new -ENOSPC error (when DMA mappings are
exhausted) without any distinction to the current -ENOMEM error,
so we don't change the behavior on old kernels where the CVE-2019-3882
fix is not present.

An easy way to reproduce this bug is to restrict the DMA mapping
limit (65535 by default) when loading the VFIO IOMMU module:

  # modprobe vfio_iommu_type1 dma_entry_limit=666

Cc: qemu-stable@nongnu.org
Cc: Fam Zheng <fam@euphon.net>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Reported-by: Michal Prívozník <mprivozn@redhat.com>
Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Reworded (Fam)
v2: KISS checking both errors undistinguishedly (Maxim)
---
 block/nvme.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa6..e8dbbc23177 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1030,7 +1030,29 @@ try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
                               len, true, &iova);
+        if (r == -ENOSPC) {
+            /*
+             * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
+             * ioctl returns -ENOSPC to signal the user exhausted the DMA
+             * mappings available for a container since Linux kernel commit
+             * 492855939bdb ("vfio/type1: Limit DMA mappings per container",
+             * April 2019, see CVE-2019-3882).
+             *
+             * This block driver already handles this error path by checking
+             * for the -ENOMEM error, so we directly replace -ENOSPC by
+             * -ENOMEM. Beside, -ENOSPC has a specific meaning for blockdev
+             * coroutines: it triggers BLOCKDEV_ON_ERROR_ENOSPC and
+             * BLOCK_ERROR_ACTION_STOP which stops the VM, asking the operator
+             * to add more storage to the blockdev. Not something we can do
+             * easily with an IOMMU :)
+             */
+            r = -ENOMEM;
+        }
         if (r == -ENOMEM && retry) {
+            /*
+             * We exhausted the DMA mappings available for our container:
+             * recycle the volatile IOVA mappings.
+             */
             retry = false;
             trace_nvme_dma_flush_queue_wait(s);
             if (s->dma_map_count) {
-- 
2.31.1


