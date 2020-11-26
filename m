Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FE2C57F2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:18:35 +0100 (CET)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ2Z-0003dA-1M
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kiES3-0003IX-Su
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:24:35 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:44202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kiES1-00080u-Gf
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:24:35 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQAIj1X165215;
 Thu, 26 Nov 2020 10:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=a2OMVuAK0MWYCXBvfdv57unumiFGjeXVUwz5Og1I+KI=;
 b=IqbgYriAjR35z5qs9pzo3n3yPS3A8TNxYpxotHnLgyvV3+8X8iYm9Gdy3E/PqUu01Ysp
 8X7VT93We6XZOBXbWtNtPRUPcfuv4/Q8SChQ9+XZRet0pWmyAs3qUDWXijjLB+YgNCSq
 ODkYiCYKydsr7n/1AXtKZNS9pF3VuSJgpLUrJqx2x0BzJJh8D92o7SKrr5qYF+6UDFk7
 itfQU/kpPT/dcbB0Mlfz47LVFcOvhdtNdJvMdFlxehBCnCD36q2Khjm7LAH40Rx1+oaD
 m5ZPiNXghm6XIwDkGWHeHHDFiTXqg2weMxYkBUXgkcfnKQWvoEWI4PHHeGCb/DJSYV0A yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 351kwhdg17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Nov 2020 10:24:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AQAL2lE183974;
 Thu, 26 Nov 2020 10:24:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 351kwfrcmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 10:24:29 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AQAOSuB032048;
 Thu, 26 Nov 2020 10:24:28 GMT
Received: from [10.159.158.250] (/10.159.158.250)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Nov 2020 02:24:27 -0800
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201124122507.1014839-1-imammedo@redhat.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
Date: Thu, 26 Nov 2020 02:24:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201124122507.1014839-1-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9816
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011260062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011260061
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=ankur.a.arora@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Nov 2020 10:16:17 -0500
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
Cc: lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-24 4:25 a.m., Igor Mammedov wrote:
> If firmware negotiates ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT feature,
> OSPM on CPU eject will set bit #4 in CPU hotplug block for to be
> ejected CPU to mark it for removal by firmware and trigger SMI
> upcall to let firmware do actual eject.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
>    - abuse 5.1 machine type for now to turn off unplug feature
>      (it will be moved to 5.2 machine type once new merge window is open)
> ---
>   include/hw/acpi/cpu.h           |  2 ++
>   docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
>   hw/acpi/cpu.c                   | 18 ++++++++++++++++--
>   hw/i386/acpi-build.c            |  5 +++++
>   hw/i386/pc.c                    |  1 +
>   hw/isa/lpc_ich9.c               |  2 +-
>   6 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 0eeedaa491..999caaf510 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
>       uint64_t arch_id;
>       bool is_inserting;
>       bool is_removing;
> +    bool fw_remove;
>       uint32_t ost_event;
>       uint32_t ost_status;
>   } AcpiCpuStatus;
> @@ -50,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>   typedef struct CPUHotplugFeatures {
>       bool acpi_1_compatible;
>       bool has_legacy_cphp;
> +    bool fw_unplugs_cpu;
>       const char *smi_path;
>   } CPUHotplugFeatures;
>   
> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> index 9bb22d1270..f68ef6e06c 100644
> --- a/docs/specs/acpi_cpu_hotplug.txt
> +++ b/docs/specs/acpi_cpu_hotplug.txt
> @@ -57,7 +57,11 @@ read access:
>                 It's valid only when bit 0 is set.
>              2: Device remove event, used to distinguish device for which
>                 no device eject request to OSPM was issued.
> -           3-7: reserved and should be ignored by OSPM
> +           3: reserved and should be ignored by OSPM
> +           4: if set to 1, OSPM requests firmware to perform device eject,
> +              firmware shall clear this event by writing 1 into it before
> +              performing device eject> +           5-7: reserved and should be ignored by OSPM
>       [0x5-0x7] reserved
>       [0x8] Command data: (DWORD access)
>             contains 0 unless value last stored in 'Command field' is one of:
> @@ -82,7 +86,10 @@ write access:
>                  selected CPU device
>               3: if set to 1 initiates device eject, set by OSPM when it
>                  triggers CPU device removal and calls _EJ0 method
> -            4-7: reserved, OSPM must clear them before writing to register
> +            4: if set to 1 OSPM hands over device eject to firmware,
> +               Firmware shall issue device eject request as described above
> +               (bit #3) and OSPM should not touch device eject bit (#3),
> +            5-7: reserved, OSPM must clear them before writing to register
>       [0x5] Command field: (1 byte access)
>             value:
>               0: selects a CPU device with inserting/removing events and
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f099b50927..09d2f20dae 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>           val |= cdev->cpu ? 1 : 0;
>           val |= cdev->is_inserting ? 2 : 0;
>           val |= cdev->is_removing  ? 4 : 0;
> +        val |= cdev->fw_remove  ? 16 : 0;

I might be missing something but I don't see where cdev->fw_remove is being
set. We do set cdev->is_removing in acpi_cpu_unplug_request_cb() so AFAICS
we would always end up setting this bit:
>           val |= cdev->is_removing  ? 4 : 0;

Also, if cdev->fw_remove and cdev->is_removing are both true, val would be
(4 | 16). I'm guessing that in that case the AML determines which case gets
handled but it might make sense to set just one of these?


>           trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>           break;
>       case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -148,6 +149,8 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
>               hotplug_ctrl = qdev_get_hotplug_handler(dev);
>               hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
>               object_unparent(OBJECT(dev));
> +        } else if (data & 16) {
> +            cdev->fw_remove = !cdev->fw_remove;
>           }
>           break;
>       case ACPI_CPU_CMD_OFFSET_WR:
> @@ -332,6 +335,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>   #define CPU_INSERT_EVENT  "CINS"
>   #define CPU_REMOVE_EVENT  "CRMV"
>   #define CPU_EJECT_EVENT   "CEJ0"
> +#define CPU_FW_EJECT_EVENT "CEJF"
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                       hwaddr io_base,
> @@ -384,7 +388,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
>           /* initiates device eject, write only */
>           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(4));
> +        aml_append(field, aml_reserved_field(1));
> +        /* tell firmware to do device eject, write only */
> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>           aml_append(field, aml_named_field(CPU_COMMAND, 8));
>           aml_append(cpu_ctrl_dev, field);
>   
> @@ -419,6 +426,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>           Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>           Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>   
>           aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>           aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
> @@ -461,7 +469,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>   
>               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>               aml_append(method, aml_store(idx, cpu_selector));
> -            aml_append(method, aml_store(one, ej_evt));
> +            if (opts.fw_unplugs_cpu) {
> +                aml_append(method, aml_store(one, fw_ej_evt));
> +                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
> +                           aml_name("%s", opts.smi_path)));
> +            } else {
> +                aml_append(method, aml_store(one, ej_evt));
> +            }
My knowledge of AML is rather rudimentary but this looks mostly reasonable to me.

One question: the corresponding code for CPU hotplug does not send an SMI_CMD.
Why the difference?

                     aml_append(while_ctx,
                         aml_store(aml_derefof(aml_index(new_cpus, cpu_idx)),
                                   uid));
                     aml_append(while_ctx,
                         aml_call2(CPU_NOTIFY_METHOD, uid, dev_chk));
                     aml_append(while_ctx, aml_store(uid, cpu_selector));
                     aml_append(while_ctx, aml_store(one, ins_evt));
                     aml_append(while_ctx, aml_increment(cpu_idx));


>               aml_append(method, aml_release(ctrl_lock));
>           }
>           aml_append(cpus_dev, method);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1f5c211245..475e76f514 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
>       bool s4_disabled;
>       bool pcihp_bridge_en;
>       bool smi_on_cpuhp;
> +    bool smi_on_cpu_unplug;
>       bool pcihp_root_en;
>       uint8_t s4_val;
>       AcpiFadtData fadt;
> @@ -197,6 +198,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>       pm->pcihp_io_base = 0;
>       pm->pcihp_io_len = 0;
>       pm->smi_on_cpuhp = false;
> +    pm->smi_on_cpu_unplug = false;
>   
>       assert(obj);
>       init_common_fadt_data(machine, obj, &pm->fadt);
> @@ -220,6 +222,8 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>           pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
>           pm->smi_on_cpuhp =
>               !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
> +        pm->smi_on_cpu_unplug =
> +            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
>       }
>   
>       /* The above need not be conditional on machine type because the reset port
> @@ -1582,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           CPUHotplugFeatures opts = {
>               .acpi_1_compatible = true, .has_legacy_cphp = true,
>               .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
> +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>           };
>           build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                          "\\_SB.PCI0", "\\_GPE._E02");
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 17b514d1da..2952a00fe6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -99,6 +99,7 @@
>   
>   GlobalProperty pc_compat_5_1[] = {
>       { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
> +    { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
>   };
>   const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
>   
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 087a18d04d..8c667b7166 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -770,7 +770,7 @@ static Property ich9_lpc_properties[] = {
>       DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
>                         ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
>       DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
> -                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
> +                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 

Thanks for sending out the patch btw. This helped me crystallize some of the
corresponding OVMF code.

Ankur

