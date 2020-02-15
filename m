Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E211515FC0C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 02:32:17 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2mJc-0007pg-FD
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 20:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j2mIm-0007Bk-Le
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 20:31:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j2mIl-0000La-BJ
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 20:31:24 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:39380 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j2mIj-0000AC-VR; Fri, 14 Feb 2020 20:31:23 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0B536EA479D5603AD10B;
 Sat, 15 Feb 2020 09:31:15 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 15 Feb
 2020 09:31:08 +0800
Subject: Re: [PATCH] ppc: free 'fdt' after reset the machine
To: Greg Kurz <groug@kaod.org>
References: <20200214033206.4395-1-pannengyuan@huawei.com>
 <20200214164816.137e1de7@bahia.lan>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <fe4b442b-a854-6eae-95ab-2c3af0a2986a@huawei.com>
Date: Sat, 15 Feb 2020 09:30:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200214164816.137e1de7@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, euler.robot@huawei.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/2020 11:48 PM, Greg Kurz wrote:
> On Fri, 14 Feb 2020 11:32:06 +0800
> <pannengyuan@huawei.com> wrote:
> 
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> 'fdt' forgot to clean both e500 and pnv when we call 'system_reset' on ppc,
>> this patch fix it. The leak stacks are as follow:
>>
>> Direct leak of 4194304 byte(s) in 4 object(s) allocated from:
>>     #0 0x7fafe37dd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
>>     #1 0x7fafe2e3149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>     #2 0x561876f7f80d in create_device_tree /mnt/sdb/qemu-new/qemu/device_tree.c:40
>>     #3 0x561876b7ac29 in ppce500_load_device_tree /mnt/sdb/qemu-new/qemu/hw/ppc/e500.c:364
>>     #4 0x561876b7f437 in ppce500_reset_device_tree /mnt/sdb/qemu-new/qemu/hw/ppc/e500.c:617
>>     #5 0x56187718b1ae in qemu_devices_reset /mnt/sdb/qemu-new/qemu/hw/core/reset.c:69
>>     #6 0x561876f6938d in qemu_system_reset /mnt/sdb/qemu-new/qemu/vl.c:1412
>>     #7 0x561876f6a25b in main_loop_should_exit /mnt/sdb/qemu-new/qemu/vl.c:1645
>>     #8 0x561876f6a398 in main_loop /mnt/sdb/qemu-new/qemu/vl.c:1679
>>     #9 0x561876f7da8e in main /mnt/sdb/qemu-new/qemu/vl.c:4438
>>     #10 0x7fafde16b812 in __libc_start_main ../csu/libc-start.c:308
>>     #11 0x5618765c055d in _start (/mnt/sdb/qemu-new/qemu/build/ppc64-softmmu/qemu-system-ppc64+0x2b1555d)
>>
>> Direct leak of 1048576 byte(s) in 1 object(s) allocated from:
>>     #0 0x7fc0a6f1b970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
>>     #1 0x7fc0a656f49d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>     #2 0x55eb05acd2ca in pnv_dt_create /mnt/sdb/qemu-new/qemu/hw/ppc/pnv.c:507
>>     #3 0x55eb05ace5bf in pnv_reset /mnt/sdb/qemu-new/qemu/hw/ppc/pnv.c:578
>>     #4 0x55eb05f2f395 in qemu_system_reset /mnt/sdb/qemu-new/qemu/vl.c:1410
>>     #5 0x55eb05f43850 in main /mnt/sdb/qemu-new/qemu/vl.c:4403
>>     #6 0x7fc0a18a9812 in __libc_start_main ../csu/libc-start.c:308
>>     #7 0x55eb0558655d in _start (/mnt/sdb/qemu-new/qemu/build/ppc64-softmmu/qemu-system-ppc64+0x2b1555d)
>>
>> Reported-by: Euler Robot <pannengyuan@huawei.com>
> 
> The recipient list and 'git log' seem to agree on the fact that 'Euler Robot'
> has its own email address, that is not yours ;-)
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> 
> I guess David can fix this when applying the patch. No need to repost
> unless explicitly asked to do so.

Yes, your guess is right. I'm sorry for my carelessness.

Thanks.

> 
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>>  hw/ppc/e500.c | 1 +
>>  hw/ppc/pnv.c  | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 886442e54f..af537bba2b 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -594,6 +594,7 @@ done:
>>          cpu_physical_memory_write(addr, fdt, fdt_size);
>>      }
>>      ret = fdt_size;
>> +    g_free(fdt);
>>  
>>  out:
>>      g_free(pci_map);
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 139c857b1e..e98038b809 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -582,6 +582,8 @@ static void pnv_reset(MachineState *machine)
>>  
>>      qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>>      cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>> +
>> +    g_free(fdt);
>>  }
>>  
>>  static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
> 
> .
> 

