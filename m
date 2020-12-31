Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6302E7E9B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 08:37:32 +0100 (CET)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kusWZ-00032c-5m
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 02:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kusTz-00028k-Bl
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 02:34:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kusTq-0002x5-Tw
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 02:34:50 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D60J816NqzkycM;
 Thu, 31 Dec 2020 15:33:28 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 15:34:22 +0800
Subject: Re: [PATCH v3 5/8] acpi/gpex: Append pxb devs in ascending order
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-6-cenjiahui@huawei.com>
 <20201229144735.42faddad@redhat.com>
 <20201230160814-mutt-send-email-mst@kernel.org>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <e4c78ddf-146c-af86-940e-4dc2b876eb98@huawei.com>
Date: Thu, 31 Dec 2020 15:34:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201230160814-mutt-send-email-mst@kernel.org>
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
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/31 5:17, Michael S. Tsirkin wrote:
> On Tue, Dec 29, 2020 at 02:47:35PM +0100, Igor Mammedov wrote:
>> On Wed, 23 Dec 2020 17:08:33 +0800
>> Jiahui Cen <cenjiahui@huawei.com> wrote:
>>
>>> The overlap check of IO resource window would fail when Linux kernel
>>> registers an IO resource [b, c) earlier than another resource [a, b).
>>> Though this incorrect check could be fixed by [1], it would be better to
>>> append pxb devs into DSDT table in ascending order.
>>>
>>> [1]: https://lore.kernel.org/lkml/20201218062335.5320-1-cenjiahui@huawei.com/
>>
>> considering there is acceptable fix for kernel I'd rather avoid
>> workarounds on QEMU side. So I suggest dropping this patch.
> 
> Well there's something to be said for a defined order of things.
> And patch is from Dec 2020 will take ages for guests to be fixed,
> and changing pci core on stable kernels is risky and needs
> a ton of testing, not done eaily ...

Agree. It seems not a fatal problem since usually the resources
are ordered, so I have no idea how long it would take to accept
the patch.

> Which guests are affected by the bug?

It is a common part of pci resource registery, and all those having
PCI_IOBASE defined would be affected, such as arm, arm64, mips, risc-v...

> 
> There are also some issues with the patch see below.
> 
>> it also should reduce noise in [8/8] masking other changes.
>>
>>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>>> ---
>>>  hw/pci-host/gpex-acpi.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>>> index 4bf1e94309..95a7a0f12b 100644
>>> --- a/hw/pci-host/gpex-acpi.c
>>> +++ b/hw/pci-host/gpex-acpi.c
>>> @@ -141,7 +141,7 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>>  {
>>>      int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
>>> -    Aml *method, *crs, *dev, *rbuf;
>>> +    Aml *method, *crs, *dev, *rbuf, *pxb_devs[nr_pcie_buses];
> 
> dynamically sized array on stack poses security issues

Thanks for your review.

I will replace it with dynamical allocation like g_alloc0.

> 
>>>      PCIBus *bus = cfg->bus;
>>>      CrsRangeSet crs_range_set;
>>>      CrsRangeEntry *entry;
>>> @@ -149,6 +149,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>>  
>>>      /* start to construct the tables for pxb */
>>>      crs_range_set_init(&crs_range_set);
>>> +    memset(pxb_devs, 0, sizeof(pxb_devs));
>>>      if (bus) {
>>>          QLIST_FOREACH(bus, &bus->child, sibling) {
>>>              uint8_t bus_num = pci_bus_num(bus);
>>> @@ -190,7 +191,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>>  
>>>              acpi_dsdt_add_pci_osc(dev);
>>>  
>>> -            aml_append(scope, dev);
>>> +            pxb_devs[bus_num] = dev;
> 
> If bus numbers intersect this will overwrite old one.
> I'd rather not worry about it, just have an array
> of structs with bus numbers and sort it.
> 

I have no idea when the bus numbers would intersect. IIUC, the
validity of bus number will be checked when pxb device realizes.
Thus different root buses would have different bus numbers.

> 
>>>          }
>>>      }
>>>  
>>> @@ -278,5 +279,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>>      aml_append(dev, dev_res0);
>>>      aml_append(scope, dev);
>>>  
>>> +    for (i = 0; i < ARRAY_SIZE(pxb_devs); i++) {
>>> +        if (pxb_devs[i]) {
>>> +            aml_append(scope, pxb_devs[i]);
>>> +        }
>>> +    }
> 
> 
> so this sorts them by bus number not by io address.
> Probably happens to help since bios numbers them in the same order ...
> Is there a way to address this more robustly in case
> bios changes? E.g. I see the bug is only in PIO so sort by that address maybe?
> 

In my humble opinion, sorting by bus number may be the simplest
way to workaround the bug, because generally the bios assigns
resources in bus number ascending order and thus the io address
would be assigned in order.

In case bios changes, as long as the bug is fixed, OS could handle
the resources no matter whether the resource is in order or not.

Otherwise we need to expose io address range from `build_crs`
for sorting. And in this way, there may be another problem that
the sorting would be difficult if a root bus has several separated
io resource windows which intersect other root buses.(Though,
generally the io resource window is a continuous range as bios
assigns resources in order.)

> Also pls add a code comment explaining why we are doing all this
> with link to patch, which guests are affected etc.

OK, I will add comments.

Thanks,
Jiahui

>>> +
>>>      crs_range_set_free(&crs_range_set);
>>>  }
> 
> .
> 

