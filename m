Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F11FB44A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:27:40 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCYt-0007ww-4b
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPN-0001YN-Sm; Tue, 16 Jun 2020 10:17:49 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPM-0006ZD-Cc; Tue, 16 Jun 2020 10:17:49 -0400
Received: by mail-ot1-x341.google.com with SMTP id n70so16043119ota.5;
 Tue, 16 Jun 2020 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R9xeBRc60+ORME3XWT914n4d4tIF833r1AL2yrH3GfE=;
 b=kBLc7qb9Bf8gIGE0trLD7hJLK+x7YDhzlNVA7Lmv8zVHGLZ3ui/0EyNPlSos6psLSE
 jD/S955GOvKyahhdk9L4WM7DG5FF8wWoZhy7FWLp1RFG9Hv2iHmJpqdBIUchwRLaFqIU
 hcyc+Lrd5gVo7q+Sggv2O6g65Z8pUUvZNOfpEKIpLvfkNnN5HoKAFe1JzNlGFEGEHGUM
 QrhwSSrtV3GCPyBDgVeHw3zAj4XK1KqY1FHIIDx0ghSsP6BKvBe+uX9HV/1NTXuhQ5Jz
 9NNEnJEVH1ELIFM7p6M2oe5hgdkEG0kqJZZ0+AJtpL83mpFf0mMTMuFHZ95g0Qm6SbEk
 01ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=R9xeBRc60+ORME3XWT914n4d4tIF833r1AL2yrH3GfE=;
 b=gm/01BDP4fDF+s6kvQWEkbVz9Aec6Nt+dCHd0aPEg12ZbV7rUeJXujoOcVN6H1eVJV
 ebrfuyIp8wzSOq1zBBTIR5LwnwMVX4Mfmcat+JBV32wad5StYWaZk1+1Rk8bnTllPXah
 b6W4GC54WtlCsTJyTWBrvRDtrBW/o8yQCL41wKWjIJU5vXLWk+h8HYe00HaZbP06ugg3
 DLfjXVavmnefdmpK8qorZIQUHku9wolmBJljyle7USsBABXWn/c9UwzWV8e8+QZW2paN
 hGgr93SaYbUOawZil9gomThgz9dFAZYoKOmHrLPRp3o8EB88YQfcWf6Gyx9+c2WrWbMG
 Tefg==
X-Gm-Message-State: AOAM533kWydafIqEBCAPDYI5eFf8uL6wbSHK2CgsUirMgcihgg3KuIYE
 hP/L46mTAWvpQ9Gged3rsspumOgV
X-Google-Smtp-Source: ABdhPJzawZm3yjs02HwVJxdnwrJ2S0f/Awx260571nMpMwTONpYUbauMbYQrMLmX6vYrM1MKt/Culg==
X-Received: by 2002:a9d:7457:: with SMTP id p23mr2518680otk.138.1592317066502; 
 Tue, 16 Jun 2020 07:17:46 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id a9sm2827543oon.38.2020.06.16.07.17.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:17:45 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/78] virtio: update queue size on guest write
Date: Tue, 16 Jun 2020 09:14:46 -0500
Message-Id: <20200616141547.24664-18-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

Some guests read back queue size after writing it.
Update the size immediatly upon write otherwise
they get confused.

In particular this is the case for seabios.

Reported-by: Roman Kagan <rkagan@virtuozzo.com>
Suggested-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit d0c5f643383b9e84316f148affff368ac33d75b9)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/virtio/virtio-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c6b47a9c73..e5c759e19e 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1256,6 +1256,8 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         break;
     case VIRTIO_PCI_COMMON_Q_SIZE:
         proxy->vqs[vdev->queue_sel].num = val;
+        virtio_queue_set_num(vdev, vdev->queue_sel,
+                             proxy->vqs[vdev->queue_sel].num);
         break;
     case VIRTIO_PCI_COMMON_Q_MSIX:
         msix_vector_unuse(&proxy->pci_dev,
-- 
2.17.1


