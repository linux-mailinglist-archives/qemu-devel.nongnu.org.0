Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3D615090
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optuH-0003Yv-Lv; Tue, 01 Nov 2022 12:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1optu8-0003Yg-U6
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:14:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1optu3-0001px-Rq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:14:20 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1w5l3q0qz689w9;
 Wed,  2 Nov 2022 00:12:27 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 17:14:09 +0100
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 16:14:08 +0000
Date: Tue, 1 Nov 2022 16:14:07 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <linux-cxl@vger.kernel.org>,
 <dave@stgolabs.net>, <a.manzanares@samsung.com>, Gregory Price
 <gregory.price@memverge.com>
Subject: Re: [PATCH] hw/i386/pc.c: CXL Fixed Memory Window should not
 reserve e820 in bios
Message-ID: <20221101161407.00007366@huawei.com>
In-Reply-To: <20221026205912.8579-1-gregory.price@memverge.com>
References: <20221026205912.8579-1-gregory.price@memverge.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 16:59:13 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> Early-boot e820 records will be inserted by the bios/efi/early boot
> software and be reported to the kernel via insert_resource.  Later, when
> CXL drivers iterate through the regions again, they will insert another
> resource and make the RESERVED memory area a child.
> 
> This RESERVED memory area causes the memory region to become unusable,
> and as a result attempting to create memory regions with
> 
>     `cxl create-region ...`
> 
> Will fail due to the RESERVED area intersecting with the CXL window.
> 
> During boot the following traceback is observed:
> 
> 0xffffffff81101650 in insert_resource_expand_to_fit ()
> 0xffffffff83d964c5 in e820__reserve_resources_late ()
> 0xffffffff83e03210 in pcibios_resource_survey ()
> 0xffffffff83e04f4a in pcibios_init ()
> 
> Which produces a call to reserve the CFMWS area:
> 
> (gdb) p *new
> $54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
>        flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
>        child = 0x0}
> 
> Later the Kernel parses ACPI tables and reserves the exact same area as
> the CXL Fixed Memory Window:
> 
> 0xffffffff811016a4 in insert_resource_conflict ()
>                       insert_resource ()
> 0xffffffff81a81389 in cxl_parse_cfmws ()
> 0xffffffff818c4a81 in call_handler ()
>                       acpi_parse_entries_array ()
> 
> (gdb) p/x *new
> $59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
>        flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
>        child = 0x0}
> 
> This produces the following output in /proc/iomem:
> 
> 590000000-68fffffff : CXL Window 0
>   590000000-68fffffff : Reserved
> 
> This reserved area causes `get_free_mem_region()` to fail due to a check
> against `__region_intersects()`.  Due to this reserved area, the
> intersect check will only ever return REGION_INTERSECTS, which causes
> `cxl create-region` to always fail.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>

My understanding of e820 is limited, but from discussions with Intel folk
I believe this fix to be correct - we should never have had e820 regions
for CXL Fixed Memory Windows. As such

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/i386/pc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 768982ae9a..203c90fedb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1062,7 +1062,6 @@ void pc_memory_init(PCMachineState *pcms,
>          hwaddr cxl_size = MiB;
>  
>          cxl_base = pc_get_cxl_range_start(pcms);
> -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>          memory_region_add_subregion(system_memory, cxl_base, mr);
>          cxl_resv_end = cxl_base + cxl_size;
> @@ -1078,7 +1077,6 @@ void pc_memory_init(PCMachineState *pcms,
>                  memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
>                                        "cxl-fixed-memory-region", fw->size);
>                  memory_region_add_subregion(system_memory, fw->base, &fw->mr);
> -                e820_add_entry(fw->base, fw->size, E820_RESERVED);
>                  cxl_fmw_base += fw->size;
>                  cxl_resv_end = cxl_fmw_base;
>              }


