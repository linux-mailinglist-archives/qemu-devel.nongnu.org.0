Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02B158220
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 19:15:34 +0100 (CET)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Dan-0007ww-Rd
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 13:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1j1DZl-0007Gi-2v
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:14:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1j1DZi-0004X5-Ej
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:14:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54505
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1j1DZi-0004WB-AC
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 13:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581358465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khuObitL4XuQwUMmoNRnu5mV9DmcmBLuMvJ7cCgM/PU=;
 b=iHwCPhO7MRQNVTLFi7yieTBH6dI286Q7VcD9tFcn0yVbbE9jNiKExWf61xSkEVXyPrD726
 amJik8kDlfdP6QLRpD6kER3JRbyXc/PuCrrHoZKUi+Yiq2k3Pafqn6kEZwEdkI2W7+kOWu
 i5f/m25HcRjJOmR9WmBdX6NqC71+9dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-3216TZRPPkK0wt9tkijSmw-1; Mon, 10 Feb 2020 13:14:20 -0500
X-MC-Unique: 3216TZRPPkK0wt9tkijSmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB6968010C7;
 Mon, 10 Feb 2020 18:14:17 +0000 (UTC)
Received: from x1.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4890A19C70;
 Mon, 10 Feb 2020 18:14:16 +0000 (UTC)
Date: Mon, 10 Feb 2020 11:14:15 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v12 Kernel 7/7] vfio: Selective dirty page tracking if
 IOMMU backed device pins pages
Message-ID: <20200210111415.10952642@x1.home>
In-Reply-To: <1581104554-10704-8-git-send-email-kwankhede@nvidia.com>
References: <1581104554-10704-1-git-send-email-kwankhede@nvidia.com>
 <1581104554-10704-8-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 cjia@nvidia.com, kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Feb 2020 01:12:34 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Added a check such that only singleton IOMMU groups can pin pages.
> From the point when vendor driver pins any pages, consider IOMMU group
> dirty page scope to be limited to pinned pages.
> 
> To optimize to avoid walking list often, added flag
> pinned_page_dirty_scope to indicate if all of the vfio_groups for each
> vfio_domain in the domain_list dirty page scope is limited to pinned
> pages. This flag is updated on first pinned pages request for that IOMMU
> group and on attaching/detaching group.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  drivers/vfio/vfio.c             | 13 +++++++-
>  drivers/vfio/vfio_iommu_type1.c | 72 +++++++++++++++++++++++++++++++++++++++--
>  include/linux/vfio.h            |  4 ++-
>  3 files changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index c8482624ca34..a941c860b440 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -87,6 +87,7 @@ struct vfio_group {
>  	bool				noiommu;
>  	struct kvm			*kvm;
>  	struct blocking_notifier_head	notifier;
> +	bool				is_singleton;

There's already a hole in the structure alignment under noiommu, we can
add this there an avoid actually increasing the structure size.

>  };
>  
>  struct vfio_device {
> @@ -838,6 +839,12 @@ int vfio_add_group_dev(struct device *dev,
>  		return PTR_ERR(device);
>  	}
>  
> +	mutex_lock(&group->device_lock);
> +	group->is_singleton = false;
> +	if (list_is_singular(&group->device_list))
> +		group->is_singleton = true;
> +	mutex_unlock(&group->device_lock);
> +

vfio_create_group() should set the initial value of is_singleton,
vfio_group_create_device() and vfio_device_release() should be where
it's modified.  It might be easier to simply have a device counter on
the group that gets incremented and decremented where is_singleton is
just a macro or alias for counter == 1.

>  	/*
>  	 * Drop all but the vfio_device reference.  The vfio_device holds
>  	 * a reference to the vfio_group, which holds a reference to the
> @@ -1895,6 +1902,9 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>  	if (!group)
>  		return -ENODEV;
>  
> +	if (!group->is_singleton)
> +		return -EINVAL;
> +
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
>  		goto err_pin_pages;
> @@ -1902,7 +1912,8 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>  	container = group->container;
>  	driver = container->iommu_driver;
>  	if (likely(driver && driver->ops->pin_pages))
> -		ret = driver->ops->pin_pages(container->iommu_data, user_pfn,
> +		ret = driver->ops->pin_pages(container->iommu_data,
> +					     group->iommu_group, user_pfn,
>  					     npage, prot, phys_pfn);
>  	else
>  		ret = -ENOTTY;


Don't we also need to prevent a device from being added to a singleton
group that has had pinned pages?  I think the group would set the flag
here (on success), clear it in __vfio_group_unset_container() and
perhaps vfio_group_create_device() would error if the group has pinned
pages.

> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index f748a3dbe9f9..a787a2bcd757 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -71,6 +71,7 @@ struct vfio_iommu {
>  	bool			v2;
>  	bool			nesting;
>  	bool			dirty_page_tracking;
> +	bool			pinned_page_dirty_scope;
>  };
>  
>  struct vfio_domain {
> @@ -98,6 +99,7 @@ struct vfio_group {
>  	struct iommu_group	*iommu_group;
>  	struct list_head	next;
>  	bool			mdev_group;	/* An mdev group */
> +	bool			has_pinned_pages;
>  };
>  
>  struct vfio_iova {
> @@ -129,6 +131,10 @@ struct vfio_regions {
>  static int put_pfn(unsigned long pfn, int prot);
>  static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu);
>  
> +static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
> +					       struct iommu_group *iommu_group);
> +
> +static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu);
>  /*
>   * This code handles mapping and unmapping of user data buffers
>   * into DMA'ble space using the IOMMU
> @@ -580,11 +586,13 @@ static int vfio_unpin_page_external(struct vfio_iommu *iommu,
>  }
>  
>  static int vfio_iommu_type1_pin_pages(void *iommu_data,
> +				      struct iommu_group *iommu_group,
>  				      unsigned long *user_pfn,
>  				      int npage, int prot,
>  				      unsigned long *phys_pfn)
>  {
>  	struct vfio_iommu *iommu = iommu_data;
> +	struct vfio_group *group;
>  	int i, j, ret;
>  	unsigned long remote_vaddr;
>  	struct vfio_dma *dma;
> @@ -661,8 +669,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>  			}
>  		}
>  	}
> -
>  	ret = i;
> +
> +	group = vfio_iommu_find_iommu_group(iommu, iommu_group);
> +	if (!group->has_pinned_pages) {
> +		group->has_pinned_pages = true;
> +		update_pinned_page_dirty_scope(iommu);
> +	}

If vfio.c were tracking whether a group had pinned pages it could pass
that as an arg to this function and the entire group lookup and dirty
scope processing could be conditional on whether vfio tells us this
group already has pinned pages in the past.  Thanks,

Alex

> +
>  	goto pin_done;
>  
>  pin_unwind:
> @@ -938,8 +952,11 @@ static int vfio_iova_dirty_bitmap(struct vfio_iommu *iommu, dma_addr_t iova,
>  		unsigned int npages = 0, shift = 0;
>  		unsigned char temp = 0;
>  
> -		/* mark all pages dirty if all pages are pinned and mapped. */
> -		if (dma->iommu_mapped) {
> +		/*
> +		 * mark all pages dirty if any IOMMU capable device is not able
> +		 * to report dirty pages and all pages are pinned and mapped.
> +		 */
> +		if (!iommu->pinned_page_dirty_scope && dma->iommu_mapped) {
>  			iova_limit = min(dma->iova + dma->size, iova + size);
>  			npages = iova_limit/pgsize;
>  			bitmap_set(dma->bitmap, 0, npages);
> @@ -1479,6 +1496,51 @@ static struct vfio_group *find_iommu_group(struct vfio_domain *domain,
>  	return NULL;
>  }
>  
> +static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
> +					       struct iommu_group *iommu_group)
> +{
> +	struct vfio_domain *domain;
> +	struct vfio_group *group = NULL;
> +
> +	list_for_each_entry(domain, &iommu->domain_list, next) {
> +		group = find_iommu_group(domain, iommu_group);
> +		if (group)
> +			return group;
> +	}
> +
> +	if (iommu->external_domain)
> +		group = find_iommu_group(iommu->external_domain, iommu_group);
> +
> +	return group;
> +}
> +
> +static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu)
> +{
> +	struct vfio_domain *domain;
> +	struct vfio_group *group;
> +
> +	list_for_each_entry(domain, &iommu->domain_list, next) {
> +		list_for_each_entry(group, &domain->group_list, next) {
> +			if (!group->has_pinned_pages) {
> +				iommu->pinned_page_dirty_scope = false;
> +				return;
> +			}
> +		}
> +	}
> +
> +	if (iommu->external_domain) {
> +		domain = iommu->external_domain;
> +		list_for_each_entry(group, &domain->group_list, next) {
> +			if (!group->has_pinned_pages) {
> +				iommu->pinned_page_dirty_scope = false;
> +				return;
> +			}
> +		}
> +	}
> +
> +	iommu->pinned_page_dirty_scope = true;
> +}
> +
>  static bool vfio_iommu_has_sw_msi(struct list_head *group_resv_regions,
>  				  phys_addr_t *base)
>  {
> @@ -1885,6 +1947,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  
>  			list_add(&group->next,
>  				 &iommu->external_domain->group_list);
> +			update_pinned_page_dirty_scope(iommu);
>  			mutex_unlock(&iommu->lock);
>  
>  			return 0;
> @@ -2007,6 +2070,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  done:
>  	/* Delete the old one and insert new iova list */
>  	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
> +	update_pinned_page_dirty_scope(iommu);
>  	mutex_unlock(&iommu->lock);
>  	vfio_iommu_resv_free(&group_resv_regions);
>  
> @@ -2021,6 +2085,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  out_free:
>  	kfree(domain);
>  	kfree(group);
> +	update_pinned_page_dirty_scope(iommu);
>  	mutex_unlock(&iommu->lock);
>  	return ret;
>  }
> @@ -2225,6 +2290,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
>  		vfio_iommu_iova_free(&iova_copy);
>  
>  detach_group_done:
> +	update_pinned_page_dirty_scope(iommu);
>  	mutex_unlock(&iommu->lock);
>  }
>  
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e42a711a2800..da29802d6276 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -72,7 +72,9 @@ struct vfio_iommu_driver_ops {
>  					struct iommu_group *group);
>  	void		(*detach_group)(void *iommu_data,
>  					struct iommu_group *group);
> -	int		(*pin_pages)(void *iommu_data, unsigned long *user_pfn,
> +	int		(*pin_pages)(void *iommu_data,
> +				     struct iommu_group *group,
> +				     unsigned long *user_pfn,
>  				     int npage, int prot,
>  				     unsigned long *phys_pfn);
>  	int		(*unpin_pages)(void *iommu_data,


