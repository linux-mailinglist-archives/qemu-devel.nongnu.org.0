Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD53EF388
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:27:44 +0200 (CEST)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5gU-0007f9-Q7
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mG5fN-0006wu-7o
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mG5fJ-0006wY-UE
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629231989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FP9pLcWWWKCQEp/WpEbDM4n4pq3r+eS+DlfCPFMBqdo=;
 b=MpRpuBuHMjEbEgL3yY7p97rLHAgj9jtRNMiQ99BZLN2L20QuMRmUQSi2Wgbqvar3zjYqWf
 fJ5qGZNxtCmlYBdbBzDmAPiCpa4PRJ8VFc6Yxr/ZzWYt59+QDr32LEFzTJVPZs4nnGDCUu
 VAfZ4RWcS4PBKg85VKUQ+NyySFcS1S4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-2ONRcCx7PxaFr1NUtBRvJA-1; Tue, 17 Aug 2021 16:26:27 -0400
X-MC-Unique: 2ONRcCx7PxaFr1NUtBRvJA-1
Received: by mail-oi1-f197.google.com with SMTP id
 w16-20020a0568081410b029025c350a89fdso307606oiv.11
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FP9pLcWWWKCQEp/WpEbDM4n4pq3r+eS+DlfCPFMBqdo=;
 b=oJUpwgX2OD6R44eFfvQIOpL4/avqwdwheHunzI3hLjgtFMTFB+UddIOZ6oZZrtGiKX
 lvmD3wGiw5p12TF6Vn0veBZfA92DYwQCp7C4+ZuCG7/58wis8TSRQrY+9U/qEiBmcsdW
 RxSb5cBnAfDlJUDvGKVYj+jqjhEBPr2WUdFOwqpM5YDx3alaHJYO8Y0EUz4h8hNnfIok
 in8KvOnwYX1ibqT3mrGw0ilJnD5w750lyQm4dzXXV3MeICXC7uiO/10H3Yqt3C/XEJ8r
 kR49tIagqOfQdbTk5khZlY4SFcK1DCb7Vi/DjMWd3HCIl6Ysygco7NKX75nKdy1bGLxT
 sA8Q==
X-Gm-Message-State: AOAM530lrc7fSVx5WrOgJbuirFUWnJhQa29h5qRdWCGPVUUV9hJ0E0d9
 MWh8uz4mscvyYR76jCd8nnnaBGtQXDwGPpSPA/jzO6AylYagYBSbXo8XRf0YiaaUwpx5VKXg2kV
 kFt0dFWc/noSliZU=
X-Received: by 2002:a05:6830:15ce:: with SMTP id
 j14mr4014775otr.310.1629231986643; 
 Tue, 17 Aug 2021 13:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp04UnvD5D+XVK45rFEFCRu8D2l7QNOzi7ppBNJKmXxNzRrbGUErfInMpigukWEUIxtoL+FQ==
X-Received: by 2002:a05:6830:15ce:: with SMTP id
 j14mr4014761otr.310.1629231986389; 
 Tue, 17 Aug 2021 13:26:26 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id bg9sm706416oib.26.2021.08.17.13.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:26:25 -0700 (PDT)
Date: Tue, 17 Aug 2021 14:26:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC] vfio/migration: reduce the msix virq setup cost in resume
 phase
Message-ID: <20210817142624.6b31c2da.alex.williamson@redhat.com>
In-Reply-To: <20210813040614.1764-1-longpeng2@huawei.com>
References: <20210813040614.1764-1-longpeng2@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwankhede@nvidia.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 12:06:14 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> In migration resume phase, all unmasked msix vectors need to be
> setup when load the VF state. However, the setup operation would
> takes longer if the VF has more unmasked vectors.
> 
> In our case, the VF has 65 vectors and each one spend 0.8ms on
> setup operation (vfio_add_kvm_msi_virq -> kvm_irqchip_commit_routes),
> the total cost of the VF is more than 40ms. Even worse, the VM has
> 8 VFs, so the downtime increase more than 320ms.
> 
> vfio_pci_load_config
>   vfio_msix_enable
>     msix_set_vector_notifiers
>       for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>         vfio_msix_vector_do_use
>           vfio_add_kvm_msi_virq
>             kvm_irqchip_commit_routes <-- 0.8ms
>       }
> 
> Originaly, We tried to batch all routes and just commit once
> outside the loop, but it's not easy to fallback to qemu interrupt
> if someone fails.

I'm not sure I follow here, once we setup the virq, what's the failure
path?  kvm_irqchip_commit_routes() returns void.  Were you looking at
adding a "defer" arg to kvm_irqchip_add_msi_route() that skips the
commit, which vfio_add_kvm_msi_virq() might set based on the migration
state and vfio_pci_load_config() could then trigger the commit?
There's more overhead that can be removed if VFIO_DEVICE_SET_IRQS could
be called once rather than per vector.

> So this patch trys to defer the KVM interrupt setup, the unmasked
> vector will use qemu interrupt as default and switch to kvm interrupt
> once it fires.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  hw/vfio/pci.h |  2 ++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e1ea1d8..dd35170 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -47,6 +47,8 @@
>  
>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> +static void vfio_add_kvm_msix_virq(VFIOPCIDevice *vdev,
> +                                   VFIOMSIVector *vector, int nr);
>  
>  /*
>   * Disabling BAR mmaping can be slow, but toggling it around INTx can
> @@ -347,6 +349,11 @@ static void vfio_msi_interrupt(void *opaque)
>          get_msg = msix_get_message;
>          notify = msix_notify;
>  
> +        if (unlikely(vector->need_switch)) {
> +            vfio_add_kvm_msix_virq(vdev, vector, nr);
> +            vector->need_switch = false;
> +        }
> +

A better name might be "vector->kvm_routing_deferred".  Essentially this
is just a lazy setup of KVM routes, we could always do this, or we could
do this based on a device options.  I wonder if there are any affinity
benefits in the VM to defer the KVM route.

>          /* A masked vector firing needs to use the PBA, enable it */
>          if (msix_is_masked(&vdev->pdev, nr)) {
>              set_bit(nr, vdev->msix->pending);
> @@ -438,6 +445,25 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>      vector->virq = virq;
>  }
>  
> +static void
> +vfio_add_kvm_msix_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector, int nr)
> +{
> +    Error *err = NULL;
> +    int fd;
> +
> +    vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> +    if (vector->virq < 0) {
> +        return;
> +    }
> +
> +    fd = event_notifier_get_fd(&vector->kvm_interrupt);
> +    if (vfio_set_irq_signaling(&vdev->vbasedev,
> +                               VFIO_PCI_MSIX_IRQ_INDEX, nr,
> +                               VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
> +        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> +    }
> +}
> +
>  static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
>  {
>      kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
> @@ -490,7 +516,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>          }
>      } else {
>          if (msg) {
> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> +            if (unlikely(vdev->defer_set_virq)) {

Likewise this could be "vdev->defer_kvm_irq_routing" and we could apply
it to all IRQ types.

> +                vector->need_switch = true;
> +            } else {
> +                vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> +            }
>          }
>      }
>  
> @@ -566,6 +596,11 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>      }
>  }
>  
> +static void inline vfio_msix_defer_set_virq(VFIOPCIDevice *vdev, bool defer)
> +{
> +    vdev->defer_set_virq = defer;
> +}

A helper function seems excessive.

> +
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
>      PCIDevice *pdev = &vdev->pdev;
> @@ -2466,7 +2501,9 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>      if (msi_enabled(pdev)) {
>          vfio_msi_enable(vdev);
>      } else if (msix_enabled(pdev)) {
> +        vfio_msix_defer_set_virq(vdev, true);
>          vfio_msix_enable(vdev);
> +        vfio_msix_defer_set_virq(vdev, false);

This is the algorithm you want for 65+ vectors, but is this the
algorithm we want for 2 vectors?  Who should define that policy?
We should at least make lazy KVM routing setup a device option to be
able to test it outside of a migration, but should it be enabled by
default?  Would anyone mind too much if there was some additional
latency of each initial vector triggering?  Thanks,

Alex

>      }
>  
>      return ret;
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 6477751..846ae85 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -95,6 +95,7 @@ typedef struct VFIOMSIVector {
>      struct VFIOPCIDevice *vdev; /* back pointer to device */
>      int virq;
>      bool use;
> +    bool need_switch; /* switch to kvm interrupt ? */
>  } VFIOMSIVector;
>  
>  enum {
> @@ -171,6 +172,7 @@ struct VFIOPCIDevice {
>      bool no_kvm_ioeventfd;
>      bool no_vfio_ioeventfd;
>      bool enable_ramfb;
> +    bool defer_set_virq;
>      VFIODisplay *dpy;
>      Notifier irqchip_change_notifier;
>  };


