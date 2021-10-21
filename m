Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1A436C59
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:52:56 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdf3X-0001Ta-Hj
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mdf27-0000mw-TO
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mdf22-0004HX-UO
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634849480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvg1+vzYkQgTUtitqr7oiGoswR+A/SAGJgS7pwx+Rd0=;
 b=Hoj2diTYw9qe4/VQ/p6p6L4UePN8H2JrOl5yJCVMEotvr1b937f5OV/os4X+gI4jww93ph
 B0HChhPGTRqyqF7p33WmmWTpsYEil1z590Sqi6L6DXzcc+M/eV2X20x7LHyKOg8P2CSJqq
 0irAF0PqyEBDW/RqWwu4X4BhAb5Kfuo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-7tIBARn6NjKwHtScUAzmUA-1; Thu, 21 Oct 2021 16:51:18 -0400
X-MC-Unique: 7tIBARn6NjKwHtScUAzmUA-1
Received: by mail-ot1-f69.google.com with SMTP id
 b7-20020a0568301de700b0054e351e751aso827152otj.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 13:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvg1+vzYkQgTUtitqr7oiGoswR+A/SAGJgS7pwx+Rd0=;
 b=vcKGoAXNFfRR0Iw/opN3F2DXKUYOm33dd76iHeTWkpmzO3vUpo8fV6DLDah35vG57p
 uOSc6uScacbZfVLOFst73t0Y/UHphsHR1BO2gtkc6DaIrD5br35v+VEg29VvyfoC79W0
 1W4xARcl3yT6YGzo3tGOZFncS2GltGyMCMZomQFc5dkihAz94+c/Qov7tGcRuYc7CKnf
 c0U7GeERwpL6VSUcVcnYMO8rFf5NekxoajoxGoU2Pbx4TxUT+2PIadgKrVRvwWiWROMo
 ojj8zdBv3dbjCYIwnrQ8QrZXCI03sP/XIftN1RQiZG1/pnUZvNz1bbqHAAkStfHvuMtZ
 P/jg==
X-Gm-Message-State: AOAM5333GntInHexqnpxhv7D6zaHQ4hRouI/Bu1lS9Z87ekfYQxLZEIX
 UNCHs9a5FX0WpgyK7SqykPBzC8Kf+rON1MMX5ZMZMf4EuTy5lpy3GnbJtN6bPnLdLDbH7MVlcM1
 ZGpd4XU7yJgiVoWc=
X-Received: by 2002:a05:6830:2b06:: with SMTP id
 l6mr6792150otv.333.1634849477496; 
 Thu, 21 Oct 2021 13:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB5O+8LzVMgP4yQ2Cv1JjSuvhL4/tKWEBXw2P9Ec914rbb5mbX80Wba7nAtc18ARIR0Lj08g==
X-Received: by 2002:a05:6830:2b06:: with SMTP id
 l6mr6792118otv.333.1634849477134; 
 Thu, 21 Oct 2021 13:51:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id m7sm1436313oiw.49.2021.10.21.13.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 13:51:16 -0700 (PDT)
Date: Thu, 21 Oct 2021 14:51:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v4 6/6] vfio: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <20211021145114.3fc4436e.alex.williamson@redhat.com>
In-Reply-To: <20211014004852.1293-7-longpeng2@huawei.com>
References: <20211014004852.1293-1-longpeng2@huawei.com>
 <20211014004852.1293-7-longpeng2@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pbonzini@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021 08:48:52 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> In migration resume phase, all unmasked msix vectors need to be
> setup when loading the VF state. However, the setup operation would
> take longer if the VM has more VFs and each VF has more unmasked
> vectors.
> 
> The hot spot is kvm_irqchip_commit_routes, it'll scan and update
> all irqfds that are already assigned each invocation, so more
> vectors means need more time to process them.
> 
> vfio_pci_load_config
>   vfio_msix_enable
>     msix_set_vector_notifiers
>       for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>         vfio_msix_vector_do_use
>           vfio_add_kvm_msi_virq
>             kvm_irqchip_commit_routes <-- expensive
>       }
> 
> We can reduce the cost by only committing once outside the loop.
> The routes are cached in kvm_state, we commit them first and then
> bind irqfd for each vector.
> 
> The test VM has 128 vcpus and 8 VF (each one has 65 vectors),
> we measure the cost of the vfio_msix_enable for each VF, and
> we can see 90+% costs can be reduce.
> 
> VF      Count of irqfds[*]  Original        With this patch
> 
> 1st           65            8               2
> 2nd           130           15              2
> 3rd           195           22              2
> 4th           260           24              3
> 5th           325           36              2
> 6th           390           44              3
> 7th           455           51              3
> 8th           520           58              4
> Total                       258ms           21ms
> 
> [*] Count of irqfds
> How many irqfds that already assigned and need to process in this
> round.
> 
> The optimization can be applied to msi type too.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++------------
>  hw/vfio/pci.h |   1 +
>  2 files changed, 105 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 0bd832b..dca2d0c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -413,8 +413,6 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>                                    int vector_n, bool msix)
>  {
> -    int virq;
> -
>      if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
>          return;
>      }
> @@ -423,20 +421,31 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
> -    if (virq < 0) {
> +    vector->virq = kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n,
> +                                                      &vdev->pdev);
> +    if (vector->virq < 0) {
>          event_notifier_cleanup(&vector->kvm_interrupt);
> +        vector->virq = -1;

Nit, it seems like all negative values are equivalent here, I don't
think we need to explicitly set virq to -1 given that it's already < 0.

> +        return;
> +    }
> +
> +    if (vdev->defer_kvm_irq_routing) {
> +        /*
> +         * The vector->virq will be reset to -1 if we fail to add the
> +         * corresponding irqfd in vfio_commit_kvm_msi_virq_batch().
> +         */
>          return;
>      }
>  
> +    kvm_irqchip_commit_routes(kvm_state);
> +
>      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
> -                                       NULL, virq) < 0) {
> -        kvm_irqchip_release_virq(kvm_state, virq);
> +                                           NULL, vector->virq) < 0) {
> +        kvm_irqchip_release_virq(kvm_state, vector->virq);
>          event_notifier_cleanup(&vector->kvm_interrupt);
> +        vector->virq = -1;
>          return;
>      }
> -
> -    vector->virq = virq;
>  }
>  
>  static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
> @@ -501,11 +510,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>       * increase them as needed.
>       */
>      if (vdev->nr_vectors < nr + 1) {
> -        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
>          vdev->nr_vectors = nr + 1;
> -        ret = vfio_enable_vectors(vdev, true);
> -        if (ret) {
> -            error_report("vfio: failed to enable vectors, %d", ret);
> +        if (!vdev->defer_kvm_irq_routing) {
> +            vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
> +            ret = vfio_enable_vectors(vdev, true);
> +            if (ret) {
> +                error_report("vfio: failed to enable vectors, %d", ret);
> +            }
>          }
>      } else {
>          Error *err = NULL;
> @@ -567,6 +578,46 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>      }
>  }
>  
> +static void vfio_prepare_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
> +{
> +    assert(!vdev->defer_kvm_irq_routing);
> +    vdev->defer_kvm_irq_routing = true;
> +}
> +
> +static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
> +{
> +    VFIOMSIVector *vector;
> +    int i;
> +
> +    if (!vdev->defer_kvm_irq_routing) {
> +        return;
> +    }
> +
> +    vdev->defer_kvm_irq_routing = false;
> +
> +    if (!vdev->nr_vectors) {
> +        return;
> +    }
> +
> +    kvm_irqchip_commit_routes(kvm_state);
> +
> +    for (i = 0; i < vdev->nr_vectors; i++) {
> +        vector = &vdev->msi_vectors[i];
> +
> +        if (!vector->use || vector->virq < 0) {
> +            continue;
> +        }
> +
> +        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> +                                               &vector->kvm_interrupt,
> +                                               NULL, vector->virq) < 0) {
> +            kvm_irqchip_release_virq(kvm_state, vector->virq);
> +            event_notifier_cleanup(&vector->kvm_interrupt);
> +            vector->virq = -1;
> +        }

I started trying to get rid of this code that largely duplicates the
error case of vfio_add_kvm_msi_virq() and questioned why we setup the
notifier separate from connecting it to the irqfd.  If we setup the
notifier and irqfd in the same function we can clean things up a bit
more and confine the deferred state tests in the vector-use code.  I
think we can also assert if we have an unmatched batch commit call and
we probably don't need to test both that a vector is in use and has a
virq, one should not be true without the other.

Does this look like an improvement to you and would you like to roll it
into this patch?  Thanks,

Alex

 pci.c |   58 ++++++++++++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

commit 6fb9336e3fe9e3775b0a0e7aadaff781fb52c0e7
Author: Alex Williamson <alex.williamson@redhat.com>
Date:   Thu Oct 21 13:35:12 2021 -0600

    cleanup

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1792c30049da..5b3a86dd5292 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -417,35 +417,33 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
-        return;
-    }
-
     vector->virq = kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n,
                                                       &vdev->pdev);
+}
+
+static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector)
+{
     if (vector->virq < 0) {
-        event_notifier_cleanup(&vector->kvm_interrupt);
-        vector->virq = -1;
         return;
     }
 
-    if (vdev->defer_kvm_irq_routing) {
-        /*
-         * The vector->virq will be reset to -1 if we fail to add the
-         * corresponding irqfd in vfio_commit_kvm_msi_virq_batch().
-         */
-        return;
+    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+        goto fail_notifier;
     }
 
-    kvm_irqchip_commit_routes(kvm_state);
-
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                            NULL, vector->virq) < 0) {
-        kvm_irqchip_release_virq(kvm_state, vector->virq);
-        event_notifier_cleanup(&vector->kvm_interrupt);
-        vector->virq = -1;
-        return;
+        goto fail_kvm;
     }
+
+    return;
+
+fail_kvm:
+    event_notifier_cleanup(&vector->kvm_interrupt);
+fail_notifier:
+    kvm_irqchip_release_virq(kvm_state, vector->virq);
+    vector->virq = -1;
+    return;
 }
 
 static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
@@ -501,6 +499,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     } else {
         if (msg) {
             vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            if (!vdev->defer_kvm_irq_routing) {
+                kvm_irqchip_commit_routes(kvm_state);
+                vfio_connect_kvm_msi_virq(vector);
+            }
         }
     }
 
@@ -586,13 +588,9 @@ static void vfio_prepare_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
 
 static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
 {
-    VFIOMSIVector *vector;
     int i;
 
-    if (!vdev->defer_kvm_irq_routing) {
-        return;
-    }
-
+    assert(vdev->defer_kvm_irq_routing);
     vdev->defer_kvm_irq_routing = false;
 
     if (!vdev->nr_vectors) {
@@ -602,19 +600,7 @@ static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
     kvm_irqchip_commit_routes(kvm_state);
 
     for (i = 0; i < vdev->nr_vectors; i++) {
-        vector = &vdev->msi_vectors[i];
-
-        if (!vector->use || vector->virq < 0) {
-            continue;
-        }
-
-        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
-                                               &vector->kvm_interrupt,
-                                               NULL, vector->virq) < 0) {
-            kvm_irqchip_release_virq(kvm_state, vector->virq);
-            event_notifier_cleanup(&vector->kvm_interrupt);
-            vector->virq = -1;
-        }
+        vfio_connect_kvm_msi_virq(&vdev->msi_vectors[i]);
     }
 }
 


