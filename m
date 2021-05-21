Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCD38D174
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 00:26:06 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkDam-0002Yx-MT
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 18:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lkDZf-0001Gd-Qm
 for qemu-devel@nongnu.org; Fri, 21 May 2021 18:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lkDZd-0003cH-Al
 for qemu-devel@nongnu.org; Fri, 21 May 2021 18:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621635892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lR4U4qIToDo/Fas28fzi/nKHeSZng51zlmNHDHMmAFo=;
 b=Jm/3Jsg7PUitmX0gEwCyTzRrGE7rP7Jyx7/IJ3zs5EeZaoR4uh8tmiUjnuU4hgshMDmn0P
 gM3z6cS+pSUB84GSUHkhL63qngjx38UAs5Vq0FexLNt1/3qrJLF2ksmXGRLGAexSgMsNtO
 K75pdjFOChfGwAwIi7Zfes0fux7XgCI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-HPRPtb65Ny6ZYfHteFoqIg-1; Fri, 21 May 2021 18:24:50 -0400
X-MC-Unique: HPRPtb65Ny6ZYfHteFoqIg-1
Received: by mail-ot1-f72.google.com with SMTP id
 w8-20020a0568300788b029033d472f6029so4179250ots.12
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 15:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lR4U4qIToDo/Fas28fzi/nKHeSZng51zlmNHDHMmAFo=;
 b=aURhD/BeKwC8jhymr/KY2kOZgt3urf9utZ2Qc9U158s1Xleutaz4wLaWGotCWe9gc9
 QAP05WN4a4MWvF1ww/YYQhehF5mzXMZIYjRcB7m2PXz4/o+gL/FLfIrFfN82lat56IRU
 8SQs6sIkByMp/5srOIFJ9qECajgCIqXG7INp6yc9lEt+mt2fECUY5eKkzJaowaZmqYYy
 el/OaL3UoJya85wRt/aeeaL6qAuE2Q6j4WWHe8Sv6m3Ybsg+9vxGLYanL5IshniYKMHF
 yA/cogGoOdlAHKIVhxkTd0KN9Ju35/Z3hhpOY7744PSICso9JbshAsrhQVBjhDgcm/yW
 qGgw==
X-Gm-Message-State: AOAM5306ZYXW8NY6OqHvETvEGpVE6+lM0AFEGB8wE+LnvalQd8WLXJD1
 P4BV85r28cunVi+0Ec7YJBn1LFIDgRObo5VtstGBMkHDSt4i9XY8YN6wv1vz9RinQUQ10tPqgpx
 NFePTg54mHhOoSyU=
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr10524995otb.257.1621635890178; 
 Fri, 21 May 2021 15:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCN9xr/q5lbauY3TjSiJ5L0+kzWl8Nc+poU2T/8ewwzte96HFH8hURS8UevpMJMoIzulnxAA==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr10524972otb.257.1621635889966; 
 Fri, 21 May 2021 15:24:49 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id q73sm1053657ooq.11.2021.05.21.15.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 15:24:49 -0700 (PDT)
Date: Fri, 21 May 2021 16:24:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 13/22] vfio-pci: cpr part 2
Message-ID: <20210521162448.65ec5f58.alex.williamson@redhat.com>
In-Reply-To: <1620390320-301716-14-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-14-git-send-email-steven.sistare@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  7 May 2021 05:25:11 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Finish cpr for vfio-pci by preserving eventfd's and vector state.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/pci.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 108 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f7ac9f03..e983db4 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2661,6 +2661,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
>      vfio_put_base_device(&vdev->vbasedev);
>  }
>  
> +static void setenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name,
> +                            EventNotifier *ev)
> +{
> +    char envname[256];
> +    int fd = event_notifier_get_fd(ev);
> +    const char *vfname = vdev->vbasedev.name;
> +
> +    if (fd >= 0) {
> +        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
> +        setenv_fd(envname, fd);
> +    }
> +}
> +
> +static int getenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name)
> +{
> +    char envname[256];
> +    const char *vfname = vdev->vbasedev.name;
> +    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
> +    return getenv_fd(envname);
> +}
> +
>  static void vfio_err_notifier_handler(void *opaque)
>  {
>      VFIOPCIDevice *vdev = opaque;
> @@ -2692,7 +2713,13 @@ static void vfio_err_notifier_handler(void *opaque)
>  static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
>  {
>      Error *err = NULL;
> -    int32_t fd;
> +    int32_t fd = getenv_event_fd(vdev, 0, "err");

Arg order should match the actual env names, device name, interrupt
name, interrupt number.

> +
> +    if (fd >= 0) {
> +        event_notifier_init_fd(&vdev->err_notifier, fd);
> +        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
> +        return;
> +    }
>  
>      if (!vdev->pci_aer) {
>          return;
> @@ -2753,7 +2780,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>      struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
>                                        .index = VFIO_PCI_REQ_IRQ_INDEX };
>      Error *err = NULL;
> -    int32_t fd;
> +    int32_t fd = getenv_event_fd(vdev, 0, "req");
> +
> +    if (fd >= 0) {
> +        event_notifier_init_fd(&vdev->req_notifier, fd);
> +        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
> +        vdev->req_enabled = true;
> +        return;
> +    }
>  
>      if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
>          return;
> @@ -3286,12 +3320,82 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static int vfio_pci_pre_save(void *opaque)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    int i;
> +
> +    for (i = 0; i < vdev->nr_vectors; i++) {
> +        VFIOMSIVector *vector = &vdev->msi_vectors[i];
> +        if (vector->use) {
> +            setenv_event_fd(vdev, i, "interrupt", &vector->interrupt);
> +            if (vector->virq >= 0) {
> +                setenv_event_fd(vdev, i, "kvm_interrupt",
> +                                &vector->kvm_interrupt);
> +            }
> +        }
> +    }
> +    setenv_event_fd(vdev, 0, "err", &vdev->err_notifier);
> +    setenv_event_fd(vdev, 0, "req", &vdev->req_notifier);
> +    return 0;
> +}
> +
> +static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
> +{
> +    int i, fd;
> +    bool pending = false;
> +    PCIDevice *pdev = &vdev->pdev;
> +
> +    vdev->nr_vectors = nr_vectors;
> +    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
> +    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
> +
> +    for (i = 0; i < nr_vectors; i++) {
> +        VFIOMSIVector *vector = &vdev->msi_vectors[i];
> +
> +        fd = getenv_event_fd(vdev, i, "interrupt");
> +        if (fd >= 0) {
> +            vfio_vector_init(vdev, i, fd);
> +            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
> +        }
> +
> +        fd = getenv_event_fd(vdev, i, "kvm_interrupt");
> +        if (fd >= 0) {
> +            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
> +        }
> +
> +        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
> +            set_bit(i, vdev->msix->pending);
> +            pending = true;
> +        }
> +    }
> +
> +    if (msix) {
> +        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
> +    }
> +}
> +
>  static int vfio_pci_post_load(void *opaque, int version_id)
>  {
>      VFIOPCIDevice *vdev = opaque;
>      PCIDevice *pdev = &vdev->pdev;
> +    int nr_vectors;
>      bool enabled;
>  
> +    if (msix_enabled(pdev)) {
> +        nr_vectors = vdev->msix->entries;
> +        vfio_claim_vectors(vdev, nr_vectors, true);
> +        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
> +                                   vfio_msix_vector_release, NULL);
> +
> +    } else if (msi_enabled(pdev)) {
> +        nr_vectors = msi_nr_vectors_allocated(pdev);
> +        vfio_claim_vectors(vdev, nr_vectors, false);
> +
> +    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
> +        error_report("vfio_pci_post_load does not support INTX");
> +    }

Why?  Is post-load where we really want to find this out?  Thanks,

Alex

> +
>      pdev->reused = false;
>      enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
>      memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
> @@ -3310,8 +3414,10 @@ static const VMStateDescription vfio_pci_vmstate = {
>      .version_id = 0,
>      .minimum_version_id = 0,
>      .post_load = vfio_pci_post_load,
> +    .pre_save = vfio_pci_pre_save,
>      .needed = vfio_pci_needed,
>      .fields = (VMStateField[]) {
> +        VMSTATE_MSIX(pdev, VFIOPCIDevice),
>          VMSTATE_END_OF_LIST()
>      }
>  };


