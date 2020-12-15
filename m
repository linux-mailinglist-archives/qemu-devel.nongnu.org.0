Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD672DA90E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:19:46 +0100 (CET)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5Yf-0000Kf-O5
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp5Wv-0008Cn-DJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:17:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp5Ws-0003ch-IQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:17:57 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwB1z4csnz15cxR;
 Tue, 15 Dec 2020 16:17:11 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 16:17:38 +0800
Subject: Re: [PULL v3 11/32] vfio: Get migration capability flags for container
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426443873.24886.12665355188047101099.stgit@gimli.home>
To: Kirti Wankhede <kwankhede@nvidia.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <0c0ca66d-c577-35d3-8fbc-c69c4eac8080@huawei.com>
Date: Tue, 15 Dec 2020 16:17:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <160426443873.24886.12665355188047101099.stgit@gimli.home>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kirti,

On 2020/11/2 5:00, Alex Williamson wrote:
> From: Kirti Wankhede <kwankhede@nvidia.com>
> 
> Added helper functions to get IOMMU info capability chain.
> Added function to get migration capability information from that
> capability chain for IOMMU container.
> 
> Similar change was proposed earlier:
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03759.html
> 
> Disable migration for devices if IOMMU module doesn't support migration
> capability.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/vfio/common.c              |   90 +++++++++++++++++++++++++++++++++++++----
>  hw/vfio/migration.c           |    7 +++
>  include/hw/vfio/vfio-common.h |    3 +
>  3 files changed, 91 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c6e98b8d61be..d4959c036dd1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1228,6 +1228,75 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>      return 0;
>  }
>  
[...]

> +
> +    /*
> +     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> +     * TARGET_PAGE_SIZE to mark those dirty.
> +     */
> +    if (cap_mig->pgsize_bitmap & TARGET_PAGE_SIZE) {
> +        container->dirty_pages_supported = true;
> +        container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
> +        container->dirty_pgsizes = cap_mig->pgsize_bitmap;
> +    }
Maybe it's better to use qemu_real_host_page_size here, as some iommu drivers (such as smmu) prefer
host page size.

Thanks,
Keqian

