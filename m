Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2F3D2458
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:08:59 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YRe-0007Sy-0l
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6YQm-0006l8-LJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6YQi-0003MZ-1O
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626959278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gu15QcABlQ1gMVUoT7FnqmLY73uWsJ49wq7lEW0O73Y=;
 b=Gg0sliCkq72PLycqu/2VmrpPdRSKVjWZpMJ3ZZh4bLrbDqXY3kMCKyqEKkC5QcUjYrhbWx
 OinpzRz9/kcvN4ujfoMl6jGMQNS7oZhudplYx4PI1CAZxQy0WJ3G/RaCSDq9zRR8GhOR9N
 pLRdqneUlaKRs1jxxLvNyYN22o3QTng=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-G_DZ3czJPI-gdM4bW6RA-g-1; Thu, 22 Jul 2021 09:07:57 -0400
X-MC-Unique: G_DZ3czJPI-gdM4bW6RA-g-1
Received: by mail-il1-f199.google.com with SMTP id
 f5-20020a92b5050000b02901ff388acf98so3546171ile.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gu15QcABlQ1gMVUoT7FnqmLY73uWsJ49wq7lEW0O73Y=;
 b=rxfOLw7LmiEMghA57s/HpSjxuBdQQr4hMq2JEqQpvNUxCJfX+m9TbUn3hyMGuRE112
 gt11Ymszfx7T9e2y/l4vFoPB/kf8NQPGEsqYgKXLq38JJh+/SndFCTG4qQRASn4YD18J
 G+HcCgzZAWhBDEFQ1xxB/drVPuR75B7HLWh7boHcZhUT63SMU8DySmefD4Ofok36loSv
 bq7hcJXIflp2AUQAXKZIOMS9PuLrBGsKFJa/lHfglpTOypffRMUivUOGt66g429FEJ5J
 vPjxuVD5vHCsz5r/qRRuRQfcgDhZ2o9C+YINZKkg9eevnxpO5zW8DA96rf9IcY1fjubD
 czwA==
X-Gm-Message-State: AOAM531GsDy3UcBgie+IzyaTgfRroaHCx1MWBLO3GlTuJX9T3Y9vaD3L
 LTR5+AtERTUGH+/4e+PsDPNVXJogFXhC7dgEMCIM+g6segwkTXdoEHaJq7HVoA3SARltQ8GoM3p
 wyVM64QZ8U5RRAn8=
X-Received: by 2002:a02:cf31:: with SMTP id s17mr36111225jar.46.1626959276515; 
 Thu, 22 Jul 2021 06:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9YN/M5EmaCiiRlNW6BTHl0epDq/glcSW5WsrXM7n+YJdRTjx/Fjopw2QQCL7hxROEQi+cww==
X-Received: by 2002:a02:cf31:: with SMTP id s17mr36111186jar.46.1626959276127; 
 Thu, 22 Jul 2021 06:07:56 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id u13sm15425679iot.29.2021.07.22.06.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 06:07:54 -0700 (PDT)
Date: Thu, 22 Jul 2021 15:07:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 10/11] machine: Split out the smp parsing code
Message-ID: <20210722130752.6yl64tkfmtl4ruq6@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-11-wangyanan55@huawei.com>
 <20210719172009.yujvlk4mu2xcl25g@gator>
 <d040bdbf-47f5-da25-9aae-8285530a0948@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d040bdbf-47f5-da25-9aae-8285530a0948@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 02:24:03PM +0800, wangyanan (Y) wrote:
> On 2021/7/20 1:20, Andrew Jones wrote:
> > On Mon, Jul 19, 2021 at 11:20:42AM +0800, Yanan Wang wrote:
> > > We are going to introduce an unit test for the parser smp_parse()
> > > in hw/core/machine.c, but now machine.c is only built in softmmu.
> > > 
> > > In order to solve the build dependency on the smp parsing code and
> > > avoid building unrelated stuff for the unit tests, move the related
> > > code from machine.c into a new common file, i.e., machine-smp.c.
> > > 
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   MAINTAINERS           |   1 +
> > >   hw/core/machine-smp.c | 124 ++++++++++++++++++++++++++++++++++++++++++
> > >   hw/core/machine.c     | 109 -------------------------------------
> > >   hw/core/meson.build   |   1 +
> > >   include/hw/boards.h   |   1 +
> > >   5 files changed, 127 insertions(+), 109 deletions(-)
> > >   create mode 100644 hw/core/machine-smp.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 9100f9a043..70633e3bf4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1626,6 +1626,7 @@ F: cpu.c
> > >   F: hw/core/cpu.c
> > >   F: hw/core/machine-qmp-cmds.c
> > >   F: hw/core/machine.c
> > > +F: hw/core/machine-smp.c

I just noticed that the spacing in this change might not be right.

> > >   F: hw/core/null-machine.c
> > >   F: hw/core/numa.c
> > >   F: hw/cpu/cluster.c
> > > diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> > > new file mode 100644
> > > index 0000000000..6a00cfe44a
> > > --- /dev/null
> > > +++ b/hw/core/machine-smp.c
> > > @@ -0,0 +1,124 @@
> > > +/*
> > > + * QEMU Machine (related to SMP configuration)
> > > + *
> > > + * Copyright (C) 2014 Red Hat Inc
> > > + *
> > > + * Authors:
> > > + *   Marcel Apfelbaum <marcel.a@redhat.com>
> > This header was obviously copy+pasted without being updated.
> Yes, the header was kept unchanged.
> 
> But actually I'm not completely sure which field should be updated. :)
> Should I add "Copyright (C) 2021, Huawei, Inc." and also the authorship
> "Yanan Wang <wangyanan55@huawei.com>" behind the existing ones
> or just replace them?

I see what you were attempting to do now. You were deriving this new work
(a source file) from an existing work and you wanted to preserve the
original copyright and authorship. It's not so simple with these types of
projects though. In this case, smp_parse wasn't even part of the original
machine.c file (it came over with commit 6f479566a87d). I think it's
pretty common for these projects to just put whatever your preferred
(or your employer's preferred) copyright/authorship on new files. So, I'd
just replace the fields.

I'm interested in what others have to say about this though.

Thanks,
drew


> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "hw/boards.h"
> > > +#include "qapi/error.h"
> > > +
> > > +/*
> > > + * smp_parse - Generic function used to parse the given SMP configuration
> > > + *
> > > + * The topology parameters must be specified equal to or great than one
> > > + * or just omitted, explicit configuration like "cpus=0" is not allowed.
> > > + * The omitted parameters will be calculated based on the provided ones.
> > > + *
> > > + * maxcpus will default to the value of cpus if omitted and will be used
> > > + * to compute the missing sockets/cores/threads. cpus will be calculated
> > > + * from the computed parametrs if omitted.
> > > + *
> > > + * In calculation of omitted arch-netural sockets/cores/threads, we prefer
> > > + * sockets over cores over threads before 6.2, while prefer cores over
> > > + * sockets over threads since 6.2 on. The arch-specific dies will directly
> > > + * default to 1 if omitted.
> > > + */
> > > +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > > +{
> > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > +    unsigned cpus    = config->has_cpus ? config->cpus : 0;
> > > +    unsigned sockets = config->has_sockets ? config->sockets : 0;
> > > +    unsigned dies    = config->has_dies ? config->dies : 1;
> > > +    unsigned cores   = config->has_cores ? config->cores : 0;
> > > +    unsigned threads = config->has_threads ? config->threads : 0;
> > > +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> > > +
> > > +    if ((config->has_cpus && config->cpus == 0) ||
> > > +        (config->has_sockets && config->sockets == 0) ||
> > > +        (config->has_dies && config->dies == 0) ||
> > > +        (config->has_cores && config->cores == 0) ||
> > > +        (config->has_threads && config->threads == 0) ||
> > > +        (config->has_maxcpus && config->maxcpus == 0)) {
> > > +        error_setg(errp, "parameters must be equal to or greater than one"
> > > +                   "if provided");
> > > +        return;
> > > +    }
> > > +
> > > +    if (!mc->smp_dies_supported && dies > 1) {
> > > +        error_setg(errp, "dies not supported by this machine's CPU topology");
> > > +        return;
> > > +    }
> > > +
> > > +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > +
> > > +    /* prefer sockets over cores over threads before 6.2 */
> > > +    if (mc->smp_prefer_sockets) {
> > > +        if (sockets == 0) {
> > > +            cores = cores > 0 ? cores : 1;
> > > +            threads = threads > 0 ? threads : 1;
> > > +            sockets = maxcpus / (dies * cores * threads);
> > > +            sockets = sockets > 0 ? sockets : 1;
> > > +        } else if (cores == 0) {
> > > +            threads = threads > 0 ? threads : 1;
> > > +            cores = maxcpus / (sockets * dies * threads);
> > > +            cores = cores > 0 ? cores : 1;
> > > +        } else if (threads == 0) {
> > > +            threads = maxcpus / (sockets * dies * cores);
> > > +            threads = threads > 0 ? threads : 1;
> > > +        }
> > > +    /* prefer cores over sockets over threads since 6.2 */
> > > +    } else {
> > > +        if (cores == 0) {
> > > +            sockets = sockets > 0 ? sockets : 1;
> > > +            threads = threads > 0 ? threads : 1;
> > > +            cores = maxcpus / (sockets * dies * threads);
> > > +            cores = cores > 0 ? cores : 1;
> > > +        } else if (sockets == 0) {
> > > +            threads = threads > 0 ? threads : 1;
> > > +            sockets = maxcpus / (dies * cores * threads);
> > > +            sockets = sockets > 0 ? sockets : 1;
> > > +        } else if (threads == 0) {
> > > +            threads = maxcpus / (sockets * dies * cores);
> > > +            threads = threads > 0 ? threads : 1;
> > > +        }
> > > +    }
> > > +
> > > +    /* use the computed parameters to calculate the omitted cpus */
> > > +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> > > +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > +
> > > +    if (sockets * dies * cores * threads != maxcpus) {
> > > +        g_autofree char *dies_msg = g_strdup_printf(
> > > +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > +        error_setg(errp, "Invalid CPU topology: "
> > > +                   "sockets (%u)%s * cores (%u) * threads (%u) "
> > > +                   "!= maxcpus (%u)",
> > > +                   sockets, dies_msg, cores, threads,
> > > +                   maxcpus);
> > > +        return;
> > > +    }
> > > +
> > > +    if (sockets * dies * cores * threads < cpus) {
> > > +        g_autofree char *dies_msg = g_strdup_printf(
> > > +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > +        error_setg(errp, "Invalid CPU topology: "
> > > +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> > > +                   "smp_cpus (%u)",
> > > +                   sockets, dies_msg, cores, threads, cpus);
> > > +        return;
> > > +    }
> > > +
> > > +    ms->smp.cpus = cpus;
> > > +    ms->smp.sockets = sockets;
> > > +    ms->smp.dies = dies;
> > > +    ms->smp.cores = cores;
> > > +    ms->smp.threads = threads;
> > > +    ms->smp.max_cpus = maxcpus;
> > > +}
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 9d24b67ef3..61be266b6c 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -744,115 +744,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
> > >       }
> > >   }
> > > -/*
> > > - * smp_parse - Generic function used to parse the given SMP configuration
> > > - *
> > > - * The topology parameters must be specified equal to or great than one
> > > - * or just omitted, explicit configuration like "cpus=0" is not allowed.
> > > - * The omitted parameters will be calculated based on the provided ones.
> > > - *
> > > - * maxcpus will default to the value of cpus if omitted and will be used
> > > - * to compute the missing sockets/cores/threads. cpus will be calculated
> > > - * from the computed parametrs if omitted.
> > > - *
> > > - * In calculation of omitted arch-netural sockets/cores/threads, we prefer
> > > - * sockets over cores over threads before 6.2, while prefer cores over
> > > - * sockets over threads since 6.2 on. The arch-specific dies will directly
> > > - * default to 1 if omitted.
> > > - */
> > > -static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > > -{
> > > -    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > -    unsigned cpus    = config->has_cpus ? config->cpus : 0;
> > > -    unsigned sockets = config->has_sockets ? config->sockets : 0;
> > > -    unsigned dies    = config->has_dies ? config->dies : 1;
> > > -    unsigned cores   = config->has_cores ? config->cores : 0;
> > > -    unsigned threads = config->has_threads ? config->threads : 0;
> > > -    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> > > -
> > > -    if ((config->has_cpus && config->cpus == 0) ||
> > > -        (config->has_sockets && config->sockets == 0) ||
> > > -        (config->has_dies && config->dies == 0) ||
> > > -        (config->has_cores && config->cores == 0) ||
> > > -        (config->has_threads && config->threads == 0) ||
> > > -        (config->has_maxcpus && config->maxcpus == 0)) {
> > > -        error_setg(errp, "parameters must be equal to or greater than one"
> > > -                   "if provided");
> > > -        return;
> > > -    }
> > > -
> > > -    if (!mc->smp_dies_supported && dies > 1) {
> > > -        error_setg(errp, "dies not supported by this machine's CPU topology");
> > > -        return;
> > > -    }
> > > -
> > > -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -
> > > -    /* prefer sockets over cores over threads before 6.2 */
> > > -    if (mc->smp_prefer_sockets) {
> > > -        if (sockets == 0) {
> > > -            cores = cores > 0 ? cores : 1;
> > > -            threads = threads > 0 ? threads : 1;
> > > -            sockets = maxcpus / (dies * cores * threads);
> > > -            sockets = sockets > 0 ? sockets : 1;
> > > -        } else if (cores == 0) {
> > > -            threads = threads > 0 ? threads : 1;
> > > -            cores = maxcpus / (sockets * dies * threads);
> > > -            cores = cores > 0 ? cores : 1;
> > > -        } else if (threads == 0) {
> > > -            threads = maxcpus / (sockets * dies * cores);
> > > -            threads = threads > 0 ? threads : 1;
> > > -        }
> > > -    /* prefer cores over sockets over threads since 6.2 */
> > > -    } else {
> > > -        if (cores == 0) {
> > > -            sockets = sockets > 0 ? sockets : 1;
> > > -            threads = threads > 0 ? threads : 1;
> > > -            cores = maxcpus / (sockets * dies * threads);
> > > -            cores = cores > 0 ? cores : 1;
> > > -        } else if (sockets == 0) {
> > > -            threads = threads > 0 ? threads : 1;
> > > -            sockets = maxcpus / (dies * cores * threads);
> > > -            sockets = sockets > 0 ? sockets : 1;
> > > -        } else if (threads == 0) {
> > > -            threads = maxcpus / (sockets * dies * cores);
> > > -            threads = threads > 0 ? threads : 1;
> > > -        }
> > > -    }
> > > -
> > > -    /* use the computed parameters to calculate the omitted cpus */
> > > -    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> > > -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -
> > > -    if (sockets * dies * cores * threads != maxcpus) {
> > > -        g_autofree char *dies_msg = g_strdup_printf(
> > > -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > -        error_setg(errp, "Invalid CPU topology: "
> > > -                   "sockets (%u)%s * cores (%u) * threads (%u) "
> > > -                   "!= maxcpus (%u)",
> > > -                   sockets, dies_msg, cores, threads,
> > > -                   maxcpus);
> > > -        return;
> > > -    }
> > > -
> > > -    if (sockets * dies * cores * threads < cpus) {
> > > -        g_autofree char *dies_msg = g_strdup_printf(
> > > -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > -        error_setg(errp, "Invalid CPU topology: "
> > > -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> > > -                   "smp_cpus (%u)",
> > > -                   sockets, dies_msg, cores, threads, cpus);
> > > -        return;
> > > -    }
> > > -
> > > -    ms->smp.cpus = cpus;
> > > -    ms->smp.sockets = sockets;
> > > -    ms->smp.dies = dies;
> > > -    ms->smp.cores = cores;
> > > -    ms->smp.threads = threads;
> > > -    ms->smp.max_cpus = maxcpus;
> > > -}
> > > -
> > >   static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> > >                               void *opaque, Error **errp)
> > >   {
> > > diff --git a/hw/core/meson.build b/hw/core/meson.build
> > > index 18f44fb7c2..6d727c7742 100644
> > > --- a/hw/core/meson.build
> > > +++ b/hw/core/meson.build
> > > @@ -14,6 +14,7 @@ hwcore_files = files(
> > >   )
> > >   common_ss.add(files('cpu-common.c'))
> > > +common_ss.add(files('machine-smp.c'))
> > >   common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
> > >   common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
> > >   common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > index 12ab0f5968..071eec1e74 100644
> > > --- a/include/hw/boards.h
> > > +++ b/include/hw/boards.h
> > > @@ -34,6 +34,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
> > >   void machine_set_cpu_numa_node(MachineState *machine,
> > >                                  const CpuInstanceProperties *props,
> > >                                  Error **errp);
> > > +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
> > >   /**
> > >    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> > > -- 
> > > 2.19.1
> > > 
> > Otherwise
> > 
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > 
> Thanks,
> Yanan
> .
> 


