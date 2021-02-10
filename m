Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D513F3160BE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:15:11 +0100 (CET)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9keU-0003j9-Si
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kbs-0001lo-3Q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9kbX-00061P-Pl
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612944726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLRLNSpUF/elkGraWlbQz/zxrO+y7lT4d5gYdR0Wm2k=;
 b=aqw2AxerZzFHpn1EcxnEfq+zQSLiXx40pEaSofAmGSK4YwjUua3lLlhc5j+SkljwaS5+bU
 GXP6sTE/+lrLcB/oGHZ8U2YQwWa0d+Xwthgr4NWfKBleC7qad/fwtrEq+EZt7JGdxtI6gF
 6iwawcHIkslYnMRZQyHh5Wd6iiE1NbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-NyQrV421P8m3oglkxSKiEg-1; Wed, 10 Feb 2021 03:12:04 -0500
X-MC-Unique: NyQrV421P8m3oglkxSKiEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B9CE91275;
 Wed, 10 Feb 2021 08:12:03 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09B9362691;
 Wed, 10 Feb 2021 08:11:39 +0000 (UTC)
Subject: Re: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-3-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c5b50bba-5928-104f-d8be-5ac07369ea1b@redhat.com>
Date: Wed, 10 Feb 2021 16:11:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-3-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Previous work on dev-iotlb message broke spapr_iommu/vhost integration
> as it did for SMMU and virtio-iommu. The spapr_iommu currently
> only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
> VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
> and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
> spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> registration.
>
> Reported-by: Peter Xu <peterx@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/ppc/spapr_iommu.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 30352df00e..24537ffcbd 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
>   {
>       struct SpaprTceTable *tbl = container_of(iommu, SpaprTceTable, iommu);
>   
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "spart_tce does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>       if (old == IOMMU_NOTIFIER_NONE && new != IOMMU_NOTIFIER_NONE) {
>           spapr_tce_set_need_vfio(tbl, true);
>       } else if (old != IOMMU_NOTIFIER_NONE && new == IOMMU_NOTIFIER_NONE) {


