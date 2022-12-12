Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182A64A4AC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lTz-0004oF-Kn; Mon, 12 Dec 2022 11:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4lTu-0004o2-SR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:16:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4lTs-0007or-Qg
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:16:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so5651194wms.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q4Di0xGG+z93gU14wE62HkF4eqVpZWQhIXEwtjdGXiE=;
 b=VG89Vg0+O86UMc258Yfi/wXMQBVZt883ofm8/stm6rpbGJFB+AXvFwE0YDNki3Rgxd
 zZ9TfteF/NlE/Hrl0F+1e05sjjo0hKIW/mFv/fEbcM8x6abAWpB/sTD512gkwf2y6npa
 pIsWyXZAlT8uRw2BGQyShBYhGgX/FjJvcqiKP6WKqaiunmuoV/UDp2mW0fRxFMiRe74W
 m2elo8BeaWh3dHFx4Pw2m94Iz8M7wpsj+VBvyolw0ZXrgbPc6e720ftVUu4fN72sNzAk
 kZrRUa3kbyyNg79ZBQVuMcd9j7esN3IRRUg00IdRZJLQoZEe8v6ConTQDa9dEE6hxxph
 y+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q4Di0xGG+z93gU14wE62HkF4eqVpZWQhIXEwtjdGXiE=;
 b=zZZ6NU9BQA6dBlUR2KxTQV6RizKy1lTVSHM4IrAGbF+NTFEWXgj0LHdlROQLAwLWkg
 UUzhtGBB3raHfrTLmLOtoMfIawYOKvOC/qAEOl79WUFwgQaWKLv26HaT6b/CRVfmltP6
 +bHi0T0kv25ShwV2idmmOgS63rDyDImRgTTNwid7fWDLAINm+3+8etKPO2Fih0AwSo8I
 jtFfzfPGBPSLOrZSRRiQ4/QQGiX/t4J6w/5wYRBBzhucWrTRDf+sJVpnpBGHRECkXzWi
 7Veqf5nv2HXjv0mJ0f2/ecoZ9lcvOboI6OTvb2ncoX0nHiFpNmw1h//irdi5/ShFU/+Y
 24qQ==
X-Gm-Message-State: ANoB5plMtcjGe35OwIdeziFM+5mCIpQmYZA5to9pRNDns8m8vH/+lYyv
 obCJTTVheu0tTKZikJnMEKU=
X-Google-Smtp-Source: AA0mqf6UfCRMn4qjz7V9VAfBEPCMJfqLawi42ajAmwDRIl9+aNs0NbITbGI/DzjsUvwy9y2OEVReBg==
X-Received: by 2002:a05:600c:991:b0:3cf:ab99:6b46 with SMTP id
 w17-20020a05600c099100b003cfab996b46mr12420536wmp.35.1670861799099; 
 Mon, 12 Dec 2022 08:16:39 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 m127-20020a1c2685000000b003d1d5a83b2esm9733512wmm.35.2022.12.12.08.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:16:38 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
Date: Mon, 12 Dec 2022 16:16:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Ankur Arora <ankur.a.arora@oracle.com>
> 
> The HVM_PARAM_CALLBACK_IRQ parameter controls the system-wide event
> channel upcall method.  The vector support is handled by KVM internally,
> when the evtchn_upcall_pending field in the vcpu_info is set.
> 
> The GSI and PCI_INTX delivery methods are not supported. yet; those
> need to simulate a level-triggered event on the I/OAPIC.

That's gonna be somewhat limiting if anyone runs a Windows guest with 
upcall vector support turned off... which is an option at:

https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=blob;f=src/xenbus/evtchn.c;;hb=HEAD#l1928

> 
> Add a 'xen_evtchn' device to host the migration state, as we'll shortly
> be adding a full event channel table there too.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Rework for upstream kernel changes, split from per-VCPU vector]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build  |   5 +-
>   hw/i386/kvm/xen_evtchn.c | 117 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h |  13 +++++
>   hw/i386/pc_piix.c        |   2 +
>   target/i386/xen.c        |  44 +++++++++++++--
>   5 files changed, 174 insertions(+), 7 deletions(-)
>   create mode 100644 hw/i386/kvm/xen_evtchn.c
>   create mode 100644 hw/i386/kvm/xen_evtchn.h
> 
> diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
> index 6165cbf019..cab64df339 100644
> --- a/hw/i386/kvm/meson.build
> +++ b/hw/i386/kvm/meson.build
> @@ -4,6 +4,9 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
>   i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
>   i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
>   i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
> -i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
> +i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
> +  'xen_overlay.c',
> +  'xen_evtchn.c',
> +  ))
>   
>   i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> new file mode 100644
> index 0000000000..1ca0c034e7
> --- /dev/null
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -0,0 +1,117 @@
> +/*
> + * QEMU Xen emulation: Shared/overlay pages support
> + *
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
> +#include "qemu/module.h"
> +#include "qemu/main-loop.h"
> +#include "qapi/error.h"
> +#include "qom/object.h"
> +#include "exec/target_page.h"
> +#include "exec/address-spaces.h"
> +#include "migration/vmstate.h"
> +
> +#include "hw/sysbus.h"
> +#include "hw/xen/xen.h"
> +#include "xen_evtchn.h"
> +
> +#include "sysemu/kvm.h"
> +#include <linux/kvm.h>
> +
> +#include "standard-headers/xen/memory.h"
> +#include "standard-headers/xen/hvm/params.h"
> +
> +#define TYPE_XEN_EVTCHN "xenevtchn"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
> +
> +struct XenEvtchnState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +
> +    uint64_t callback_param;
> +};
> +
> +struct XenEvtchnState *xen_evtchn_singleton;
> +
> +static int xen_evtchn_post_load(void *opaque, int version_id)
> +{
> +    XenEvtchnState *s = opaque;
> +
> +    if (s->callback_param) {
> +        xen_evtchn_set_callback_param(s->callback_param);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool xen_evtchn_is_needed(void *opaque)
> +{
> +    return xen_mode == XEN_EMULATE;
> +}
> +
> +static const VMStateDescription xen_evtchn_vmstate = {
> +    .name = "xen_evtchn",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = xen_evtchn_is_needed,
> +    .post_load = xen_evtchn_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(callback_param, XenEvtchnState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void xen_evtchn_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &xen_evtchn_vmstate;
> +}
> +
> +static const TypeInfo xen_evtchn_info = {
> +    .name          = TYPE_XEN_EVTCHN,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XenEvtchnState),
> +    .class_init    = xen_evtchn_class_init,
> +};
> +
> +void xen_evtchn_create(void)
> +{
> +    xen_evtchn_singleton = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN, -1, NULL));
> +}
> +
> +static void xen_evtchn_register_types(void)
> +{
> +    type_register_static(&xen_evtchn_info);
> +}
> +
> +type_init(xen_evtchn_register_types)
> +
> +
> +#define CALLBACK_VIA_TYPE_SHIFT       56
> +
> +int xen_evtchn_set_callback_param(uint64_t param)
> +{
> +    int ret = -ENOSYS;
> +
> +    if (param >> CALLBACK_VIA_TYPE_SHIFT == HVM_PARAM_CALLBACK_TYPE_VECTOR) {
> +        struct kvm_xen_hvm_attr xa = {
> +            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
> +            .u.vector = (uint8_t)param,
> +        };
> +
> +        ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
> +        if (!ret && xen_evtchn_singleton)
> +            xen_evtchn_singleton->callback_param = param;
> +    }
> +    return ret;
> +}
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> new file mode 100644
> index 0000000000..11c6ed22a0
> --- /dev/null
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -0,0 +1,13 @@
> +/*
> + * QEMU Xen emulation: Event channel support
> + *
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +void xen_evtchn_create(void);
> +int xen_evtchn_set_callback_param(uint64_t param);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index c3c61eedde..18540084a0 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -60,6 +60,7 @@
>   #endif
>   #ifdef CONFIG_XEN_EMU
>   #include "hw/i386/kvm/xen_overlay.h"
> +#include "hw/i386/kvm/xen_evtchn.h"
>   #endif
>   #include "migration/global_state.h"
>   #include "migration/misc.h"
> @@ -417,6 +418,7 @@ static void pc_xen_hvm_init(MachineState *machine)
>   #ifdef CONFIG_XEN_EMU
>       if (xen_mode == XEN_EMULATE) {
>               xen_overlay_create();
> +            xen_evtchn_create();
>       }
>   #endif
>   }
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index 2583c00a6b..1af336d9e5 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -16,6 +16,8 @@
>   #include "xen.h"
>   #include "trace.h"
>   #include "hw/i386/kvm/xen_overlay.h"
> +#include "hw/i386/kvm/xen_evtchn.h"
> +
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/memory.h"
>   #include "standard-headers/xen/hvm/hvm_op.h"
> @@ -287,24 +289,53 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
>       return true;
>   }
>   
> +static int handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
> +                            uint64_t arg)
> +{
> +    CPUState *cs = CPU(cpu);
> +    struct xen_hvm_param hp;
> +    int err = 0;
> +
> +    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
> +        err = -EFAULT;
> +        goto out;
> +    }
> +
> +    if (hp.domid != DOMID_SELF) {

Xen actually allows the domain's own id to be specified as well as the 
magic DOMID_SELF.

> +        err = -EINVAL;

And this should be -ESRCH.

> +        goto out;
> +    }
> +
> +    switch (hp.index) {
> +    case HVM_PARAM_CALLBACK_IRQ:
> +        err = xen_evtchn_set_callback_param(hp.value);
> +        break;
> +    default:
> +        return false;
> +    }
> +
> +out:
> +    exit->u.hcall.result = err;

This is a bit on the ugly side isn't it? Why not return the err and have 
kvm_xen_hcall_hvm_op() deal with passing it back?

> +    return true;
> +}
> +
>   static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
>                                                 X86CPU *cpu, uint64_t arg)
>   {
> -    struct xen_hvm_evtchn_upcall_vector *up;
> +    struct xen_hvm_evtchn_upcall_vector up;
>       CPUState *target_cs;
>       int vector;
>   
> -    up = gva_to_hva(CPU(cpu), arg);
> -    if (!up) {
> +    if (kvm_copy_from_gva(CPU(cpu), arg, &up, sizeof(up))) {
>           return -EFAULT;
>       }
>   
> -    vector = up->vector;
> +    vector = up.vector;
>       if (vector < 0x10) {
>           return -EINVAL;
>       }
>   
> -    target_cs = qemu_get_cpu(up->vcpu);
> +    target_cs = qemu_get_cpu(up.vcpu);
>       if (!target_cs) {
>           return -EINVAL;
>       }

These changes to kvm_xen_hcall_evtchn_upcall_vector() seem to have 
nothing to do with the rest of the patch. Am I missing something?

   Paul

> @@ -325,7 +356,8 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       case HVMOP_pagetable_dying:
>               ret = -ENOSYS;
>               break;
> -
> +    case HVMOP_set_param:
> +            return handle_set_param(exit, cpu, arg);
>       default:
>               return false;
>       }


