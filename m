Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27C3383F6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 03:49:14 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKXrV-0003bi-C6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 21:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lKXqe-00039V-6R
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:48:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:4094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lKXqa-0007Pf-Lg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:48:19 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DxVYw25JNz8wmH;
 Fri, 12 Mar 2021 10:46:12 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 12 Mar 2021 10:47:50 +0800
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
To: Alex Williamson <alex.williamson@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
 <20210308155117.035c1408@omen.home.shazbot.org>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <c428fba8-d84a-d1bc-bba3-276f60e7ff94@huawei.com>
Date: Fri, 12 Mar 2021 10:47:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210308155117.035c1408@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=lushenming@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 cjia@nvidia.com, quintela@redhat.com, Keqian Zhu <zhukeqian1@huawei.com>,
 cohuck@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Yan Zhao <yan.y.zhao@intel.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/9 6:51, Alex Williamson wrote:
> [Cc +Intel]
> 
> On Mon, 8 Mar 2021 21:39:49 +0530
> Tarun Gupta <targupta@nvidia.com> wrote:
> 
>> VFIO migration support in QEMU is experimental as of now, which was done to
>> provide soak time and resolve concerns regarding bit-stream.
>> But, with the patches discussed in
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784931.html , we have
>> corrected ordering of saving PCI config space and bit-stream.
>>
>> So, this patch proposes to make vfio migration support in QEMU to be enabled
>> by default. Tested by successfully migrating mdev device.
>>
>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>  hw/vfio/pci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index f74be78209..15e26f460b 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>>                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>>      DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
>> -                     vbasedev.enable_migration, false),
>> +                     vbasedev.enable_migration, true),
>>      DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
>>      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>>                       vbasedev.ram_block_discard_allowed, false),
> 
> Looking back at the commit where this was added:
> 
> commit cf254988a50d4164c86a356c80b8d3ae0ccaa005
> Author: Alex Williamson <alex.williamson@redhat.com>
> Date:   Mon Nov 9 11:56:02 2020 -0700
> 
>     vfio: Make migration support experimental
>     
>     Support for migration of vfio devices is still in flux.  Developers
>     are attempting to add support for new devices and new architectures,
>     but none are yet readily available for validation.  We have concerns
>     whether we're transferring device resources at the right point in the
>     migration, whether we're guaranteeing that updates during pre-copy are
>     migrated, and whether we can provide bit-stream compatibility should
>     any of this change.  Even the question of whether devices should
>     participate in dirty page tracking during pre-copy seems contentious.
>     In short, migration support has not had enough soak time and it feels
>     premature to mark it as supported.
>     
>     Create an experimental option such that we can continue to develop.
>     
>     [Retaining previous acks/reviews for a previously identical code
>      change with different specifics in the commit log.]
>     
>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>     Acked-by: Cornelia Huck <cohuck@redhat.com>
>     Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> 
> 
> What has tangibly changed since then?  I think we have patches on-list
> to address the known issue of PCI config space (MSI) ordering, which
> related to enabling migration on ARM platforms.  Do we have
> significantly more confidence in our ability to make compatible
> enhancement to the migration bitstream?  This was a particularly
> troublesome point for me if we have any hope of calling this
> supportable.  As far as I know, there are still no open source vendor
> drivers supporting migration for community testing.  We're also still
> missing the documentation that was promised previously, as Connie noted.
> 
> Huawei and Intel, what's your confidence level and what can you share
> regarding support for this implementation?  Thanks,

We have sent a number of patches regarding VFIO migration from our own test
(the support for this in our accelerator driver is still in experiment),
some of them are still on-list []...

[] https://lore.kernel.org/qemu-devel/20210310094106.2191-2-jiangkunkun@huawei.com/
   https://lore.kernel.org/linux-arm-kernel/20210126124444.27136-1-zhukeqian1@huawei.com/

Thanks,
Shenming

> 
> Alex
> 
> .
> 

