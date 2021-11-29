Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC1461716
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:54:20 +0100 (CET)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh6p-0005vt-Ps
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:54:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3w-0003Zj-53
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh3u-000302-5F
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+0pbbrfn/qHP6LtjNcDnY9pfhSUSvMOuMXSePsEHYw=;
 b=E+tL9oZzzJBw6uGY/AKFjmKwWuWo3KzKYPCPfOYCeyow0d9UYqMrshF0Zkfvhi58Dfbpfh
 l5ymny89kNy1OmAQaxjdn3wVFN2ynzAq1zEg7CMWQBObqyJatUCyXbklHKqWATEv/XPivP
 fumlyuofQUuc08yiOo0M3AJfn+umNxs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-rF3B4Fl9Od6b2ulZPVsyFQ-1; Mon, 29 Nov 2021 08:51:15 -0500
X-MC-Unique: rF3B4Fl9Od6b2ulZPVsyFQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso13789775edq.19
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3+0pbbrfn/qHP6LtjNcDnY9pfhSUSvMOuMXSePsEHYw=;
 b=TKMDJ5Up7FhedOv2H1YP9m+NifUtQgoQcxiQSPBqDd9Kx/a5znaRciGPoAXZN8IDwF
 NV4OXBgOOaP4hrhkbRxQ/RTlgEp1nwFybkzIvvfp8gMLMIXFYJ2ky1Z7/rTIcykG3Sf9
 fyWKZEmKXQK6TYWNYNmRqthK3qazVkhzF07D5iaRG1xjcG91P4/+JCkrMMCVHAPKzvUb
 C2c8aUTbxSCCqQwDsnwraM0508D6HfVdPPVf+YFfbJikeCzVF0+a5xcJWnjE2zvs57mc
 FkfQfZedujOMBHoqUqAXfgg2Vl+lM6u2OW9rYKZ9C6CQzyumxPBFBEToi4l1pl6ZGbtn
 jnzQ==
X-Gm-Message-State: AOAM533n3nJzoiiZ/Pp+Z1TKFURKxDQA6RrhDEDAS0aqwZxwQrYDvc27
 Ic9gYTCEHb2d7nLQPQRAyUB1563DfmLSQ6ANjAZyKGHw0TfYu2/kUmrBv0tbsWYvzEXh8EJxPVX
 krzjinpuSt2cxSjfsdz7SksDUfwkfRTHfQIu+MJXMrTiIno3m16P53dwHDG2Z
X-Received: by 2002:a17:906:3489:: with SMTP id
 g9mr59592346ejb.17.1638193874060; 
 Mon, 29 Nov 2021 05:51:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwJjnv3O9nK66U5zWe5mk1oLVT+sbVu4rtH+IKUyCAE4SN6RdbapFGZwLJzJv781ZtLR4lCg==
X-Received: by 2002:a17:906:3489:: with SMTP id
 g9mr59592318ejb.17.1638193873849; 
 Mon, 29 Nov 2021 05:51:13 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id hx21sm7389570ejc.85.2021.11.29.05.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:13 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] failover: fix unplug pending detection
Message-ID: <20211129135053.560225-3-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Failover needs to detect the end of the PCI unplug to start migration
after the VFIO card has been unplugged.

To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
pcie_unplug_device().

But since
    17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
we have switched to ACPI unplug and these functions are not called anymore
and the flag not set. So failover migration is not able to detect if card
is really unplugged and acts as it's done as soon as it's started. So it
doesn't wait the end of the unplug to start the migration. We don't see any
problem when we test that because ACPI unplug is faster than PCIe native
hotplug and when the migration really starts the unplug operation is
already done.

See c000a9bd06ea ("pci: mark device having guest unplug request pending")
    a99c4da9fc2a ("pci: mark devices partially unplugged")

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211118133225.324937-4-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f610a25d2e..30405b5113 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
         PCIDevice *dev = PCI_DEVICE(qdev);
         if (PCI_SLOT(dev->devfn) == slot) {
             if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
-                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
-                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
-                object_unparent(OBJECT(qdev));
+                /*
+                 * partially_hotplugged is used by virtio-net failover:
+                 * failover has asked the guest OS to unplug the device
+                 * but we need to keep some references to the device
+                 * to be able to plug it back in case of failure so
+                 * we don't execute hotplug_handler_unplug().
+                 */
+                if (dev->partially_hotplugged) {
+                    /*
+                     * pending_deleted_event is set to true when
+                     * virtio-net failover asks to unplug the device,
+                     * and set to false here when the operation is done
+                     * This is used by the migration loop to detect the
+                     * end of the operation and really start the migration.
+                     */
+                    qdev->pending_deleted_event = false;
+                } else {
+                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
+                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
+                    object_unparent(OBJECT(qdev));
+                }
             }
         }
     }
@@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    /*
+     * pending_deleted_event is used by virtio-net failover to detect the
+     * end of the unplug operation, the flag is set to false in
+     * acpi_pcihp_eject_slot() when the operation is completed.
+     */
+    pdev->qdev.pending_deleted_event = true;
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
-- 
MST


