Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A618FF94
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 21:32:33 +0100 (CET)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGTkO-0006qQ-R7
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 16:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jGTis-0005cD-PK
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jGTir-0000Yz-JE
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:30:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52517)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jGTir-0000Yq-Fx
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584995457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlIULzxpZnyUqrzlDG0sOgiICKn19mY66jy1Bqo/I1Y=;
 b=Pf1N8tvjHPg9R1/UTP9YWrd9Vsne3aw5v+I9CocRBlwTcb/hn5pO/piRDjhPSXuKgQy5GD
 Q8mB8+rKyUZKDV+++Qm1eDShitXPYkS1dNa+nOx8Oybv8FpENu7oSJdQJmI2dgbEvQi4r9
 6oTLXmZHDkvm3V6YiS8ht9eVd/TeMAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-G0bunP3LPU6Vu93X0USvQQ-1; Mon, 23 Mar 2020 16:30:53 -0400
X-MC-Unique: G0bunP3LPU6Vu93X0USvQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A692107ACCD;
 Mon, 23 Mar 2020 20:30:50 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD48D9496C;
 Mon, 23 Mar 2020 20:30:42 +0000 (UTC)
Subject: Re: [PATCH v15 Kernel 2/7] vfio iommu: Remove atomicity of ref_count
 of pinned pages
To: Kirti Wankhede <kwankhede@nvidia.com>, alex.williamson@redhat.com,
 cjia@nvidia.com
References: <1584649004-8285-1-git-send-email-kwankhede@nvidia.com>
 <1584649004-8285-3-git-send-email-kwankhede@nvidia.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b2e791ee-e55a-3142-119c-c2f4300fabd5@redhat.com>
Date: Mon, 23 Mar 2020 21:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1584649004-8285-3-git-send-email-kwankhede@nvidia.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, kvm@vger.kernel.org, eskultet@redhat.com,
 ziye.yang@intel.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru, eauger@redhat.com,
 felipe@nutanix.com, jonathan.davies@nutanix.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kirti,

On 3/19/20 9:16 PM, Kirti Wankhede wrote:
> vfio_pfn.ref_count is always updated by holding iommu->lock, using atomic
> variable is overkill.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  drivers/vfio/vfio_iommu_type1.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 9fdfae1cb17a..70aeab921d0f 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -112,7 +112,7 @@ struct vfio_pfn {
>  	struct rb_node		node;
>  	dma_addr_t		iova;		/* Device address */
>  	unsigned long		pfn;		/* Host pfn */
> -	atomic_t		ref_count;
> +	unsigned int		ref_count;
>  };
>  
>  struct vfio_regions {
> @@ -233,7 +233,7 @@ static int vfio_add_to_pfn_list(struct vfio_dma *dma, dma_addr_t iova,
>  
>  	vpfn->iova = iova;
>  	vpfn->pfn = pfn;
> -	atomic_set(&vpfn->ref_count, 1);
> +	vpfn->ref_count = 1;
>  	vfio_link_pfn(dma, vpfn);
>  	return 0;
>  }
> @@ -251,7 +251,7 @@ static struct vfio_pfn *vfio_iova_get_vfio_pfn(struct vfio_dma *dma,
>  	struct vfio_pfn *vpfn = vfio_find_vpfn(dma, iova);
>  
>  	if (vpfn)
> -		atomic_inc(&vpfn->ref_count);
> +		vpfn->ref_count++;
>  	return vpfn;
>  }
>  
> @@ -259,7 +259,8 @@ static int vfio_iova_put_vfio_pfn(struct vfio_dma *dma, struct vfio_pfn *vpfn)
>  {
>  	int ret = 0;
>  
> -	if (atomic_dec_and_test(&vpfn->ref_count)) {
> +	vpfn->ref_count--;
> +	if (!vpfn->ref_count) {
>  		ret = put_pfn(vpfn->pfn, dma->prot);
>  		vfio_remove_from_pfn_list(dma, vpfn);
>  	}
> 


