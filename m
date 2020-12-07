Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB982D0AA3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 07:23:33 +0100 (CET)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km9vo-0002wD-5c
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 01:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1km9t0-00027V-2P
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:20:38 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:51742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1km9sx-0001HZ-9Y
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:20:37 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B769xFk065572;
 Mon, 7 Dec 2020 06:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vQ87+3l24IZ5MkdGqL07gNOXe/CuWxqVd3D0AJsqi88=;
 b=kfKXzzim1NLUGFxxb6PNauP4CvzsNYeGtF3+U7js1I2s/EiaX50FAJ/9qU4rykbDEzzC
 hsCBlVQdHYVZnNUDchwCcWy8w8dikyS0TnUGImbOw8zFwStINlqtmrE3057JVX5jeFL7
 rvC8pW6M0fAe7wfo6v32rsfU2XfGNVuPAxnEoBKyLLzzDJKq6tcxn34I71L29ndaduAO
 fWEjFwOK9uUAp3rvsOCKPnjqpqvs7JAWtgtpqQXIyXuySO4MuQGSCxGE2bv5VtCPaP2m
 aO3QHac6UZDXtwspvbvl3Nh3K/g6D0OciCgT7LrpLodLVRfGTn9+TMQxwfR90dPYlqAV kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 357yqbkqxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 06:20:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B76Akxf050296;
 Mon, 7 Dec 2020 06:20:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 358kskry4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 06:20:29 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B76KSaZ008600;
 Mon, 7 Dec 2020 06:20:28 GMT
Received: from [10.159.238.131] (/10.159.238.131)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 06 Dec 2020 22:20:27 -0800
Subject: Re: [PATCH 5/8] x86: acpi: let the firmware handle pending "CPU
 remove" events in SMM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201204170939.1815522-1-imammedo@redhat.com>
 <20201204170939.1815522-6-imammedo@redhat.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <533b92b0-1eae-f24d-b90b-f7f174dbf305@oracle.com>
Date: Sun, 6 Dec 2020 22:20:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201204170939.1815522-6-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9827
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070040
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

On 2020-12-04 9:09 a.m., Igor Mammedov wrote:
> if firmware and QEMU negotiated CPU hotunplug support, generate
> _EJ0 method so that it will mark CPU for removal by firmware and
> pass control to it by triggering SMI.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   include/hw/acpi/cpu.h |  1 +
>   hw/acpi/cpu.c         | 15 +++++++++++++--
>   hw/i386/acpi-build.c  |  1 +
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index d71edde456..999caaf510 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>   typedef struct CPUHotplugFeatures {
>       bool acpi_1_compatible;
>       bool has_legacy_cphp;
> +    bool fw_unplugs_cpu;
>       const char *smi_path;
>   } CPUHotplugFeatures;
>   
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 811218f673..bded2a837f 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -341,6 +341,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>   #define CPU_INSERT_EVENT  "CINS"
>   #define CPU_REMOVE_EVENT  "CRMV"
>   #define CPU_EJECT_EVENT   "CEJ0"
> +#define CPU_FW_EJECT_EVENT "CEJF"
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                       hwaddr io_base,
> @@ -393,7 +394,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));

   Bit 2: Device remove event, used to distinguish device for which
         no device eject request to OSPM was issued. Firmware must
         ignore this bit.

>           /* initiates device eject, write only */
>           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));

   Bit 3: reserved and should be ignored by OSPM

> -        aml_append(field, aml_reserved_field(4));
> +        aml_append(field, aml_reserved_field(1));
> +        /* tell firmware to do device eject, write only */
> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> +        aml_append(field, aml_reserved_field(2));

Shouldn't this be instead:

> -        aml_append(field, aml_reserved_field(4));
> +        /* tell firmware to do device eject, write only */
> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> +        aml_append(field, aml_reserved_field(3));

   Bit 4: if set to 1, OSPM requests firmware to perform device eject.
   Bit 5-7: reserved and should be ignored by OSPM

Otherwise AFAICS CPU_FW_EJECT_EVENT would correspond to bit 5.


Ankur

>           aml_append(field, aml_named_field(CPU_COMMAND, 8));
>           aml_append(cpu_ctrl_dev, field);
>   
> @@ -428,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>           Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>           Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>   
>           aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>           aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
> @@ -470,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
>               aml_append(method, aml_release(ctrl_lock));
>           }
>           aml_append(cpus_dev, method);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9036e5594c..475e76f514 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1586,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           CPUHotplugFeatures opts = {
>               .acpi_1_compatible = true, .has_legacy_cphp = true,
>               .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
> +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>           };
>           build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                          "\\_SB.PCI0", "\\_GPE._E02");
> 

