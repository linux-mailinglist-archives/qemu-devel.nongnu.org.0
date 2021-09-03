Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2414007B6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 00:02:35 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMHGc-0008Ls-Ij
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 18:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHCM-0004K8-Re
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHCH-00070F-2E
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630706284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5RO6lHDXMqfV2UvlKuIGsunZDb2ANrj3SslKJFiGYU=;
 b=S/4/Vebsj6JvqA+0Y3WacV7t+ZxS1WPrqqy6neTnSnMD+WsZdYjcPJo03ZgtxulgBULSu3
 O7luqPYdtYscBFKTkLJzUXnyOr5BRlcwhdBg9Co9Ai4yPYNM8qfTcvmg35RzCX/f4KF9fp
 F87AvMpJOW5yO9doO/1DpeSmZzPYdcI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-sCl9l5KnNdefO94C6VCu3g-1; Fri, 03 Sep 2021 17:58:01 -0400
X-MC-Unique: sCl9l5KnNdefO94C6VCu3g-1
Received: by mail-oi1-f197.google.com with SMTP id
 n26-20020a05680803ba00b002695053b627so370376oie.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=T5RO6lHDXMqfV2UvlKuIGsunZDb2ANrj3SslKJFiGYU=;
 b=SVPRdTKHw6InUJtKffG9fKWCfwxeRWYz4bCp7Ufo/qI3Tuh5HVUBsC7bQUwTexvBuY
 WZx/U9DbtIpAKHn8y9RrG631S+toACYfQn4jQL/Aw5SWVWIqwsQMa0/jDFfrQvANXzub
 p5Fc1uYBQBU+47pC6zA7DYkWaXyfW+BXHoSf+gMDDjBKrLuu5kzi1jC4jsu4bdrqrQU4
 BP2r3JLwPtRa9OD3B4Ei1jZ27RdJxoZ9lbvcggqabwC0vUpSq5VDbGGDSjdLdbG/zwQy
 s2mPcVche/ld05UtWgAnHZT9ATt+3p6XdkykONE0SeKZixGTUzHa30cY4dOGYKIPAEkS
 R6RQ==
X-Gm-Message-State: AOAM530LJSzWuruMv7N9S6OuC3eHS4G0oy172zCoTcv8G2dCFhORXO/H
 2FcqILnUr7xb1WNj4tpngBNROxscAzN4R6gsAu+xNNHRsSJr83m4nufzcjunUmGb92IjrIUCYDC
 AOChFaKfKF0IH1aQ=
X-Received: by 2002:a05:6830:2470:: with SMTP id
 x48mr964335otr.103.1630706280893; 
 Fri, 03 Sep 2021 14:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2fmgi6ukVuIM41T5ERpZmwwyoXsIgT23oRIp+w6yhBUtiznDHzvTt8OAiGRfQLmRdtIVMKg==
X-Received: by 2002:a05:6830:2470:: with SMTP id
 x48mr964326otr.103.1630706280694; 
 Fri, 03 Sep 2021 14:58:00 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id w9sm132295oti.35.2021.09.03.14.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:58:00 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:57:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH 5/5] vfio: defer to commit kvm route in migraiton resume
 phase
Message-ID: <20210903155759.3a933fa7.alex.williamson@redhat.com>
In-Reply-To: <20210825075620.2607-6-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-6-longpeng2@huawei.com>
Organization: Red Hat
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 15:56:20 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> In migration resume phase, all unmasked msix vectors need to be
> setup when load the VF state. However, the setup operation would
> takes longer if the VF has more unmasked vectors.
> 
> In our case, the VF has 65 vectors and each one spend at most 0.8ms
> on setup operation the total cost of the VF is about 8-58ms. For a
> VM that has 8 VFs of this type, the total cost is more than 250ms.
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
> We can reduce the cost by only commit once outside the loop. The
> routes is cached in kvm_state, we commit them first and then bind
> irqfd for each vector.
> 
> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
> we mesure the cost of the vfio_msix_enable for each one, and
> we can see 90+% costs can be reduce.
> 
>         Origin          Apply this patch
>                         and vfio enable optimization
> 1st     8               2
> 2nd     15              2
> 3rd     22              2
> 4th     24              3
> 5th     36              2
> 6th     44              3
> 7th     51              3
> 8th     58              4
> Total   258ms           21ms

Almost seems like we should have started here rather than much more
subtle improvements from patch 3.

 
> The optimition can be also applied to msi type.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 3ab67d6..50e7ec7 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -427,12 +427,17 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
> +    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev,
> +                                     vdev->defer_add_virq);

See comment on previous patch about these bool function args.

>      if (virq < 0) {
>          event_notifier_cleanup(&vector->kvm_interrupt);
>          return;
>      }
>  
> +    if (vdev->defer_add_virq) {
> +        goto out;
> +    }

See comment on previous patch about this goto flow.

> +
>      if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
>                                         NULL, virq) < 0) {
>          kvm_irqchip_release_virq(kvm_state, virq);
> @@ -440,6 +445,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> +out:
>      vector->virq = virq;
>  }
>  
> @@ -577,6 +583,36 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>      }
>  }
>  
> +static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
> +{
> +    int i;
> +    VFIOMSIVector *vector;
> +    bool commited = false;
> +
> +    for (i = 0; i < vdev->nr_vectors; i++) {
> +        vector = &vdev->msi_vectors[i];
> +
> +        if (vector->virq < 0) {
> +            continue;
> +        }
> +
> +        /* Commit cached route entries to KVM core first if not yet */
> +        if (!commited) {
> +            kvm_irqchip_commit_routes(kvm_state);
> +            commited = true;
> +        }

Why is this in the loop, shouldn't we just start with:

    if (!vdev->nr_vectors) {
        return;
    }

    kvm_irqchip_commit_routes(kvm_state);

    for (...

> +
> +        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> +                                               &vector->kvm_interrupt,
> +                                               NULL, vector->virq) < 0) {
> +            kvm_irqchip_release_virq(kvm_state, vector->virq);
> +            event_notifier_cleanup(&vector->kvm_interrupt);
> +            vector->virq = -1;
> +            return;
> +        }

And all the other vectors we've allocated?  Error logging?

> +    }
> +}
> +
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
>      PCIDevice *pdev = &vdev->pdev;
> @@ -624,6 +660,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>      if (!pdev->msix_function_masked && vdev->defer_add_virq) {
>          int ret;
>          vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
> +        vfio_commit_kvm_msi_virq(vdev);
>          ret = vfio_enable_vectors(vdev, true);
>          if (ret) {
>              error_report("vfio: failed to enable vectors, %d", ret);
> @@ -664,6 +701,10 @@ retry:
>          vfio_add_kvm_msi_virq(vdev, vector, i, false);
>      }
>  
> +    if (vdev->defer_add_virq){
> +        vfio_commit_kvm_msi_virq(vdev);
> +    }

Again, why is the load_config path unique, shouldn't we always batch on
setup?

> +
>      /* Set interrupt type prior to possible interrupts */
>      vdev->interrupt = VFIO_INT_MSI;
>  
> @@ -2473,13 +2514,13 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>      vfio_pci_write_config(pdev, PCI_COMMAND,
>                            pci_get_word(pdev->config + PCI_COMMAND), 2);
>  
> +    vdev->defer_add_virq = true;
>      if (msi_enabled(pdev)) {
>          vfio_msi_enable(vdev);
>      } else if (msix_enabled(pdev)) {
> -        vdev->defer_add_virq = true;
>          vfio_msix_enable(vdev);
> -        vdev->defer_add_virq = false;
>      }
> +    vdev->defer_add_virq = false;
>  
>      return ret;
>  }


