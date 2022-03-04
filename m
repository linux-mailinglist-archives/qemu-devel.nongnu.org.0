Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB54CD2AE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:43:41 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5PQ-00027k-F0
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5NN-0007rD-KD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5NL-0003EI-J6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646390490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAXrw562EeQayBEsh9Yli5fjjbt5olGMaoJYh3bbkkY=;
 b=AK4YJBvWohSTZyXJvfv605PbALNd4A6TCmhWsDZd+htsbQkgy6v4RFZdtqupJ8NtDhu96u
 x9TnbFjhE1FQMn+x/xPbck4SdREcjKGuSwPXAM44JLkkET4F2UpT9DxEFphQDCjcRJouNA
 X3KScJXAePnZ6t704kM98bL00nJ1vKk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-9qY88iQsPCuaZlu24EyNdg-1; Fri, 04 Mar 2022 05:41:28 -0500
X-MC-Unique: 9qY88iQsPCuaZlu24EyNdg-1
Received: by mail-ej1-f72.google.com with SMTP id
 y5-20020a1709060a8500b006da9258a34cso2439943ejf.21
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAXrw562EeQayBEsh9Yli5fjjbt5olGMaoJYh3bbkkY=;
 b=A9v9qmA/KIdEM1bYIhsMcqKcBnzqyDGeVRzc7q4hIOu2/R/8QROq/+GTlnQKhdook6
 4dVW/10VNseSfzR0WCyxkvK12NA8yVHlxENpJr+QeOWK62PMNQDxNZcfw+cG5Qyrf25x
 fU935nZRrgpsGY0qH78X7IfjZKNqaOpvQo17cPRlecwnhAOTI07xAMzD9IsYLeFD1yMg
 Cvru+MJ3n3BLpQrp+tr3tzl5TEdmuJn2P7vFU4v78551vvAqmUFKdpKYxXKG8bPuQMvd
 GqyNWa24LHEScVruei72XRnSX+vl+DJxrcGlv573GY6NYQYNhdbPhLfVxdE+8cV1hG2j
 PnZQ==
X-Gm-Message-State: AOAM530Qf7of+Vxj8yFHZOamAJ1Hndg1uhBlHnPLT+bD5lI5dJ1/XxXj
 bYJ2qARPmoeABhczOghexAE3DCt0sceuhDoXDBuInE7kRabocKG1q3781+oPcnbJeLbmeOmJYk9
 Ta2k9i+/lq3tm7eM=
X-Received: by 2002:a17:907:8692:b0:6da:866c:6355 with SMTP id
 qa18-20020a170907869200b006da866c6355mr7520193ejc.174.1646390487359; 
 Fri, 04 Mar 2022 02:41:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE5X8lLL7s9hAWOrFxGWc6b2Ny9rse3GevQcGf526YqRBtVv64lo+GK+4HHmMmAHVkRg0ang==
X-Received: by 2002:a17:907:8692:b0:6da:866c:6355 with SMTP id
 qa18-20020a170907869200b006da866c6355mr7520156ejc.174.1646390486997; 
 Fri, 04 Mar 2022 02:41:26 -0800 (PST)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm1618867ejm.115.2022.03.04.02.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:41:26 -0800 (PST)
Date: Fri, 4 Mar 2022 11:41:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Message-ID: <20220304114124.6fe97646@redhat.com>
In-Reply-To: <20220303121534-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 12:21:15 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:
> > Allocate anonymous memory using memfd_create if the memfd-alloc machine
> > option is set.
> > 
> > Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> > ---
> >  hw/core/machine.c   | 19 +++++++++++++++++++
> >  include/hw/boards.h |  1 +
> >  qemu-options.hx     |  6 ++++++
> >  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
> >  softmmu/vl.c        |  1 +
> >  trace-events        |  1 +
> >  util/qemu-config.c  |  4 ++++
> >  7 files changed, 70 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 53a99ab..7739d88 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
> >      ms->mem_merge = value;
> >  }
> >  
> > +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(obj);
> > +
> > +    return ms->memfd_alloc;
> > +}
> > +
> > +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(obj);
> > +
> > +    ms->memfd_alloc = value;
> > +}
> > +
> >  static bool machine_get_usb(Object *obj, Error **errp)
> >  {
> >      MachineState *ms = MACHINE(obj);
> > @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
> >      object_class_property_set_description(oc, "mem-merge",
> >          "Enable/disable memory merge support");
> >  
> > +    object_class_property_add_bool(oc, "memfd-alloc",
> > +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> > +    object_class_property_set_description(oc, "memfd-alloc",
> > +        "Enable/disable allocating anonymous memory using memfd_create");
> > +
> >      object_class_property_add_bool(oc, "usb",
> >          machine_get_usb, machine_set_usb);
> >      object_class_property_set_description(oc, "usb",
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 9c1c190..a57d7a0 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -327,6 +327,7 @@ struct MachineState {
> >      char *dt_compatible;
> >      bool dump_guest_core;
> >      bool mem_merge;
> > +    bool memfd_alloc;
> >      bool usb;
> >      bool usb_disabled;
> >      char *firmware;
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 7d47510..33c8173 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
> >      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
> >      "                mem-merge=on|off controls memory merge support (default: on)\n"
> > +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"  
> 
> Question: are there any disadvantages associated with using
> memfd_create? I guess we are using up an fd, but that seems minor.  Any
> reason not to set to on by default? maybe with a fallback option to
> disable that?
> 
> I am concerned that it's actually a kind of memory backend, this flag
> seems to instead be closer to the deprecated mem-prealloc. E.g.
> it does not work with a mem path, does it?

(mem path and mem-prealloc are transparently aliased to used memory backend
if I recall it right.)

Steve,

For allocating guest RAM, we switched exclusively to using memory-backends
including initial guest RAM (-m size option) and we have hostmem-memfd
that uses memfd_create() and I'd rather avoid adding random knobs to machine
for tweaking how RAM should be allocated, we have memory backends for this,
so this patch begs the question: why hostmem-memfd is not sufficient?
(patch description is rather lacking on rationale behind the patch)


> 
> 
> >      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
> >      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
> >      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
> > @@ -76,6 +77,11 @@ SRST
> >          supported by the host, de-duplicates identical memory pages
> >          among VMs instances (enabled by default).
> >  
> > +    ``memfd-alloc=on|off``
> > +        Enables or disables allocation of anonymous guest RAM using
> > +        memfd_create.  Any associated memory-backend objects are created with
> > +        share=on.  The memfd-alloc default is off.
> > +
> >      ``aes-key-wrap=on|off``
> >          Enables or disables AES key wrapping support on s390-ccw hosts.
> >          This feature controls whether AES wrapping keys will be created
> > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > index 3524c04..95e2b49 100644
> > --- a/softmmu/physmem.c
> > +++ b/softmmu/physmem.c
> > @@ -41,6 +41,7 @@
> >  #include "qemu/config-file.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/qemu-print.h"
> > +#include "qemu/memfd.h"
> >  #include "exec/memory.h"
> >  #include "exec/ioport.h"
> >  #include "sysemu/dma.h"
> > @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
> >      const bool shared = qemu_ram_is_shared(new_block);
> >      RAMBlock *block;
> >      RAMBlock *last_block = NULL;
> > +    struct MemoryRegion *mr = new_block->mr;
> >      ram_addr_t old_ram_size, new_ram_size;
> >      Error *err = NULL;
> > +    const char *name;
> > +    void *addr = 0;
> > +    size_t maxlen;
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> >  
> >      old_ram_size = last_ram_page();
> >  
> >      qemu_mutex_lock_ramlist();
> > -    new_block->offset = find_ram_offset(new_block->max_length);
> > +    maxlen = new_block->max_length;
> > +    new_block->offset = find_ram_offset(maxlen);
> >  
> >      if (!new_block->host) {
> >          if (xen_enabled()) {
> > -            xen_ram_alloc(new_block->offset, new_block->max_length,
> > -                          new_block->mr, &err);
> > +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
> >              if (err) {
> >                  error_propagate(errp, err);
> >                  qemu_mutex_unlock_ramlist();
> >                  return;
> >              }
> >          } else {
> > -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
> > -                                                  &new_block->mr->align,
> > -                                                  shared, noreserve);
> > -            if (!new_block->host) {
> > +            name = memory_region_name(mr);
> > +            if (ms->memfd_alloc) {
> > +                Object *parent = &mr->parent_obj;
> > +                int mfd = -1;          /* placeholder until next patch */
> > +                mr->align = QEMU_VMALLOC_ALIGN;
> > +                if (mfd < 0) {
> > +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
> > +                                            0, 0, 0, &err);
> > +                    if (mfd < 0) {
> > +                        return;
> > +                    }
> > +                }
> > +                qemu_set_cloexec(mfd);
> > +                /* The memory backend already set its desired flags. */
> > +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
> > +                    new_block->flags |= RAM_SHARED;
> > +                }
> > +                addr = file_ram_alloc(new_block, maxlen, mfd,
> > +                                      false, false, 0, errp);
> > +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> > +            } else {
> > +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
> > +                                           shared, noreserve);
> > +            }
> > +
> > +            if (!addr) {
> >                  error_setg_errno(errp, errno,
> >                                   "cannot set up guest memory '%s'",
> > -                                 memory_region_name(new_block->mr));
> > +                                 name);
> >                  qemu_mutex_unlock_ramlist();
> >                  return;
> >              }
> > -            memory_try_enable_merging(new_block->host, new_block->max_length);
> > +            memory_try_enable_merging(addr, maxlen);
> > +            new_block->host = addr;
> >          }
> >      }
> >  
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 620a1f1..ab3648a 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
> >          object_property_set_str(obj, "mem-path", path, &error_fatal);
> >      }
> >      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
> > +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
> >      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
> >                                obj);
> >      /* Ensure backend's memory region name is equal to mc->default_ram_id */
> > diff --git a/trace-events b/trace-events
> > index a637a61..770a9ac 100644
> > --- a/trace-events
> > +++ b/trace-events
> > @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
> >  # accel/tcg/cputlb.c
> >  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
> >  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> > +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
> >  
> >  # gdbstub.c
> >  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
> > diff --git a/util/qemu-config.c b/util/qemu-config.c
> > index 436ab63..3606e5c 100644
> > --- a/util/qemu-config.c
> > +++ b/util/qemu-config.c
> > @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
> >              .type = QEMU_OPT_BOOL,
> >              .help = "enable/disable memory merge support",
> >          },{
> > +            .name = "memfd-alloc",
> > +            .type = QEMU_OPT_BOOL,
> > +            .help = "enable/disable memfd_create for anonymous memory",
> > +        },{
> >              .name = "usb",
> >              .type = QEMU_OPT_BOOL,
> >              .help = "Set on/off to enable/disable usb",
> > -- 
> > 1.8.3.1  
> 
> 


