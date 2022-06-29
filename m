Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C65560B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 22:46:41 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ea7-00075l-LG
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6eX2-0006M4-EE
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6eWv-0002de-Ix
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656535400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkEGAsh/UkOiFPIWJyWKQFz82lD/8zPK8eENGRjXgFg=;
 b=RipwaYOL/Fj8qZ3LAO8kn1RQdDRC6H7J2CSH6xVdwSJTOtDRws9JMlXrVyceUBH7MBzD4/
 2Pt57Vf3KxUq61TFH8LKF6/oBezejPsp7ncPIebm5r6SBmf6Fsv94BUNZK+i4tfz+QOlLu
 I7ST3w7UNEhIjRa3PjwGLwo6rCO8JeU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-rw-2t3fvODitoUwS5Vv5rw-1; Wed, 29 Jun 2022 16:43:19 -0400
X-MC-Unique: rw-2t3fvODitoUwS5Vv5rw-1
Received: by mail-il1-f200.google.com with SMTP id
 o17-20020a056e02115100b002d95d6881e4so9483702ill.19
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 13:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=zkEGAsh/UkOiFPIWJyWKQFz82lD/8zPK8eENGRjXgFg=;
 b=X+IVfl2pkHa0fg+xJlb0w6hK62t4cz7sKnu4X32sBOYuCBX11o4OhClhDptSIp4GrY
 FPNEgOMWM6uudadHE+mloWYDODBCaAGawJ7ghay00/DyFNBXOttNi0rSKA6U8mTTFo+8
 bOI8Mzj0LxeVG2zksU85nzRBcFV5YKxnXQAmLwW93iSJTmCzmOc/LeLL6pxJQ9AZARj6
 lbPT3paeo3jvyFmEFd6qnK/d38xCR87WzZOaLNPuQRowKzWAaCb/vh3HPqQ/lV4twDnY
 eCStSYQup2FsuptrkiQpTCmWzOrRc+mBcxs4HTubJFv0OeVIrS8OVDT9zYdRWViLb9mt
 /m3Q==
X-Gm-Message-State: AJIora/RZT/BrQ9+zfWX9QJo9DgTFu01VpSIVRuT5xnV7Eg72wjptcJF
 sECgBGOw3XJ3XuPMUUFLJKc4J1PMmOJwZ6vjrz/+w2lv+FELN939kI60iHWuck9JfGe/IWIDmp5
 X+I9VWsmVbgMm3nU=
X-Received: by 2002:a05:6638:1383:b0:33c:912d:51c8 with SMTP id
 w3-20020a056638138300b0033c912d51c8mr2922141jad.315.1656535398126; 
 Wed, 29 Jun 2022 13:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNg1XhYm7qyi+g7soezeCvz7YJI6GOYktYmNuED4iLVnCspwKib3Frg/iNrUUOSGA3XGmIQg==
X-Received: by 2002:a05:6638:1383:b0:33c:912d:51c8 with SMTP id
 w3-20020a056638138300b0033c912d51c8mr2922121jad.315.1656535397806; 
 Wed, 29 Jun 2022 13:43:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r3-20020a02aa03000000b0033cd78a3612sm647043jam.18.2022.06.29.13.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:43:17 -0700 (PDT)
Date: Wed, 29 Jun 2022 14:43:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philippe.mathieu.daude@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 29/39] vfio-pci: cpr part 3 (intx)
Message-ID: <20220629144316.60e6ea6c.alex.williamson@redhat.com>
In-Reply-To: <1655304746-102776-30-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-30-git-send-email-steven.sistare@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 15 Jun 2022 07:52:16 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
> follows:
>   pin : Recover this from the vfio config in kernel space
>   interrupt : Preserve its eventfd descriptor across exec.
>   unmask : Ditto
>   route.irq : This could perhaps be recovered in vfio_pci_post_load by
>     calling pci_device_route_intx_to_irq(pin), whose implementation reads
>     config space for a bridge device such as ich9.  However, there is no
>     guarantee that the bridge vmstate is read before vfio vmstate.  Rather
>     than fiddling with MigrationPriority for vmstate handlers, explicitly
>     save route.irq in vfio vmstate.
>   pending : save in vfio vmstate.
>   mmap_timeout, mmap_timer : Re-initialize
>   bool kvm_accel : Re-initialize
> 
> In vfio_realize, defer calling vfio_intx_enable until the vmstate
> is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
> vfio_intx_kvm_enable to skip vfio initialization, but still perform
> kvm initialization.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/pci.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 2fd7121..b8aee91 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -173,14 +173,45 @@ static void vfio_intx_eoi(VFIODevice *vbasedev)
>      vfio_unmask_single_irqindex(vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
>  }
>  
> +#ifdef CONFIG_KVM
> +static bool vfio_no_kvm_intx(VFIOPCIDevice *vdev)
> +{
> +    return vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
> +           vdev->intx.route.mode != PCI_INTX_ENABLED ||
> +           !kvm_resamplefds_enabled();
> +}
> +#endif
> +
> +static void vfio_intx_reenable_kvm(VFIOPCIDevice *vdev, Error **errp)
> +{
> +#ifdef CONFIG_KVM
> +    if (vfio_no_kvm_intx(vdev)) {
> +        return;
> +    }
> +
> +    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
> +        error_setg(errp, "vfio_notifier_init intx-unmask failed");
> +        return;
> +    }
> +
> +    if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> +                                           &vdev->intx.interrupt,
> +                                           &vdev->intx.unmask,
> +                                           vdev->intx.route.irq)) {
> +        error_setg_errno(errp, errno, "failed to setup resample irqfd");


Does not unwind with vfio_notifier_cleanup().  This also exactly
duplicates code in vfio_intx_enable_kvm(), which suggests it needs
further refactoring to a common helper.



> +        return;
> +    }
> +
> +    vdev->intx.kvm_accel = true;
> +#endif
> +}
> +
>  static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
>  {
>  #ifdef CONFIG_KVM
>      int irq_fd = event_notifier_get_fd(&vdev->intx.interrupt);
>  
> -    if (vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
> -        vdev->intx.route.mode != PCI_INTX_ENABLED ||
> -        !kvm_resamplefds_enabled()) {
> +    if (vfio_no_kvm_intx(vdev)) {
>          return;
>      }
>  
> @@ -328,7 +359,13 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>          return 0;
>      }
>  
> -    vfio_disable_interrupts(vdev);
> +    /*
> +     * Do not alter interrupt state during vfio_realize and cpr-load.  The
> +     * reused flag is cleared thereafter.
> +     */
> +    if (!vdev->vbasedev.reused) {
> +        vfio_disable_interrupts(vdev);
> +    }
>  
>      vdev->intx.pin = pin - 1; /* Pin A (1) -> irq[0] */
>      pci_config_set_interrupt_pin(vdev->pdev.config, pin);
> @@ -353,6 +390,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>      fd = event_notifier_get_fd(&vdev->intx.interrupt);
>      qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
>  
> +    if (vdev->vbasedev.reused) {
> +        vfio_intx_reenable_kvm(vdev, &err);
> +        goto finish;
> +    }
> +

This only jumps over the vfio_set_irq_signaling() and
vfio_intx_enable_kvm(), largely replacing the latter with chunks of
code taken from it.  Doesn't seem like the right factoring.

>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
>                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
>          qemu_set_fd_handler(fd, NULL, NULL, vdev);
> @@ -365,6 +407,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>          warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>      }
>  
> +finish:
>      vdev->interrupt = VFIO_INT_INTx;
>  
>      trace_vfio_intx_enable(vdev->vbasedev.name);
> @@ -3195,9 +3238,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>                                               vfio_intx_routing_notifier);
>          vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
>          kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
> -        ret = vfio_intx_enable(vdev, errp);
> -        if (ret) {
> -            goto out_deregister;
> +
> +        /* Wait until cpr-load reads intx routing data to enable */
> +        if (!vdev->vbasedev.reused) {
> +            ret = vfio_intx_enable(vdev, errp);
> +            if (ret) {
> +                goto out_deregister;
> +            }
>          }
>      }
>  
> @@ -3474,6 +3521,7 @@ static int vfio_pci_post_load(void *opaque, int version_id)
>      VFIOPCIDevice *vdev = opaque;
>      PCIDevice *pdev = &vdev->pdev;
>      int nr_vectors;
> +    int ret = 0;
>  
>      if (msix_enabled(pdev)) {
>          msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
> @@ -3486,10 +3534,35 @@ static int vfio_pci_post_load(void *opaque, int version_id)
>          vfio_claim_vectors(vdev, nr_vectors, false);
>  
>      } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
> -        assert(0);      /* completed in a subsequent patch */
> +        Error *err = 0;
> +        ret = vfio_intx_enable(vdev, &err);
> +        if (ret) {
> +            error_report_err(err);
> +        }
>      }
>  
> -    return 0;
> +    return ret;
> +}
> +
> +static const VMStateDescription vfio_intx_vmstate = {
> +    .name = "vfio-intx",
> +    .unmigratable = 1,


unmigratable-vmstates-to-interfere-with-migration++

Thanks,
Alex


> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(pending, VFIOINTx),
> +        VMSTATE_UINT32(route.mode, VFIOINTx),
> +        VMSTATE_INT32(route.irq, VFIOINTx),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +#define VMSTATE_VFIO_INTX(_field, _state) {                         \
> +    .name       = (stringify(_field)),                              \
> +    .size       = sizeof(VFIOINTx),                                 \
> +    .vmsd       = &vfio_intx_vmstate,                               \
> +    .flags      = VMS_STRUCT,                                       \
> +    .offset     = vmstate_offset_value(_state, _field, VFIOINTx),   \
>  }
>  
>  static bool vfio_pci_needed(void *opaque)
> @@ -3509,6 +3582,7 @@ static const VMStateDescription vfio_pci_vmstate = {
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
>          VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
> +        VMSTATE_VFIO_INTX(intx, VFIOPCIDevice),
>          VMSTATE_END_OF_LIST()
>      }
>  };


