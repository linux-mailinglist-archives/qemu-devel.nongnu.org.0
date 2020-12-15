Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC652DA8F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:49 +0100 (CET)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5N6-0003cC-18
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp5Lr-0002ic-Hw
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:06:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp5Lo-0008NS-T9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:06:31 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw9mh39pzzhs25;
 Tue, 15 Dec 2020 16:05:40 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 16:06:11 +0800
Subject: Re: [PULL v3 15/32] vfio: Add ioctl to get dirty pages bitmap during
 dma unmap
To: Kirti Wankhede <kwankhede@nvidia.com>
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426447993.24886.10237011487367170903.stgit@gimli.home>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <f32646c2-acbd-71e8-7b3b-307f25e03247@huawei.com>
Date: Tue, 15 Dec 2020 16:06:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <160426447993.24886.10237011487367170903.stgit@gimli.home>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, jiangkunkun@huawei.com, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kirti,

On 2020/11/2 5:01, Alex Williamson wrote:
> From: Kirti Wankhede <kwankhede@nvidia.com>
> 
> With vIOMMU, IO virtual address range can get unmapped while in pre-copy
> phase of migration. In that case, unmap ioctl should return pages pinned
> in that range and QEMU should find its correcponding guest physical
> addresses and report those dirty.
> 
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> [aw: fix error_report types, fix cpu_physical_memory_set_dirty_lebitmap() cast]
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/vfio/common.c |   97 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 93 insertions(+), 4 deletions(-)
> 
[...]

> +
> +    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> +    unmap->iova = iova;
> +    unmap->size = size;
> +    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
> +    bitmap = (struct vfio_bitmap *)&unmap->data;
> +
> +    /*
> +     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> +     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap_pgsize to
> +     * TARGET_PAGE_SIZE.
> +     */

Here maybe not OK. cpu_physical_memory_set_dirty_lebitmap expects the granule
of bitmap is qemu_real_host_page_size. It uses hpratio to covert this bitmap
to QEMU dirty bitmap.

Thanks,
Keqian

