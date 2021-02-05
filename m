Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C131036A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 04:19:00 +0100 (CET)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7re8-0004wb-0k
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 22:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l7rcH-0003pI-Ox
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l7rcE-00010k-28
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612495015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IcGkEz27hNZl6kjS7W7xgoeSQK3mU+V0qKilBnoFsk=;
 b=Og0c2nyCDu7fA4OjtuNZwqkzeBDT+krk3sf6Y8vJaaqq/Bg6n+NoUtiuLCqGAsEO4Z5A9+
 1h6qmsNP5aeYWH08HlUgt3QcLB7JeaD5Gf6t2ujPNnalQyr7m5FGGhHZtzUvZMrbkQDHeH
 LCjj9htEG8IDfr/Vy4FZegGSiaCCCAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-pQraMoVxPz2E57TFKAJuWw-1; Thu, 04 Feb 2021 22:16:53 -0500
X-MC-Unique: pQraMoVxPz2E57TFKAJuWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFE281005501
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 03:16:52 +0000 (UTC)
Received: from [10.72.12.112] (ovpn-12-112.pek2.redhat.com [10.72.12.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1F6660937;
 Fri,  5 Feb 2021 03:16:40 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210204191228.187550-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
Date: Fri, 5 Feb 2021 11:16:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204191228.187550-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/5 上午3:12, Peter Xu wrote:
> Previous work on dev-iotlb message broke vhost on either SMMU


Have a quick git grep and it looks to me v3 support ATS and have command 
for device iotlb (ATC) invalidation.


> or virtio-iommu
> since dev-iotlb (or PCIe ATS)


We may need to add this in the future.


> is not yet supported for those archs.


Rethink about this, it looks to me the point is that we should make 
vhost work when ATS is disabled like what ATS spec defined:

"""

ATS is enabled through a new Capability and associated configuration 
structure.  To enable 15 ATS, software must detect this Capability and 
enable the Function to issue ATS TLP.  If a Function is not enabled, the 
Function is required not to issue ATS Translation Requests and is 
required to issue all DMA Read and Write Requests with the TLP AT field 
set to “untranslated.”

"""

Maybe we can add this in the commit log.


>
> An initial idea is that we can let IOMMU to export this information to vhost so
> that vhost would know whether the vIOMMU would support dev-iotlb, then vhost
> can conditionally register to dev-iotlb or the old iotlb way.  We can work
> based on some previous patch to introduce PCIIOMMUOps as Yi Liu proposed [1].
>
> However it's not as easy as I thought since vhost_iommu_region_add() does not
> have a PCIDevice context at all since it's completely a backend.  It seems
> non-trivial to pass over a PCI device to the backend during init.  E.g. when
> the IOMMU notifier registered hdev->vdev is still NULL.
>
> To make the fix smaller and easier, this patch goes the other way to leverage
> the flag_changed() hook of vIOMMUs so that SMMU and virtio-iommu can trap the
> dev-iotlb registration and fail it.  Then vhost could try the fallback solution
> as using UNMAP invalidation for it's translations.
>
> [1] https://lore.kernel.org/qemu-devel/1599735398-6829-4-git-send-email-yi.l.liu@intel.com/
>
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   hw/arm/smmuv3.c          |  5 +++++
>   hw/virtio/vhost.c        | 13 +++++++++++--
>   hw/virtio/virtio-iommu.c |  5 +++++
>   3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 98b99d4fe8e..bd1f97000d9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1497,6 +1497,11 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>       SMMUv3State *s3 = sdev->smmu;
>       SMMUState *s = &(s3->smmu_state);
>   
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "SMMUv3 does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>       if (new & IOMMU_NOTIFIER_MAP) {
>           error_setg(errp,
>                      "device %02x.%02x.%x requires iommu MAP notifier which is "
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 28c7d781721..6e17d631f77 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -704,6 +704,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>       Int128 end;
>       int iommu_idx;
>       IOMMUMemoryRegion *iommu_mr;
> +    int ret;
>   
>       if (!memory_region_is_iommu(section->mr)) {
>           return;
> @@ -726,8 +727,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>       iommu->iommu_offset = section->offset_within_address_space -
>                             section->offset_within_region;
>       iommu->hdev = dev;
> -    memory_region_register_iommu_notifier(section->mr, &iommu->n,
> -                                          &error_fatal);
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    if (ret) {
> +        /*
> +         * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
> +         * UNMAP legacy message
> +         */
> +        iommu->n.notifier_flags = IOMMU_NOTIFIER_UNMAP;
> +        memory_region_register_iommu_notifier(section->mr, &iommu->n,
> +                                              &error_fatal);
> +    }
>       QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
>       /* TODO: can replay help performance here? */
>   }
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 6b9ef7f6b2b..c2883a2f6c8 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -893,6 +893,11 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
>                                               IOMMUNotifierFlag new,
>                                               Error **errp)
>   {
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "Virtio-iommu does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>       if (old == IOMMU_NOTIFIER_NONE) {
>           trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
>       } else if (new == IOMMU_NOTIFIER_NONE) {


Patch looks good. I wonder whether we should fix intel when ATS is disabled.

Thanks


