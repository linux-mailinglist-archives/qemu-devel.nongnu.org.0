Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80E188D4F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:37:36 +0100 (CET)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEH5r-0006u5-Nc
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1jEGxS-0004MQ-Pw
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1jEGxQ-0008Vq-C8
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:28:54 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15295)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1jEGxQ-0008MT-3m
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:28:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7116b20000>; Tue, 17 Mar 2020 11:28:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 17 Mar 2020 11:28:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 17 Mar 2020 11:28:50 -0700
Received: from [10.40.102.54] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Mar
 2020 18:28:42 +0000
Subject: Re: [PATCH v13 Kernel 7/7] vfio: Selective dirty page tracking if
 IOMMU backed device pins pages
To: Alex Williamson <alex.williamson@redhat.com>
References: <1584035607-23166-1-git-send-email-kwankhede@nvidia.com>
 <1584035607-23166-8-git-send-email-kwankhede@nvidia.com>
 <20200313144911.72e727d4@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <48f3b2b2-c066-f366-e5ff-2f39763a9463@nvidia.com>
Date: Tue, 17 Mar 2020 23:58:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313144911.72e727d4@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584469682; bh=YFWiUs44vzNSjTNHhFHG8oqaztXPsfyR6yTjYvq5vGE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=EMjo8dI1pxuVAZl8S8AMRkifNoxP3pTtx5uUbjyio1shCBO/iISBKrj5oGt0lj3ln
 kUVW+wJ9Ig5S9smC9Jah9HC+9JT3LEoLRYTU8u+0r9I8dUs39sNYuihcPWNMHCbLfW
 mA5O2a5qjQw2Z5nHBC+TkmTTV4dlWtcqnwCauRdgPNk5V4QwlihA3mosL3pEuszUm1
 10xY4YSfEjeT4X9+QAu+WWiP+PiqiK3mQJn+nEkbicZh4qMetmJfgQMlhL/Zy/k8nV
 yys4W8tBBXqXd2aTjpmlq9GrBNDFBmXYHw1M8bh0qsUmCs62Bnh8rylvyu63uirAtd
 +y4XlcPNfhhhw==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 216.228.121.64
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



On 3/14/2020 2:19 AM, Alex Williamson wrote:
> On Thu, 12 Mar 2020 23:23:27 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> Added a check such that only singleton IOMMU groups can pin pages.
>>  From the point when vendor driver pins any pages, consider IOMMU group
>> dirty page scope to be limited to pinned pages.
>>
>> To optimize to avoid walking list often, added flag
>> pinned_page_dirty_scope to indicate if all of the vfio_groups for each
>> vfio_domain in the domain_list dirty page scope is limited to pinned
>> pages. This flag is updated on first pinned pages request for that IOMMU
>> group and on attaching/detaching group.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>   drivers/vfio/vfio.c             |  9 +++++-
>>   drivers/vfio/vfio_iommu_type1.c | 72 +++++++++++++++++++++++++++++++++++++++--
>>   include/linux/vfio.h            |  4 ++-
>>   3 files changed, 80 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
>> index c8482624ca34..79108c1245a5 100644
>> --- a/drivers/vfio/vfio.c
>> +++ b/drivers/vfio/vfio.c
>> @@ -85,6 +85,7 @@ struct vfio_group {
>>   	atomic_t			opened;
>>   	wait_queue_head_t		container_q;
>>   	bool				noiommu;
>> +	unsigned int			dev_counter;
>>   	struct kvm			*kvm;
>>   	struct blocking_notifier_head	notifier;
>>   };
>> @@ -555,6 +556,7 @@ struct vfio_device *vfio_group_create_device(struct vfio_group *group,
>>   
>>   	mutex_lock(&group->device_lock);
>>   	list_add(&device->group_next, &group->device_list);
>> +	group->dev_counter++;
>>   	mutex_unlock(&group->device_lock);
>>   
>>   	return device;
>> @@ -567,6 +569,7 @@ static void vfio_device_release(struct kref *kref)
>>   	struct vfio_group *group = device->group;
>>   
>>   	list_del(&device->group_next);
>> +	group->dev_counter--;
>>   	mutex_unlock(&group->device_lock);
>>   
>>   	dev_set_drvdata(device->dev, NULL);
>> @@ -1895,6 +1898,9 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>>   	if (!group)
>>   		return -ENODEV;
>>   
>> +	if (group->dev_counter > 1)
>> +		return -EINVAL;
>> +
>>   	ret = vfio_group_add_container_user(group);
>>   	if (ret)
>>   		goto err_pin_pages;
>> @@ -1902,7 +1908,8 @@ int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int npage,
>>   	container = group->container;
>>   	driver = container->iommu_driver;
>>   	if (likely(driver && driver->ops->pin_pages))
>> -		ret = driver->ops->pin_pages(container->iommu_data, user_pfn,
>> +		ret = driver->ops->pin_pages(container->iommu_data,
>> +					     group->iommu_group, user_pfn,
>>   					     npage, prot, phys_pfn);
>>   	else
>>   		ret = -ENOTTY;
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index 4f1f116feabc..18a284b230c0 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -71,6 +71,7 @@ struct vfio_iommu {
>>   	bool			v2;
>>   	bool			nesting;
>>   	bool			dirty_page_tracking;
>> +	bool			pinned_page_dirty_scope;
>>   };
>>   
>>   struct vfio_domain {
>> @@ -98,6 +99,7 @@ struct vfio_group {
>>   	struct iommu_group	*iommu_group;
>>   	struct list_head	next;
>>   	bool			mdev_group;	/* An mdev group */
>> +	bool			has_pinned_pages;
> 
> I'm afraid over time this name will be confusing, should we simply
> call it pinned_page_dirty_scope per vfio_group as well? 

Updating as you suggested, but I hope it doesn't look confusing.

>  We might have
> to adapt this over time as we get new ways to dirty pages, but each
> group voting towards the same value being set on the vfio_iommu object
> seems like a good starting point.
> 
>>   };
>>   
>>   struct vfio_iova {
>> @@ -129,6 +131,10 @@ struct vfio_regions {
>>   static int put_pfn(unsigned long pfn, int prot);
>>   static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu);
>>   
>> +static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
>> +					       struct iommu_group *iommu_group);
>> +
>> +static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu);
>>   /*
>>    * This code handles mapping and unmapping of user data buffers
>>    * into DMA'ble space using the IOMMU
>> @@ -579,11 +585,13 @@ static int vfio_unpin_page_external(struct vfio_dma *dma, dma_addr_t iova,
>>   }
>>   
>>   static int vfio_iommu_type1_pin_pages(void *iommu_data,
>> +				      struct iommu_group *iommu_group,
>>   				      unsigned long *user_pfn,
>>   				      int npage, int prot,
>>   				      unsigned long *phys_pfn)
>>   {
>>   	struct vfio_iommu *iommu = iommu_data;
>> +	struct vfio_group *group;
>>   	int i, j, ret;
>>   	unsigned long remote_vaddr;
>>   	struct vfio_dma *dma;
>> @@ -662,8 +670,14 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>>   				   (vpfn->iova - dma->iova) >> pgshift, 1);
>>   		}
>>   	}
>> -
>>   	ret = i;
>> +
>> +	group = vfio_iommu_find_iommu_group(iommu, iommu_group);
>> +	if (!group->has_pinned_pages) {
>> +		group->has_pinned_pages = true;
>> +		update_pinned_page_dirty_scope(iommu);
>> +	}
>> +
>>   	goto pin_done;
>>   
>>   pin_unwind:
>> @@ -946,8 +960,11 @@ static int vfio_iova_dirty_bitmap(struct vfio_iommu *iommu, dma_addr_t iova,
>>   	npages = dma->size >> pgshift;
>>   	bitmap_size = dirty_bitmap_bytes(npages);
>>   
>> -	/* mark all pages dirty if all pages are pinned and mapped. */
>> -	if (dma->iommu_mapped)
>> +	/*
>> +	 * mark all pages dirty if any IOMMU capable device is not able
>> +	 * to report dirty pages and all pages are pinned and mapped.
>> +	 */
>> +	if (!iommu->pinned_page_dirty_scope && dma->iommu_mapped)
>>   		bitmap_set(dma->bitmap, 0, npages);
>>   
>>   	if (dma->bitmap) {
>> @@ -1430,6 +1447,51 @@ static struct vfio_group *find_iommu_group(struct vfio_domain *domain,
>>   	return NULL;
>>   }
>>   
>> +static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
>> +					       struct iommu_group *iommu_group)
>> +{
>> +	struct vfio_domain *domain;
>> +	struct vfio_group *group = NULL;
>> +
>> +	list_for_each_entry(domain, &iommu->domain_list, next) {
>> +		group = find_iommu_group(domain, iommu_group);
>> +		if (group)
>> +			return group;
>> +	}
>> +
>> +	if (iommu->external_domain)
>> +		group = find_iommu_group(iommu->external_domain, iommu_group);
>> +
>> +	return group;
>> +}
>> +
>> +static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu)
>> +{
>> +	struct vfio_domain *domain;
>> +	struct vfio_group *group;
>> +
>> +	list_for_each_entry(domain, &iommu->domain_list, next) {
>> +		list_for_each_entry(group, &domain->group_list, next) {
>> +			if (!group->has_pinned_pages) {
>> +				iommu->pinned_page_dirty_scope = false;
>> +				return;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (iommu->external_domain) {
>> +		domain = iommu->external_domain;
>> +		list_for_each_entry(group, &domain->group_list, next) {
>> +			if (!group->has_pinned_pages) {
>> +				iommu->pinned_page_dirty_scope = false;
>> +				return;
>> +			}
>> +		}
>> +	}
>> +
>> +	iommu->pinned_page_dirty_scope = true;
>> +}
>> +
>>   static bool vfio_iommu_has_sw_msi(struct list_head *group_resv_regions,
>>   				  phys_addr_t *base)
>>   {
>> @@ -1836,6 +1898,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>   
>>   			list_add(&group->next,
>>   				 &iommu->external_domain->group_list);
>> +			update_pinned_page_dirty_scope(iommu);
>>   			mutex_unlock(&iommu->lock);
>>   
>>   			return 0;
>> @@ -1958,6 +2021,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>   done:
>>   	/* Delete the old one and insert new iova list */
>>   	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
>> +	update_pinned_page_dirty_scope(iommu);
>>   	mutex_unlock(&iommu->lock);
>>   	vfio_iommu_resv_free(&group_resv_regions);
>>   
> 
> At this point we've added an iommu backed group that can't possibly
> have pages pinned on behalf of this group yet, can't we just set
> iommu->pinned_page_dirty_scope = false?
> 

Right, changing.

> In the previous case, aren't we adding a non-iommu backed group, so
> should we presume the scope is pinned pages even before we have any?

Anyways we are updating it when pages are pinned, I think better not to 
presume.

> We could almost forego the iommu scope update, but it could be the
> first group added if we're going to preemptively assume the scope of
> the group.
> 
>> @@ -1972,6 +2036,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>   out_free:
>>   	kfree(domain);
>>   	kfree(group);
>> +	update_pinned_page_dirty_scope(iommu);
> 
> This one looks like paranoia given how late we update when the group is
> added.
> 
>>   	mutex_unlock(&iommu->lock);
>>   	return ret;
>>   }
>> @@ -2176,6 +2241,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
>>   		vfio_iommu_iova_free(&iova_copy);
>>   
>>   detach_group_done:
>> +	update_pinned_page_dirty_scope(iommu);
> 
> We only need to do this if the group we're removing does not have
> pinned page dirty scope, right?  I think we have all the info here to
> make that optimization.
> 

There could be more than one group that doesn't have pinned page dirty 
scope, better to run through update_pinned_page_dirty_scope() function.

Thanks,
Kirti

>>   	mutex_unlock(&iommu->lock);
>>   }
>>   
>> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
>> index e42a711a2800..da29802d6276 100644
>> --- a/include/linux/vfio.h
>> +++ b/include/linux/vfio.h
>> @@ -72,7 +72,9 @@ struct vfio_iommu_driver_ops {
>>   					struct iommu_group *group);
>>   	void		(*detach_group)(void *iommu_data,
>>   					struct iommu_group *group);
>> -	int		(*pin_pages)(void *iommu_data, unsigned long *user_pfn,
>> +	int		(*pin_pages)(void *iommu_data,
>> +				     struct iommu_group *group,
>> +				     unsigned long *user_pfn,
>>   				     int npage, int prot,
>>   				     unsigned long *phys_pfn);
>>   	int		(*unpin_pages)(void *iommu_data,
> 

