Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA41371E6C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:22:31 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcH9-0001lk-1z
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldc1e-0005Mt-Ql
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldc1X-0000me-MP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620061583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiJotyRMwWTX619D6R4OGkdEcW07YQOSXFbELgAder0=;
 b=dbi0j49jv+h+igTIKAOPg9G5DjGDnR67lCGFr0d6FTUDxi5jKCPghRZYEHD7b0Y7lI2gen
 K8pdn/27L65V/Y0DbVqjz0lPLlga3e9ONCkex2A11ND0f1IW6fRU0MssGu9M5EoD3hsG8Z
 M1FJ1ZfT2oKhfXF1ulHkdhVnL7Qw87g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-UZ1GqrbROSS9DviQYj5skA-1; Mon, 03 May 2021 13:06:22 -0400
X-MC-Unique: UZ1GqrbROSS9DviQYj5skA-1
Received: by mail-ej1-f69.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so2329572ejc.15
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iiJotyRMwWTX619D6R4OGkdEcW07YQOSXFbELgAder0=;
 b=YAGrfOXkZ9G11hYgg7bgvnJt89KU+7yXsZGipEl0LS7yEREQ2iHzSu1JgpDm1/nVdp
 fxYT+/2E7gIziovRxFvZyfWqz/nlJS0mckkPDVzMpXoKbNkjLhkcfesdrY93E2W4wpI2
 PUq+nUoMt9hmmPpWD2d9elfT13Lz98hfEm7Xb7AgqvedvQwvMhf7h9FWWSNW8P73YfEN
 vRstu4qOJWyfHYglNBFpyBWUboGaOthb/b5o22qi9NxMJeCPv8XK02v5W3FZOYyGsb5X
 +AQC9/xu2DMEWT/BWAMuseNwBaxt+Ma6kAKSASX2kDUwgFB+9LPvtIc9MgpXpNVYhucv
 HIGA==
X-Gm-Message-State: AOAM531S4R969jfoxFXgOCKAlkVuelQr1RyXpwMPtDia+qAMmSvtiJ7Y
 dGpTm3qMkL4fMYTzSt5HYU7+Tergh0IL46Wu72NQNU36PtM/LWFwYBw+8s6DI6gBwlCrYZuyNR0
 J5rsONUZ6FYMPeBs=
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr17896107edy.155.1620061580227; 
 Mon, 03 May 2021 10:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyre8CVvEk+k1z6kYmgavxAPxSYBHGoZu/PZn7FJY8VZ0SrKBznq9ASKiZwP8bEkaxQKtB+wg==
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr17896080edy.155.1620061579997; 
 Mon, 03 May 2021 10:06:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y11sm127141ejj.55.2021.05.03.10.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:06:19 -0700 (PDT)
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad5e6653-23d0-2f90-2962-1041c5d2d038@redhat.com>
Date: Mon, 3 May 2021 19:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/21 08:24, Yang Zhong wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
> realized prior to realizing the vCPUs themselves, i.e. long before
> generic devices are parsed and realized.  From a virtualization
> perspective, the CPUID aspect also means that EPC sections cannot be
> hotplugged without paravirtualizing the guest kernel (hardware does
> not support hotplugging as EPC sections must be locked down during
> pre-boot to provide EPC's security properties).
> 
> So even though EPC sections could be realized through the generic
> -devices command, they need to be created much earlier for them to
> actually be usable by the guest.  Place all EPC sections in a
> contiguous block, somewhat arbitrarily starting after RAM above 4g.
> Ensuring EPC is in a contiguous region simplifies calculations, e.g.
> device memory base, PCI hole, etc..., allows dynamic calculation of the
> total EPC size, e.g. exposing EPC to guests does not require -maxmem,
> and last but not least allows all of EPC to be enumerated in a single
> ACPI entry, which is expected by some kernels, e.g. Windows 7 and 8.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

This will have to change, since we don't really want to add more command 
line options.  It will become an "array of strings" machine property, like

   -M sgx-epc.0=epc1,sgx-epc.1=epc2

I was already planning support for this kind of compound property in 
-machine and -accel, so I'll clean up the patches and send them (but it 
will take a couple of weeks).

Paolo

> ---
>   hw/i386/sgx-epc.c         | 104 +++++++++++++++++++++++++++++++++++++-
>   include/hw/i386/pc.h      |   6 +++
>   include/hw/i386/sgx-epc.h |  16 ++++++
>   qemu-options.hx           |   8 +++
>   softmmu/globals.c         |   1 +
>   softmmu/vl.c              |   9 ++++
>   6 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index aa487dea79..0858819a71 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -56,6 +56,8 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
>   {
>       PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>       X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MemoryDeviceState *md = MEMORY_DEVICE(dev);
> +    SGXEPCState *sgx_epc = pcms->sgx_epc;
>       SGXEPCDevice *epc = SGX_EPC(dev);
>       const char *path;
>   
> @@ -74,7 +76,18 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    error_setg(errp, "'" TYPE_SGX_EPC "' not supported");
> +    epc->addr = sgx_epc->base + sgx_epc->size;
> +
> +    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
> +                                host_memory_backend_get_memory(epc->hostmem));
> +
> +    host_memory_backend_set_mapped(epc->hostmem, true);
> +
> +    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
> +                                sgx_epc->nr_sections + 1);
> +    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
> +
> +    sgx_epc->size += memory_device_get_region_size(md, errp);
>   }
>   
>   static void sgx_epc_unrealize(DeviceState *dev)
> @@ -159,3 +172,92 @@ static void sgx_epc_register_types(void)
>   }
>   
>   type_init(sgx_epc_register_types)
> +
> +
> +static int sgx_epc_set_property(void *opaque, const char *name,
> +                                const char *value, Error **errp)
> +{
> +    Object *obj = opaque;
> +    Error *err = NULL;
> +
> +    object_property_parse(obj, name, value, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +static int sgx_epc_init_func(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    Error *err = NULL;
> +    Object *obj;
> +
> +    obj = object_new("sgx-epc");
> +
> +    qdev_set_id(DEVICE(obj), qemu_opts_id(opts));
> +
> +    if (qemu_opt_foreach(opts, sgx_epc_set_property, obj, &err)) {
> +        goto out;
> +    }
> +
> +    object_property_set_bool(obj, "realized", true, &err);
> +
> +out:
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +    }
> +    object_unref(obj);
> +    return err != NULL ? -1 : 0;
> +}
> +
> +void pc_machine_init_sgx_epc(PCMachineState *pcms)
> +{
> +    SGXEPCState *sgx_epc;
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +
> +    sgx_epc = g_malloc0(sizeof(*sgx_epc));
> +    pcms->sgx_epc = sgx_epc;
> +
> +    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
> +
> +    memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
> +    memory_region_add_subregion(get_system_memory(), sgx_epc->base,
> +                                &sgx_epc->mr);
> +
> +    qemu_opts_foreach(qemu_find_opts("sgx-epc"), sgx_epc_init_func, NULL,
> +                      &error_fatal);
> +
> +    if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
> +        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
> +                     sgx_epc->size);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
> +}
> +
> +static QemuOptsList sgx_epc_opts = {
> +    .name = "sgx-epc",
> +    .implied_opt_name = "id",
> +    .head = QTAILQ_HEAD_INITIALIZER(sgx_epc_opts.head),
> +    .desc = {
> +        {
> +            .name = "id",
> +            .type = QEMU_OPT_STRING,
> +            .help = "SGX EPC section ID",
> +        },{
> +            .name = "memdev",
> +            .type = QEMU_OPT_STRING,
> +            .help = "memory object backend",
> +        },
> +        { /* end of list */ }
> +    },
> +};
> +
> +static void sgx_epc_register_opts(void)
> +{
> +    qemu_add_opts(&sgx_epc_opts);
> +}
> +
> +opts_init(sgx_epc_register_opts);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index dcf060b791..71e2fc6f26 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -12,6 +12,7 @@
>   #include "hw/acpi/acpi_dev_interface.h"
>   #include "hw/hotplug.h"
>   #include "qom/object.h"
> +#include "hw/i386/sgx-epc.h"
>   
>   #define HPET_INTCAP "hpet-intcap"
>   
> @@ -53,6 +54,8 @@ typedef struct PCMachineState {
>   
>       /* ACPI Memory hotplug IO base address */
>       hwaddr memhp_io_base;
> +
> +    SGXEPCState *sgx_epc;
>   } PCMachineState;
>   
>   #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> @@ -197,6 +200,9 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>   void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                          const CPUArchIdList *apic_ids, GArray *entry);
>   
> +/* sgx-epc.c */
> +void pc_machine_init_sgx_epc(PCMachineState *pcms);
> +
>   extern GlobalProperty pc_compat_5_2[];
>   extern const size_t pc_compat_5_2_len;
>   
> diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
> index 5fd9ae2d0c..1f7dd17c17 100644
> --- a/include/hw/i386/sgx-epc.h
> +++ b/include/hw/i386/sgx-epc.h
> @@ -41,4 +41,20 @@ typedef struct SGXEPCDevice {
>       HostMemoryBackend *hostmem;
>   } SGXEPCDevice;
>   
> +/*
> + * @base: address in guest physical address space where EPC regions start
> + * @mr: address space container for memory devices
> + */
> +typedef struct SGXEPCState {
> +    uint64_t base;
> +    uint64_t size;
> +
> +    MemoryRegion mr;
> +
> +    struct SGXEPCDevice **sections;
> +    int nr_sections;
> +} SGXEPCState;
> +
> +extern int sgx_epc_enabled;
> +
>   #endif
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002bd6..262c3084af 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -532,6 +532,14 @@ SRST
>       Preallocate memory when using -mem-path.
>   ERST
>   
> +DEF("sgx-epc", HAS_ARG, QEMU_OPTION_sgx_epc,
> +    "-sgx-epc memdev=memid[,id=epcid]\n",
> +    QEMU_ARCH_I386)
> +SRST
> +``-sgx-epc memdev=@var{memid}[,id=@var{epcid}]``
> +    Define an SGX EPC section.
> +ERST
> +
>   DEF("k", HAS_ARG, QEMU_OPTION_k,
>       "-k language     use keyboard layout (for example 'fr' for French)\n",
>       QEMU_ARCH_ALL)
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 7d0fc81183..d3029953ce 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -70,3 +70,4 @@ bool qemu_uuid_set;
>   uint32_t xen_domid;
>   enum xen_mode xen_mode = XEN_EMULATE;
>   bool xen_domid_restrict;
> +int sgx_epc_enabled;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aadb526138..0c7e9fab78 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -74,6 +74,7 @@
>   #include "hw/block/block.h"
>   #include "hw/i386/x86.h"
>   #include "hw/i386/pc.h"
> +#include "hw/i386/sgx-epc.h"
>   #include "migration/misc.h"
>   #include "migration/snapshot.h"
>   #include "sysemu/tpm.h"
> @@ -2891,6 +2892,14 @@ void qemu_init(int argc, char **argv, char **envp)
>               case QEMU_OPTION_mem_prealloc:
>                   mem_prealloc = 1;
>                   break;
> +            case QEMU_OPTION_sgx_epc:
> +                opts = qemu_opts_parse_noisily(qemu_find_opts("sgx-epc"),
> +                                               optarg, false);
> +                if (!opts) {
> +                    exit(1);
> +                }
> +                sgx_epc_enabled = 1;
> +                break;
>               case QEMU_OPTION_d:
>                   log_mask = optarg;
>                   break;
> 


