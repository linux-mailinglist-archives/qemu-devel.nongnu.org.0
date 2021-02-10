Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01993160AB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:13:20 +0100 (CET)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9kch-0001mA-VS
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kaz-0001D4-96
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kan-0005dG-7m
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612944678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcsbE0qqBQawtHjLhHXAI98Ny2HDQeZwk9EAX3zBoy0=;
 b=jP7CmEF9Tow3rgYnvrxTNqp1hiJYcOx3R0aw5epLpPb4rvlf2kfGQGkplcSwHCqMVjqoDY
 MUA3/wIijAeKm8M+i+sjyskEUyOo+65ER+EkICeHDXyZV5VoS5qSUZuzK+xLuoDr163M7l
 vxtjrtH53MH/FKuGJdymIgzwvvnnrYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-ILApvVUbNzemJlHqHxpvHA-1; Wed, 10 Feb 2021 03:11:17 -0500
X-MC-Unique: ILApvVUbNzemJlHqHxpvHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECAD1005501;
 Wed, 10 Feb 2021 08:11:15 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5235A6F7EE;
 Wed, 10 Feb 2021 08:10:52 +0000 (UTC)
Subject: Re: [PATCH 1/2] vfio: Do not register any
 IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-2-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09d20dd5-fa58-b34a-094d-2de89654fa37@redhat.com>
Date: Wed, 10 Feb 2021 16:10:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-2-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/10 上午5:32, Eric Auger wrote:
> In an attempt to fix smmu/virtio-iommu - vhost regression, commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> broke virtio-iommu integration. This is due to the fact VFIO registers
> IOMMU_NOTIFIER_ALL notifiers, which includes IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> and this latter now is rejected by the virtio-iommu. As a consequence,
> the registration fails. VHOST behaves like a device with an ATC cache. The
> VFIO device does not support this scheme yet.
>
> Let's register only legacy MAP and UNMAP notifiers.
>
> Fixes: 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/vfio/common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..a50b10c801 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -787,7 +787,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>                                                          MEMTXATTRS_UNSPECIFIED);
>           iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
> -                            IOMMU_NOTIFIER_ALL,
> +                            IOMMU_NOTIFIER_IOTLB_EVENTS,
>                               section->offset_within_region,
>                               int128_get64(llend),
>                               iommu_idx);


Acked-by: Jason Wang <jasowang@redhat.com>



