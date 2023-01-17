Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D666DA76
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:01:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHim4-0000dg-Qq; Tue, 17 Jan 2023 05:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHill-0000Wl-6U
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:00:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHile-0001u8-KR
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:00:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so29968206wrb.11
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ev0fSEsSaOAmnE4vXdWe+XJmNLe5yIx2mje7ttdagXo=;
 b=OlKbZE/SQZPJ3TS4ptcr6NRA4WSvSVinY4lM1rH77LMzWv8Z4nstUjMZ7x1lhOouhD
 zRrjSyqebvU4XTci9spDZ8YeNNLxh/e6TwBhtpfBeLJcGYDRw3yA7rC5zr0qsnbteeQ0
 eKRXeRP9Z64s8GZ+4jOAmZF2AebAWdvsnC70FttcXmGmRbuliJURuNX9r73E/a6B3yy2
 PHViaZ9DPuw9c/GobrY7/CelzHi14R4Q2B3pLk5t6ofwPYvaRrdFoQaB88T2WjrzAch8
 iouw1nv00BKENr3wspGvAG73varQZLVIA5Wos0/bhn6DdWzkLXX1BKwY8f+GAmwJIkxi
 u1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ev0fSEsSaOAmnE4vXdWe+XJmNLe5yIx2mje7ttdagXo=;
 b=pw/ihiQiQn3Hgt5FnI7rt2Uv6RxDJSR/tsiS14bgTiFysiGZrIdE5iVWPz1fEYIsxr
 9acTXzKjmmo1nRFyLy/CFvJBenVKWQkjOQ4TV83poSCkO3jgFvjZaVTy5831I3lShgrb
 +xDj45r/nA2Rv5TAddOI9HDVnQogu8tjgqh/jH8HBZoDe6W1ksr6d8uyI3SsI8qCKpXn
 F7Cd2weLTIKh8uTwVOKEfdMr0n4h5kCTKUfgeiyquSAnqC5C8VyFQiGUj0WggZy+jdXC
 wyXNmnJyIkAtd2TgQyQ2JWcKc3OYHS8VY84xTHzskTsO1G1jouxH2IutG3dLsV3j7hHM
 Ylug==
X-Gm-Message-State: AFqh2krGM8vXse4nGnv3K8liBAt5wF3W8HXJ+GL0b+4ONDkQEplTp7UT
 QpJogE9PVFz3ETJOk1uy6PQ=
X-Google-Smtp-Source: AMrXdXtiI9w81sozKXxzblPjlEYZRAN/QBy95Rvh7b11sHTVKROT1JHtbX7I10X63DwC4JIDzrExUw==
X-Received: by 2002:a5d:6b50:0:b0:2bd:f17b:bfd3 with SMTP id
 x16-20020a5d6b50000000b002bdf17bbfd3mr2548060wrw.4.1673949632874; 
 Tue, 17 Jan 2023 02:00:32 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm14053313wrs.48.2023.01.17.02.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 02:00:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ea0a98e2-14e4-620a-60ee-86cfbe76403e@xen.org>
Date: Tue, 17 Jan 2023 10:00:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 26/51] hw/xen: Add xen_evtchn device for event channel
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-27-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-27-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 21:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Include basic support for setting HVM_PARAM_CALLBACK_IRQ to the global
> vector method HVM_PARAM_CALLBACK_TYPE_VECTOR, which is handled in-kernel
> by raising the vector whenever the vCPU's vcpu_info->evtchn_upcall_pending
> flag is set.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build   |   5 +-
>   hw/i386/kvm/xen_evtchn.c  | 148 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  18 +++++
>   hw/i386/pc.c              |   2 +
>   target/i386/kvm/xen-emu.c |  10 +++
>   5 files changed, 182 insertions(+), 1 deletion(-)
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
> index 0000000000..018f4ef4da
> --- /dev/null
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -0,0 +1,148 @@
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
> +#include "sysemu/kvm_xen.h"
> +#include <linux/kvm.h>
> +
> +#include "standard-headers/xen/memory.h"
> +#include "standard-headers/xen/hvm/params.h"
> +
> +#define TYPE_XEN_EVTCHN "xen-evtchn"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
> +
> +struct XenEvtchnState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +
> +    uint64_t callback_param;
> +    bool evtchn_in_kernel;
> +
> +    QemuMutex port_lock;
> +};
> +
> +struct XenEvtchnState *xen_evtchn_singleton;
> +
> +/* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) */
> +#define CALLBACK_VIA_TYPE_SHIFT 56
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
> +    XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
> +                                                        -1, NULL));
> +    xen_evtchn_singleton = s;
> +
> +    qemu_mutex_init(&s->port_lock);
> +}
> +
> +static void xen_evtchn_register_types(void)
> +{
> +    type_register_static(&xen_evtchn_info);
> +}
> +
> +type_init(xen_evtchn_register_types)
> +
> +int xen_evtchn_set_callback_param(uint64_t param)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    bool in_kernel = false;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
> +    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
> +        struct kvm_xen_hvm_attr xa = {
> +            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
> +            .u.vector = (uint8_t)param,
> +        };
> +
> +        ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
> +        if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
> +            in_kernel = true;
> +        }
> +        break;
> +    }
> +    default:
> +        ret = -ENOSYS;
> +        break;
> +    }
> +
> +    if (!ret) {
> +        s->callback_param = param;
> +        s->evtchn_in_kernel = in_kernel;
> +    }
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    return ret;
> +}
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> new file mode 100644
> index 0000000000..c9b7f9d11f
> --- /dev/null
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -0,0 +1,18 @@
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
> +#ifndef QEMU_XEN_EVTCHN_H
> +#define QEMU_XEN_EVTCHN_H
> +
> +void xen_evtchn_create(void);
> +int xen_evtchn_set_callback_param(uint64_t param);
> +
> +#endif /* QEMU_XEN_EVTCHN_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 0ddae2f6ad..8f668a5138 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -90,6 +90,7 @@
>   #include "hw/virtio/virtio-pmem-pci.h"
>   #include "hw/virtio/virtio-mem-pci.h"
>   #include "hw/i386/kvm/xen_overlay.h"
> +#include "hw/i386/kvm/xen_evtchn.h"
>   #include "hw/mem/memory-device.h"
>   #include "sysemu/replay.h"
>   #include "target/i386/cpu.h"
> @@ -1850,6 +1851,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
>   #ifdef CONFIG_XEN_EMU
>       if (xen_mode == XEN_EMULATE) {
>           xen_overlay_create();
> +        xen_evtchn_create();
>       }
>   #endif
>       return 0;
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 3e05ef836d..b0e7620b16 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -21,6 +21,7 @@
>   #include "sysemu/runstate.h"
>   
>   #include "hw/i386/kvm/xen_overlay.h"
> +#include "hw/i386/kvm/xen_evtchn.h"
>   
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/sched.h"
> @@ -507,6 +508,10 @@ static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
>       }
>   
>       switch (hp.index) {
> +    case HVM_PARAM_CALLBACK_IRQ:
> +        err = xen_evtchn_set_callback_param(hp.value);
> +        xen_set_long_mode(exit->u.hcall.longmode);
> +        break;
>       default:
>           return false;
>       }
> @@ -712,6 +717,11 @@ static int kvm_xen_soft_reset(void)
>       CPUState *cpu;
>       int err;
>   
> +    err = xen_evtchn_set_callback_param(0);

Doesn't this always result in -ENOSYS?

> +    if (err) {
> +        return err;
> +    }
> +
>       CPU_FOREACH(cpu) {
>           async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
>       }


