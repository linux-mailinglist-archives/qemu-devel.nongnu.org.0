Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A136C41F814
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 01:11:24 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWRgZ-0003wc-9K
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 19:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRa8-0005SA-Oo
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRa5-0001ep-5W
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633129478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=984vjtQ8DMRJF1e+nTWd8Rb2FuiXVeHgLKVHZJ/B/F8=;
 b=E+nZXY7EqPSnls+AB8Uv+3nr5h6BENeC/bF4YOArRcmbYO8lNe0t+NfCJtdojKZUDcQ+C5
 eIwYIzIhL2MiZUoq6n60VHZtzfN1vBTelC9BnxNfUMuc+AYsums+rqdviHswlblxOp20bw
 OyMgCvSzM62QgrhYOnwX6Ja/GrjrVKY=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-zmyzb2_APhmlVpnKxVN9jg-1; Fri, 01 Oct 2021 19:04:37 -0400
X-MC-Unique: zmyzb2_APhmlVpnKxVN9jg-1
Received: by mail-oo1-f69.google.com with SMTP id
 q3-20020a056820028300b002a9a312d6fdso7985694ood.21
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 16:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=984vjtQ8DMRJF1e+nTWd8Rb2FuiXVeHgLKVHZJ/B/F8=;
 b=N40ABjUEDdTVLtiLeBPFBMl7AlOf+jrBtmVdq2qaQikjix9ZNBXRm3cN52ZmvN3BKP
 jjttwjiJK8yABZxbkUv1KK6b3yNCI6CPwAw5dWvfrYe9O+ZAVGkXzeRmZyC/JQ0SgG2Z
 3pUbGfaeuJMU+RFZgm3y+MvJ0BEsHRyNdSPL9oKRw0K+irHy+6JF+c95lwEI5PrM5ioz
 7dmjUQWC812pBLZlF0JeFMGFcRkiXknKbLsrlZ9ZRpeSjyIV2IQmkVIzg598IUS8eO+C
 FGP01nEv25w3AMUkhC3O0265x1wzwhrJwbFEBzC5eibaK7fWb17Bm6kj/KDLACz0o8kM
 4v7Q==
X-Gm-Message-State: AOAM531z6ujJP50RMurAiLw/AiiySMygxZJqdTGcxSmnQjUQj+wLbxiF
 Xig/zIhJN0eRT9qh3snbOIoJYLo/yNXPge+siSageEeIbt1yDONjdhYHY6ZnRH0L96OFZbKmVoj
 DmOiOWEvUMFbQ5Sc=
X-Received: by 2002:a54:4818:: with SMTP id j24mr5871418oij.150.1633129476723; 
 Fri, 01 Oct 2021 16:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA9FTjQX69j6oYzSzIaPVJFMDgcuBJvKQeHDvgq6zU61p0bG15vINEGLvUMGcWR+nsKBnskQ==
X-Received: by 2002:a54:4818:: with SMTP id j24mr5871410oij.150.1633129476565; 
 Fri, 01 Oct 2021 16:04:36 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id u2sm1471340otg.51.2021.10.01.16.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 16:04:36 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:04:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 7/9] vfio: add infrastructure to commit the deferred
 kvm routing
Message-ID: <20211001170435.36024305.alex.williamson@redhat.com>
In-Reply-To: <20210920230202.1439-8-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-8-longpeng2@huawei.com>
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sep 2021 07:02:00 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> 'defer_kvm_irq_routing' indicates whether we should defer to commit
> the kvm routing.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  hw/vfio/pci.h |  1 +
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8e97ca93cf..8fe238b11d 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -423,12 +423,24 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
> +    virq = kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n, &vdev->pdev);
>      if (virq < 0) {
>          event_notifier_cleanup(&vector->kvm_interrupt);
>          return;
>      }
>  
> +    if (vdev->defer_kvm_irq_routing) {
> +        /*
> +         * Hold the allocated virq in vector->virq temporarily, will
> +         * reset it to -1 when we fail to add the corresponding irqfd
> +         * in vfio_commit_kvm_msi_virq().

s/when/if/

> +         */
> +        vector->virq = virq;

Do we need to make this unique to the deferred case or could we use
vector->virq directly and fill it with -1 on all error paths like we do
on a failure in vfio_commit_kvm_msi_virq()?


> +        return;
> +    }
> +
> +    kvm_irqchip_commit_routes(kvm_state);
> +
>      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
>                                         NULL, virq) < 0) {
>          kvm_irqchip_release_virq(kvm_state, virq);
> @@ -567,6 +579,35 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>      }
>  }
>  
> +/* TODO: invoked when enclabe msi/msix vectors */

"enclabe"?  Is this meant to be "enable"?

> +static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)

I'd move this function, if not this entire change, to patch 9 rather
than adding these attributes for an unused function.  Thanks,

Alex

> +{
> +    int i;
> +    VFIOMSIVector *vector;
> +
> +    if (!vdev->defer_kvm_irq_routing || !vdev->nr_vectors) {
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
> +    }
> +}
> +
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
>      PCIDevice *pdev = &vdev->pdev;
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 64777516d1..d3c5177d37 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -171,6 +171,7 @@ struct VFIOPCIDevice {
>      bool no_kvm_ioeventfd;
>      bool no_vfio_ioeventfd;
>      bool enable_ramfb;
> +    bool defer_kvm_irq_routing;
>      VFIODisplay *dpy;
>      Notifier irqchip_change_notifier;
>  };


