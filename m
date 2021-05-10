Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48463377D5E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:44:49 +0200 (CEST)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0au-00065X-D4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lg0ZQ-0004IT-T6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:43:16 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lg0ZN-0008VJ-My
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:43:16 -0400
Received: from dggeml705-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FdtGL3Qvfz19NXh;
 Mon, 10 May 2021 15:38:50 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml705-chm.china.huawei.com (10.3.17.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 10 May 2021 15:43:02 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 10 May 2021 15:43:02 +0800
Subject: Re: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
To: Alex Williamson <alex.williamson@redhat.com>, <kevin.tian@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list : All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210508093105.2558-1-jiangkunkun@huawei.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <8c770379-8bdb-b573-9c45-fad9d24e7c64@huawei.com>
Date: Mon, 10 May 2021 15:42:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508093105.2558-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Sorry for my carelessness.
This is the v2 of this series.

Thanks,
Kunkun Jiang

On 2021/5/8 17:31, Kunkun Jiang wrote:
> In the past, we clear dirty log immediately after sync dirty log to
> userspace. This may cause redundant dirty handling if userspace
> handles dirty log iteratively:
>
> After vfio clears dirty log, new dirty log starts to generate. These
> new dirty log will be reported to userspace even if they are generated
> before userspace handles the same dirty page.
>
> Since a new dirty log tracking method for vfio based on iommu hwdbm[1]
> has been introduced in the kernel and added a new capability named
> VFIO_DIRTY_LOG_MANUAL_CLEAR, we can eliminate some redundant dirty
> handling by supporting it.
>
> This series include patches as below:
> Patch 1:
> - updated the linux-headers/linux/vfio.h from kernel side
>
> Patch 2:
> - introduced 'struct VFIODMARange' to describe a range of the given DMA
>    mapping and with respect to a VFIO_IOMMU_MAP_DMA operation
>
> Patch 3:
> - implemented the operation to manual clear vfio dirty log, which can
>    eliminate some redundant dirty handling
>
> History:
> v1 -> v2:
> - Add a new ioctl VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP_NOCLEAR to get
>    vfio dirty log when support manual clear.
>
> Thanks,
> Kunkun Jiang
>
> [1]
> IOMMU part: https://lore.kernel.org/linux-iommu/20210507102211.8836-1-zhukeqian1@huawei.com/
> VFIO part: https://lore.kernel.org/kvm/20210507103608.39440-1-zhukeqian1@huawei.com/
>
> Zenghui Yu (3):
>    linux-headers: update against 5.12 and "manual clear vfio dirty log"
>      series
>    vfio: Maintain DMA mapping range for the container
>    vfio/migration: Add support for manual clear vfio dirty log
>
>   hw/vfio/common.c              | 211 ++++++++++++++++++++++++++++++++--
>   include/hw/vfio/vfio-common.h |  10 ++
>   linux-headers/linux/vfio.h    |  61 +++++++++-
>   3 files changed, 273 insertions(+), 9 deletions(-)
>


