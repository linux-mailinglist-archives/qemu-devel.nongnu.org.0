Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25935856B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:58:18 +0200 (CEST)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVAm-0000jB-TA
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUV9k-0000A2-2f
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUV9h-0005QR-GI
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617890228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAudoOi43np3P4X/YD8NU7B80CeYlNf0J9l3yjLi4T8=;
 b=ZbXcX4zU2SIHScQ7AEN2lbhfdhvEORtL9J9qb8CSf0UIY2hoKcm8HMx+LlW0M3Kg4lU/wi
 0SS2lCKV3dH/vni/FqF/jaCabmhymhl20dcJTa5YsY5oWSw1RSI0DXRIzctHEe5ImnjwcR
 Wh+bfTTiVsXBzqALQ8e/FOCBH+55jZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-yaDh5h7aOiqdeP4Dz98Iag-1; Thu, 08 Apr 2021 09:57:05 -0400
X-MC-Unique: yaDh5h7aOiqdeP4Dz98Iag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6211A83DD22;
 Thu,  8 Apr 2021 13:57:02 +0000 (UTC)
Received: from [10.36.114.172] (ovpn-114-172.ams2.redhat.com [10.36.114.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E8D60BF1;
 Thu,  8 Apr 2021 13:56:55 +0000 (UTC)
Subject: Re: [RFC PATCH 2/3] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-3-jiangkunkun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c6ee5401-ccb6-1259-f7db-c3f97ff39256@redhat.com>
Date: Thu, 8 Apr 2021 15:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210219094230.231-3-jiangkunkun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 2/19/21 10:42 AM, Kunkun Jiang wrote:
> On Intel, the DMA mapped through the host single stage. Instead
> we set up the stage 2 and stage 1 separately in nested mode as there
> is no "Caching Mode".

You need to rewrite the above sentences, Missing ARM and also the 1st
sentences misses a verb.
> 
> Legacy vfio_listener_log_sync cannot be used in nested stage as we
> don't need to pay close attention to stage 1 mapping. This patch adds
> vfio_prereg_listener_log_sync to mark dirty pages in nested mode.
> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/common.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 7c50905856..af333e0dee 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1216,6 +1216,22 @@ static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
>                         int128_get64(section->size), ram_addr);
>  }
>  
> +static void vfio_prereg_listener_log_sync(MemoryListener *listener,
> +                                          MemoryRegionSection *section)
> +{
> +    VFIOContainer *container =
> +        container_of(listener, VFIOContainer, prereg_listener);
> +
> +    if (!memory_region_is_ram(section->mr) ||
> +        !container->dirty_pages_supported) {
> +        return;
> +    }
> +
> +    if (vfio_devices_all_saving(container)) {
I fail to see where is this defined?
> +        vfio_dma_sync_ram_section_dirty_bitmap(container, section);
> +    }
> +}
> +
>  typedef struct {
>      IOMMUNotifier n;
>      VFIOGuestIOMMU *giommu;
> @@ -1260,6 +1276,14 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>      if (memory_region_is_iommu(section->mr)) {
>          VFIOGuestIOMMU *giommu;
>  
> +        /*
> +         * In nested mode, stage 2 and stage 1 are set up separately. We
> +         * only need to focus on stage 2 mapping when marking dirty pages.
> +         */
> +        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
> +            return 0;
> +        }
> +
>          QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
>              if (MEMORY_REGION(giommu->iommu) == section->mr &&
>                  giommu->n.start == section->offset_within_region) {
> @@ -1312,6 +1336,7 @@ static const MemoryListener vfio_memory_listener = {
>  static MemoryListener vfio_memory_prereg_listener = {
>      .region_add = vfio_prereg_listener_region_add,
>      .region_del = vfio_prereg_listener_region_del,
> +    .log_sync = vfio_prereg_listener_log_sync,
>  };
>  
>  static void vfio_listener_release(VFIOContainer *container)
> 
Thanks

Eric


