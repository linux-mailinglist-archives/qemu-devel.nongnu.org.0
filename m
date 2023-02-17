Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A269B076
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3Pn-0006qb-Dy; Fri, 17 Feb 2023 11:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT3PN-0006pu-IU
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:16:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT3PL-0006wS-Bq
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:16:25 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PJGyz6g9fz6J7R6;
 Sat, 18 Feb 2023 00:11:39 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 17 Feb
 2023 16:16:18 +0000
Date: Fri, 17 Feb 2023 16:16:17 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>
Subject: Re: [PATCH 2/2] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230217161617.000064d1@huawei.com>
In-Reply-To: <20230131163847.23025-3-Jonathan.Cameron@huawei.com>
References: <20230131163847.23025-1-Jonathan.Cameron@huawei.com>
 <20230131163847.23025-3-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023 16:38:47 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> From: Gregory Price <gourry.memverge@gmail.com>
> 
> This commit enables each CXL Type-3 device to contain one volatile
> memory region and one persistent region.
> 
> Two new properties have been added to cxl-type3 device initialization:
>     [volatile-memdev] and [persistent-memdev]
> 
> The existing [memdev] property has been deprecated and will default the
> memory region to a persistent memory region (although a user may assign
> the region to a ram or file backed region). It cannot be used in
> combination with the new [persistent-memdev] property.
> 
> Partitioning volatile memory from persistent memory is not yet supported.
> 
> Volatile memory is mapped at DPA(0x0), while Persistent memory is mapped
> at DPA(vmem->size), per CXL Spec 8.2.9.8.2.0 - Get Partition Info.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
Hi Gregory,

I've added support for multiple HDM decoders and hence can now
test both volatile and non volatile on same device.
It very nearly all works. With one exception which is I couldn't
poke the first byte of the non volatile region.

I think we have an off by one in a single check.

Interestingly it makes no difference when creating an FS on top
(which was my standard test) so I only noticed when poking memory
addresses directly to sanity check the HDM decoder setup.

I'll roll a v2 if no one shouts out that I'm wrong.

Note that adding multiple HDM decoders massively increases
the number of test cases over what we had before to poke all the
corners so I may well be missing stuff.  Hopefully can send an RFC
of that support out next week.

Jonathan

> -MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
> -                           unsigned size, MemTxAttrs attrs)
> +static int cxl_type3_hpa_to_as_and_dpa(CXLType3Dev *ct3d,
> +                                       hwaddr host_addr,
> +                                       unsigned int size,
> +                                       AddressSpace **as,
> +                                       uint64_t *dpa_offset)
>  {
> -    CXLType3Dev *ct3d = CXL_TYPE3(d);
> -    uint64_t dpa_offset;
> -    MemoryRegion *mr;
> +    MemoryRegion *vmr = NULL, *pmr = NULL;
>  
> -    /* TODO support volatile region */
> -    mr = host_memory_backend_get_memory(ct3d->hostmem);
> -    if (!mr) {
> -        return MEMTX_ERROR;
> +    if (ct3d->hostvmem) {
> +        vmr = host_memory_backend_get_memory(ct3d->hostvmem);
> +    }
> +    if (ct3d->hostpmem) {
> +        pmr = host_memory_backend_get_memory(ct3d->hostpmem);
>      }
>  
> -    if (!cxl_type3_dpa(ct3d, host_addr, &dpa_offset)) {
> -        return MEMTX_ERROR;
> +    if (!vmr && !pmr) {
> +        return -ENODEV;
> +    }
> +
> +    if (!cxl_type3_dpa(ct3d, host_addr, dpa_offset)) {
> +        return -EINVAL;
> +    }
> +
> +    if (*dpa_offset > int128_get64(ct3d->cxl_dstate.mem_size)) {
> +        return -EINVAL;
> +    }
> +
> +    if (vmr) {
> +        if (*dpa_offset <= int128_get64(vmr->size)) {

Off by one I think.  < 

> +            *as = &ct3d->hostvmem_as;
> +        } else {
> +            *as = &ct3d->hostpmem_as;
> +            *dpa_offset -= vmr->size;
> +        }
> +    } else {
> +        *as = &ct3d->hostpmem_as;
>      }
>  
> -    if (dpa_offset > int128_get64(mr->size)) {
> +    return 0;
> +}

