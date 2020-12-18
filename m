Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233912DDE43
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:59:36 +0100 (CET)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8nf-0002Lq-50
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kq8kt-0000bP-Gq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:56:43 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kq8kq-0000Wi-IY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:56:43 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cxyld23cxzhtmN;
 Fri, 18 Dec 2020 13:55:57 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 13:56:29 +0800
Subject: Re: [PATCH] acpi/gpex: Inform os to keep firmware resource map
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20201217132926.4812-1-cenjiahui@huawei.com>
 <20201217144933-mutt-send-email-mst@kernel.org>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <0c7bcfe9-437b-f750-29d5-983d09a47b3c@huawei.com>
Date: Fri, 18 Dec 2020 13:56:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201217144933-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: xieyingtai@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 2020/12/18 4:04, Michael S. Tsirkin wrote:
> On Thu, Dec 17, 2020 at 09:29:26PM +0800, Jiahui Cen wrote:
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
>>
>>     While in Linux, kernel will use 0x2FFFFFF as the alignment to calculate
>>     the PMem64 size, which would be 0x6000000.
>>
>> The diffences could result in resource assignment failure.
>>
>> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>> that firmware has done at boot time could handle the differences.
>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/pci-host/gpex-acpi.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 071aa11b5c..2b490f3379 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -112,10 +112,19 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>> -    uint8_t byte_list[1] = {1};
>> +    uint8_t byte_list[1] = {0x21};
>>      buf = aml_buffer(1, byte_list);
> 
> 
> Hmm what is this change for?
> 
> I also noticed something weird.
> Spec seems to say for _DSM for PCI Express Slot Information:
> 
> 
> Arguments:
> Arg0: UUID: E5C937D0-3553-4d7a-9117-EA4D19C3434D
> Arg1: Revision ID: 2
> Arg2: Function Index: 1
> Arg3: Empty Package
> 
> 
> how come we are comparing function index to 0 here?
> 

PCI Firmware Spec says in 4.6.1. _DSM for PCI Express Slot Information

Note: Function 0 is a generic Query function that is supported by _DSMs with any UUID and
Revision ID. The definition of function 0 is generic to _DSM and specified in the ACPI Specification,
Version 3.0 (or later).


And ACPI Spec says in 9.1.1 _DSM (Device Specific Method)

Return Value Information:
If Function Index is zero, the return is a buffer containing one bit for each function index, starting with zero. Bit 0
indicates whether there is support for any functions other than function 0 for the specified UUID and Revision ID.
If set to zero, no functions are supported (other than function zero) for the specified UUID and Revision ID. If set
to one, at least one additional function is supported. For all other bits in the buffer, a bit is set to zero to indicate if
that function index is not supported for the specific UUID and Revision ID. (For example, bit 1 set to 0 indicates that
function index 1 is not supported for the specific UUID and Revision ID.)


I have no idea whether the original code does aim to use _DSM #0
by setting function index 0 (The return value seems not to be suitable
with _DSM #1). But if it does, I think it is necessary to set bit 5
in return value to indicate _DSM #5 function is supported.

> 
> Also, as long as we are changing this probably shouldn't hard-code
> 1 as array size ...
> 

Is a macro enough? Like #define RET_BUF_SIZE 2

> 
>>      aml_append(ifctx1, aml_return(buf));
>>      aml_append(ifctx, ifctx1);
>> +
>> +    /* PCI Firmware Specification 3.2
>> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
> 
> Note you must always quote the most recent spec that
> your change refers to. This is so people can figure out
> legacy guest compatibility.
> 
> In this case I think this first appeard in 3.1 not 3.2
> 

OK, I'll fix this.

>> +     * The UUID in _DSM in this context is
>> +     * {E5C937D0-3553-4D7A-9117-EA4D19C3434D}
> 
> This is just five lines earier, I don't think we need it here.
> 

Will remove.

>> +     */
>> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
> 
> add comment:
> 	/* Arg2: Function Index: 5 */

Will add.

> 
>> +    aml_append(ifctx1, aml_return(aml_int(0)));
> 
> 
> add comment: /* 0 - do not ignore ... (quote spec I don't have it to hand) */
> 

Will add.

Thanks,
Jiahui

> 
> 
> 
>> +    aml_append(ifctx, ifctx1);
>>      aml_append(method, ifctx);
>>  
>>      byte_list[0] = 0;
>> -- 
>> 2.28.0
> 
> .
> 

