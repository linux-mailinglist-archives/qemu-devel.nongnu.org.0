Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD741F80C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 01:08:28 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWRdj-000076-Fo
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 19:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRaL-0005eB-NA
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRaI-0001ng-HF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633129493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBZ7aoMvUD8s7N/PZG2Y6gFL3K1taSpIg3oUNZ7k3mA=;
 b=O5CgtH3dv0eg6X3HkRAKfFCSlEP6BSWPMl3seuRvZBcrTPUqfTpHM2dPmSDkv0cq2abtPQ
 JBzhRQcuF+5saaExtg5NJu4GrFKWpdhj/3+WhvWyf66fYeuUhR+ITm1UzkbAfc9XdOI1zY
 deFGBm4gynLcofrLIskB4mxXTHArUJA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-BwW1gTpQP_WvSZRasJdmug-1; Fri, 01 Oct 2021 19:04:52 -0400
X-MC-Unique: BwW1gTpQP_WvSZRasJdmug-1
Received: by mail-oo1-f69.google.com with SMTP id
 j27-20020a4ad2db000000b0029ac522e7d5so8015428oos.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 16:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBZ7aoMvUD8s7N/PZG2Y6gFL3K1taSpIg3oUNZ7k3mA=;
 b=RosF+ZBNcuJyAMksKX9NbMNxFEUAlJJtq98ZaUzlaIAWJWxvHsJEGcO6lTbVvVBLeH
 wZUeIOMD81enh6OWkGkEqyS3+y+jePLpfVFXuH+sekGcw8TOQEsGXVwXzbonMuPSq7SY
 3CXd79nYqqNr0UfyMKbrnZT5FtiZZH80X9J/vIojCGHvRElIuEWOlvnBU8lC06tiLrXJ
 1+TzsxFWN50V0ct4uwUJzYEmndF72V88A4qFh379xaJVL+UMIK1ffgqQifQhckweI8Fl
 QBS1Fa5lXlIzNP5L/678xpaG4+lFP1ltsVd3KKIF2NiOJI/oMdaC2+4LZAQ/dqZtjfTM
 rTCg==
X-Gm-Message-State: AOAM5336GqbYjJTJyzlc86GSfBJJnv+ddGOSLDmXaa0JtuKPWUj60d5v
 OYA6yTicg1OPXd8Ip58MG8NsI91KSuB/CiqEnB0t4xhtC+ruuuyNJZeym6KO4sJQ3rg0+s+PSXf
 tMD5yXZTzMoJlRQg=
X-Received: by 2002:a05:6830:1e4d:: with SMTP id
 e13mr348980otj.377.1633129491743; 
 Fri, 01 Oct 2021 16:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/xfBtqYBCLP1ztz9o/+dAWS0SS/PQUz+TH3POCky4+NUrP+rZfXej+wxMKwPCDwp0PW+Ctw==
X-Received: by 2002:a05:6830:1e4d:: with SMTP id
 e13mr348957otj.377.1633129491521; 
 Fri, 01 Oct 2021 16:04:51 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id s189sm827274oif.14.2021.10.01.16.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 16:04:51 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:04:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 9/9] vfio: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <20211001170450.0a46c4a0.alex.williamson@redhat.com>
In-Reply-To: <20210920230202.1439-10-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-10-longpeng2@huawei.com>
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sep 2021 07:02:02 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> In migration resume phase, all unmasked msix vectors need to be
> setup when load the VF state. However, the setup operation would

s/load/loading/

> take longer if the VM has more VFs and each VF has more unmasked
> vectors.
> 
> The hot spot is kvm_irqchip_commit_routes, it'll scan and update
> all irqfds that already assigned each invocation, so more vectors

s/that/that are/

> means need more time to process them.
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

s/commit/committing/

> routes is cached in kvm_state, we commit them first and then bind

s/is/are/

> irqfd for each vector.
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
> The optimition can be applied to msi type too.

s/optimition/optimization/

> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 2de1cc5425..b26129bddf 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -513,11 +513,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
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
> @@ -579,8 +581,7 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>      }
>  }
>  
> -/* TODO: invoked when enclabe msi/msix vectors */
> -static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
> +static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
>  {
>      int i;
>      VFIOMSIVector *vector;
> @@ -610,6 +611,9 @@ static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev
>  
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
> +    PCIDevice *pdev = &vdev->pdev;
> +    int ret;
> +
>      vfio_disable_interrupts(vdev);
>  
>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
> @@ -632,11 +636,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>      vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
>      vfio_msix_vector_release(&vdev->pdev, 0);
>  
> -    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> -                                  vfio_msix_vector_release, NULL)) {

A comment would be useful here, maybe something like:

    /*
     * Setting vector notifiers triggers synchronous vector-use
     * callbacks for each active vector.  Deferring to commit the KVM
     * routes once rather than per vector provides a substantial
     * performance improvement.
     */

> +    vdev->defer_kvm_irq_routing = true;
> +
> +    ret = msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> +                                    vfio_msix_vector_release, NULL);
> +    if (ret < 0) {
>          error_report("vfio: msix_set_vector_notifiers failed");
> +    } else if (!pdev->msix_function_masked) {
> +        vfio_commit_kvm_msi_virq(vdev);
> +        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);

Couldn't we also optimize the do_use/release on vector 0 above to avoid
this gratuitous disable here?  We only want to make sure MSIX is always
enabled on the device when we exit this function, so maybe that code
becomes an "else" branch below?

> +        ret = vfio_enable_vectors(vdev, true);
> +        if (ret) {
> +            error_report("vfio: failed to enable vectors, %d", ret);
> +        }
>      }
>  
> +    vdev->defer_kvm_irq_routing = false;
>      trace_vfio_msix_enable(vdev->vbasedev.name);
>  }
>  
> @@ -645,6 +660,7 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
>      int ret, i;
>  
>      vfio_disable_interrupts(vdev);
> +    vdev->defer_kvm_irq_routing = true;
>  
>      vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
>  retry:
> @@ -671,6 +687,8 @@ retry:
>          vfio_add_kvm_msi_virq(vdev, vector, i, false);
>      }
>  
> +    vfio_commit_kvm_msi_virq(vdev);
> +
>      /* Set interrupt type prior to possible interrupts */
>      vdev->interrupt = VFIO_INT_MSI;
>  
> @@ -697,9 +715,11 @@ retry:
>           */
>          error_report("vfio: Error: Failed to enable MSI");
>  
> +        vdev->defer_kvm_irq_routing = false;
>          return;
>      }
>  
> +    vdev->defer_kvm_irq_routing = false;

Why wouldn't we clear the flag in vfio_commit_kvm_msi_virq()?  It
almost feels like there should be a vfio_prepare_kvm_msi_virq_batch()
that enables the flag and an unconditional
vfio_commit_kvm_msi_virq_batch() that clears the flag and decides if
further work is necessary.  Thanks,

Alex

>      trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
>  }
>  


