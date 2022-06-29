Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7935560AF9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 22:21:44 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6eBz-0001iV-Pb
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 16:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6e9k-00010f-Rq
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o6e9g-00052t-Kl
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656533959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22JT4d0jynk3zQBF1/+pdh5Ci+sTbH2dZmtkxrvXoYc=;
 b=UpyLmqx6+USGlLA7FVKp+oAANtOY0jnZrRG5FBMeWkLaAtSdihk08ASpKHqBMogBhEpBiu
 D3kDiQJpEioC76gjWrNzQNIgSvsiPilCkWrnAyVrmUNEeUotstrTD9uI4I4cMtz3jL2dM8
 +J4ZkGl3SsyF31ye/GQOfl2uiSBFsi8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-C_6rtJAYN_u5UhO-ODPc3Q-1; Wed, 29 Jun 2022 16:19:18 -0400
X-MC-Unique: C_6rtJAYN_u5UhO-ODPc3Q-1
Received: by mail-io1-f70.google.com with SMTP id
 h73-20020a6bb74c000000b0067275998ba8so9081385iof.2
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 13:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=22JT4d0jynk3zQBF1/+pdh5Ci+sTbH2dZmtkxrvXoYc=;
 b=cKo2MeIPwgZrKmGAvVT7rNf8Bne3pGersDriZH4Rj6xjwSlG5jJWUsnxsswaqWUjpf
 T3I3+LF6+4s4Ea57h4Ym7ie81v1o1ELLK/4ItZ88cVnBupn1wEx/YYifGomhNYjkVlav
 KKdTmHwlFcyFzgetfMKlAtJoTAZ3hIzMq/xBFqSGTce25CuSeff6DxA6g4c+GTCi7C7c
 yLuPr/1RfQDp/2tjCBvIN58muCkecSIqpkrZJiEPnenNEBHM1XBa1i/n2MKWBvt1Q7xO
 q5cYeTeE6uzctzypdvfUyDr+nebwf2X7cZL9VbzHn4wRCMeWuQJTkp4A7Bf7XbhGCaVd
 gOgg==
X-Gm-Message-State: AJIora9mjyckni9nq3DaHnO6p9cDsk1vjwKDlyX6mwapHDc9FUCm6488
 pi0ntIL+CSGCJr3e+A10YhBjRI6K74hpYAscXOwrLEQgXEw8yfoSQUHXdRzn82Rh7yzyIQxeAaF
 JzHZP9SxEGkH13W8=
X-Received: by 2002:a92:c844:0:b0:2d9:983:80be with SMTP id
 b4-20020a92c844000000b002d9098380bemr3008333ilq.65.1656533957156; 
 Wed, 29 Jun 2022 13:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTmpKiSqnuMOCyOWENCeDV/fuYUj3UJNhj+vQo9bjBJholslGR64ComfJqRbKSZ0mWxVWazQ==
X-Received: by 2002:a92:c844:0:b0:2d9:983:80be with SMTP id
 b4-20020a92c844000000b002d9098380bemr3008307ilq.65.1656533956878; 
 Wed, 29 Jun 2022 13:19:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05663822b300b00331f1f828adsm7741490jas.16.2022.06.29.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:19:16 -0700 (PDT)
Date: Wed, 29 Jun 2022 14:19:13 -0600
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
Subject: Re: [PATCH V8 28/39] vfio-pci: cpr part 2 (msi)
Message-ID: <20220629141913.0a6ad118.alex.williamson@redhat.com>
In-Reply-To: <1655304746-102776-29-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-29-git-send-email-steven.sistare@oracle.com>
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

On Wed, 15 Jun 2022 07:52:15 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Finish cpr for vfio-pci MSI/MSI-X devices by preserving eventfd's and
> vector state.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/pci.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 237231b..2fd7121 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -53,17 +53,53 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
>  static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
>  
> +#define EVENT_FD_NAME(vdev, name)   \
> +    g_strdup_printf("%s_%s", (vdev)->vbasedev.name, (name))
> +
> +static int save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
> +                         EventNotifier *ev)
> +{
> +    int fd = event_notifier_get_fd(ev);
> +
> +    if (fd >= 0) {
> +        Error *err;
> +        g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
> +
> +        if (cpr_resave_fd(fdname, nr, fd, &err)) {
> +            error_report_err(err);
> +            return 1;


Preferably -1, but the caller doesn't actually test the return value
anyway :-\


> +        }
> +    }
> +    return 0;
> +}
> +
> +static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
> +{
> +    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
> +    int fd = cpr_find_fd(fdname, nr);
> +    return fd;


    return cpr_find_fd(EVENT_FD_NAME(vdev, name), nr);


> +}
> +
> +static void delete_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
> +{
> +    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
> +    cpr_delete_fd(fdname, nr);


    cpr_delete_fd(EVENT_FD_NAME(vdev, name), nr);


> +}
> +
>  /* Create new or reuse existing eventfd */
>  static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
>                                const char *name, int nr)
>  {
> -    int fd = -1;   /* placeholder until a subsequent patch */
>      int ret = 0;
> +    int fd = load_event_fd(vdev, name, nr);
>  
>      if (fd >= 0) {
>          event_notifier_init_fd(e, fd);
>      } else {
>          ret = event_notifier_init(e, 0);
> +        if (!ret) {
> +            save_event_fd(vdev, name, nr, e);


Return value not tested.  The function generates an error report if it
fails, but it doesn't seem that actually blocks a cpr attempt.  Do we
just wind up with that error report as a breadcrumb to why cpr breaks
with a missing fd down the road?


> +        }
>      }
>      return ret;
>  }
> @@ -71,6 +107,7 @@ static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
>  static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
>                                    const char *name, int nr)
>  {
> +    delete_event_fd(vdev, name, nr);
>      event_notifier_cleanup(e);
>  }
>  
> @@ -511,6 +548,15 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>      VFIOMSIVector *vector;
>      int ret;
>  
> +    /*
> +     * Ignore the callback from msix_set_vector_notifiers during resume.
> +     * The necessary subset of these actions is called from vfio_claim_vectors
> +     * during post load.
> +     */
> +    if (vdev->vbasedev.reused) {
> +        return 0;
> +    }
> +
>      trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
>  
>      vector = &vdev->msi_vectors[nr];
> @@ -2784,6 +2830,11 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
>      fd = event_notifier_get_fd(&vdev->err_notifier);
>      qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
>  
> +    /* Do not alter irq_signaling during vfio_realize for cpr */
> +    if (vdev->vbasedev.reused) {
> +        return;
> +    }
> +
>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_ERR_IRQ_INDEX, 0,
>                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
>          error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> @@ -2849,6 +2900,12 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>      fd = event_notifier_get_fd(&vdev->req_notifier);
>      qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
>  
> +    /* Do not alter irq_signaling during vfio_realize for cpr */
> +    if (vdev->vbasedev.reused) {
> +        vdev->req_enabled = true;
> +        return;
> +    }


vfio_notifier_init() transparently gets the old fd or creates a new
one, how do we know which has occurred to know that this eventfd is
already configured?

Don't we also have the same issue relative to vdev->pci_aer for the
error handler?

> +
>      if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_REQ_IRQ_INDEX, 0,
>                             VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
>          error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> @@ -3357,6 +3414,43 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
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
> +        fd = load_event_fd(vdev, "interrupt", i);
> +        if (fd >= 0) {
> +            vfio_vector_init(vdev, i);
> +            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
> +        }
> +
> +        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
> +            vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
> +            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
> +            kvm_irqchip_commit_route_changes(&vfio_route_change);
> +            vfio_connect_kvm_msi_virq(vector, i);


Shouldn't we take advantage of the batching support here?


> +        }


How do we debug if one of the above fails that shouldn't have failed?
Should we have an assert or change this to a non-void return if we
cannot setup an interrupt that we think is configured?


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
>  /*
>   * The kernel may change non-emulated config bits.  Exclude them from the
>   * changed-bits check in get_pci_config_device.
> @@ -3375,6 +3469,29 @@ static int vfio_pci_pre_load(void *opaque)
>      return 0;
>  }
>  
> +static int vfio_pci_post_load(void *opaque, int version_id)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +    int nr_vectors;
> +
> +    if (msix_enabled(pdev)) {
> +        msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
> +                                   vfio_msix_vector_release, NULL);
> +        nr_vectors = vdev->msix->entries;



Maybe this is why we're not generating an error above, we don't know
which vectors are configured other than if they have a saved eventfd,
where we don't test whether we were able to actually save the fd.
Thanks,

Alex


> +        vfio_claim_vectors(vdev, nr_vectors, true);
> +
> +    } else if (msi_enabled(pdev)) {
> +        nr_vectors = msi_nr_vectors_allocated(pdev);
> +        vfio_claim_vectors(vdev, nr_vectors, false);
> +
> +    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
> +        assert(0);      /* completed in a subsequent patch */
> +    }
> +
> +    return 0;
> +}
> +
>  static bool vfio_pci_needed(void *opaque)
>  {
>      return cpr_get_mode() == CPR_MODE_RESTART;
> @@ -3387,8 +3504,11 @@ static const VMStateDescription vfio_pci_vmstate = {
>      .minimum_version_id = 0,
>      .priority = MIG_PRI_VFIO_PCI,       /* must load before container */
>      .pre_load = vfio_pci_pre_load,
> +    .post_load = vfio_pci_post_load,
>      .needed = vfio_pci_needed,
>      .fields = (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
> +        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
>          VMSTATE_END_OF_LIST()
>      }
>  };


