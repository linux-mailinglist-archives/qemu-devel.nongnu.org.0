Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7BE63EA32
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dn5-0005Au-5R; Thu, 01 Dec 2022 02:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0dmu-000577-Ky
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:15:19 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0dmr-0007i5-G8
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:15:16 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NN6gx62MdzJp0c;
 Thu,  1 Dec 2022 15:11:41 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Dec 2022 15:15:05 +0800
Subject: Re: regression: insmod module failed in VM with nvdimm on
To: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, chenxiang via
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>
Message-ID: <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
Date: Thu, 1 Dec 2022 15:15:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Ard,


在 2022/11/30 16:18, Ard Biesheuvel 写道:
> On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
>> On Wed, 30 Nov 2022 02:52:35 +0000,
>> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
>>> Hi,
>>>
>>> We boot the VM using following commands (with nvdimm on)  (qemu
>>> version 6.1.50, kernel 6.0-r4):
>> How relevant is the presence of the nvdimm? Do you observe the failure
>> without this?
>>
>>> qemu-system-aarch64 -machine
>>> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
>>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
>>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
>>> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
>>> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
>>> -object memory-backend-ram,id=ram1,size=10G -device
>>> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
>>> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
>>>
>>> Then in VM we insmod a module, vmalloc error occurs as follows (kernel
>>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
>>>
>>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
>>> [    8.186563] vmap allocation for size 20480 failed: use
>>> vmalloc=<size> to increase size
>> Have you tried increasing the vmalloc size to check that this is
>> indeed the problem?
>>
>> [...]
>>
>>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
>>> defer initialization to initcall where permitted").
>> I guess you mean commit fc5a89f75d2a instead, right?
>>
>>> Do you have any idea about the issue?
>> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
>> portion of the vmalloc space, but you give very little information
>> that could help here...
>>
> Ouch. I suspect what's going on here: that patch defers the
> randomization of the module region, so that we can decouple it from
> the very early init code.
>
> Obviously, it is happening too late now, and the randomized module
> region is overlapping with a vmalloc region that is in use by the time
> the randomization occurs.
>
> Does the below fix the issue?

The issue still occurs, but it seems decrease the probability, before it 
occured almost every time, after the change, i tried 2-3 times, and it 
occurs.
But i change back "subsys_initcall" to "core_initcall", and i test more 
than 20 times, and it is still ok.

>
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index 37a9deed2aec..71fb18b2f304 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -90,4 +90,4 @@ static int __init kaslr_init(void)
>
>          return 0;
>   }
> -subsys_initcall(kaslr_init)
> +arch_initcall(kaslr_init)
> .
>


