Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3793B518
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 14:33:04 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haJTy-000553-M0
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 08:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1haJSR-0004Wg-Ux
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1haJSQ-0006Hu-MU
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:31:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1haJSO-0006GI-Ld
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:31:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9F224128B5
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 12:31:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 919792F299;
 Mon, 10 Jun 2019 12:31:13 +0000 (UTC)
Date: Mon, 10 Jun 2019 14:31:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190610143109.10c4979b@redhat.com>
In-Reply-To: <87h8915m7u.fsf@dusky.pond.sub.org>
References: <1559205199-233510-1-git-send-email-imammedo@redhat.com>
 <1559205199-233510-2-git-send-email-imammedo@redhat.com>
 <87h8915m7u.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 10 Jun 2019 12:31:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 1/3] machine: show if CLI option '-numa
 node, mem' is supported in QAPI schema
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 07 Jun 2019 19:39:17 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > Legacy '-numa node,mem' option has a number of issues and mgmt often
> > defaults to it. Unfortunately it's no possible to replace it with
> > an alternative '-numa memdev' without breaking migration compatibility.
> > What's possible though is to deprecate it, keeping option working with
> > old machine types only.
> >
> > In order to help users to find out if being deprecated CLI option
> > '-numa node,mem' is still supported by particular machine type, add new
> > "numa-mem-supported" property to MachineInfo description in QAPI schema.  
> 
> Suggest s/to MachineInfo description in QAPI schema/to output of
> query-machines/, because query-machines is the external interface people
> know.

fixed

> 
> > "numa-mem-supported" is set to 'true' for machines that currently support
> > NUMA, but it will be flipped to 'false' later on, once deprecation period
> > expires and kept 'true' only for old machine types that used to support
> > the legacy option so it won't break existing configuration that are using
> > it.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >
> > Notes:
> >     v4:
> >       * drop idea to use "qom-list-properties" and use MachineInfo instead
> >         which could be inspected with 'query-machines'
> >
> >  include/hw/boards.h | 3 +++
> >  hw/arm/virt.c       | 1 +
> >  hw/i386/pc.c        | 1 +
> >  hw/ppc/spapr.c      | 1 +
> >  qapi/misc.json      | 5 ++++-
> >  vl.c                | 1 +
> >  6 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 6f7916f..86894b6 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -158,6 +158,8 @@ typedef struct {
> >   * @kvm_type:
> >   *    Return the type of KVM corresponding to the kvm-type string option or
> >   *    computed based on other criteria such as the host kernel capabilities.
> > + * @numa_mem_supported:
> > + *    true if '--numa node.mem' option is supported and false otherwise
> >   */
> >  struct MachineClass {
> >      /*< private >*/
> > @@ -210,6 +212,7 @@ struct MachineClass {
> >      bool ignore_boot_device_suffixes;
> >      bool smbus_no_migration_support;
> >      bool nvdimm_supported;
> > +    bool numa_mem_supported;
> >  
> >      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> >                                             DeviceState *dev);
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index bf54f10..481a603 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1943,6 +1943,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >      assert(!mc->get_hotplug_handler);
> >      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> >      hc->plug = virt_machine_device_plug_cb;
> > +    mc->numa_mem_supported = true;
> >  }
> >  
> >  static void virt_instance_init(Object *obj)
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 2632b73..05b8368 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -2747,6 +2747,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
> >      nc->nmi_monitor_handler = x86_nmi;
> >      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
> >      mc->nvdimm_supported = true;
> > +    mc->numa_mem_supported = true;
> >  
> >      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
> >          pc_machine_get_device_memory_region_size, NULL,
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 2ef3ce4..265ecfb 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4336,6 +4336,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> >       * in which LMBs are represented and hot-added
> >       */
> >      mc->numa_mem_align_shift = 28;
> > +    mc->numa_mem_supported = true;
> >  
> >      smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
> >      smc->default_caps.caps[SPAPR_CAP_VSX] = SPAPR_CAP_ON;  
> 
> This is correct when the TYPE_VIRT_MACHINE, TYPE_PC_MACHINE and
> TYPE_SPAPR_MACHINE are exactly the machines supporting NUMA.  How could
> I check that?

We don't have an interface to communicate that to users as far as I know.

Eduardo pointed out to the patch that might serve as starting point for it though.

> 
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 8b3ca4f..d0bdccb 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -2018,12 +2018,15 @@
> >  #
> >  # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
> >  #
> > +# @numa-mem-supported: true if '-numa node,mem' option is supported by machine
> > +#                      type and false otherwise (since 4.1)  
> 
> 
> "by the machine type", for consistency with @cpu-max.  Also, rather long
> line.

fixed

> 
> > +#
> >  # Since: 1.2.0
> >  ##
> >  { 'struct': 'MachineInfo',
> >    'data': { 'name': 'str', '*alias': 'str',
> >              '*is-default': 'bool', 'cpu-max': 'int',
> > -            'hotpluggable-cpus': 'bool'} }
> > +            'hotpluggable-cpus': 'bool', 'numa-mem-supported': 'bool'} }
> >  
> >  ##
> >  # @query-machines:
> > diff --git a/vl.c b/vl.c
> > index 5550bd7..5bf17f5 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -1520,6 +1520,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
> >          info->name = g_strdup(mc->name);
> >          info->cpu_max = !mc->max_cpus ? 1 : mc->max_cpus;
> >          info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
> > +        info->numa_mem_supported = mc->numa_mem_supported;
> >  
> >          entry = g_malloc0(sizeof(*entry));
> >          entry->value = info;  


