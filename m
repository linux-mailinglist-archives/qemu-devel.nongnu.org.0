Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D44BB402
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:17:33 +0100 (CET)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKySJ-0006Dz-Sg
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1nKyPA-00058w-RW
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:14:19 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:57046
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1nKyP6-0008KZ-U7
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:14:15 -0500
HMM_SOURCE_IP: 172.18.0.48:39740.1530309072
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 3463B280118;
 Fri, 18 Feb 2022 16:05:41 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 147c8ab0bf0d457d909d78a8d3c62a80 for
 steven.sistare@oracle.com; Fri, 18 Feb 2022 16:05:53 CST
X-Transaction-ID: 147c8ab0bf0d457d909d78a8d3c62a80
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <dba8f271d8e79b6748384124a561612d9260a8f2.camel@chinatelecom.cn>
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
From: Guoyi Tu <tugy@chinatelecom.cn>
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org, 
 tugy@chinatelecom.cn
Date: Fri, 18 Feb 2022 16:05:34 +0800
In-Reply-To: <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.223; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-12-22 at 11:05 -0800, Steve Sistare wrote:
> Allocate anonymous memory using memfd_create if the memfd-alloc
> machine
> option is set.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/core/machine.c   | 19 +++++++++++++++++++
>  include/hw/boards.h |  1 +
>  qemu-options.hx     |  6 ++++++
>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++-----
> ----
>  softmmu/vl.c        |  1 +
>  trace-events        |  1 +
>  util/qemu-config.c  |  4 ++++
>  7 files changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 53a99ab..7739d88 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj,
> bool value, Error **errp)
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
> +static void machine_set_memfd_alloc(Object *obj, bool value, Error
> **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->memfd_alloc = value;
> +}
> +
>  static bool machine_get_usb(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc,
> void *data)
>      object_class_property_set_description(oc, "mem-merge",
>          "Enable/disable memory merge support");
>  
> +    object_class_property_add_bool(oc, "memfd-alloc",
> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> +    object_class_property_set_description(oc, "memfd-alloc",
> +        "Enable/disable allocating anonymous memory using
> memfd_create");
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
>      "                vmport=on|off|auto controls emulation of vmport
> (default: auto)\n"
>      "                dump-guest-core=on|off include guest memory in
> a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support
> (default: on)\n"
> +    "                memfd-alloc=on|off controls allocating
> anonymous guest RAM using memfd_create (default: off)\n"
>      "                aes-key-wrap=on|off controls support for AES
> key wrapping (default=on)\n"
>      "                dea-key-wrap=on|off controls support for DEA
> key wrapping (default=on)\n"
>      "                suppress-vmdesc=on|off disables self-describing 
> migration (default=off)\n"
> @@ -76,6 +77,11 @@ SRST
>          supported by the host, de-duplicates identical memory pages
>          among VMs instances (enabled by default).
>  
> +    ``memfd-alloc=on|off``
> +        Enables or disables allocation of anonymous guest RAM using
> +        memfd_create.  Any associated memory-backend objects are
> created with
> +        share=on.  The memfd-alloc default is off.
> +
>      ``aes-key-wrap=on|off``
>          Enables or disables AES key wrapping support on s390-ccw
> hosts.
>          This feature controls whether AES wrapping keys will be
> created
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
> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock
> *new_block, Error **errp)
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
> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr,
> &err);
>              if (err) {
>                  error_propagate(errp, err);
>                  qemu_mutex_unlock_ramlist();
>                  return;
>              }
>          } else {
> -            new_block->host = qemu_anon_ram_alloc(new_block-
> >max_length,
> -                                                  &new_block->mr-
> >align,
> -                                                  shared,
> noreserve);
> -            if (!new_block->host) {
> +            name = memory_region_name(mr);
> +            if (ms->memfd_alloc) {
> +                Object *parent = &mr->parent_obj;
> +                int mfd = -1;          /* placeholder until next
> patch */
> +                mr->align = QEMU_VMALLOC_ALIGN;
> +                if (mfd < 0) {
> +                    mfd = qemu_memfd_create(name, maxlen + mr-
> >align,
> +                                            0, 0, 0, &err);
> +                    if (mfd < 0) {

the error message should be propagated

--
Guoyi Tu

> +                        return;
> +                    }
> +                }
> +                qemu_set_cloexec(mfd);
> +                /* The memory backend already set its desired flags.
> */
> +                if (!object_dynamic_cast(parent,
> TYPE_MEMORY_BACKEND)) {
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
> -            memory_try_enable_merging(new_block->host, new_block-
> >max_length);
> +            memory_try_enable_merging(addr, maxlen);
> +            new_block->host = addr;
>          }
>      }
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1..ab3648a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState
> *ms, const char *path)
>          object_property_set_str(obj, "mem-path", path,
> &error_fatal);
>      }
>      object_property_set_int(obj, "size", ms->ram_size,
> &error_fatal);
> +    object_property_set_bool(obj, "share", ms->memfd_alloc,
> &error_fatal);
>      object_property_add_child(object_get_objects_root(), mc-
> >default_ram_id,
>                                obj);
>      /* Ensure backend's memory region name is equal to mc-
> >default_ram_id */
> diff --git a/trace-events b/trace-events
> index a637a61..770a9ac 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void
> *hva, size_t length, bool need_
>  # accel/tcg/cputlb.c
>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr,
> unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd)
> "%s size %zu ptr %p fd %d"
>  
>  # gdbstub.c
>  gdbstub_op_start(const char *device) "Starting gdbstub using device
> %s"
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
> +            .help = "enable/disable memfd_create for anonymous
> memory",
> +        },{
>              .name = "usb",
>              .type = QEMU_OPT_BOOL,
>              .help = "Set on/off to enable/disable usb",
-- 
Guoyi Tu <tugy@chinatelecom.cn>


