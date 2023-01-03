Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACB65C578
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClUj-0001W9-NZ; Tue, 03 Jan 2023 12:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pClUh-0001W0-VR
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pClUf-0001Pq-SX
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672768472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9d408YWcg2KUAAPIsv85NJ3HaBC6n3xnRdgKPxuDQU=;
 b=Oq63TWpglmxCD2wygSwSTXJ6NbaP9j91RUXGM8cyiPuwlkowOL6OYzX0ur9okuWHtXSfXe
 uzkXBWGSqNO+paQRQS9pnQWQF/Izh4HVX1UjZhhy3Yg7BJ3kQdhFre7dRg5p3Idp/xVDUp
 xe276KobCvJIyEvyRYhGuLqE961t4Uo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-p66sXIV2NZWEdSjlPdDQSw-1; Tue, 03 Jan 2023 12:54:30 -0500
X-MC-Unique: p66sXIV2NZWEdSjlPdDQSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso17417230wmb.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9d408YWcg2KUAAPIsv85NJ3HaBC6n3xnRdgKPxuDQU=;
 b=PbXuyCelg2+agPbjG4IApWWg5hOu9N6gI/AbhylPrPMUa86W4Aim/naT1QRhT+Y9QB
 LcthSNmXXZhNG0K5v6rzg05EMOejFREelTnKGvFAMxgpTlx3re3mWuRI1llCmW3u3Igj
 UPcl4yUF30T4LQ8PVEvz5b6n5JHiLirZ8s3wAyArhBNzw7ldvHkfmFRE5DW1nXsdPO7I
 yTfgwda63LKAXdugFw9xWdTEgG0mF+x61o4UV1Zsfm/Zg53mZsfjh6Zkg4h/L75wJmq3
 xYkOIhiQdmeMme46NiCO5kkxa8x9SE6CmLDO7pYr2TUkNODZXH2MdtA/1u9kPtnN4TXY
 iDNg==
X-Gm-Message-State: AFqh2koxQRVFmn72H+92GpUrhLcJz2jS700PkwE9IGM/Z5Nl5oGMZ01j
 looTq4kmUV/3RmXgQ7dAr6mA6mAFsuTkp4AUwSnISqyMZ0+/sGrGsi9NdZ+QUgMJ99atfFmhGVf
 KCpUU0F+XUpnOeq0=
X-Received: by 2002:a5d:6e8c:0:b0:26b:e7e1:ad03 with SMTP id
 k12-20020a5d6e8c000000b0026be7e1ad03mr27628277wrz.55.1672768469841; 
 Tue, 03 Jan 2023 09:54:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvWq3O/QkfO7m49tT2y6aMrF5GGTXO5cStQQv6VSHbs5tXvyKUQMST9PqnaE3e4S70BTgYtwA==
X-Received: by 2002:a5d:6e8c:0:b0:26b:e7e1:ad03 with SMTP id
 k12-20020a5d6e8c000000b0026be7e1ad03mr27628258wrz.55.1672768469557; 
 Tue, 03 Jan 2023 09:54:29 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 y6-20020adfdf06000000b002879c013b8asm18124833wrl.42.2023.01.03.09.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 09:54:29 -0800 (PST)
Date: Tue, 3 Jan 2023 17:54:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v5 14/52] hw/xen: Add xen_overlay device for
 emulating shared xenheap pages
Message-ID: <Y7Rr0r+qb0F2k+N3@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-15-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230121235.1282915-15-dwmw2@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* David Woodhouse (dwmw2@infradead.org) wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> For the shared info page and for grant tables, Xen shares its own pages
> from the "Xen heap" to the guest. The guest requests that a given page
> from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
> to a given GPA using the XENMEM_add_to_physmap hypercall.
> 
> To support that in qemu when *emulating* Xen, create a memory region
> (migratable) and allow it to be mapped as an overlay when requested.
> 
> Xen theoretically allows the same page to be mapped multiple times
> into the guest, but that's hard to track and reinstate over migration,
> so we automatically *unmap* any previous mapping when creating a new
> one. This approach has been used in production with.... a non-trivial
> number of guests expecting true Xen, without any problems yet being
> noticed.
> 
> This adds just the shared info page for now. The grant tables will be
> a larger region, and will need to be overlaid one page at a time. I
> think that means I need to create separate aliases for each page of
> the overall grant_frames region, so that they can be mapped individually.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/i386/kvm/meson.build   |   1 +
>  hw/i386/kvm/xen_overlay.c | 200 ++++++++++++++++++++++++++++++++++++++
>  hw/i386/kvm/xen_overlay.h |  20 ++++
>  include/sysemu/kvm_xen.h  |   4 +
>  4 files changed, 225 insertions(+)
>  create mode 100644 hw/i386/kvm/xen_overlay.c
>  create mode 100644 hw/i386/kvm/xen_overlay.h
> 
> diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
> index 95467f1ded..6165cbf019 100644
> --- a/hw/i386/kvm/meson.build
> +++ b/hw/i386/kvm/meson.build
> @@ -4,5 +4,6 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
>  i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
>  i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
>  i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
> +i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
>  
>  i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
> diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
> new file mode 100644
> index 0000000000..331dea6b8b
> --- /dev/null
> +++ b/hw/i386/kvm/xen_overlay.c
> @@ -0,0 +1,200 @@
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
> +#include "xen_overlay.h"
> +
> +#include "sysemu/kvm.h"
> +#include "sysemu/kvm_xen.h"
> +#include <linux/kvm.h>
> +
> +#include "standard-headers/xen/memory.h"
> +
> +
> +#define TYPE_XEN_OVERLAY "xen-overlay"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenOverlayState, XEN_OVERLAY)
> +
> +#define XEN_PAGE_SHIFT 12
> +#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
> +
> +struct XenOverlayState {
> +    /*< private >*/
> +    SysBusDevice busdev;
> +    /*< public >*/
> +
> +    MemoryRegion shinfo_mem;
> +    void *shinfo_ptr;
> +    uint64_t shinfo_gpa;
> +};
> +
> +struct XenOverlayState *xen_overlay_singleton;
> +
> +static void xen_overlay_map_page_locked(MemoryRegion *page, uint64_t gpa)
> +{
> +    /*
> +     * Xen allows guests to map the same page as many times as it likes
> +     * into guest physical frames. We don't, because it would be hard
> +     * to track and restore them all. One mapping of each page is
> +     * perfectly sufficient for all known guests... and we've tested
> +     * that theory on a few now in other implementations. dwmw2.
> +     */
> +    if (memory_region_is_mapped(page)) {
> +        if (gpa == INVALID_GPA) {
> +            memory_region_del_subregion(get_system_memory(), page);
> +        } else {
> +            /* Just move it */
> +            memory_region_set_address(page, gpa);
> +        }
> +    } else if (gpa != INVALID_GPA) {
> +        memory_region_add_subregion_overlap(get_system_memory(), gpa, page, 0);
> +    }
> +}
> +
> +/* KVM is the only existing back end for now. Let's not overengineer it yet. */
> +static int xen_overlay_set_be_shinfo(uint64_t gfn)
> +{
> +    struct kvm_xen_hvm_attr xa = {
> +        .type = KVM_XEN_ATTR_TYPE_SHARED_INFO,
> +        .u.shared_info.gfn = gfn,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
> +}
> +
> +
> +static void xen_overlay_realize(DeviceState *dev, Error **errp)
> +{
> +    XenOverlayState *s = XEN_OVERLAY(dev);
> +
> +    if (xen_mode != XEN_EMULATE) {
> +        error_setg(errp, "Xen overlay page support is for Xen emulation");
> +        return;
> +    }
> +
> +    memory_region_init_ram(&s->shinfo_mem, OBJECT(dev), "xen:shared_info",
> +                           XEN_PAGE_SIZE, &error_abort);
> +    memory_region_set_enabled(&s->shinfo_mem, true);
> +
> +    s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
> +    s->shinfo_gpa = INVALID_GPA;
> +    memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
> +}
> +
> +static int xen_overlay_post_load(void *opaque, int version_id)
> +{
> +    XenOverlayState *s = opaque;
> +
> +    if (s->shinfo_gpa != INVALID_GPA) {
> +        xen_overlay_map_page_locked(&s->shinfo_mem, s->shinfo_gpa);
> +        xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool xen_overlay_is_needed(void *opaque)
> +{
> +    return xen_mode == XEN_EMULATE;
> +}
> +
> +static const VMStateDescription xen_overlay_vmstate = {
> +    .name = "xen_overlay",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = xen_overlay_is_needed,
> +    .post_load = xen_overlay_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void xen_overlay_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = xen_overlay_realize;
> +    dc->vmsd = &xen_overlay_vmstate;

That looks OK from a migration point of view

> +}
> +
> +static const TypeInfo xen_overlay_info = {
> +    .name          = TYPE_XEN_OVERLAY,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XenOverlayState),
> +    .class_init    = xen_overlay_class_init,
> +};
> +
> +void xen_overlay_create(void)
> +{
> +    xen_overlay_singleton = XEN_OVERLAY(sysbus_create_simple(TYPE_XEN_OVERLAY,
> +                                                             -1, NULL));
> +}
> +
> +static void xen_overlay_register_types(void)
> +{
> +    type_register_static(&xen_overlay_info);
> +}
> +
> +type_init(xen_overlay_register_types)
> +
> +int xen_overlay_map_shinfo_page(uint64_t gpa)
> +{
> +    XenOverlayState *s = xen_overlay_singleton;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOENT;
> +    }
> +
> +    qemu_mutex_lock_iothread();
> +    if (s->shinfo_gpa) {
> +            /* If removing shinfo page, turn the kernel magic off first */

Odd indent?

Dave

> +        ret = xen_overlay_set_be_shinfo(INVALID_GFN);
> +        if (ret) {
> +            goto out;
> +        }
> +    }
> +
> +    xen_overlay_map_page_locked(&s->shinfo_mem, gpa);
> +    if (gpa != INVALID_GPA) {
> +        ret = xen_overlay_set_be_shinfo(gpa >> XEN_PAGE_SHIFT);
> +        if (ret) {
> +            goto out;
> +        }
> +    }
> +    s->shinfo_gpa = gpa;
> + out:
> +    qemu_mutex_unlock_iothread();
> +
> +    return ret;
> +}
> +
> +void *xen_overlay_get_shinfo_ptr(void)
> +{
> +    XenOverlayState *s = xen_overlay_singleton;
> +
> +    if (!s) {
> +        return NULL;
> +    }
> +
> +    return s->shinfo_ptr;
> +}
> diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
> new file mode 100644
> index 0000000000..00cff05bb0
> --- /dev/null
> +++ b/hw/i386/kvm/xen_overlay.h
> @@ -0,0 +1,20 @@
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
> +#ifndef QEMU_XEN_OVERLAY_H
> +#define QEMU_XEN_OVERLAY_H
> +
> +void xen_overlay_create(void);
> +
> +int xen_overlay_map_shinfo_page(uint64_t gpa);
> +void *xen_overlay_get_shinfo_ptr(void);
> +
> +#endif /* QEMU_XEN_OVERLAY_H */
> diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
> index 296533f2d5..3e43cd7843 100644
> --- a/include/sysemu/kvm_xen.h
> +++ b/include/sysemu/kvm_xen.h
> @@ -12,6 +12,10 @@
>  #ifndef QEMU_SYSEMU_KVM_XEN_H
>  #define QEMU_SYSEMU_KVM_XEN_H
>  
> +/* The KVM API uses these to indicate "no GPA" or "no GFN" */
> +#define INVALID_GPA UINT64_MAX
> +#define INVALID_GFN UINT64_MAX
> +
>  uint32_t kvm_xen_get_caps(void);
>  
>  #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


