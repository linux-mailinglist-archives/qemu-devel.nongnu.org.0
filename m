Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42932AC4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:34:45 +0100 (CET)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCfE-0004hF-A9
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCXa-00038N-OA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCXY-00053V-2o
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614720406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN+pYTFwW0AI998xEFeXLntBCHMnJo3GWrA7byw4bEg=;
 b=b0sFBspro6n6gz2XBknfcv+3JhbvjyGX1vpoD/jBrAesaz/Etb8r9W2mPkltgVGvPO5bQ8
 Qm+osyiH7S1M+8tXkmA0Z4zlrcQOiydiZARh7yhMhOAcF6ycP6nebwCqpxAxm6dqUtpTDi
 roM1x1ckAmXl3VsBQqfHvHKNlQI+8U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-2AWfUDhjNgm-LMY-ffS8Bg-1; Tue, 02 Mar 2021 16:26:42 -0500
X-MC-Unique: 2AWfUDhjNgm-LMY-ffS8Bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E40585EE60;
 Tue,  2 Mar 2021 21:26:40 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 192246F7E6;
 Tue,  2 Mar 2021 21:26:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:26:28 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>, <mst@redhat.com>,
 marcel.apfelbaum@gmail.com
Subject: Re: [PATCH v3 3/3] vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration
Message-ID: <20210302142628.60e0ab6f@omen.home.shazbot.org>
In-Reply-To: <20210223022225.50-4-lushenming@huawei.com>
References: <20210223022225.50-1-lushenming@huawei.com>
 <20210223022225.50-4-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


MST/Marcel,

Do you have an Ack or objection to exporting msix_masked() as below?
Thanks,

Alex

On Tue, 23 Feb 2021 10:22:25 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In VFIO migration resume phase and some guest startups, there are
> already unmasked vectors in the vector table when calling
> vfio_msix_enable(). So in order to avoid inefficiently disabling
> and enabling vectors repeatedly, let's allocate all needed vectors
> first and then enable these unmasked vectors one by one without
> disabling.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  hw/pci/msix.c         |  2 +-
>  hw/vfio/pci.c         | 20 +++++++++++++++++---
>  include/hw/pci/msix.h |  1 +
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331cd0b..e057958fcd 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -131,7 +131,7 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
>      }
>  }
>  
> -static bool msix_masked(PCIDevice *dev)
> +bool msix_masked(PCIDevice *dev)
>  {
>      return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
>  }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f74be78209..088fd41926 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -569,6 +569,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>  
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
> +    PCIDevice *pdev = &vdev->pdev;
> +    unsigned int nr, max_vec = 0;
> +
>      vfio_disable_interrupts(vdev);
>  
>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
> @@ -587,11 +590,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>       * triggering to userspace, then immediately release the vector, leaving
>       * the physical device with no vectors enabled, but MSI-X enabled, just
>       * like the guest view.
> +     * If there are already unmasked vectors (in migration resume phase and
> +     * some guest startups) which will be enabled soon, we can allocate all
> +     * of them here to avoid inefficiently disabling and enabling vectors
> +     * repeatedly later.
>       */
> -    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> -    vfio_msix_vector_release(&vdev->pdev, 0);
> +    if (!msix_masked(pdev)) {
> +        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
> +            if (!msix_is_masked(pdev, nr)) {
> +                max_vec = nr;
> +            }
> +        }
> +    }
> +    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
> +    vfio_msix_vector_release(pdev, max_vec);
>  
> -    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
> +    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>                                    vfio_msix_vector_release, NULL)) {
>          error_report("vfio: msix_set_vector_notifiers failed");
>      }
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c739..b3cd88e262 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -28,6 +28,7 @@ void msix_load(PCIDevice *dev, QEMUFile *f);
>  
>  int msix_enabled(PCIDevice *dev);
>  int msix_present(PCIDevice *dev);
> +bool msix_masked(PCIDevice *dev);
>  
>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>  void msix_set_pending(PCIDevice *dev, unsigned vector);


