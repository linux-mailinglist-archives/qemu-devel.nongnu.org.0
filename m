Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4A68C7B3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:34:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8BN-0004kp-Rx; Mon, 06 Feb 2023 15:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP8BD-0004j7-QI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP8BA-0007j9-RW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675715611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TK3UhSvTwl0xR1AqZDHsUzvRh8rhkhBdVfPJh3byTpk=;
 b=F/jGVHMPvWdCCzQ0c4HVQ29/PBuJL1cVulTquliykTMGq/UqzMDvrkCOuSWBD7iy8+5Tsb
 7JQogvAngQVS5jna5uRU4cuK83CCkwCmDbf9zqP8jiAEHwZ8hLYMg9cVKm0ICqc1vLki8B
 sjOGkA6YlPH8dhZVIzPImujNm5kYcho=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-ACL6vEtDMF6E8b5KmnxrwA-1; Mon, 06 Feb 2023 15:33:30 -0500
X-MC-Unique: ACL6vEtDMF6E8b5KmnxrwA-1
Received: by mail-io1-f70.google.com with SMTP id
 e16-20020a6b5010000000b00719041c51ebso7733092iob.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TK3UhSvTwl0xR1AqZDHsUzvRh8rhkhBdVfPJh3byTpk=;
 b=immHb+GvVI0KUPgIz2a2L5/UsTL6ARCqTcbK0+8vtHyeRST6ZVMT/EcooXz3+hiz1s
 q5p6dJcC3A+mArx4+lfRjy42/vZ5asVgZ+UQwDj+pg5ZeSqkoImcTSCcmPWCBYpC2wmF
 URohQaZ6Fg++MoC/zJojJP7iIyiU28kj90BDB5iK7MpuI4tYrxIq8MQp70IO//k0v5I/
 8mtKlVy+beT9XArhMwb1yDtzjGoYT4uwjFtG3YSW1S5gPVY9yxfDWUo9y4+ASGrlC2qC
 Ir51XbJAJ+Zo2eb4a5KW5r/+KfZicU96lSB4feDQ+LARGyUiQzNlbHB8gcB2V95evTla
 oNaA==
X-Gm-Message-State: AO0yUKXog+NeyW2PqndYZUzolvm0Zviup5cssNHSIaIzcP8MvqsyAQKU
 CUM4tjNhVnlanUDgqLY4VXG2cqW55p6ZfIiUDqESxluEJL005amL9Q1OC6HjL51JMEchKsvEGSr
 swYmdLFaydsBqTR4=
X-Received: by 2002:a92:7402:0:b0:313:b792:3da1 with SMTP id
 p2-20020a927402000000b00313b7923da1mr378503ilc.25.1675715609280; 
 Mon, 06 Feb 2023 12:33:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9pPKgG9oBXIhXkd4q3TZWiyPJBKi/6zb9b8ZbnLjZENZJyBFcg+CMpZLuh5BY2ZSjsByttFQ==
X-Received: by 2002:a92:7402:0:b0:313:b792:3da1 with SMTP id
 p2-20020a927402000000b00313b7923da1mr378489ilc.25.1675715608966; 
 Mon, 06 Feb 2023 12:33:28 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b129-20020a021987000000b003b1f6de471fsm3816029jab.70.2023.02.06.12.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 12:33:28 -0800 (PST)
Date: Mon, 6 Feb 2023 13:33:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 15/23] vfio-user: forward msix BAR accesses to server
Message-ID: <20230206133327.3b254677.alex.williamson@redhat.com>
In-Reply-To: <0ad69e4ea3d1f37246ce5e32ba833d6c871e99b1.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <0ad69e4ea3d1f37246ce5e32ba833d6c871e99b1.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed,  1 Feb 2023 21:55:51 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Server holds device current device pending state
> Use irq masking commands in socket case
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.h                 |  1 +
>  include/hw/vfio/vfio-common.h |  3 ++
>  hw/vfio/ccw.c                 |  1 +
>  hw/vfio/common.c              | 26 ++++++++++++++++++
>  hw/vfio/pci.c                 | 23 +++++++++++++++-
>  hw/vfio/platform.c            |  1 +
>  hw/vfio/user-pci.c            | 64 +++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 4f70664..d3e5d5f 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -113,6 +113,7 @@ typedef struct VFIOMSIXInfo {
>      uint32_t table_offset;
>      uint32_t pba_offset;
>      unsigned long *pending;
> +    MemoryRegion *pba_region;
>  } VFIOMSIXInfo;
>  
>  /*
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbc4b15..2c58d7d 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -143,6 +143,7 @@ typedef struct VFIODevice {
>      bool ram_block_discard_allowed;
>      bool enable_migration;
>      bool use_regfds;
> +    bool can_mask_irq;

How can this be a device level property?  vfio-pci (kernel) supports
masking of INTx.  It seems like there needs to be a per-index info or
probe here to to support this.


>      VFIODeviceOps *ops;
>      VFIODeviceIO *io;
>      unsigned int num_irqs;
> @@ -239,6 +240,8 @@ void vfio_put_base_device(VFIODevice *vbasedev);
>  void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
>  void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
>  void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index);
> +void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq);
> +void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq);
>  int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
>                             int action, int fd, Error **errp);
>  void vfio_region_write(void *opaque, hwaddr addr,
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 00605bd..bf67670 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -616,6 +616,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
>      vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
>      vcdev->vdev.io = &vfio_dev_io_ioctl;
>      vcdev->vdev.use_regfds = false;
> +    vcdev->vdev.can_mask_irq = false;
>  
>      return;
>  
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index de64e53..0c1cb21 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -102,6 +102,32 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
>      vbasedev->io->set_irqs(vbasedev, &irq_set);
>  }
>  
> +void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq)
> +{
> +    struct vfio_irq_set irq_set = {
> +        .argsz = sizeof(irq_set),
> +        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_MASK,
> +        .index = index,
> +        .start = irq,
> +        .count = 1,
> +    };
> +
> +    vbasedev->io->set_irqs(vbasedev, &irq_set);
> +}
> +
> +void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq)
> +{
> +    struct vfio_irq_set irq_set = {
> +        .argsz = sizeof(irq_set),
> +        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_UNMASK,
> +        .index = index,
> +        .start = irq,
> +        .count = 1,
> +    };
> +
> +    vbasedev->io->set_irqs(vbasedev, &irq_set);
> +}
> +
>  static inline const char *action_to_str(int action)
>  {
>      switch (action) {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 42e7c82..7b16f8f 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -477,6 +477,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      VFIOMSIVector *vector;
> +    bool new_vec = false;
>      int ret;
>  
>      trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
> @@ -490,6 +491,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>              error_report("vfio: Error: event_notifier_init failed");
>          }
>          vector->use = true;
> +        new_vec = true;
>          msix_vector_use(pdev, nr);
>      }
>  
> @@ -516,6 +518,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                  kvm_irqchip_commit_route_changes(&vfio_route_change);
>                  vfio_connect_kvm_msi_virq(vector);
>              }
> +            new_vec = true;

This looks wrong to me, can't we get here when a previously used vector
is unmasked?

>          }
>      }
>  
> @@ -523,6 +526,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>       * We don't want to have the host allocate all possible MSI vectors
>       * for a device if they're not in use, so we shutdown and incrementally
>       * increase them as needed.
> +     * Otherwise, unmask the vector if the vector is already setup (and we can
> +     * do so) or send the fd if not.
>       */
>      if (vdev->nr_vectors < nr + 1) {
>          vdev->nr_vectors = nr + 1;
> @@ -533,6 +538,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                  error_report("vfio: failed to enable vectors, %d", ret);
>              }
>          }
> +    } else if (vdev->vbasedev.can_mask_irq && !new_vec) {
> +        vfio_unmask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);

The correctness of @new_vec is doubtful here, but masking support must
be in reference to a specific IRQ index.  INTx masking is implicit, but
we'd probably need something on the VFIOPCIDevice to indicate support
for MSI and MSIX masking support, separately.

>      } else {
>          Error *err = NULL;
>          int32_t fd;
> @@ -574,6 +581,12 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>  
>      trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
>  
> +    /* just mask vector if peer supports it */
> +    if (vdev->vbasedev.can_mask_irq) {
> +        vfio_mask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
> +        return;
> +    }
> +
>      /*
>       * There are still old guests that mask and unmask vectors on every
>       * interrupt.  If we're using QEMU bypass with a KVM irqfd, leave all of
> @@ -644,7 +657,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>          if (ret) {
>              error_report("vfio: failed to enable vectors, %d", ret);
>          }
> -    } else {
> +    } else if (!vdev->vbasedev.can_mask_irq) {
>          /*
>           * Some communication channels between VF & PF or PF & fw rely on the
>           * physical state of the device and expect that enabling MSI-X from the
> @@ -660,6 +673,13 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>           */
>          vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
>          vfio_msix_vector_release(&vdev->pdev, 0);
> +    } else {
> +        /*
> +         * If we can use irq masking, send an invalid fd on vector 0
> +         * to enable MSI-X without any vectors enabled.
> +         */
> +        vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, 0,
> +                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, NULL);

What does this have to do with masking?  I'm not entirely sure this
doesn't also work on vfio-pci (kernel).

In general this feels like a special cased version of MSI/X masking
support rather than actually reworking things to support underlying
masking support for these indexes.  Thanks,

Alex


