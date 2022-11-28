Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92863A7FA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 13:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozcxG-0006N9-3Q; Mon, 28 Nov 2022 07:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozcxA-0006Md-2g
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozcx5-0006y4-Em
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669637373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+Kes9P8cvDgDjXH2FmeTmU1IwTbzcoLdZ1wnZwqhR4=;
 b=G494buoE4MDwt7jxLH/Rc70otKUamLkzdpkgTyO4EUncIwGNNynXVbpGJrwvZj5Mt2WLD6
 aY1gRXT7KQElQOtbehDBz0BIDNSf/o8hhliAJdwcizJ8wGNm61taV2spB9tJVGz6hQ+JzG
 8OMb5nVQa+f8EK/D1sHNgIG3qVR4L3Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-k__PWja4OKm-e0AhjVUFPQ-1; Mon, 28 Nov 2022 07:09:31 -0500
X-MC-Unique: k__PWja4OKm-e0AhjVUFPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso6218438wmh.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 04:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+Kes9P8cvDgDjXH2FmeTmU1IwTbzcoLdZ1wnZwqhR4=;
 b=lRrdvaFOUGS10L21lGASsSxM2S8SLDc0yXf9vYzqb9kjmUu6kFPVSK0mM/Eh+3+K3Q
 pVJHEMEIZ9ACJQjq99u6KunbzxAYpeNrpE/GrP5TBJYUk5rwAJcAj5hwvcqwVhnlzqc0
 CP3/7Ai+XG+6vMKiwpwSkDvQVo0MavUbInTdFF5YfjD7GwLH2HjOuegsqgrbSehxP9kR
 awxkj4YLumFy7LYAuyd/rfJ2+EANe7YO2PZyKU3EpkWfI6bolnlqOKS2cjNQ39dGV+MD
 BvnLVlV/x11dXDR0LG1DPwVl9gbu4G+mpuXY4ZYp4ya6wuYIzz8Pnsa/0s96r9DNAtK7
 4+5Q==
X-Gm-Message-State: ANoB5pnE2JBnLzMRPojXn4yn3XuiCKBLwOuw0zIJqG4DJ1l1yBU+RMqM
 E2CCNBDJNXj7Rb96hsA7SVKmCfLJSTWmng/A15U0XfYNise7WwQoFAADetyUa8hv8ZZ7rva7HDv
 TSW9InXjrmN/2k4A=
X-Received: by 2002:a05:6000:1046:b0:241:fa2d:debc with SMTP id
 c6-20020a056000104600b00241fa2ddebcmr13823682wrx.12.1669637370678; 
 Mon, 28 Nov 2022 04:09:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ItC5rVbTH2oDERs3nmIwll/cBbIMjIJlwhOSXGWSHy6lcNyK7UN/ZS+jED5Y2nwtzsBMlgw==
X-Received: by 2002:a05:6000:1046:b0:241:fa2d:debc with SMTP id
 c6-20020a056000104600b00241fa2ddebcmr13823662wrx.12.1669637370376; 
 Mon, 28 Nov 2022 04:09:30 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 x7-20020adfdcc7000000b002366d1cc198sm10847904wrm.41.2022.11.28.04.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 04:09:29 -0800 (PST)
Date: Mon, 28 Nov 2022 12:09:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 03/12] pci: Move HMP commands from monitor/ to new
 hw/pci/pci-hmp-cmds.c
Message-ID: <Y4Sk96FsWdt4wYcK@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-4-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "PCI".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/pci/pci-hmp-cmds.c | 126 ++++++++++++++++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c    | 107 -----------------------------------
>  hw/pci/meson.build    |   1 +
>  3 files changed, 127 insertions(+), 107 deletions(-)
>  create mode 100644 hw/pci/pci-hmp-cmds.c
> 
> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
> new file mode 100644
> index 0000000000..5adfe4f57f
> --- /dev/null
> +++ b/hw/pci/pci-hmp-cmds.c
> @@ -0,0 +1,126 @@
> +/*
> + * HMP commands related to PCI
> + *
> + * Copyright IBM, Corp. 2011
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

Yes, unfortunately it looks like the bulk of this code was ~3 months
earlier than the cut off.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> + */
> +
> +#include "qemu/osdep.h"
> +#include "monitor/hmp.h"
> +#include "monitor/monitor.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-pci.h"
> +
> +static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
> +{
> +    PciMemoryRegionList *region;
> +
> +    monitor_printf(mon, "  Bus %2" PRId64 ", ", dev->bus);
> +    monitor_printf(mon, "device %3" PRId64 ", function %" PRId64 ":\n",
> +                   dev->slot, dev->function);
> +    monitor_printf(mon, "    ");
> +
> +    if (dev->class_info->has_desc) {
> +        monitor_puts(mon, dev->class_info->desc);
> +    } else {
> +        monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
> +    }
> +
> +    monitor_printf(mon, ": PCI device %04" PRIx64 ":%04" PRIx64 "\n",
> +                   dev->id->vendor, dev->id->device);
> +    if (dev->id->has_subsystem_vendor && dev->id->has_subsystem) {
> +        monitor_printf(mon, "      PCI subsystem %04" PRIx64 ":%04" PRIx64 "\n",
> +                       dev->id->subsystem_vendor, dev->id->subsystem);
> +    }
> +
> +    if (dev->has_irq) {
> +        monitor_printf(mon, "      IRQ %" PRId64 ", pin %c\n",
> +                       dev->irq, (char)('A' + dev->irq_pin - 1));
> +    }
> +
> +    if (dev->has_pci_bridge) {
> +        monitor_printf(mon, "      BUS %" PRId64 ".\n",
> +                       dev->pci_bridge->bus->number);
> +        monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
> +                       dev->pci_bridge->bus->secondary);
> +        monitor_printf(mon, "      subordinate bus %" PRId64 ".\n",
> +                       dev->pci_bridge->bus->subordinate);
> +
> +        monitor_printf(mon, "      IO range [0x%04"PRIx64", 0x%04"PRIx64"]\n",
> +                       dev->pci_bridge->bus->io_range->base,
> +                       dev->pci_bridge->bus->io_range->limit);
> +
> +        monitor_printf(mon,
> +                       "      memory range [0x%08"PRIx64", 0x%08"PRIx64"]\n",
> +                       dev->pci_bridge->bus->memory_range->base,
> +                       dev->pci_bridge->bus->memory_range->limit);
> +
> +        monitor_printf(mon, "      prefetchable memory range "
> +                       "[0x%08"PRIx64", 0x%08"PRIx64"]\n",
> +                       dev->pci_bridge->bus->prefetchable_range->base,
> +                       dev->pci_bridge->bus->prefetchable_range->limit);
> +    }
> +
> +    for (region = dev->regions; region; region = region->next) {
> +        uint64_t addr, size;
> +
> +        addr = region->value->address;
> +        size = region->value->size;
> +
> +        monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
> +
> +        if (!strcmp(region->value->type, "io")) {
> +            monitor_printf(mon, "I/O at 0x%04" PRIx64
> +                                " [0x%04" PRIx64 "].\n",
> +                           addr, addr + size - 1);
> +        } else {
> +            monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
> +                               " [0x%08" PRIx64 "].\n",
> +                           region->value->mem_type_64 ? 64 : 32,
> +                           region->value->prefetch ? " prefetchable" : "",
> +                           addr, addr + size - 1);
> +        }
> +    }
> +
> +    monitor_printf(mon, "      id \"%s\"\n", dev->qdev_id);
> +
> +    if (dev->has_pci_bridge) {
> +        if (dev->pci_bridge->has_devices) {
> +            PciDeviceInfoList *cdev;
> +            for (cdev = dev->pci_bridge->devices; cdev; cdev = cdev->next) {
> +                hmp_info_pci_device(mon, cdev->value);
> +            }
> +        }
> +    }
> +}
> +
> +void hmp_info_pci(Monitor *mon, const QDict *qdict)
> +{
> +    PciInfoList *info_list, *info;
> +    Error *err = NULL;
> +
> +    info_list = qmp_query_pci(&err);
> +    if (err) {
> +        monitor_printf(mon, "PCI devices not supported\n");
> +        error_free(err);
> +        return;
> +    }
> +
> +    for (info = info_list; info; info = info->next) {
> +        PciDeviceInfoList *dev;
> +
> +        for (dev = info->value->devices; dev; dev = dev->next) {
> +            hmp_info_pci_device(mon, dev->value);
> +        }
> +    }
> +
> +    qapi_free_PciInfoList(info_list);
> +}
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 01b789a79e..03eae10663 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -37,7 +37,6 @@
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-commands-net.h"
> -#include "qapi/qapi-commands-pci.h"
>  #include "qapi/qapi-commands-rocker.h"
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-commands-stats.h"
> @@ -701,89 +700,6 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
>      qapi_free_BalloonInfo(info);
>  }
>  
> -static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
> -{
> -    PciMemoryRegionList *region;
> -
> -    monitor_printf(mon, "  Bus %2" PRId64 ", ", dev->bus);
> -    monitor_printf(mon, "device %3" PRId64 ", function %" PRId64 ":\n",
> -                   dev->slot, dev->function);
> -    monitor_printf(mon, "    ");
> -
> -    if (dev->class_info->has_desc) {
> -        monitor_puts(mon, dev->class_info->desc);
> -    } else {
> -        monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
> -    }
> -
> -    monitor_printf(mon, ": PCI device %04" PRIx64 ":%04" PRIx64 "\n",
> -                   dev->id->vendor, dev->id->device);
> -    if (dev->id->has_subsystem_vendor && dev->id->has_subsystem) {
> -        monitor_printf(mon, "      PCI subsystem %04" PRIx64 ":%04" PRIx64 "\n",
> -                       dev->id->subsystem_vendor, dev->id->subsystem);
> -    }
> -
> -    if (dev->has_irq) {
> -        monitor_printf(mon, "      IRQ %" PRId64 ", pin %c\n",
> -                       dev->irq, (char)('A' + dev->irq_pin - 1));
> -    }
> -
> -    if (dev->has_pci_bridge) {
> -        monitor_printf(mon, "      BUS %" PRId64 ".\n",
> -                       dev->pci_bridge->bus->number);
> -        monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
> -                       dev->pci_bridge->bus->secondary);
> -        monitor_printf(mon, "      subordinate bus %" PRId64 ".\n",
> -                       dev->pci_bridge->bus->subordinate);
> -
> -        monitor_printf(mon, "      IO range [0x%04"PRIx64", 0x%04"PRIx64"]\n",
> -                       dev->pci_bridge->bus->io_range->base,
> -                       dev->pci_bridge->bus->io_range->limit);
> -
> -        monitor_printf(mon,
> -                       "      memory range [0x%08"PRIx64", 0x%08"PRIx64"]\n",
> -                       dev->pci_bridge->bus->memory_range->base,
> -                       dev->pci_bridge->bus->memory_range->limit);
> -
> -        monitor_printf(mon, "      prefetchable memory range "
> -                       "[0x%08"PRIx64", 0x%08"PRIx64"]\n",
> -                       dev->pci_bridge->bus->prefetchable_range->base,
> -                       dev->pci_bridge->bus->prefetchable_range->limit);
> -    }
> -
> -    for (region = dev->regions; region; region = region->next) {
> -        uint64_t addr, size;
> -
> -        addr = region->value->address;
> -        size = region->value->size;
> -
> -        monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
> -
> -        if (!strcmp(region->value->type, "io")) {
> -            monitor_printf(mon, "I/O at 0x%04" PRIx64
> -                                " [0x%04" PRIx64 "].\n",
> -                           addr, addr + size - 1);
> -        } else {
> -            monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
> -                               " [0x%08" PRIx64 "].\n",
> -                           region->value->mem_type_64 ? 64 : 32,
> -                           region->value->prefetch ? " prefetchable" : "",
> -                           addr, addr + size - 1);
> -        }
> -    }
> -
> -    monitor_printf(mon, "      id \"%s\"\n", dev->qdev_id);
> -
> -    if (dev->has_pci_bridge) {
> -        if (dev->pci_bridge->has_devices) {
> -            PciDeviceInfoList *cdev;
> -            for (cdev = dev->pci_bridge->devices; cdev; cdev = cdev->next) {
> -                hmp_info_pci_device(mon, cdev->value);
> -            }
> -        }
> -    }
> -}
> -
>  static int hmp_info_pic_foreach(Object *obj, void *opaque)
>  {
>      InterruptStatsProvider *intc;
> @@ -810,29 +726,6 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
>                                     hmp_info_pic_foreach, mon);
>  }
>  
> -void hmp_info_pci(Monitor *mon, const QDict *qdict)
> -{
> -    PciInfoList *info_list, *info;
> -    Error *err = NULL;
> -
> -    info_list = qmp_query_pci(&err);
> -    if (err) {
> -        monitor_printf(mon, "PCI devices not supported\n");
> -        error_free(err);
> -        return;
> -    }
> -
> -    for (info = info_list; info; info = info->next) {
> -        PciDeviceInfoList *dev;
> -
> -        for (dev = info->value->devices; dev; dev = dev->next) {
> -            hmp_info_pci_device(mon, dev->value);
> -        }
> -    }
> -
> -    qapi_free_PciInfoList(info_list);
> -}
> -
>  void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>  {
>  #ifdef CONFIG_TPM
> diff --git a/hw/pci/meson.build b/hw/pci/meson.build
> index 40721f1514..e42a133f3a 100644
> --- a/hw/pci/meson.build
> +++ b/hw/pci/meson.build
> @@ -20,3 +20,4 @@ softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
>  
>  softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
> +softmmu_ss.add(files('pci-hmp-cmds.c'))
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


