Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EC2E7DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 04:32:14 +0100 (CET)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuohB-00072e-TE
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 22:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kuog1-0006Yd-Aa
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 22:31:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kuofx-0006cu-Jm
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 22:31:00 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D5tvJ5cSQz15m8L;
 Thu, 31 Dec 2020 11:30:04 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 11:30:47 +0800
Subject: Re: [PATCH v3 3/8] acpi/gpex: Inform os to keep firmware resource map
To: Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-4-cenjiahui@huawei.com>
 <20201229144142.66583852@redhat.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <674d13e0-c819-62f2-94d1-f74b03a03ef0@huawei.com>
Date: Thu, 31 Dec 2020 11:30:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201229144142.66583852@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.399,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/29 21:41, Igor Mammedov wrote:
> On Wed, 23 Dec 2020 17:08:31 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> 
>> There may be some differences in pci resource assignment between guest os
>> and firmware.
>>
>> Eg. A Bridge with Bus [d2]
>>     -+-[0000:d2]---01.0-[d3]----01.0
>>
>>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>>                                           BAR4 (mem, 64-bit, pref) [size=64M]
>>
>>     In EDK2, the Resource Map would be:
>>         PciBus: Resource Map for Bridge [D2|01|00]
>>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
>>     It would use 0x4100000 to calculate the root bus's PMem64 resource window.
>>
>>     While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
>>     the PMem64 size, which would be 0x6000000. So kernel would try to
>>     allocate 0x6000000 from the PMem64 resource window, but since the window
>>     size is 0x4100000 as assigned by EDK2, the allocation would fail.
>>
>> The diffences could result in resource assignment failure.
>>
>> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>> that firmware has done at boot time could handle the differences.
> 
> I'm not sure about this one, 
> OS should able to reconfigure PCI resources according to what and where is plugged
> (and it even more true is hotplug is taken into account)

I think the problem is that OS can not reconfigure the resource windows set in _CRS
by firmware, which means the total resource range where OS can assign from is limited.
So would it be better that OS prefers the resource assignment by firmware and
reconfigures those not properly assigned resources?

And the bios seems to have taken hotplug reserved resources into account.

Thanks,
Jiahui

>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 11b3db8f71..c189306599 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>> -    uint8_t byte_list[1] = {1};
>> -    buf = aml_buffer(1, byte_list);
>> +    uint8_t byte_list[] = {
>> +                0x1 << 0 /* support for functions other than function 0 */ |
>> +                0x1 << 5 /* support for function 5 */
>> +                };
>> +    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
>>      aml_append(ifctx1, aml_return(buf));
>>      aml_append(ifctx, ifctx1);
>> +
>> +    /* PCI Firmware Specification 3.1
>> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
>> +     */
>> +    /* Arg2: Function Index: 5 */
>> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
>> +    /* 0 - The operating system must not ignore the PCI configuration that
>> +     *     firmware has done at boot time.
>> +     */
>> +    aml_append(ifctx1, aml_return(aml_int(0)));
>> +    aml_append(ifctx, ifctx1);
>>      aml_append(method, ifctx);
>>  
>>      byte_list[0] = 0;
> 
> .
> 

