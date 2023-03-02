Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC56A7CB6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:32:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGP-0004eS-7w; Thu, 02 Mar 2023 03:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGB-00046Y-56
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG9-0002Oa-IC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v+fAaTMzaHbQ6OGyBux6MoCGU/rvRP9Pac7qwzuX0Kw=;
 b=YsNpN0TLxOR8+MWDbXMfzXBI1O1IG5l489/ifnkpDM16LhECw2icMpvEF2gV0ndepdJshj
 lgeplHH+voSasg4wyZptUsRogbwnXhSLmDpWLnovFpmfXwwE6RqGDrMCQsZnFl+4NkWlct
 86iNgx84zCVHdcIy4v/JWws0YDLtl9I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-mySM7merO2qtsbh4pIbazw-1; Thu, 02 Mar 2023 03:25:51 -0500
X-MC-Unique: mySM7merO2qtsbh4pIbazw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so916712wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+fAaTMzaHbQ6OGyBux6MoCGU/rvRP9Pac7qwzuX0Kw=;
 b=zE8hXyr+CR73dY42S5VeeVWHln8kz42j8q9ubCkzglj3DxAh71afsWtUV6SObXARyH
 t7pw/r0BPcZs57h3s3gcSJygJVEtRcYlqZSyrEYEG6hHr0fXr2E9/1qP4LHmp0UNWrNS
 Lf0u2IjbPbYsGoai076ILndZ6BpL2M1i3FHblZwWow62UxN/BIPBZ2/yGTiOjsnS1kOb
 pOtyGMYB0MdHuSUd4xlVDGSKJDaaEEWjPK6QbcaeZX7UmJFW9ZEMbAY7OyE+uKMzGHMI
 qXFWVl3e9d504sHQR1evgu9q2qn8nYB7Lh/c8PfEBK052JLQqpgRSzHcAimSrDxiWuEi
 Uvmg==
X-Gm-Message-State: AO0yUKXkLa9RkbtGqBzKCVeTbx/KgsDY10rwaE+9xT/sXME9kUCgJ5+R
 iTdEiAHHHJ4j2pfdy1jlZDt7Q7fTuQ7BrmPNCO2bn+BMVMqzaxXobDt1nBlzQ13S/lwfc2LqmuL
 tDqGWGzAEENC9zO3w+AnIWuenz8yd0RrbZOX1mfYCDk2mR/zRuoRzjTiyM7yjjCbkFQ==
X-Received: by 2002:a5d:4ed2:0:b0:2c7:f56:285b with SMTP id
 s18-20020a5d4ed2000000b002c70f56285bmr7656935wrv.63.1677745550182; 
 Thu, 02 Mar 2023 00:25:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8GyNYM+E6tNg8LkJ9An+cQfBKa6oiDPDq8DJUvHw7Pk+rnyd173vFsLj6+hYjovJbg9HorSg==
X-Received: by 2002:a5d:4ed2:0:b0:2c7:f56:285b with SMTP id
 s18-20020a5d4ed2000000b002c70f56285bmr7656922wrv.63.1677745549927; 
 Thu, 02 Mar 2023 00:25:49 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 iz12-20020a05600c554c00b003e1f2e43a1csm2109878wmb.48.2023.03.02.00.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:49 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 25/53] pci/shpc: refactor shpc_device_plug_common()
Message-ID: <20230302082343.560446-26-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Rename it to shpc_device_get_slot(), to mention what it does rather
than how it is used. It also helps to reuse it in further commit.

Also, add a return value and get rid of local_err.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-7-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 9f964b1d70..e7bc7192f1 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -496,8 +496,9 @@ static const MemoryRegionOps shpc_mmio_ops = {
         .max_access_size = 4,
     },
 };
-static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
-                                    SHPCDevice *shpc, Error **errp)
+
+static bool shpc_device_get_slot(PCIDevice *affected_dev, int *slot,
+                                 SHPCDevice *shpc, Error **errp)
 {
     int pci_slot = PCI_SLOT(affected_dev->devfn);
     *slot = SHPC_PCI_TO_IDX(pci_slot);
@@ -507,21 +508,20 @@ static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
                    "controller. Valid slots are between %d and %d.",
                    pci_slot, SHPC_IDX_TO_PCI(0),
                    SHPC_IDX_TO_PCI(shpc->nslots) - 1);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 void shpc_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                             Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
@@ -563,16 +563,13 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     uint8_t state;
     uint8_t led;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
-- 
MST


