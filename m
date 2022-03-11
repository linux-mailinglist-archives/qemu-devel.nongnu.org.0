Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07C4D5EE2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 10:56:16 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSc0N-0005jL-IQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 04:56:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSbyh-0004yJ-Uq
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSbye-0000hZ-1M
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646992466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IpaCJxgxxhW4P/ev/e+INtlmJRMNqryGgU7iPwZhkQ=;
 b=RXhmBMeFuy6XsxA6Gkbm1Uz1GVO8D0k/Y30o34fgrT2XkikXw+wf24wYXGHnhYaXJuPjuJ
 buFkjvFg0H1NK2tZ8D1b0o8OfW2cl7aip/pYdX+d2Yn6UB34UAY+c8SMC5GA1FQE5Rha37
 by5kOP46yBm+1hvcOR4BpJdZHlNTJ4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-9L3ABe2UNsu8uD7fbbGScw-1; Fri, 11 Mar 2022 04:54:24 -0500
X-MC-Unique: 9L3ABe2UNsu8uD7fbbGScw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so5306329wmr.4
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 01:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=5IpaCJxgxxhW4P/ev/e+INtlmJRMNqryGgU7iPwZhkQ=;
 b=1Vem6tmRHXuMIsFWK7M7p1C0j13jv7NZBkpmvtnNRpi06X100QUfGOVomLoMTQ164i
 58rhYufSdPSi6tg/K1RaumQeCnD5GwTphT3jW4Cd01z660fBGKetQAHoj1tC3P6KFgD0
 028WeItAVZIrst4DxuOUS9vS7V43A4r/TYeAhBom/tBRRUrr15CN1cP2fRvTmqfJwH0K
 StC9KaSUWGUrAmI+veBZtqUMtRTEBPQt4d0JtVCDSvSVlzOYMpeX97sn70JMKTTyZ+bl
 f2bRKlAL7WLUg+QzRH9Ddj8uyK6Rfgth179f7b1iQZML09mKd4QQTpLZPIkRMbR4UXHG
 pthw==
X-Gm-Message-State: AOAM53127MQm13gmu5LFWUwg21kighCkGtEeovoR1YDSJ01fmleW6A7j
 h/3HIjEmbiVlWLgbljeXOuKPfsumZKNpyzC6Zfjb8QkjjAno75/LCuHJPEnJpk3D4/JxQlsIUOF
 o2Bhq6L3mYRXT5FU=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr6873333wrm.521.1646992463154; 
 Fri, 11 Mar 2022 01:54:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4l6TjTeakWz9/w6I6J/sx69JskB/tKQ1I9P6IOhAXHtYm2WNoZOMkm+861X0YXWqjIZYIjA==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr6873308wrm.521.1646992462821; 
 Fri, 11 Mar 2022 01:54:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b00382aa0b1619sm6573310wmp.45.2022.03.11.01.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:54:22 -0800 (PST)
Message-ID: <d6984635-6ebd-ab24-6f14-e1a732d8c13c@redhat.com>
Date: Fri, 11 Mar 2022 10:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
In-Reply-To: <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 20:05, Steve Sistare wrote:
> Allocate anonymous memory using memfd_create if the memfd-alloc machine
> option is set.

Hi,

late to the party (thanks Igor for CCing)

... in which case it's no longer anonymous memory (because it's now
MAP_SHARED). So you're converting all private memory to shared memory.

For example, memory ballooning will no longer work as expected. There is
no shared zeropage. KSM won't work. This brings a lot of "surprises".


This patch begs for a proper description why this is required and why we
cannot simply let the user handle that by properly using
memory-backend-memfd manually.

Especially the "memfd-alloc option" doesn't even express to a user
what's actually happening and what the implications are.


Long story short: this patch description has to be seriously extended.

> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/core/machine.c   | 19 +++++++++++++++++++
>  include/hw/boards.h |  1 +
>  qemu-options.hx     |  6 ++++++
>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>  softmmu/vl.c        |  1 +
>  trace-events        |  1 +
>  util/qemu-config.c  |  4 ++++
>  7 files changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 53a99ab..7739d88 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>      ms->mem_merge = value;
>  }
>  
> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->memfd_alloc;
> +}
> +
> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->memfd_alloc = value;
> +}
> +
>  static bool machine_get_usb(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "mem-merge",
>          "Enable/disable memory merge support");
>  
> +    object_class_property_add_bool(oc, "memfd-alloc",
> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> +    object_class_property_set_description(oc, "memfd-alloc",
> +        "Enable/disable allocating anonymous memory using memfd_create");
> +
>      object_class_property_add_bool(oc, "usb",
>          machine_get_usb, machine_set_usb);
>      object_class_property_set_description(oc, "usb",
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9c1c190..a57d7a0 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -327,6 +327,7 @@ struct MachineState {
>      char *dt_compatible;
>      bool dump_guest_core;
>      bool mem_merge;
> +    bool memfd_alloc;
>      bool usb;
>      bool usb_disabled;
>      char *firmware;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7d47510..33c8173 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"
>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
> @@ -76,6 +77,11 @@ SRST
>          supported by the host, de-duplicates identical memory pages
>          among VMs instances (enabled by default).
>  
> +    ``memfd-alloc=on|off``
> +        Enables or disables allocation of anonymous guest RAM using
> +        memfd_create.  Any associated memory-backend objects are created with
> +        share=on.  The memfd-alloc default is off.
> +
>      ``aes-key-wrap=on|off``
>          Enables or disables AES key wrapping support on s390-ccw hosts.
>          This feature controls whether AES wrapping keys will be created
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3524c04..95e2b49 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -41,6 +41,7 @@
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
>  #include "qemu/qemu-print.h"
> +#include "qemu/memfd.h"
>  #include "exec/memory.h"
>  #include "exec/ioport.h"
>  #include "sysemu/dma.h"
> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>      const bool shared = qemu_ram_is_shared(new_block);
>      RAMBlock *block;
>      RAMBlock *last_block = NULL;
> +    struct MemoryRegion *mr = new_block->mr;
>      ram_addr_t old_ram_size, new_ram_size;
>      Error *err = NULL;
> +    const char *name;
> +    void *addr = 0;
> +    size_t maxlen;
> +    MachineState *ms = MACHINE(qdev_get_machine());
>  
>      old_ram_size = last_ram_page();
>  
>      qemu_mutex_lock_ramlist();
> -    new_block->offset = find_ram_offset(new_block->max_length);
> +    maxlen = new_block->max_length;
> +    new_block->offset = find_ram_offset(maxlen);
>  
>      if (!new_block->host) {
>          if (xen_enabled()) {
> -            xen_ram_alloc(new_block->offset, new_block->max_length,
> -                          new_block->mr, &err);
> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>              if (err) {
>                  error_propagate(errp, err);
>                  qemu_mutex_unlock_ramlist();
>                  return;
>              }
>          } else {
> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
> -                                                  &new_block->mr->align,
> -                                                  shared, noreserve);
> -            if (!new_block->host) {
> +            name = memory_region_name(mr);
> +            if (ms->memfd_alloc) {
> +                Object *parent = &mr->parent_obj;
> +                int mfd = -1;          /* placeholder until next patch */
> +                mr->align = QEMU_VMALLOC_ALIGN;
> +                if (mfd < 0) {
> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
> +                                            0, 0, 0, &err);
> +                    if (mfd < 0) {
> +                        return;
> +                    }
> +                }
> +                qemu_set_cloexec(mfd);
> +                /* The memory backend already set its desired flags. */
> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
> +                    new_block->flags |= RAM_SHARED;
> +                }
> +                addr = file_ram_alloc(new_block, maxlen, mfd,
> +                                      false, false, 0, errp);
> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
> +            } else {
> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
> +                                           shared, noreserve);
> +            }
> +
> +            if (!addr) {
>                  error_setg_errno(errp, errno,
>                                   "cannot set up guest memory '%s'",
> -                                 memory_region_name(new_block->mr));
> +                                 name);
>                  qemu_mutex_unlock_ramlist();
>                  return;
>              }
> -            memory_try_enable_merging(new_block->host, new_block->max_length);
> +            memory_try_enable_merging(addr, maxlen);
> +            new_block->host = addr;
>          }
>      }
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1..ab3648a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>      }
>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>                                obj);
>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
> diff --git a/trace-events b/trace-events
> index a637a61..770a9ac 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>  # accel/tcg/cputlb.c
>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>  
>  # gdbstub.c
>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 436ab63..3606e5c 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>              .type = QEMU_OPT_BOOL,
>              .help = "enable/disable memory merge support",
>          },{
> +            .name = "memfd-alloc",
> +            .type = QEMU_OPT_BOOL,
> +            .help = "enable/disable memfd_create for anonymous memory",
> +        },{
>              .name = "usb",
>              .type = QEMU_OPT_BOOL,
>              .help = "Set on/off to enable/disable usb",


-- 
Thanks,

David / dhildenb


