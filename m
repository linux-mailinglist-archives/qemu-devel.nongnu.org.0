Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0EC6D0BD3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:51:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvTQ-0006X0-Is; Thu, 30 Mar 2023 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1phvTO-0006WX-Hs
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:50:02 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1phvTM-0007gL-9y
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:50:02 -0400
Received: by mail-lf1-x133.google.com with SMTP id c9so14912491lfb.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680194998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fkoPed+jwbHlx1UYMxQsLLf/bPeWL9y2mCr9gwPd7bM=;
 b=SQd0nLNY1sJdyMvGPE5tOp4QOJSZm3XdP2DbUMbhupbwPLZssUsyclDlNiCKMWa+i2
 gMEiB9wGdAkamFT7mfJRjZ9IYkXm6omEo4mj9ozHjEk/AMw6cCEVIjqm2ccK1N0CZ/WU
 hFxgv6bAiB+MXLh9rQ6V4W2wTt6i4c8wWUMYcOtIlNQma36hvkAxDp7n4sYfKfzWhwuu
 1za1fJn2xzfiwtBEJo6fJtu4bbCe+vYp4z2hDeDOf5rDYaQvUbE95MoH1jCUcMcrR4Ut
 cqBCu2jjwQPfEbRSqbr3JZEJhUirN5yZdgl9AkiNik2AeC5Xcrn4HrfV4Bo/C74qzwzj
 GGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680194998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkoPed+jwbHlx1UYMxQsLLf/bPeWL9y2mCr9gwPd7bM=;
 b=VZ2sGUJs9IoF9x43phZ74T7GD9GUaY/VGiOgnZnGbn/2Ye+ey6SpI/pp+R3SKFkXXQ
 I/IqS830Sg0d1sEtzQfd0TOCCZbs+nMppd+TQR3GCDRj6FgYvfZkczg0PIo2gDe6dSvX
 ZR+28gxsviAIzrao0t8V49HJQCFUAz6NwE8tPKS1Ra3r4RqAZV5WHFMmNDoKCmuqLYT/
 x5yl1KITFN5QnaPzaIdmnOKzbofrBSw5Kft/Olv0NzqGA0VRMPnb/C3mdxD2Y/1qPpHV
 WA+8SK0Kz9DLRyApI+PV+Lnqwc5IEenJfwgwmJ5G2M+T3TJImJc9Kh2LTc0Z4oVOHNCV
 DQJg==
X-Gm-Message-State: AAQBX9cHKvMNbCo2Z5gHBK4PMQYZ69xboAC/plGoG9qVGaiF3ez1tLmC
 MBWINmL6EGmCClALC7PBiQ31/A==
X-Google-Smtp-Source: AKy350an/dkEIt0Y1p52cLSIlmXYPMZLdJsWCgIrzhin6K4fWCuzs3HwISA9PuMpzDDqOKHcXqnQEw==
X-Received: by 2002:ac2:4ac7:0:b0:4ea:f7aa:e778 with SMTP id
 m7-20020ac24ac7000000b004eaf7aae778mr2303368lfp.24.1680194997769; 
 Thu, 30 Mar 2023 09:49:57 -0700 (PDT)
Received: from vp-pc.. ([109.252.113.252]) by smtp.gmail.com with ESMTPSA id
 w7-20020ac25987000000b004d5786b7299sm13339lfn.5.2023.03.30.09.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:49:57 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH] vhost: enable IOMMU_NOTIFIER_UNMAP events handling when
 device-iotlb=on
Date: Thu, 30 Mar 2023 19:49:44 +0300
Message-Id: <20230330164944.75481-1-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Even if Device-TLB and PCI ATS is enabled, the guest can reject to use
it. For example, this situation appears when Windows Server 2022 is
running with intel-iommu with device-iotlb=on and virtio-net-pci with
vhost=on. The guest implies that no address translation info cached in
device IOTLB and doesn't send device IOTLB invalidation commands. So,
it leads to irrelevant address translations in vhost-net in the host
kernel. Therefore network frames from the guest in host tap interface
contains wrong payload data.

This patch enables IOTLB unmap events (IOMMU_NOTIFIER_UNMAP) along with
Device-TLB unmap events (IOMMU_NOTIFIER_DEVIOTLB_UNMAP) handling for
proper vhost IOTLB unmapping when the guest isn't aware of Device-TLB.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001312
Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---

 Tested on Windows Server 2022 and Fedora guests with
 -device virtio-net-pci,bus=pci.3,netdev=nd0,iommu_platform=on,ats=on
 -netdev tap,id=nd0,ifname=tap1,script=no,downscript=no,vhost=on
 -device intel-iommu,intremap=on,eim=on,device-iotlb=on/off

 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a266396576..968ca18fce 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -796,7 +796,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
     iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
+                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP | IOMMU_NOTIFIER_UNMAP,
                         section->offset_within_region,
                         int128_get64(end),
                         iommu_idx);
-- 
2.35.1


