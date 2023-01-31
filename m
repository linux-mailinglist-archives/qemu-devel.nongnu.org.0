Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A5682BE1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpCa-0005lF-Fo; Tue, 31 Jan 2023 06:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMpCW-0005l7-U6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:53:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMpCU-0002Hx-4J
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:53:24 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P5jyV4x0Lz6J6CH;
 Tue, 31 Jan 2023 19:49:38 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 11:53:15 +0000
Date: Tue, 31 Jan 2023 11:53:14 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <hchkuo@avery-design.com.tw>,
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230131115314.00004f7e@huawei.com>
In-Reply-To: <20221128150157.97724-4-gregory.price@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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

On Mon, 28 Nov 2022 10:01:57 -0500
Gregory Price <gourry.memverge@gmail.com> wrote:

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

I'm taking another look at these and tweaking what I'm carrying as I go
with a plan to post them for merging shortly.

Anyhow, a few more changes I wanted to call out here so they don't come
as a surprise / are things to focus on in reviewing that version 
(hopefully post it later today or maybe tomorrow).

Most of this is reducing the diff / duplication of code to make review a
tiny bit easier (hopefully)

...
  
>  /* TODO: Support multiple HDM decoders and DPA skip */
> @@ -663,11 +769,17 @@ MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
>  {
>      CXLType3Dev *ct3d = CXL_TYPE3(d);
>      uint64_t dpa_offset;
> -    MemoryRegion *mr;
> +    MemoryRegion *vmr = NULL, *pmr = NULL;
> +    AddressSpace *as;

We end up with a lot of duplication between cxl_type3_read and cxl_type3_write()
so I've factored out a _get_as_and_dpa() function that deals with establish
where the memory we then read or write is. 

>  
> -    /* TODO support volatile region */
> -    mr = host_memory_backend_get_memory(ct3d->hostmem);
> -    if (!mr) {
> +    if (ct3d->hostvmem) {
> +        vmr = host_memory_backend_get_memory(ct3d->hostvmem);
> +    }
> +    if (ct3d->hostpmem) {
> +        pmr = host_memory_backend_get_memory(ct3d->hostpmem);
> +    }
> +
> +    if (!vmr && !pmr) {
>          return MEMTX_ERROR;
>      }
>  
> @@ -675,11 +787,22 @@ MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
>          return MEMTX_ERROR;
>      }
>  
> -    if (dpa_offset > int128_get64(mr->size)) {
> +    if (dpa_offset > int128_get64(ct3d->cxl_dstate.mem_size)) {
>          return MEMTX_ERROR;
>      }
>  
> -    return address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size);
> +    if (vmr) {
> +        if (dpa_offset <= int128_get64(vmr->size)) {
> +            as = &ct3d->hostvmem_as;
> +        } else {
> +            as = &ct3d->hostpmem_as;
> +            dpa_offset -= vmr->size;
> +        }
> +    }
> +    else {
> +        as = &ct3d->hostpmem_as;
> +    }
> +    return address_space_read(as, dpa_offset, attrs, data, size);
>  }
>  
>  MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
> @@ -687,10 +810,17 @@ MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
>  {
>      CXLType3Dev *ct3d = CXL_TYPE3(d);
>      uint64_t dpa_offset;
> -    MemoryRegion *mr;
> +    MemoryRegion *vmr = NULL, *pmr = NULL;
> +    AddressSpace *as;
>  
> -    mr = host_memory_backend_get_memory(ct3d->hostmem);
> -    if (!mr) {
> +    if (ct3d->hostvmem) {
> +        vmr = host_memory_backend_get_memory(ct3d->hostvmem);
> +    }
> +    if (ct3d->hostpmem) {
> +        pmr = host_memory_backend_get_memory(ct3d->hostpmem);
> +    }
> +
> +    if (!vmr && !pmr) {
>          return MEMTX_OK;
>      }
>  
> @@ -698,11 +828,22 @@ MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
>          return MEMTX_OK;
>      }
>  
> -    if (dpa_offset > int128_get64(mr->size)) {
> +    if (dpa_offset > int128_get64(ct3d->cxl_dstate.mem_size)) {
>          return MEMTX_OK;
>      }
> -    return address_space_write(&ct3d->hostmem_as, dpa_offset, attrs,
> -                               &data, size);
> +
> +    if (vmr) {
> +        if (dpa_offset <= int128_get64(vmr->size)) {
> +            as = &ct3d->hostvmem_as;
> +        } else {
> +            as = &ct3d->hostpmem_as;
> +            dpa_offset -= vmr->size;
> +        }
> +    }
> +    else {
> +        as = &ct3d->hostpmem_as;
> +    }
> +    return address_space_write(as, dpa_offset, attrs, &data, size);
>  }
>  
>  static void ct3d_reset(DeviceState *dev)
> @@ -717,7 +858,11 @@ static void ct3d_reset(DeviceState *dev)
>  
>  static Property ct3_props[] = {
>      DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
> -                     HostMemoryBackend *),
> +                     HostMemoryBackend *), /* for backward compatibility */
> +    DEFINE_PROP_LINK("persistent-memdev", CXLType3Dev, hostpmem,
> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> +    DEFINE_PROP_LINK("volatile-memdev", CXLType3Dev, hostvmem,
> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>      DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
>                       HostMemoryBackend *),
>      DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
> @@ -728,10 +873,12 @@ static Property ct3_props[] = {
>  
>  static uint64_t get_lsa_size(CXLType3Dev *ct3d)
>  {
> -    MemoryRegion *mr;
> -
> -    mr = host_memory_backend_get_memory(ct3d->lsa);
> -    return memory_region_size(mr);
> +    MemoryRegion *mr = NULL;
> +    if (ct3d->lsa) {

I flipped this logic as reduces the resulting diff and makes patch a little
easier to read.

> +        mr = host_memory_backend_get_memory(ct3d->lsa);
> +        return memory_region_size(mr);
> +    }
> +    return 0;
>  }
>  
>  static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
> @@ -744,30 +891,35 @@ static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
>  static uint64_t get_lsa(CXLType3Dev *ct3d, void *buf, uint64_t size,
>                      uint64_t offset)
>  {
> -    MemoryRegion *mr;
> +    MemoryRegion *mr = NULL;
>      void *lsa;
>  
> -    mr = host_memory_backend_get_memory(ct3d->lsa);
> -    validate_lsa_access(mr, size, offset);
> +    if (ct3d->lsa) {

Flipped this one as well.

> +        mr = host_memory_backend_get_memory(ct3d->lsa);
> +        validate_lsa_access(mr, size, offset);
>  
> -    lsa = memory_region_get_ram_ptr(mr) + offset;
> -    memcpy(buf, lsa, size);
> +        lsa = memory_region_get_ram_ptr(mr) + offset;
> +        memcpy(buf, lsa, size);
> +        return size;
> +    }
>  
> -    return size;
> +    return 0;
>  }
>  
>  static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
>                      uint64_t offset)
>  {
> -    MemoryRegion *mr;
> -    void *lsa;
> +    MemoryRegion *mr = NULL;
> +    void *lsa = NULL;
>  
> -    mr = host_memory_backend_get_memory(ct3d->lsa);
> -    validate_lsa_access(mr, size, offset);
> +    if (ct3d->lsa) {
> +        mr = host_memory_backend_get_memory(ct3d->lsa);
> +        validate_lsa_access(mr, size, offset);
>  
> -    lsa = memory_region_get_ram_ptr(mr) + offset;
> -    memcpy(lsa, buf, size);
> -    memory_region_set_dirty(mr, offset, size);
> +        lsa = memory_region_get_ram_ptr(mr) + offset;
> +        memcpy(lsa, buf, size);
> +        memory_region_set_dirty(mr, offset, size);
> +    }
>  
>      /*
>       * Just like the PMEM, if the guest is not allowed to exit gracefully, label
> @@ -978,7 +1130,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
>      pc->config_read = ct3d_config_read;
>  
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> -    dc->desc = "CXL PMEM Device (Type 3)";
> +    dc->desc = "CXL Memory Device (Type 3)";
>      dc->reset = ct3d_reset;
>      device_class_set_props(dc, ct3_props);
>  
>

