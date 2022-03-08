Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A025C4D1084
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 07:52:43 +0100 (CET)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRTi6-0002fD-LM
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 01:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRTfu-0001sf-FU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRTfo-0001a5-Ge
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646722219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/MeaSNwYAuY5THkFmligDhd/YZYmkx8FqLc/h6V18RY=;
 b=bukYSTQLuMDQrItLAEquyAb/3uj0mjYaMFdxj0KW39YU109s5G8IggZfQjJ3xRy2cSVaFM
 P7bZE9Q3kIcRMYdaxiPffFXd4XIJbcWzx+zC7wcDqylIIG9e6DwrjjI6n8aKHWUj6lxkWG
 xF+Vu29iAjhE0fmdF63uPtdBXtrK+Ns=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-nVY7Lo7iMZWxdWS7np99QQ-1; Tue, 08 Mar 2022 01:50:18 -0500
X-MC-Unique: nVY7Lo7iMZWxdWS7np99QQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso8137978ejk.17
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 22:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/MeaSNwYAuY5THkFmligDhd/YZYmkx8FqLc/h6V18RY=;
 b=mArRmhP9PMSREgyIZCQBKEi+ZlDzxcB77/jTe9o7x6ZBVM/6eUGIctspsq3ncAczv+
 LdsedzJerl6SOhy5ndaTLH6BeIqQzzZ4OSB3aR1Sb7vxMr3USoMlYFIdhx8saqQmrxCn
 SNbllwilR0s0bx3lBgw6+HCRMy6rAYPzzW554dqkEHlq3iJpuVxXffPnDYqj/3TE5JEs
 JKRDnM5Q2CEFkeaj35X3zr2w/0/lqLyIoV9CTBUk84QpOCFsnLXzlg3CDypwYiH1tn2L
 FZo9GVWsZBTKY+AtVw3y1irN5eaO4rVPh9RV/K0hKAOGuuVy1lvpEhjtm4cI7/nPV3lf
 a6ZQ==
X-Gm-Message-State: AOAM532fAYfmHgIpKg+Rb/eXsEWwp4rHbfGCnwQPUWuXh/Z/dqgBsIuR
 g2jw3MZ9jiz5KUDXQTHcyG3JHQ4t4wMdYnlsO+GJMrclT5vR/HvJk1x3iRzfflT+ipJMQselpg+
 I5qm0wqgOvIIFEy0=
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr11778808ejc.217.1646722216632; 
 Mon, 07 Mar 2022 22:50:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypH1Y4WPywVPvyboMO/NMtJnzUSLMPXkxlq2k7BhWlUVnGvQ1V18n88Z5pN8YpymXAPmo9mg==
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr11778782ejc.217.1646722216287; 
 Mon, 07 Mar 2022 22:50:16 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 d2-20020a50cf42000000b004135b6eef60sm7225126edk.94.2022.03.07.22.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 22:50:15 -0800 (PST)
Date: Tue, 8 Mar 2022 01:50:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Message-ID: <20220307184045-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
MIME-Version: 1.0
In-Reply-To: <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:
> On 3/4/2022 5:41 AM, Igor Mammedov wrote:
> > On Thu, 3 Mar 2022 12:21:15 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> >> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:
> >>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
> >>> option is set.
> >>>
> >>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>> ---
> >>>  hw/core/machine.c   | 19 +++++++++++++++++++
> >>>  include/hw/boards.h |  1 +
> >>>  qemu-options.hx     |  6 ++++++
> >>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
> >>>  softmmu/vl.c        |  1 +
> >>>  trace-events        |  1 +
> >>>  util/qemu-config.c  |  4 ++++
> >>>  7 files changed, 70 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >>> index 53a99ab..7739d88 100644
> >>> --- a/hw/core/machine.c
> >>> +++ b/hw/core/machine.c
> >>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
> >>>      ms->mem_merge = value;
> >>>  }
> >>>  
> >>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> >>> +{
> >>> +    MachineState *ms = MACHINE(obj);
> >>> +
> >>> +    return ms->memfd_alloc;
> >>> +}
> >>> +
> >>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
> >>> +{
> >>> +    MachineState *ms = MACHINE(obj);
> >>> +
> >>> +    ms->memfd_alloc = value;
> >>> +}
> >>> +
> >>>  static bool machine_get_usb(Object *obj, Error **errp)
> >>>  {
> >>>      MachineState *ms = MACHINE(obj);
> >>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
> >>>      object_class_property_set_description(oc, "mem-merge",
> >>>          "Enable/disable memory merge support");
> >>>  
> >>> +    object_class_property_add_bool(oc, "memfd-alloc",
> >>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> >>> +    object_class_property_set_description(oc, "memfd-alloc",
> >>> +        "Enable/disable allocating anonymous memory using memfd_create");
> >>> +
> >>>      object_class_property_add_bool(oc, "usb",
> >>>          machine_get_usb, machine_set_usb);
> >>>      object_class_property_set_description(oc, "usb",
> >>> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >>> index 9c1c190..a57d7a0 100644
> >>> --- a/include/hw/boards.h
> >>> +++ b/include/hw/boards.h
> >>> @@ -327,6 +327,7 @@ struct MachineState {
> >>>      char *dt_compatible;
> >>>      bool dump_guest_core;
> >>>      bool mem_merge;
> >>> +    bool memfd_alloc;
> >>>      bool usb;
> >>>      bool usb_disabled;
> >>>      char *firmware;
> >>> diff --git a/qemu-options.hx b/qemu-options.hx
> >>> index 7d47510..33c8173 100644
> >>> --- a/qemu-options.hx
> >>> +++ b/qemu-options.hx
> >>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
> >>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
> >>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> >>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"  
> >>
> >> Question: are there any disadvantages associated with using
> >> memfd_create? I guess we are using up an fd, but that seems minor.  Any
> >> reason not to set to on by default? maybe with a fallback option to
> >> disable that?
> 
> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
> Also, the tunable to enable huge pages for share memory is different than for
> anon memory, so there could be performance loss if it is not set correctly.
>     /sys/kernel/mm/transparent_hugepage/enabled
>     vs
>     /sys/kernel/mm/transparent_hugepage/shmem_enabled

I guess we can test this when launching the VM, and select
a good default.

> It might make sense to use memfd_create by default for the secondary segments.

Well there's also KSM now you mention it.

> >> I am concerned that it's actually a kind of memory backend, this flag
> >> seems to instead be closer to the deprecated mem-prealloc. E.g.
> >> it does not work with a mem path, does it?
> 
> One can still define a memory backend with mempath to create the main ram segment,
> though it must be some form of shared to work with live update.  Indeed, I would 
> expect most users to specify an explicit memory backend for it.  The secondary
> segments would still use memfd_create.
> 
> > (mem path and mem-prealloc are transparently aliased to used memory backend
> > if I recall it right.)
> > 
> > Steve,
> > 
> > For allocating guest RAM, we switched exclusively to using memory-backends
> > including initial guest RAM (-m size option) and we have hostmem-memfd
> > that uses memfd_create() and I'd rather avoid adding random knobs to machine
> > for tweaking how RAM should be allocated, we have memory backends for this,
> > so this patch begs the question: why hostmem-memfd is not sufficient?
> > (patch description is rather lacking on rationale behind the patch)
> 
> There is currently no way to specify memory backends for the secondary memory
> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.
> 
> - Steve
> 
> >>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
> >>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
> >>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
> >>> @@ -76,6 +77,11 @@ SRST
> >>>          supported by the host, de-duplicates identical memory pages
> >>>          among VMs instances (enabled by default).
> >>>  
> >>> +    ``memfd-alloc=on|off``
> >>> +        Enables or disables allocation of anonymous guest RAM using
> >>> +        memfd_create.  Any associated memory-backend objects are created with
> >>> +        share=on.  The memfd-alloc default is off.
> >>> +
> >>>      ``aes-key-wrap=on|off``
> >>>          Enables or disables AES key wrapping support on s390-ccw hosts.
> >>>          This feature controls whether AES wrapping keys will be created
> >>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >>> index 3524c04..95e2b49 100644
> >>> --- a/softmmu/physmem.c
> >>> +++ b/softmmu/physmem.c
> >>> @@ -41,6 +41,7 @@
> >>>  #include "qemu/config-file.h"
> >>>  #include "qemu/error-report.h"
> >>>  #include "qemu/qemu-print.h"
> >>> +#include "qemu/memfd.h"
> >>>  #include "exec/memory.h"
> >>>  #include "exec/ioport.h"
> >>>  #include "sysemu/dma.h"
> >>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
> >>>      const bool shared = qemu_ram_is_shared(new_block);
> >>>      RAMBlock *block;
> >>>      RAMBlock *last_block = NULL;
> >>> +    struct MemoryRegion *mr = new_block->mr;
> >>>      ram_addr_t old_ram_size, new_ram_size;
> >>>      Error *err = NULL;
> >>> +    const char *name;
> >>> +    void *addr = 0;
> >>> +    size_t maxlen;
> >>> +    MachineState *ms = MACHINE(qdev_get_machine());
> >>>  
> >>>      old_ram_size = last_ram_page();
> >>>  
> >>>      qemu_mutex_lock_ramlist();
> >>> -    new_block->offset = find_ram_offset(new_block->max_length);
> >>> +    maxlen = new_block->max_length;
> >>> +    new_block->offset = find_ram_offset(maxlen);
> >>>  
> >>>      if (!new_block->host) {
> >>>          if (xen_enabled()) {
> >>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
> >>> -                          new_block->mr, &err);
> >>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
> >>>              if (err) {
> >>>                  error_propagate(errp, err);
> >>>                  qemu_mutex_unlock_ramlist();
> >>>                  return;
> >>>              }
> >>>          } else {
> >>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
> >>> -                                                  &new_block->mr->align,
> >>> -                                                  shared, noreserve);
> >>> -            if (!new_block->host) {
> >>> +            name = memory_region_name(mr);
> >>> +            if (ms->memfd_alloc) {
> >>> +                Object *parent = &mr->parent_obj;
> >>> +                int mfd = -1;          /* placeholder until next patch */
> >>> +                mr->align = QEMU_VMALLOC_ALIGN;
> >>> +                if (mfd < 0) {
> >>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
> >>> +                                            0, 0, 0, &err);
> >>> +                    if (mfd < 0) {
> >>> +                        return;
> >>> +                    }
> >>> +                }
> >>> +                qemu_set_cloexec(mfd);
> >>> +                /* The memory backend already set its desired flags. */
> >>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
> >>> +                    new_block->flags |= RAM_SHARED;
> >>> +                }
> >>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
> >>> +                                      false, false, 0, errp);
> >>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> >>> +            } else {
> >>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
> >>> +                                           shared, noreserve);
> >>> +            }
> >>> +
> >>> +            if (!addr) {
> >>>                  error_setg_errno(errp, errno,
> >>>                                   "cannot set up guest memory '%s'",
> >>> -                                 memory_region_name(new_block->mr));
> >>> +                                 name);
> >>>                  qemu_mutex_unlock_ramlist();
> >>>                  return;
> >>>              }
> >>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
> >>> +            memory_try_enable_merging(addr, maxlen);
> >>> +            new_block->host = addr;
> >>>          }
> >>>      }
> >>>  
> >>> diff --git a/softmmu/vl.c b/softmmu/vl.c
> >>> index 620a1f1..ab3648a 100644
> >>> --- a/softmmu/vl.c
> >>> +++ b/softmmu/vl.c
> >>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
> >>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
> >>>      }
> >>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
> >>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
> >>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
> >>>                                obj);
> >>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
> >>> diff --git a/trace-events b/trace-events
> >>> index a637a61..770a9ac 100644
> >>> --- a/trace-events
> >>> +++ b/trace-events
> >>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
> >>>  # accel/tcg/cputlb.c
> >>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
> >>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> >>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
> >>>  
> >>>  # gdbstub.c
> >>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
> >>> diff --git a/util/qemu-config.c b/util/qemu-config.c
> >>> index 436ab63..3606e5c 100644
> >>> --- a/util/qemu-config.c
> >>> +++ b/util/qemu-config.c
> >>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
> >>>              .type = QEMU_OPT_BOOL,
> >>>              .help = "enable/disable memory merge support",
> >>>          },{
> >>> +            .name = "memfd-alloc",
> >>> +            .type = QEMU_OPT_BOOL,
> >>> +            .help = "enable/disable memfd_create for anonymous memory",
> >>> +        },{
> >>>              .name = "usb",
> >>>              .type = QEMU_OPT_BOOL,
> >>>              .help = "Set on/off to enable/disable usb",
> >>> -- 
> >>> 1.8.3.1  
> >>
> >>
> > 


