Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732412E7DD9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 04:28:03 +0100 (CET)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuod8-0005E1-2d
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 22:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kuoc8-0004nk-B9
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 22:27:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kuoc5-000587-8e
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 22:26:59 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D5tpV32gtz15lt2;
 Thu, 31 Dec 2020 11:25:54 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 11:26:36 +0800
Subject: Re: [PATCH v3 2/8] acpi: Add addr offset in build_crs
To: Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-3-cenjiahui@huawei.com>
 <20201229143657.1e00faf5@redhat.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <fe7e3656-721c-229c-f8b2-8d4a5a07dc01@huawei.com>
Date: Thu, 31 Dec 2020 11:26:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201229143657.1e00faf5@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/29 21:36, Igor Mammedov wrote:
> On Wed, 23 Dec 2020 17:08:30 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> 
>> AML needs Address Translation offset to describe how a bridge translates
>> addresses accross the bridge when using an address descriptor, and
>> especially on ARM, the translation offset of pio resource is usually
>> non zero.
> 
> could you point out where in patch [8/8] it becomes non zero?
> 

Actually the testcase is simple and there is no resource required by
the extra bus except bus number. So this patch seems not change the
expected files. Would it be better to add some devices under the extra
bus in the testcase?

BTW, there are several patches that changes the expected files and
make patch [8/8] messy. Should I separate patch [8/8] into different
patches to make it clear?

Thanks,
Jiahui

>>
>> Therefore, it's necessary to pass offset for pio, mmio32, mmio64 and bus
>> number into build_crs.
>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/acpi/aml-build.c         | 18 ++++++++++--------
>>  hw/i386/acpi-build.c        |  3 ++-
>>  hw/pci-host/gpex-acpi.c     |  3 ++-
>>  include/hw/acpi/aml-build.h |  4 +++-
>>  4 files changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index f976aa667b..7b6ebb0cc8 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2076,7 +2076,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>                   tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>>  }
>>  
>> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
>> +               uint32_t mmio32_offset, uint64_t mmio64_offset,
>> +               uint16_t bus_nr_offset)
>>  {
>>      Aml *crs = aml_resource_template();
>>      CrsRangeSet temp_range_set;
>> @@ -2189,10 +2191,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>      for (i = 0; i < temp_range_set.io_ranges->len; i++) {
>>          entry = g_ptr_array_index(temp_range_set.io_ranges, i);
>>          aml_append(crs,
>> -                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
>> -                               AML_POS_DECODE, AML_ENTIRE_RANGE,
>> -                               0, entry->base, entry->limit, 0,
>> -                               entry->limit - entry->base + 1));
>> +                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
>> +                                AML_POS_DECODE, AML_ENTIRE_RANGE,
>> +                                0, entry->base, entry->limit, io_offset,
>> +                                entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
>>      }
>>  
>> @@ -2205,7 +2207,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>                     aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>>                                      AML_READ_WRITE,
>> -                                    0, entry->base, entry->limit, 0,
>> +                                    0, entry->base, entry->limit, mmio32_offset,
>>                                      entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
>>      }
>> @@ -2217,7 +2219,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>                     aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>>                                      AML_READ_WRITE,
>> -                                    0, entry->base, entry->limit, 0,
>> +                                    0, entry->base, entry->limit, mmio64_offset,
>>                                      entry->limit - entry->base + 1));
>>          crs_range_insert(range_set->mem_64bit_ranges,
>>                           entry->base, entry->limit);
>> @@ -2230,7 +2232,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>>                              0,
>>                              pci_bus_num(host->bus),
>>                              max_bus,
>> -                            0,
>> +                            bus_nr_offset,
>>                              max_bus - pci_bus_num(host->bus) + 1));
>>  
>>      return crs;
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index f18b71dea9..f56d699c7f 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1360,7 +1360,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>              }
>>  
>>              aml_append(dev, build_prt(false));
>> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
>> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
>> +                            0, 0, 0, 0);
>>              aml_append(dev, aml_name_decl("_CRS", crs));
>>              aml_append(scope, dev);
>>              aml_append(dsdt, scope);
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 7f20ee1c98..11b3db8f71 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -168,7 +168,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>               * 1. The resources the pci-brige/pcie-root-port need.
>>               * 2. The resources the devices behind pxb need.
>>               */
>> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
>> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
>> +                            cfg->pio.base, 0, 0, 0);
>>              aml_append(dev, aml_name_decl("_CRS", crs));
>>  
>>              acpi_dsdt_add_pci_osc(dev);
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index e727bea1bc..54a5aec4d7 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -452,7 +452,9 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
>>  void crs_range_set_init(CrsRangeSet *range_set);
>>  void crs_range_set_free(CrsRangeSet *range_set);
>>  
>> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
>> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
>> +               uint32_t mmio32_offset, uint64_t mmio64_offset,
>> +               uint16_t bus_nr_offset);
>>  
>>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>                         uint64_t len, int node, MemoryAffinityFlags flags);
> 
> .
> 

