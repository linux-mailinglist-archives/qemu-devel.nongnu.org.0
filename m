Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B821A2DDEA2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:32:31 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9JW-0006Ye-PL
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kq917-0000tw-Nd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:13:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kq912-0006Fc-HM
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:13:29 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cxz6f15hLzks4t;
 Fri, 18 Dec 2020 14:12:26 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 14:13:07 +0800
Subject: Re: [PATCH] acpi: Add addr_trans in build_crs
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20201217132747.4744-1-cenjiahui@huawei.com>
 <20201217132949-mutt-send-email-mst@kernel.org>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <3b42c9c8-816e-f505-3853-fd1c968e6b05@huawei.com>
Date: Fri, 18 Dec 2020 14:13:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201217132949-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 2020/12/18 2:32, Michael S. Tsirkin wrote:
> On Thu, Dec 17, 2020 at 09:27:47PM +0800, Jiahui Cen wrote:
>> AML needs Address Translation offset to describe how a bridge translates
>> addresses accross the bridge when using an address descriptor, and
>> especially on ARM, the translation offset of pio resource is usually
>> non zero.
>>
>> Therefore, it's necessary to pass addr_trans for pio, mmio32 and mmio64
>> into build_crs.
>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/acpi/aml-build.c         | 15 ++++++++-------
>>  hw/i386/acpi-build.c        |  3 ++-
>>  hw/pci-host/gpex-acpi.c     |  3 ++-
>>  include/hw/acpi/aml-build.h |  4 +++-
>>  4 files changed, 15 insertions(+), 10 deletions(-)
> 
> 
> Doesn't this result in any changes to expected files for tests?

Right, I'll update the expected file for test.

BTW, another patch that introduces _DSM #5 also seems to need
changes to expected files. Should I put them in one patch series
and update expected files once?

> 
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index f976aa667b..be077b3ab6 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2076,7 +2076,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>                   tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>>  }
>>  
>> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set,
>> +               hwaddr io_trans, hwaddr mmio32_trans, hwaddr mmio64_trans)
> 
> 
> More of io_offset etc I think.

IIUC, io_trans is just the io_offset. Would it be better to rename
io_trans to io_offset? And seems I forgot to add bus number trans.

Thanks,
Jiahui
> 
>>  {
>>      Aml *crs = aml_resource_template();
>>      CrsRangeSet temp_range_set;
>> @@ -2189,10 +2190,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>      for (i = 0; i < temp_range_set.io_ranges->len; i++) {
>>          entry = g_ptr_array_index(temp_range_set.io_ranges, i);
>>          aml_append(crs,
>> -                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
>> -                               AML_POS_DECODE, AML_ENTIRE_RANGE,
>> -                               0, entry->base, entry->limit, 0,
>> -                               entry->limit - entry->base + 1));
>> +                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
>> +                                AML_POS_DECODE, AML_ENTIRE_RANGE,
>> +                                0, entry->base, entry->limit, io_trans,
>> +                                entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
>>      }
>>  
>> @@ -2205,7 +2206,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>                     aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>>                                      AML_READ_WRITE,
>> -                                    0, entry->base, entry->limit, 0,
>> +                                    0, entry->base, entry->limit, mmio32_trans,
>>                                      entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
>>      }
>> @@ -2217,7 +2218,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>                     aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>>                                      AML_READ_WRITE,
>> -                                    0, entry->base, entry->limit, 0,
>> +                                    0, entry->base, entry->limit, mmio64_trans,
>>                                      entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->mem_64bit_ranges,
>>                           entry->base, entry->limit);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index f18b71dea9..7461ccad2c 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1360,7 +1360,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>              }
>>  
>>              aml_append(dev, build_prt(false));
>> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
>> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
>> +                            0, 0, 0);
>>              aml_append(dev, aml_name_decl("_CRS", crs));
>>              aml_append(scope, dev);
>>              aml_append(dsdt, scope);
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 7f20ee1c98..071aa11b5c 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -168,7 +168,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>               * 1. The resources the pci-brige/pcie-root-port need.
>>               * 2. The resources the devices behind pxb need.
>>               */
>> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
>> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
>> +                            cfg->pio.base, 0, 0);
>>              aml_append(dev, aml_name_decl("_CRS", crs));
>>  
>>              acpi_dsdt_add_pci_osc(dev);
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index e727bea1bc..ff3dcb703d 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -1,6 +1,7 @@
>>  #ifndef HW_ACPI_AML_BUILD_H
>>  #define HW_ACPI_AML_BUILD_H
>>  
>> +#include "exec/hwaddr.h"
>>  #include "hw/acpi/acpi-defs.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>>  
>> @@ -452,7 +453,8 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
>>  void crs_range_set_init(CrsRangeSet *range_set);
>>  void crs_range_set_free(CrsRangeSet *range_set);
>>  
>> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
>> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set,
>> +               hwaddr io_trans, hwaddr mmio32_trans, hwaddr mmio64_trans);
>>  
>>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>                         uint64_t len, int node, MemoryAffinityFlags flags);
>> -- 
>> 2.28.0
> 
> .
> 

