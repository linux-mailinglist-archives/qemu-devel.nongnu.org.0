Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717923D96F1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:41:22 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qMj-0002gG-Fx
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qKV-00087z-Le
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qKT-0008RZ-EQ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQjKE/Ho/tpYZm6fcKGk88ONU3/5Da3Hxd8TFK+rx+w=;
 b=FS/HvRqO04Dl7J5gLotYfePkkxe53kn2RKeC7Ua9jE97ZxQiB6DWZBT6rJSGGfF3zcUXh9
 ykjQNSIORsJP5ntYqgrffry2+VCH20HfG19C3TlrOT7PU3otxJofqGwt/nAf1t54qy+0rT
 WmgTgc1zFWZ3ByJCI1wJ1liiYzft4gc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-7m4wmw51Pa2gGfb7GGorDg-1; Wed, 28 Jul 2021 16:38:58 -0400
X-MC-Unique: 7m4wmw51Pa2gGfb7GGorDg-1
Received: by mail-il1-f197.google.com with SMTP id
 a2-20020a9266020000b0290222005f354cso1290824ilc.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LQjKE/Ho/tpYZm6fcKGk88ONU3/5Da3Hxd8TFK+rx+w=;
 b=lCYY8z77T60x7zE7stwYoI5nXY7NG09KYHAw2MnKnf/mxB1cZrTf7u0v+24ktfmUdW
 J8cGNlDEUgLNGyJDSOosU1WdOed/S9mij97EA+Kwgs20zCQDbdxIO5qEcUkI+3Um0DYy
 z3SWxNPcimRIsMzo24pBdy+qgQRg5pGFDfvWKp3R4LfM1QdDhWqm5DmJ2qkiy+pVrPCv
 T+hbWJv/uZ3tb7VzrA8gmEsJpFIXeXIPbka1K61+zOh9/l+klCN/q/acbndeDDjkMQNB
 8CrBcHE2t7L6ldJkWA7Uwjaz8ZUw1CgNZq328f1QcuVksX6nmPooxUnv087naZ3ppk7x
 aq8g==
X-Gm-Message-State: AOAM532bC8pddvDZGHHIxiggdtx5a/CZF4qV9IGgBl9BwPIM/dpdNlXa
 bWBG+ndzRPduBpYi6yW1EGD50qY5Ng+fvV9J+1H5UFb/HzVCHQGGcMe24/59C0m37EzoBlGBO0X
 vjoLtz99I35x6hOo=
X-Received: by 2002:a05:6e02:14cc:: with SMTP id
 o12mr1135745ilk.76.1627504737847; 
 Wed, 28 Jul 2021 13:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywiD2XNl86FDXLKhNv8nzT87vjL7uSAkXRqwMRkqeg2ZYbYFOUlSWrGWrOmfFGOd1euMxOKg==
X-Received: by 2002:a05:6e02:14cc:: with SMTP id
 o12mr1135711ilk.76.1627504737495; 
 Wed, 28 Jul 2021 13:38:57 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id q7sm839427iow.12.2021.07.28.13.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:38:57 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:38:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 09/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <20210728203854.algjktwccs2t663w@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-10-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-10-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 11:48:46AM +0800, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 96 +++++++++++++++++++++++++++++++++++++++------
>  hw/i386/pc.c        | 83 +--------------------------------------
>  include/hw/boards.h |  9 +++++
>  3 files changed, 93 insertions(+), 95 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9223ece3ea..76b6c3bc64 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -15,6 +15,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/replay.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "qapi/error.h"
> @@ -744,20 +745,87 @@ void machine_set_cpu_numa_node(MachineState *machine,
>      }
>  }
>  
> +static char *cpu_topology_hierarchy(MachineState *ms)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    SMPCompatProps *smp_props = &mc->smp_props;
> +    char topo_msg[256] = "";
> +
> +    /*
> +     * Topology members should be ordered from the largest to the smallest.
> +     * Concept of sockets/cores/threads is supported by default and will be
> +     * reported in the hierarchy. Unsupported members will not be reported.
> +     */
> +    g_autofree char *sockets_msg = g_strdup_printf(
> +            " * sockets (%u)", ms->smp.sockets);
> +    pstrcat(topo_msg, sizeof(topo_msg), sockets_msg);
> +
> +    if (smp_props->dies_supported) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +                " * dies (%u)", ms->smp.dies);
> +        pstrcat(topo_msg, sizeof(topo_msg), dies_msg);
> +    }
> +
> +    g_autofree char *cores_msg = g_strdup_printf(
> +            " * cores (%u)", ms->smp.cores);
> +    pstrcat(topo_msg, sizeof(topo_msg), cores_msg);
> +
> +    g_autofree char *threads_msg = g_strdup_printf(
> +            " * threads (%u)", ms->smp.threads);
> +    pstrcat(topo_msg, sizeof(topo_msg), threads_msg);
> +
> +    return g_strdup_printf("%s", topo_msg + 3);
> +}
> +
> +/*
> + * smp_parse - Generic function used to parse the given SMP configuration
> + *
> + * A topology parameter must be omitted or specified equal to 1 if it's
> + * not supported by the machine. Concept of sockets/cores/threads is
> + * supported by default. Unsupported members will not be reported in
> + * the cpu topology hierarchy message.
> + *
> + * For compatibility, if omitted the arch-specific members (e.g. dies)
> + * will not be computed, but will directly default to 1 instead. This
> + * logic should also apply to future introduced ones.
> + *
> + * Omitted arch-neutral members, i.e., cpus/sockets/cores/threads/maxcpus
> + * will be computed based on the provided ones. When both maxcpus and cpus
> + * are omitted, maxcpus will be computed from the given parameters and cpus
> + * will be set equal to maxcpus. When only one of maxcpus and cpus is given
> + * then the omitted one will be set to its given counterpart's value.
> + * Both maxcpus and cpus may be specified, but maxcpus must be equal to or
> + * greater than cpus.
> + *
> + * In calculation of omitted sockets/cores/threads, we prefer sockets over
> + * cores over threads before 6.2, while preferring cores over sockets over
> + * threads since 6.2.
> + */
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
> +    unsigned dies    = config->has_dies ? config->dies : 0;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
> -    if (config->has_dies && config->dies > 1) {
> +    /*
> +     * A topology parameter must be omitted or specified equal to 1,
> +     * if the machine's CPU topology doesn't support it.
> +     */
> +    if (!mc->smp_props.dies_supported && dies > 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
>          return;
>      }
>  
> +    /*
> +     * If omitted the arch-specific members will not be computed,
> +     * but will directly default to 1 instead.
> +     */
> +    dies = dies > 0 ? dies : 1;
> +
>      /* compute missing values based on the provided ones */
>      if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
> @@ -796,29 +864,31 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
> +    ms->smp.cpus = cpus;
> +    ms->smp.sockets = sockets;
> +    ms->smp.dies = dies;
> +    ms->smp.cores = cores;
> +    ms->smp.threads = threads;
> +    ms->smp.max_cpus = maxcpus;
> +
> +    /* sanity-check of the computed topology */
>      if (sockets * cores * threads != maxcpus) {
> +        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
>          error_setg(errp, "Invalid CPU topology: "
>                     "product of the hierarchy must match maxcpus: "
> -                   "sockets (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, cores, threads, maxcpus);
> +                   "%s != maxcpus (%u)",
> +                   topo_msg, maxcpus);
>          return;
>      }
>  
>      if (maxcpus < cpus) {
> +        g_autofree char *topo_msg = cpu_topology_hierarchy(ms);
>          error_setg(errp, "Invalid CPU topology: "
>                     "maxcpus must be equal to or greater than smp: "
> -                   "sockets (%u) * cores (%u) * threads (%u) "
> -                   "== maxcpus (%u) < smp_cpus (%u)",
> -                   sockets, cores, threads, maxcpus, cpus);
> +                   "%s == maxcpus (%u) < smp_cpus (%u)",
> +                   topo_msg, maxcpus, cpus);
>          return;
>      }
> -
> -    ms->smp.cpus = cpus;
> -    ms->smp.sockets = sockets;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
> -    ms->smp.max_cpus = maxcpus;
>  }
>  
>  static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 77ab764c5d..ce493a9294 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -711,87 +711,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
>      }
>  }
>  
> -/*
> - * This function is very similar to smp_parse()
> - * in hw/core/machine.c but includes CPU die support.
> - */
> -static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> -{
> -    MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    unsigned cpus    = config->has_cpus ? config->cpus : 0;
> -    unsigned sockets = config->has_sockets ? config->sockets : 0;
> -    unsigned dies    = config->has_dies ? config->dies : 0;
> -    unsigned cores   = config->has_cores ? config->cores : 0;
> -    unsigned threads = config->has_threads ? config->threads : 0;
> -    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> -
> -    /* directly default dies to 1 if it's omitted */
> -    dies = dies > 0 ? dies : 1;
> -
> -    /* compute missing values based on the provided ones */
> -    if (cpus == 0 && maxcpus == 0) {
> -        sockets = sockets > 0 ? sockets : 1;
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -    } else {
> -        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -        if (mc->smp_prefer_sockets) {
> -            /* prefer sockets over cores over threads before 6.2 */
> -            if (sockets == 0) {
> -                cores = cores > 0 ? cores : 1;
> -                threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * cores * threads);
> -            } else if (cores == 0) {
> -                threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * threads);
> -            } else if (threads == 0) {
> -                threads = maxcpus / (sockets * dies * cores);
> -            }
> -        } else {
> -            /* prefer cores over sockets over threads since 6.2 */
> -            if (cores == 0) {
> -                sockets = sockets > 0 ? sockets : 1;
> -                threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * threads);
> -            } else if (sockets == 0) {
> -                threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * cores * threads);
> -            } else if (threads == 0) {
> -                threads = maxcpus / (sockets * dies * cores);
> -            }
> -        }
> -    }
> -
> -    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
> -    cpus = cpus > 0 ? cpus : maxcpus;
> -
> -    if (sockets * cores * threads != maxcpus) {
> -        error_setg(errp, "Invalid CPU topology: "
> -                   "product of the hierarchy must match maxcpus: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, dies, cores, threads, maxcpus);
> -        return;
> -    }
> -
> -    if (maxcpus < cpus) {
> -        error_setg(errp, "Invalid CPU topology: "
> -                   "maxcpus must be equal to or greater than smp: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> -                   "== maxcpus (%u) < smp_cpus (%u)",
> -                   sockets, dies, cores, threads, maxcpus, cpus);
> -        return;
> -    }
> -
> -    ms->smp.cpus = cpus;
> -    ms->smp.sockets = sockets;
> -    ms->smp.dies = dies;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
> -    ms->smp.maxcpus = maxcpus;
> -}
> -
>  static
>  void pc_machine_done(Notifier *notifier, void *data)
>  {
> @@ -1745,7 +1664,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      mc->auto_enable_numa_with_memdev = true;
>      mc->has_hotpluggable_cpus = true;
>      mc->default_boot_order = "cad";
> -    mc->smp_parse = pc_smp_parse;
>      mc->block_default_type = IF_IDE;
>      mc->max_cpus = 255;
>      mc->reset = pc_machine_reset;
> @@ -1756,6 +1674,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug = pc_machine_device_unplug_cb;
>      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>      mc->nvdimm_supported = true;
> +    mc->smp_props.dies_supported = true;
>      mc->default_ram_id = "pc.ram";
>  
>      object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 2a1bba86c0..0631900c08 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -108,6 +108,14 @@ typedef struct {
>      CPUArchId cpus[];
>  } CPUArchIdList;
>  
> +/**
> + * SMPCompatProps:
> + * @dies_supported - whether dies is supported by the machine
> + */
> +typedef struct {
> +    bool dies_supported;
> +} SMPCompatProps;
> +
>  /**
>   * MachineClass:
>   * @deprecation_reason: If set, the machine is marked as deprecated. The
> @@ -248,6 +256,7 @@ struct MachineClass {
>      bool numa_mem_supported;
>      bool auto_enable_numa;
>      bool smp_prefer_sockets;
> +    SMPCompatProps smp_props;
>      const char *default_ram_id;
>  
>      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> -- 
> 2.19.1
>

What about putting smp_prefer_sockets in SMPCompatProps too (as
prefer_sockets)?

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>


