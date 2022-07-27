Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D2582AEA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:25:45 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjqx-0005M8-GI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjgh-0005Wm-Fo
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:15:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjgd-0004QM-RW
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658938502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4Gy6twBITKIdrKf74OZpMa18dkKqibzh1uKvqRaDJiE=;
 b=SsPDyLKz2qOdZZUpXUcnojThh+DzC7qO7eCu6AgG83YtaL0+YZTFzsB6Keb6q6rTuoD+sw
 YizFpzFIsUA0fHET9t1cOcgXL8FYJ3tw4pu5H4cSvlc73h3RWQbwe+sjcvIm3PeLOv6yag
 RaQ+x7WNZpBk29gf5RoXAKSDnqzyDxY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-chl70IdyOTa-nLfjPLAprw-1; Wed, 27 Jul 2022 12:15:01 -0400
X-MC-Unique: chl70IdyOTa-nLfjPLAprw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o8-20020adfa108000000b0021e903fb612so1867656wro.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 09:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=4Gy6twBITKIdrKf74OZpMa18dkKqibzh1uKvqRaDJiE=;
 b=go55friT0n1OHQsP7dU/0+LChgnuu2m7e5KVP19g4WbQXkT4T8PnNQD5Wsp/MpVQ1b
 R9J3UX1Z79Sl0pLilD9CXAbBwHNjXeg42h2+BYpXOlx8ODa7mELgkDW6xdOZOwPaF5Xc
 NOZZzzNXWSnoOK54O5yWmIDtXVWQPchxoJE/CLB6RCNtcNs93Jv7zyOwsNhlpqPB+PSU
 z1q74a4HOESdYcAAbDsu6frxzyS+VsXfw+j+0P/JzIuiKYeqX1+OQL2F+MabqZ+jkwBV
 F0303KUZwuRuy7Ah068ocRsteAtLBD1jX1D/Jdm2sh386uQw0S6ihS85wk8BLadFIisk
 uIpA==
X-Gm-Message-State: AJIora9II1KoxXcKKZgF4g3aeegH4uFUTpx37Uh6tsGVKgKks2fvJ64r
 1Bi+GWUOvT2o1NoJKNqtOQhJd/vr6CZ335693JbCuZqXJshIR1g7w7uxw6cTw7+7/QPnNHJolOS
 odFofmj7IbQyom27EzkvbD6DYndOaG1PAR99arlDPUDOFCxnJnMuLYMX0ec+t
X-Received: by 2002:a05:6000:18af:b0:21d:93a5:2d2 with SMTP id
 b15-20020a05600018af00b0021d93a502d2mr14486332wri.301.1658938499638; 
 Wed, 27 Jul 2022 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vsbsk8XH4Y7BIkURbYq1kTdo4nbaqN7gzcJ++6ci0g7vlEoNHoM5Z4rMuENkHktl1bo8xKtA==
X-Received: by 2002:a05:6000:18af:b0:21d:93a5:2d2 with SMTP id
 b15-20020a05600018af00b0021d93a502d2mr14486319wri.301.1658938499377; 
 Wed, 27 Jul 2022 09:14:59 -0700 (PDT)
Received: from redhat.com ([2.52.132.243]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c034f00b003a325bd8517sm3157145wmd.5.2022.07.27.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 09:14:58 -0700 (PDT)
Date: Wed, 27 Jul 2022 12:14:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>
Subject: [PATCH] virtio-pci: don't touch pci on virtio reset
Message-ID: <20220727161445.21428-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio level reset should not affect pci express
registers such as PM, error or link.

Fixes: 27ce0f3afc ("hw/virtio: fix Power Management Control Register for PCI Express virtio devices")
Fixes: d584f1b9ca ("hw/virtio: fix Link Control Register for PCI Express virtio devices")
Fixes: c2cabb3422 ("hw/virtio: fix error enabling flags in Device Control register")
Cc: "Marcel Apfelbaum" <marcel@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..3189ec014d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1955,6 +1955,13 @@ static void virtio_pci_reset(DeviceState *qdev)
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
     }
+}
+
+static void virtio_pci_bus_reset(DeviceState *qdev)
+{
+    PCIDevice *dev = PCI_DEVICE(qdev);
+
+    virtio_pci_reset(qdev);
 
     if (pci_is_express(dev)) {
         pcie_cap_deverr_reset(dev);
@@ -2022,7 +2029,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_reset;
+    dc->reset = virtio_pci_bus_reset;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
MST


