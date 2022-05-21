Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794752FA2D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:13:25 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLAp-0000q6-Qs
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nsL8g-0007yo-P3
 for qemu-devel@nongnu.org; Sat, 21 May 2022 05:11:10 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nsL8f-0000fe-2A
 for qemu-devel@nongnu.org; Sat, 21 May 2022 05:11:10 -0400
Received: by mail-ej1-x636.google.com with SMTP id m20so19451375ejj.10
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbVZumlmqIlKW4tw4gW3FnmT0CGvI34/PKMaPOCdfEA=;
 b=Uos3/RYP2bI7RvKwfAW6OhZivmMViyaaCvAks7M5nw7CY3tv5YNc3c2SgAD0xY6RFj
 yUjyfVM4daibK6PD7EnWN6DBxECTGjDSFoArAjs85FYMH2/U+ezkM7kG1GmIpij9Hp0F
 e8scaS2xMyvISnOa0xmrSQO7NIF2GxIqfG0BrWROMQ/pq2AtBHSwG+/w9kknF+q6uYnm
 RBaTsc0qnoSY1YeT8My5MjlFlFWjlu5n55BQznNqdRWZrcQJ2/vShwAkbGHmnETtOIye
 P8qnhRBVmuDuRPy1HMhq7VLAZbggBPxOJYWzK5Wkxfxk6oOGk3HF+4J2TOA32GZrzi1U
 tPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbVZumlmqIlKW4tw4gW3FnmT0CGvI34/PKMaPOCdfEA=;
 b=jygFjwmsZ5G1kdlULQksmKw0QWdlaEX3Dq0dRgpFClQreRFa5vtdRSYOIZdnT6RHRw
 nmX2PBzbhmvZFL/3Z+GJYJdRG5mBsxSRc/7lQOGfdIxod3QX8dg87uTfAuKHfj1LHwIz
 BYaUBa8adxQoP4yqyoKrbIlu6AQ4hOsV3eTzI6Q4tbsBShSqMbR+ST7Gf+la5/Pp7mWz
 Gny1d9pkHllQGp/Hpo/b5ZCfaWHwR6VKFocvT5l5V5To1u8bm6EBVGdcSOpg8Bdihq2y
 zmmcPQCkG1tzdOoWZ2gw5VXuckRdURnUuHKWSbqiGtBP0qbOaSU5CLQB+NvmgC8jcqq9
 bLnw==
X-Gm-Message-State: AOAM530iiyI749Vu5+5MoxcBOb6iBPhZwG2f0iGEi7cobgh06+MUIfi3
 SLItS0Q8Q860Q/k5Ki3iDro=
X-Google-Smtp-Source: ABdhPJxt9jBPQAvpuf6fp0rlNFLbT3KhbwqCLXY2XL9cH3mahXwlRMu3IjsVe8jOpS6GLYwJLh0IlQ==
X-Received: by 2002:a17:907:a40a:b0:6f4:d84e:3e49 with SMTP id
 sg10-20020a170907a40a00b006f4d84e3e49mr11471108ejc.361.1653124267680; 
 Sat, 21 May 2022 02:11:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 q10-20020aa7da8a000000b0042617ba637fsm5476791eds.9.2022.05.21.02.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 02:11:07 -0700 (PDT)
Message-ID: <c3dcb335-1a7f-b8d4-ee77-8b00aefcb274@redhat.com>
Date: Sat, 21 May 2022 11:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 13/45] cxl: Machine level control on whether CXL
 support is enabled
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, linuxarm@huawei.com,
 qemu-devel@nongnu.org, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
Cc: linux-cxl@vger.kernel.org, Ben Widawsky <ben.widawsky@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 f4bug@amsat.org, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Saransh Gupta1 <saransh@ibm.com>,
 Shreyas Shah <shreyas.shah@elastics.cloud>,
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena
 <samarths@cadence.com>, Dan Williams <dan.j.williams@intel.com>,
 k.jensen@samsung.com, dave@stgolabs.net,
 Alison Schofield <alison.schofield@intel.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
 <20220429144110.25167-14-Jonathan.Cameron@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220429144110.25167-14-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 16:40, Jonathan Cameron via wrote:
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> There are going to be some potential overheads to CXL enablement,
> for example the host bridge region reserved in memory maps.
> Add a machine level control so that CXL is disabled by default.
> 
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/machine.c    | 28 ++++++++++++++++++++++++++++
>   hw/i386/pc.c         |  1 +
>   include/hw/boards.h  |  2 ++
>   include/hw/cxl/cxl.h |  4 ++++
>   4 files changed, 35 insertions(+)

Another belated review, I think this shouldn't be added to machines that 
do not support CXL (yes, there are options like -M usb but they are from 
olden times---and CXL is a little more niche, too :)).

Can you move the CXL code for machines to e.g. hw/cxl/machine.c and have
the various machines call back into hooks to add the properties, resolve
the memory window targets etc.?.  A CXLState* like cxl_devices_state can 
be added to the machines and passed as CXLState** to one of these hooks.

Thanks,

Paolo

> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d..6ae2997f16 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -31,6 +31,7 @@
>   #include "sysemu/qtest.h"
>   #include "hw/pci/pci.h"
>   #include "hw/mem/nvdimm.h"
> +#include "hw/cxl/cxl.h"
>   #include "migration/global_state.h"
>   #include "migration/vmstate.h"
>   #include "exec/confidential-guest-support.h"
> @@ -550,6 +551,20 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
>       nvdimms_state->persistence_string = g_strdup(value);
>   }
>   
> +static bool machine_get_cxl(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->cxl_devices_state->is_enabled;
> +}
> +
> +static void machine_set_cxl(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->cxl_devices_state->is_enabled = value;
> +}
> +
>   void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>   {
>       QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
> @@ -782,6 +797,8 @@ static void machine_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_size = 128 * MiB;
>       mc->rom_file_has_mr = true;
>   
> +    /* Few machines support CXL, so default to off */
> +    mc->cxl_supported = false;
>       /* numa node memory size aligned on 8MB by default.
>        * On Linux, each node's border has to be 8MB aligned
>        */
> @@ -927,6 +944,16 @@ static void machine_initfn(Object *obj)
>                                           "Valid values are cpu, mem-ctrl");
>       }
>   
> +    if (mc->cxl_supported) {
> +        Object *obj = OBJECT(ms);
> +
> +        ms->cxl_devices_state = g_new0(CXLState, 1);
> +        object_property_add_bool(obj, "cxl", machine_get_cxl, machine_set_cxl);
> +        object_property_set_description(obj, "cxl",
> +                                        "Set on/off to enable/disable "
> +                                        "CXL instantiation");
> +    }
> +
>       if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
>           ms->numa_state = g_new0(NumaState, 1);
>           object_property_add_bool(obj, "hmat",
> @@ -961,6 +988,7 @@ static void machine_finalize(Object *obj)
>       g_free(ms->device_memory);
>       g_free(ms->nvdimms_state);
>       g_free(ms->numa_state);
> +    g_free(ms->cxl_devices_state);
>   }
>   
>   bool machine_usb(MachineState *machine)
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 23bba9d82c..b752339beb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1761,6 +1761,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>       mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>       mc->nvdimm_supported = true;
>       mc->smp_props.dies_supported = true;
> +    mc->cxl_supported = true;
>       mc->default_ram_id = "pc.ram";
>   
>       object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d64b5481e8..f756a1d5fc 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -269,6 +269,7 @@ struct MachineClass {
>       bool ignore_boot_device_suffixes;
>       bool smbus_no_migration_support;
>       bool nvdimm_supported;
> +    bool cxl_supported;
>       bool numa_mem_supported;
>       bool auto_enable_numa;
>       SMPCompatProps smp_props;
> @@ -360,6 +361,7 @@ struct MachineState {
>       CPUArchIdList *possible_cpus;
>       CpuTopology smp;
>       struct NVDIMMState *nvdimms_state;
> +    struct CXLState *cxl_devices_state;
>       struct NumaState *numa_state;
>   };
>   
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 554ad93b6b..31af92fd5e 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -17,4 +17,8 @@
>   #define CXL_COMPONENT_REG_BAR_IDX 0
>   #define CXL_DEVICE_REG_BAR_IDX 2
>   
> +typedef struct CXLState {
> +    bool is_enabled;
> +} CXLState;
> +
>   #endif


