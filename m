Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463982D0AAA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 07:28:41 +0100 (CET)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmA0m-0004od-CE
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 01:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1km9z2-0004Mf-2u
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:26:52 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:52450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1km9z0-0003vs-0T
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:26:51 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B76NxL0154986;
 Mon, 7 Dec 2020 06:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=cRijsNZSJo7DuIfkrKxyQgxeys/0e/x1mPFV7gE+bAQ=;
 b=vEq9HXHT7k7TLlM8791Gv43EFUc/2cgkyjEZ4356EOhpuqz7sNCEHtSxYbHPnGJGqjyA
 XhgUm7J13AujJTna5xeh8A6jM/kULNYeSPHPRoQN3HRzXVgMmqWr5tyunoaBFDjDRQ0g
 dmQOGddAvcZLdZufviHLemgEvXWG7w1ouwVxaebxK1xdQdpfIn3WdiSLTcS6BEj2c8wm
 r8A4BgWn6wHk+2W1nk2yHWNZNTxQ3lUeNDfpDYgOV5JkhKhN5WXAZ032gHgyeTn7W42Q
 S+AGiCRI+DIdhjVDnBprNDgk25qHpFx5U8mNeAUyrUfJN6Oigq1zj3jo2W6kiInDC8XO 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3581mqkmgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 06:26:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B76BdqB011399;
 Mon, 7 Dec 2020 06:24:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 358m4vhwh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 06:24:46 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B76OjaD011960;
 Mon, 7 Dec 2020 06:24:45 GMT
Received: from [10.159.238.131] (/10.159.238.131)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 06 Dec 2020 22:24:45 -0800
Subject: Re: [PATCH 5/8] x86: acpi: let the firmware handle pending "CPU
 remove" events in SMM
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201204170939.1815522-1-imammedo@redhat.com>
 <20201204170939.1815522-6-imammedo@redhat.com>
 <533b92b0-1eae-f24d-b90b-f7f174dbf305@oracle.com>
Message-ID: <4144648e-0488-3b06-26d8-e894f148a961@oracle.com>
Date: Sun, 6 Dec 2020 22:24:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <533b92b0-1eae-f24d-b90b-f7f174dbf305@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070041
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=ankur.a.arora@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-12-06 10:20 p.m., Ankur Arora wrote:
> On 2020-12-04 9:09 a.m., Igor Mammedov wrote:
>> if firmware and QEMU negotiated CPU hotunplug support, generate
>> _EJ0 method so that it will mark CPU for removal by firmware and
>> pass control to it by triggering SMI.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>>   include/hw/acpi/cpu.h |  1 +
>>   hw/acpi/cpu.c         | 15 +++++++++++++--
>>   hw/i386/acpi-build.c  |  1 +
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
>> index d71edde456..999caaf510 100644
>> --- a/include/hw/acpi/cpu.h
>> +++ b/include/hw/acpi/cpu.h
>> @@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>>   typedef struct CPUHotplugFeatures {
>>       bool acpi_1_compatible;
>>       bool has_legacy_cphp;
>> +    bool fw_unplugs_cpu;
>>       const char *smi_path;
>>   } CPUHotplugFeatures;
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index 811218f673..bded2a837f 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -341,6 +341,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>>   #define CPU_INSERT_EVENT  "CINS"
>>   #define CPU_REMOVE_EVENT  "CRMV"
>>   #define CPU_EJECT_EVENT   "CEJ0"
>> +#define CPU_FW_EJECT_EVENT "CEJF"
>>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>                       hwaddr io_base,
>> @@ -393,7 +394,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>           aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
> 
>    Bit 2: Device remove event, used to distinguish device for which
>          no device eject request to OSPM was issued. Firmware must
>          ignore this bit.
> 
>>           /* initiates device eject, write only */
>>           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
> 
>    Bit 3: reserved and should be ignored by OSPM

In write-access mode:
Bit  3: if set to 1 initiates device eject, set by OSPM when it
        triggers CPU device removal and calls _EJ0 method or by firmware
        when bit #4 is set. In case bit #4 were set, it's cleared as
        part of device eject.

(and so should not be a reserved_field() below)

> 
>> -        aml_append(field, aml_reserved_field(4));
>> +        aml_append(field, aml_reserved_field(1));
>> +        /* tell firmware to do device eject, write only */
>> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
>> +        aml_append(field, aml_reserved_field(2));
> 
> Shouldn't this be instead:
> 
>> -        aml_append(field, aml_reserved_field(4));
>> +        /* tell firmware to do device eject, write only */
>> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
>> +        aml_append(field, aml_reserved_field(3));
> 
>    Bit 4: if set to 1, OSPM requests firmware to perform device eject.
>    Bit 5-7: reserved and should be ignored by OSPM
> 
> Otherwise AFAICS CPU_FW_EJECT_EVENT would correspond to bit 5.
> 
> 
> Ankur
> 
>>           aml_append(field, aml_named_field(CPU_COMMAND, 8));
>>           aml_append(cpu_ctrl_dev, field);
>> @@ -428,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>>           Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>>           Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
>> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>>           aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>>           aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
>> @@ -470,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>>               aml_append(method, aml_store(idx, cpu_selector));
>> -            aml_append(method, aml_store(one, ej_evt));
>> +            if (opts.fw_unplugs_cpu) {
>> +                aml_append(method, aml_store(one, fw_ej_evt));
>> +                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
>> +                           aml_name("%s", opts.smi_path)));
>> +            } else {
>> +                aml_append(method, aml_store(one, ej_evt));
>> +            }
>>               aml_append(method, aml_release(ctrl_lock));
>>           }
>>           aml_append(cpus_dev, method);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 9036e5594c..475e76f514 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1586,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>           CPUHotplugFeatures opts = {
>>               .acpi_1_compatible = true, .has_legacy_cphp = true,
>>               .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
>> +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>>           };
>>           build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>>                          "\\_SB.PCI0", "\\_GPE._E02");
>>

