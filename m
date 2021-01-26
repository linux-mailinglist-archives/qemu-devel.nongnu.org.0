Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF1304B97
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:37:54 +0100 (CET)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4W25-0007yz-HF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0j-0006yH-Hp
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0h-0003mH-NF
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611696987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8msAROHyVbSt0cYlNfVVA//kSOL7L8UBGXBIpVNpzM=;
 b=YBcLAnV7awPwk84b06uYTW6+8jyZIhPefKMoztmpbXSs08HJWmDy8Ex8edvxSue3wBPttf
 WAcj3ZuD9PcXE03qM+hr7ZrkH1ci3xREazJSHFx8heeovFbU8N+HmgAKFiV0t2EvxRsNpa
 0PgEfmWbLbQxmSbNLCX23y41MdoPzBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-RBIv0YQSNM-aixkQY35WHw-1; Tue, 26 Jan 2021 16:36:23 -0500
X-MC-Unique: RBIv0YQSNM-aixkQY35WHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D661927800;
 Tue, 26 Jan 2021 21:36:20 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E41960C5F;
 Tue, 26 Jan 2021 21:36:14 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:36:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 3/3] vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration
Message-ID: <20210126143614.175e271c@omen.home.shazbot.org>
In-Reply-To: <20201209080919.156-4-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-4-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 16:09:19 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> Different from the normal situation when the guest starts, we can
> know the max unmasked vetctor (at the beginning) after msix_load()
> in VFIO migration. So in order to avoid ineffectively disabling and

s/ineffectively/inefficiently/?  It's "effective" either way I think.

> enabling vectors repeatedly, let's allocate all needed vectors first
> and then enable these unmasked vectors one by one without disabling.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  hw/pci/msix.c         | 17 +++++++++++++++++
>  hw/vfio/pci.c         | 10 ++++++++--
>  include/hw/pci/msix.h |  2 ++
>  3 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index 67e34f34d6..bf291d3ff8 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -557,6 +557,23 @@ unsigned int msix_nr_vectors_allocated(const PCIDevice *dev)
>      return dev->msix_entries_nr;
>  }
>  
> +int msix_get_max_unmasked_vector(PCIDevice *dev)
> +{
> +    int max_unmasked_vector = -1;
> +    int vector;
> +
> +    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> +        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +        for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +            if (!msix_is_masked(dev, vector)) {
> +                max_unmasked_vector = vector;
> +            }
> +        }
> +    }
> +
> +    return max_unmasked_vector;
> +}

Comments from QEMU PCI folks?

> +
>  static int msix_set_notifier_for_vector(PCIDevice *dev, unsigned int vector)
>  {
>      MSIMessage msg;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 51dc373695..e755ed2514 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -568,6 +568,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>  
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
> +    int max_unmasked_vector = msix_get_max_unmasked_vector(&vdev->pdev);
> +    unsigned int used_vector = MAX(max_unmasked_vector, 0);
> +

The above PCI function could also be done inline here pretty easily too:

unsigned int nr, max_vec = 0;

if (!msix_masked(&vdev->pdev))
    for (nr = 0; nr < msix_nr_vectors_allocated(&vdev->pdev); nr++) {
        if (!msix_is_masked(&vdev->pdev, nr)) {
            max_vec = nr;
        }
    }
}

It's a bit cleaner than the msix utility function, imo. 

>      vfio_disable_interrupts(vdev);
>  
>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
> @@ -586,9 +589,12 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>       * triggering to userspace, then immediately release the vector, leaving
>       * the physical device with no vectors enabled, but MSI-X enabled, just
>       * like the guest view.
> +     * If there are unmasked vectors (such as in migration) which will be
> +     * enabled soon, we can allocate them here to avoid ineffectively disabling
> +     * and enabling vectors repeatedly later.

It just happens that migration triggers this usage model where the
MSI-X enable bit is set with vectors unmasked in the vector table, but
this is not unique to migration, guests can follow this pattern as well.
Has this been tested with a variety of guests?  Logically it seems
correct, but always good to prove so.  Thanks,

Alex

>       */
> -    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> -    vfio_msix_vector_release(&vdev->pdev, 0);
> +    vfio_msix_vector_do_use(&vdev->pdev, used_vector, NULL, NULL);
> +    vfio_msix_vector_release(&vdev->pdev, used_vector);
>  
>      if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
>                                    vfio_msix_vector_release, NULL)) {
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c739..4bfb463fa6 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -23,6 +23,8 @@ void msix_uninit_exclusive_bar(PCIDevice *dev);
>  
>  unsigned int msix_nr_vectors_allocated(const PCIDevice *dev);
>  
> +int msix_get_max_unmasked_vector(PCIDevice *dev);
> +
>  void msix_save(PCIDevice *dev, QEMUFile *f);
>  void msix_load(PCIDevice *dev, QEMUFile *f);
>  


