Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3C33B23C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:09:21 +0100 (CET)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm2C-00068F-KX
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlt6-0000wx-5d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:00:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlsz-0005Rf-0K
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:59:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id j2so8524169wrx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=atQwveCaqHx8ObgqVNxXUl96cTn6loxRePCjXLUGL4A=;
 b=nAd/M76VtKq2Wdu3/ahK6YPQi31dtHOGKgxcSb6RHtmHXnE2kB6Uhj8cmgkUHzLMbV
 Fm4xKFrtAWcETA0QKguXaFwGN42ojq4x1D/JdOmi+ywF/119NJ3R38X4Cgc66TVYzSrs
 E3gEpyIH92nhyyIPS/HEmRlpYTDUvNzSiWCDVvd7b3vXog7gnRjXw/Rhxa3m9Snmqs3g
 +TkyHesKbg8ZrtxCQ8mAgc/Vb4T8g9nZ9g4l0AG0uf7ZNQlqxqHjPR9IdUq6VN+Ddv4E
 PKzowztUZH2aN6VPwzchzZRoEMtRKPGn/ne+BwznQ+c1aSKUq6YJ+bC1PmmyqtMl19Cz
 ytdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=atQwveCaqHx8ObgqVNxXUl96cTn6loxRePCjXLUGL4A=;
 b=Cz5GWWOf1g75mvk1xKEQBxprc9ez/JrmAMxqEdHGwwQaDckC4QMNs8LLog+251x1Z+
 vKEtKSfJQSGiKvnxhcoTAPn4GXIS+O3gJM3NXGMlmUZf8VQM/OISvwSStBI/pESDj5V3
 ocLDxX0xIHRy8BKUecK5GVLCiaLpOBAGbUHc0EuKZ6DWPD3jofQikgxACTzw0Q+vfJdt
 CJ8CrZxsHMul0H6k0b7ERByqTJZU5LlDqkn4aVGJ7oWFNK2aB4y+8AJFWuG5zQYflBDO
 ZcFPltB+tzVIaA+EMx4ThqsWjeK+td520Y73IR29WDLnQk8ouje4OSUKQr0bfDXmF9G+
 purg==
X-Gm-Message-State: AOAM5316f1UR7X5D2Wo2oQPcx7NzUqPD6kjCTufYB5B5EmKenWcQJ45B
 7oFAKcNVEa6l+YUmx2XGPK9aofQSYxedVQ==
X-Google-Smtp-Source: ABdhPJzz0Z4mOaTAeVPXrNLIhu3HFCMWxFAHzm6Gm6y2Nt4tyCwuAPH2tpJAh+Wc3R8zW5EoX8KYKA==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr20089342wrv.10.1615809586246; 
 Mon, 15 Mar 2021 04:59:46 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-176-30-57.red.bezeqint.net.
 [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id a6sm14060010wmm.0.2021.03.15.04.59.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Mar 2021 04:59:45 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH v2 1/2] virtio-pci: add check for vdev in virtio_pci_isr_read
Date: Mon, 15 Mar 2021 13:59:36 +0200
Message-Id: <20210315115937.14286-2-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315115937.14286-1-yuri.benditovich@daynix.com>
References: <20210315115937.14286-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://bugzilla.redhat.com/show_bug.cgi?id=1743098
This commit completes the solution of segfault in hot unplug flow
(by commit ccec7e9603f446fe75c6c563ba335c00cfda6a06).
Added missing check for vdev in virtio_pci_isr_read.
Typical stack of crash:
virtio_pci_isr_read ../hw/virtio/virtio-pci.c:1365 with proxy-vdev = 0
memory_region_read_accessor at ../softmmu/memory.c:442
access_with_adjusted_size at ../softmmu/memory.c:552
memory_region_dispatch_read1 at ../softmmu/memory.c:1420
memory_region_dispatch_read  at ../softmmu/memory.c:1449
flatview_read_continue at ../softmmu/physmem.c:2822
flatview_read at ../softmmu/physmem.c:2862
address_space_read_full at ../softmmu/physmem.c:2875

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 883045a223..4a3dcee771 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1364,9 +1364,14 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    uint64_t val = qatomic_xchg(&vdev->isr, 0);
-    pci_irq_deassert(&proxy->pci_dev);
+    uint64_t val;
+
+    if (vdev == NULL) {
+        return 0;
+    }
 
+    val = qatomic_xchg(&vdev->isr, 0);
+    pci_irq_deassert(&proxy->pci_dev);
     return val;
 }
 
-- 
2.17.1


