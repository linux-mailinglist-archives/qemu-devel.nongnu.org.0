Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F022E7EB2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 09:24:06 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kutFd-0002FS-Hi
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 03:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kutER-0001ou-Qn
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 03:22:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kutEO-0001Ko-NE
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 03:22:51 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D61Mg09b3zMCg6;
 Thu, 31 Dec 2020 16:21:35 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 16:22:28 +0800
Subject: Re: [PATCH v3 3/8] acpi/gpex: Inform os to keep firmware resource map
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-4-cenjiahui@huawei.com>
 <20201229144142.66583852@redhat.com>
 <20201230161942-mutt-send-email-mst@kernel.org>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <c4bd0462-40e1-0025-35f4-8652141013c4@huawei.com>
Date: Thu, 31 Dec 2020 16:22:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201230161942-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.399,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/31 5:22, Michael S. Tsirkin wrote:
> On Tue, Dec 29, 2020 at 02:41:42PM +0100, Igor Mammedov wrote:
>> On Wed, 23 Dec 2020 17:08:31 +0800
>> Jiahui Cen <cenjiahui@huawei.com> wrote:
>>
>>> There may be some differences in pci resource assignment between guest os
>>> and firmware.
>>>
>>> Eg. A Bridge with Bus [d2]
>>>     -+-[0000:d2]---01.0-[d3]----01.0
>>>
>>>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>>>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>>>                                           BAR4 (mem, 64-bit, pref) [size=64M]
>>>
>>>     In EDK2, the Resource Map would be:
>>>         PciBus: Resource Map for Bridge [D2|01|00]
>>>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>>>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>>>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>>>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
>>>     It would use 0x4100000 to calculate the root bus's PMem64 resource window.
>>>
>>>     While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
>>>     the PMem64 size, which would be 0x6000000. So kernel would try to
>>>     allocate 0x6000000 from the PMem64 resource window, but since the window
>>>     size is 0x4100000 as assigned by EDK2, the allocation would fail.
>>>
>>> The diffences could result in resource assignment failure.
>>>
>>> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>>> that firmware has done at boot time could handle the differences.
>>
>> I'm not sure about this one, 
>> OS should able to reconfigure PCI resources according to what and where is plugged
>> (and it even more true is hotplug is taken into account)
> 
> spec says this:
> 
> 0: No (The operating system must not ignore the PCI configuration that firmware has done
> at boot time. However, the operating system is free to configure the devices in this hierarchy
> that have not been configured by the firmware. There may be a reduced level of hot plug
> capability support in this hierarchy due to resource constraints. This situation is the same as
> the legacy situation where this _DSM is not provided.)
> 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
> 
> and
> 
> IMPLEMENTATION NOTE
> This _DSM function provides backwards compatibility on platforms that can run legacy operating
> systems.
> Operating systems for two different architectures (e.g., x86 and x64) can be installed on a platform.
> The firmware cannot distinguish the operating system in time to change the boot configuration of
> devices. Say for instance, an x86 operating system in non-PAE mode is installed on a system. The
> x86 operating system cannot access device resource space above 4 GiB. So the firmware is required
> to configure devices at boot time using addresses below 4 GiB. On the other hand, if an x64
> operating system is installed on this system, it can access device resources above the 4 GiB so it does
> not want the firmware to constrain the resource assignment below 4 GiB that the firmware
> configures at boot time. It is not possible for the firmware to change this by the time it boots the
> operating system. Ignoring the configurations done by firmware at boot time will allow the
> operating system to push resource assignment using addresses above 4 GiB for an x64 operating
> system while constrain it to addresses below 4 GiB for an x86 operating system.
> 
> so fundamentally, saying "1" here just means "you can ignore what
> firmware configured if you like".
> 
> 
> I have a different question though: our CRS etc is based on what
> firmware configured. Is that ok? Or is ACPI expected to somehow
> reconfigure itself when OS reconfigures devices?
> Think it's ok but could not find documentation either way.

In my humble opinion, it is ok.

I'm not sure whether it is useful, but PCI Firmware Specification Revision 3.0 Chapter 3.5 said:

Firmware must configure all Host Bridges in the systems, even if they are not connected to a
console or boot device. Firmware must configure Host Bridges in order to allow operating systems
to use the devices below the Host Bridges. This is because the Host Bridges programming model is
not defined by the PCI Specifications. “Configured” in this context means that:
- Memory and I/O resources are assigned and configured.
- Includes both the resources consumed by the Host Bridge and the resources passed through to
the secondary bus.
- The bridge is enabled to receive and forward transactions.
- The bridge is operating in “safe” mode. Safe mode includes:
● Enabling resources such as: I/O Port, Memory addresses, VGA routing, bus number, etc.
● Enabling detection of parity and system errors
● Programming cacheline, latency timer, and other registers as required by the PCI
Specifications.


I'm not sure, but does "This is because the Host Bridges
programming model is not defined by the PCI Specifications"
mean that OS has no way to reconfigure Host Bridges (and
their CRS etc configuration).

Please point it out if I misunderstand the spec.

Thanks,
Jiahui

> 
>>>
>>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>>> ---
>>>  hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>>> index 11b3db8f71..c189306599 100644
>>> --- a/hw/pci-host/gpex-acpi.c
>>> +++ b/hw/pci-host/gpex-acpi.c
>>> @@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>>> -    uint8_t byte_list[1] = {1};
>>> -    buf = aml_buffer(1, byte_list);
>>> +    uint8_t byte_list[] = {
>>> +                0x1 << 0 /* support for functions other than function 0 */ |
>>> +                0x1 << 5 /* support for function 5 */
>>> +                };
>>> +    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
>>>      aml_append(ifctx1, aml_return(buf));
>>>      aml_append(ifctx, ifctx1);
>>> +
>>> +    /* PCI Firmware Specification 3.1
>>> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
>>> +     */
>>> +    /* Arg2: Function Index: 5 */
>>> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
>>> +    /* 0 - The operating system must not ignore the PCI configuration that
>>> +     *     firmware has done at boot time.
>>> +     */
>>> +    aml_append(ifctx1, aml_return(aml_int(0)));
>>> +    aml_append(ifctx, ifctx1);
>>>      aml_append(method, ifctx);
>>>  
>>>      byte_list[0] = 0;
> 
> .
> 

