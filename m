Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF911DAFB8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 12:09:41 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbLfQ-0005Il-Hc
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 06:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jbLeW-0004eM-8d
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:08:44 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59909
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jbLeV-0005pR-GN
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589969322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcWON8E7vVA9RaONAcWnZZZmaga+7CkifeGerQ7VIUg=;
 b=VvQzN1aDnRYk1fSLVrOfESkoZALaathS62JM1LsVYce9ACbWYaftB1nW5xLFBtDdsvqru+
 gyXSqoEHeQEer98h4bj5/lI2icSehKtPzVn4DNcNOaBp5BRxa2rG6phT3vTw6ISmJeiX76
 3/MHO3wB78JoNebyIzJsHo/LDE2ljSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-CQeOVtbiMc2dbdFNIFsnPQ-1; Wed, 20 May 2020 06:08:39 -0400
X-MC-Unique: CQeOVtbiMc2dbdFNIFsnPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C41A6800688;
 Wed, 20 May 2020 10:08:35 +0000 (UTC)
Received: from gondolin (ovpn-113-5.ams2.redhat.com [10.36.113.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6091943D;
 Wed, 20 May 2020 10:08:28 +0000 (UTC)
Date: Wed, 20 May 2020 12:08:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH Kernel v22 3/8] vfio iommu: Cache pgsize_bitmap in
 struct vfio_iommu
Message-ID: <20200520120825.7d8144ba.cohuck@redhat.com>
In-Reply-To: <1589781397-28368-4-git-send-email-kwankhede@nvidia.com>
References: <1589781397-28368-1-git-send-email-kwankhede@nvidia.com>
 <1589781397-28368-4-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, cjia@nvidia.com,
 kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 alex.williamson@redhat.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 May 2020 11:26:32 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Calculate and cache pgsize_bitmap when iommu->domain_list is updated
> and iommu->external_domain is set for mdev device.
> Add iommu->lock protection when cached pgsize_bitmap is accessed.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 88 +++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 39 deletions(-)
> 

(...)

> @@ -805,15 +806,14 @@ static void vfio_remove_dma(struct vfio_iommu *iommu, struct vfio_dma *dma)
>  	iommu->dma_avail++;
>  }
>  
> -static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu)
> +static void vfio_pgsize_bitmap(struct vfio_iommu *iommu)

Minor nit: I'd have renamed this function to
vfio_update_pgsize_bitmap().

>  {
>  	struct vfio_domain *domain;
> -	unsigned long bitmap = ULONG_MAX;
>  
> -	mutex_lock(&iommu->lock);
> +	iommu->pgsize_bitmap = ULONG_MAX;
> +
>  	list_for_each_entry(domain, &iommu->domain_list, next)
> -		bitmap &= domain->domain->pgsize_bitmap;
> -	mutex_unlock(&iommu->lock);
> +		iommu->pgsize_bitmap &= domain->domain->pgsize_bitmap;
>  
>  	/*
>  	 * In case the IOMMU supports page sizes smaller than PAGE_SIZE

(...)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


