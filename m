Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF3C3CE80C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:21:44 +0200 (CEST)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Wxc-00037M-22
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WwD-0002MY-5M
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WwA-0007IP-SX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HyG6TnPtrJfQx5ADSRYmDmfQiQJRjlY5m2UV44BpIEE=;
 b=Touy4EaJAMR9TYooMwal8QaieWROP2exzdS1DK8ynvDFGnrXIU6q4UIYnEdGTBmvOsfHoj
 4Hs+Iq+G/a6km9Y7Qco0DrUebQrztzaN7VwY1JryidWw+YLg9njrr1CqsVnGjGlTsZjAV+
 szyDl4CMw+ejdGwNR486Kt5FLShg9VM=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-BVgWUqW2O7u2d8J8qj9vSw-1; Mon, 19 Jul 2021 13:20:13 -0400
X-MC-Unique: BVgWUqW2O7u2d8J8qj9vSw-1
Received: by mail-io1-f72.google.com with SMTP id
 m14-20020a5d898e0000b02904f7957d92b5so13028441iol.21
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 10:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HyG6TnPtrJfQx5ADSRYmDmfQiQJRjlY5m2UV44BpIEE=;
 b=QU1u0dQt+osVzZCHDCM8h7BDIPg0TqSLKdS04Bu2pvKzxq9K3kyBHNbOjwp6Q+Cruj
 lS6+WjM0CEvxbvgAhh3B72Wevweu1WzrfyLrC02JPv8D/a9TMh+vNYR3qHxGZeeJcHA+
 oU8QN5g/za7YYHc3iCEoIuPuV1cqJaGdbTKFYxGcDVfG2TGhYwnTod3QHCp0hkMJDkPl
 bVZzfXMZbDLsXmc141z89/xmqZHYxuDrQ0ITBYJvcJJ1AXFINh7CzepyH9f9RhPKDg2M
 N+m/7FiYM40yJMCoDfK2kMYa8AMzJc6QuVyzOrlXXKhnm99VTMW+pQTl9bmxZR1O3r5F
 ljLw==
X-Gm-Message-State: AOAM532xNZu8+7tmvBu+BybCxWpIvYkPJ7lTFA/y5C5k0JQ5+08YxDxK
 kNZ/OVpeJEhdafrZZ3Xm2Oh8HAoheqyevIbCOkqlrLtvgeKJQd6noRgZa2LhKAcv+4OHokLUsZm
 5NkY30n1PoTw5lYI=
X-Received: by 2002:a05:6638:24c3:: with SMTP id
 y3mr22713984jat.10.1626715212418; 
 Mon, 19 Jul 2021 10:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4yXmemwufkvOyRTUx2z/R6SSEr0jVp4VeAnYclAlNoJYG5aGunpWi8BT/AinJ5JNFK8WBXw==
X-Received: by 2002:a05:6638:24c3:: with SMTP id
 y3mr22713960jat.10.1626715212127; 
 Mon, 19 Jul 2021 10:20:12 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id l15sm8592317ilq.33.2021.07.19.10.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:20:11 -0700 (PDT)
Date: Mon, 19 Jul 2021 19:20:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 10/11] machine: Split out the smp parsing code
Message-ID: <20210719172009.yujvlk4mu2xcl25g@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-11-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-11-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:42AM +0800, Yanan Wang wrote:
> We are going to introduce an unit test for the parser smp_parse()
> in hw/core/machine.c, but now machine.c is only built in softmmu.
> 
> In order to solve the build dependency on the smp parsing code and
> avoid building unrelated stuff for the unit tests, move the related
> code from machine.c into a new common file, i.e., machine-smp.c.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS           |   1 +
>  hw/core/machine-smp.c | 124 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     | 109 -------------------------------------
>  hw/core/meson.build   |   1 +
>  include/hw/boards.h   |   1 +
>  5 files changed, 127 insertions(+), 109 deletions(-)
>  create mode 100644 hw/core/machine-smp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9100f9a043..70633e3bf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1626,6 +1626,7 @@ F: cpu.c
>  F: hw/core/cpu.c
>  F: hw/core/machine-qmp-cmds.c
>  F: hw/core/machine.c
> +F: hw/core/machine-smp.c
>  F: hw/core/null-machine.c
>  F: hw/core/numa.c
>  F: hw/cpu/cluster.c
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> new file mode 100644
> index 0000000000..6a00cfe44a
> --- /dev/null
> +++ b/hw/core/machine-smp.c
> @@ -0,0 +1,124 @@
> +/*
> + * QEMU Machine (related to SMP configuration)
> + *
> + * Copyright (C) 2014 Red Hat Inc
> + *
> + * Authors:
> + *   Marcel Apfelbaum <marcel.a@redhat.com>

This header was obviously copy+pasted without being updated.

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/boards.h"
> +#include "qapi/error.h"
> +
> +/*
> + * smp_parse - Generic function used to parse the given SMP configuration
> + *
> + * The topology parameters must be specified equal to or great than one
> + * or just omitted, explicit configuration like "cpus=0" is not allowed.
> + * The omitted parameters will be calculated based on the provided ones.
> + *
> + * maxcpus will default to the value of cpus if omitted and will be used
> + * to compute the missing sockets/cores/threads. cpus will be calculated
> + * from the computed parametrs if omitted.
> + *
> + * In calculation of omitted arch-netural sockets/cores/threads, we prefer
> + * sockets over cores over threads before 6.2, while prefer cores over
> + * sockets over threads since 6.2 on. The arch-specific dies will directly
> + * default to 1 if omitted.
> + */
> +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    unsigned cpus    = config->has_cpus ? config->cpus : 0;
> +    unsigned sockets = config->has_sockets ? config->sockets : 0;
> +    unsigned dies    = config->has_dies ? config->dies : 1;
> +    unsigned cores   = config->has_cores ? config->cores : 0;
> +    unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "parameters must be equal to or greater than one"
> +                   "if provided");
> +        return;
> +    }
> +
> +    if (!mc->smp_dies_supported && dies > 1) {
> +        error_setg(errp, "dies not supported by this machine's CPU topology");
> +        return;
> +    }
> +
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    /* prefer sockets over cores over threads before 6.2 */
> +    if (mc->smp_prefer_sockets) {
> +        if (sockets == 0) {
> +            cores = cores > 0 ? cores : 1;
> +            threads = threads > 0 ? threads : 1;
> +            sockets = maxcpus / (dies * cores * threads);
> +            sockets = sockets > 0 ? sockets : 1;
> +        } else if (cores == 0) {
> +            threads = threads > 0 ? threads : 1;
> +            cores = maxcpus / (sockets * dies * threads);
> +            cores = cores > 0 ? cores : 1;
> +        } else if (threads == 0) {
> +            threads = maxcpus / (sockets * dies * cores);
> +            threads = threads > 0 ? threads : 1;
> +        }
> +    /* prefer cores over sockets over threads since 6.2 */
> +    } else {
> +        if (cores == 0) {
> +            sockets = sockets > 0 ? sockets : 1;
> +            threads = threads > 0 ? threads : 1;
> +            cores = maxcpus / (sockets * dies * threads);
> +            cores = cores > 0 ? cores : 1;
> +        } else if (sockets == 0) {
> +            threads = threads > 0 ? threads : 1;
> +            sockets = maxcpus / (dies * cores * threads);
> +            sockets = sockets > 0 ? sockets : 1;
> +        } else if (threads == 0) {
> +            threads = maxcpus / (sockets * dies * cores);
> +            threads = threads > 0 ? threads : 1;
> +        }
> +    }
> +
> +    /* use the computed parameters to calculate the omitted cpus */
> +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    if (sockets * dies * cores * threads != maxcpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, dies_msg, cores, threads,
> +                   maxcpus);
> +        return;
> +    }
> +
> +    if (sockets * dies * cores * threads < cpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> +                   "smp_cpus (%u)",
> +                   sockets, dies_msg, cores, threads, cpus);
> +        return;
> +    }
> +
> +    ms->smp.cpus = cpus;
> +    ms->smp.sockets = sockets;
> +    ms->smp.dies = dies;
> +    ms->smp.cores = cores;
> +    ms->smp.threads = threads;
> +    ms->smp.max_cpus = maxcpus;
> +}
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9d24b67ef3..61be266b6c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -744,115 +744,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
>      }
>  }
>  
> -/*
> - * smp_parse - Generic function used to parse the given SMP configuration
> - *
> - * The topology parameters must be specified equal to or great than one
> - * or just omitted, explicit configuration like "cpus=0" is not allowed.
> - * The omitted parameters will be calculated based on the provided ones.
> - *
> - * maxcpus will default to the value of cpus if omitted and will be used
> - * to compute the missing sockets/cores/threads. cpus will be calculated
> - * from the computed parametrs if omitted.
> - *
> - * In calculation of omitted arch-netural sockets/cores/threads, we prefer
> - * sockets over cores over threads before 6.2, while prefer cores over
> - * sockets over threads since 6.2 on. The arch-specific dies will directly
> - * default to 1 if omitted.
> - */
> -static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> -{
> -    MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    unsigned cpus    = config->has_cpus ? config->cpus : 0;
> -    unsigned sockets = config->has_sockets ? config->sockets : 0;
> -    unsigned dies    = config->has_dies ? config->dies : 1;
> -    unsigned cores   = config->has_cores ? config->cores : 0;
> -    unsigned threads = config->has_threads ? config->threads : 0;
> -    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> -
> -    if ((config->has_cpus && config->cpus == 0) ||
> -        (config->has_sockets && config->sockets == 0) ||
> -        (config->has_dies && config->dies == 0) ||
> -        (config->has_cores && config->cores == 0) ||
> -        (config->has_threads && config->threads == 0) ||
> -        (config->has_maxcpus && config->maxcpus == 0)) {
> -        error_setg(errp, "parameters must be equal to or greater than one"
> -                   "if provided");
> -        return;
> -    }
> -
> -    if (!mc->smp_dies_supported && dies > 1) {
> -        error_setg(errp, "dies not supported by this machine's CPU topology");
> -        return;
> -    }
> -
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -    /* prefer sockets over cores over threads before 6.2 */
> -    if (mc->smp_prefer_sockets) {
> -        if (sockets == 0) {
> -            cores = cores > 0 ? cores : 1;
> -            threads = threads > 0 ? threads : 1;
> -            sockets = maxcpus / (dies * cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        } else if (cores == 0) {
> -            threads = threads > 0 ? threads : 1;
> -            cores = maxcpus / (sockets * dies * threads);
> -            cores = cores > 0 ? cores : 1;
> -        } else if (threads == 0) {
> -            threads = maxcpus / (sockets * dies * cores);
> -            threads = threads > 0 ? threads : 1;
> -        }
> -    /* prefer cores over sockets over threads since 6.2 */
> -    } else {
> -        if (cores == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            threads = threads > 0 ? threads : 1;
> -            cores = maxcpus / (sockets * dies * threads);
> -            cores = cores > 0 ? cores : 1;
> -        } else if (sockets == 0) {
> -            threads = threads > 0 ? threads : 1;
> -            sockets = maxcpus / (dies * cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        } else if (threads == 0) {
> -            threads = maxcpus / (sockets * dies * cores);
> -            threads = threads > 0 ? threads : 1;
> -        }
> -    }
> -
> -    /* use the computed parameters to calculate the omitted cpus */
> -    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -    if (sockets * dies * cores * threads != maxcpus) {
> -        g_autofree char *dies_msg = g_strdup_printf(
> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> -        error_setg(errp, "Invalid CPU topology: "
> -                   "sockets (%u)%s * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, dies_msg, cores, threads,
> -                   maxcpus);
> -        return;
> -    }
> -
> -    if (sockets * dies * cores * threads < cpus) {
> -        g_autofree char *dies_msg = g_strdup_printf(
> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> -        error_setg(errp, "Invalid CPU topology: "
> -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, dies_msg, cores, threads, cpus);
> -        return;
> -    }
> -
> -    ms->smp.cpus = cpus;
> -    ms->smp.sockets = sockets;
> -    ms->smp.dies = dies;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
> -    ms->smp.max_cpus = maxcpus;
> -}
> -
>  static void machine_get_smp(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>  {
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 18f44fb7c2..6d727c7742 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -14,6 +14,7 @@ hwcore_files = files(
>  )
>  
>  common_ss.add(files('cpu-common.c'))
> +common_ss.add(files('machine-smp.c'))
>  common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>  common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
>  common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 12ab0f5968..071eec1e74 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -34,6 +34,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
>  void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
>                                 Error **errp);
> +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
>  
>  /**
>   * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> -- 
> 2.19.1
>

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>


