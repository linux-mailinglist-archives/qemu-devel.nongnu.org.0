Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F03CE7C6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:15:23 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WrR-00071F-FH
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5Wpa-0006JL-9g
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WpT-0002o7-Af
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626714798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3kGq7GPwVUZtF4P2pXY+9Giuu7eDvLOrLtwTJKrT/to=;
 b=HXNH6GaHypLxarKYHWnqLwOqNw2L5zz994idteVYPQ/EaIxkBMZ8oH5hZ/TaFLsm5x+JRr
 7gI28rFKjyreuieEZoV3QUxcZcNWXc3NHZhgP/i/o4PnYY+9drHty0LGh5dJYkSrZXuAp2
 IUWGJd5Ng6LPs6qOmE36KrzBm8XxgEk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-1h80F3ptMqaINHiD1O0r3A-1; Mon, 19 Jul 2021 13:13:05 -0400
X-MC-Unique: 1h80F3ptMqaINHiD1O0r3A-1
Received: by mail-io1-f71.google.com with SMTP id
 p7-20020a5d8d070000b02904c0978ed194so13037785ioj.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 10:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3kGq7GPwVUZtF4P2pXY+9Giuu7eDvLOrLtwTJKrT/to=;
 b=sgXt/r4pyOvpPBT2IFo69Mf6Aq6RbNiZMTTOk1Yn/Phpy8gpQGHBvgXreIm7UjS6LJ
 d9sjoHmn369r6l4ITIigBbBMhZm64j85WDhNUqNj+zJ7pzhpdQ14p9XLMc3VdTkHB8lZ
 OAW1+3znhxgh2DAtwrThi1UY533fIL2hTTMmK7tNTbebWq6Nosm6Kh7j3WsmpfvxJdmE
 sFt7oF5Gr2xzhBO103gUnzrPNf7+NcLBN8RvSRFTGzOM4KdPC7fCpVzoiVwQx/bNhDFK
 J+OcnF6WhzbTRSrtohfZNgZQNs4RCAXZ+UDmXIlvq3Ldkpqkv5Nv18n/gw80fXjA3nUs
 +dSw==
X-Gm-Message-State: AOAM531leOasxSHBFoZKlDA5BMUPOmXHxhWlsHfGgL50js0fZOaUCf9s
 ChV/xUmiBwmBqCoft39k82drQKuhP4LEV8YilSZKMZRv52ztOcC4jUNH8eBadgwrk1I3XEUPlkT
 XkL7/5kofLwAhPwU=
X-Received: by 2002:a92:de0a:: with SMTP id x10mr17761521ilm.215.1626714784560; 
 Mon, 19 Jul 2021 10:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJndL1Xfi6h0Qb46zMb22zXg7+jhKpTNYvO8FzEJ4+hrkw2ZVhDysp6UUoqqmtcajCXfE3FA==
X-Received: by 2002:a92:de0a:: with SMTP id x10mr17761501ilm.215.1626714784341; 
 Mon, 19 Jul 2021 10:13:04 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id t11sm1079190ioc.4.2021.07.19.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:13:03 -0700 (PDT)
Date: Mon, 19 Jul 2021 19:13:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 07/11] machine: Prefer cores over sockets in
 smp parsing since 6.2
Message-ID: <20210719171301.d4pr4geiewe6kcis@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-8-wangyanan55@huawei.com>
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

On Mon, Jul 19, 2021 at 11:20:39AM +0800, Yanan Wang wrote:
> In the real SMP hardware topology world, it's much more likely that
> we have high cores-per-socket counts and few sockets totally. While
> the current preference of sockets over cores in smp parsing results
> in a virtual cpu topology with low cores-per-sockets counts and a
> large number of sockets, which is just contrary to the real world.
> 
> Given that it is better to make the virtual cpu topology be more
> reflective of the real world and also for the sake of compatibility,
> we start to prefer cores over sockets over threads in smp parsing
> since machine type 6.2 for different arches.
> 
> In this patch, a boolean "smp_prefer_sockets" is added, and we only
> enable the old preference on older machines and enable the new one
> since type 6.2 for all arches by using the machine compat mechanism.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              |  1 +
>  hw/core/machine.c          | 59 +++++++++++++++++++++++++++++---------
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  include/hw/boards.h        |  1 +
>  qemu-options.hx            |  4 ++-
>  8 files changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 01165f7f53..7babea40dc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2797,6 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
>  {
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets = true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
>  
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63439c4a6d..c074425015 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -744,6 +744,22 @@ void machine_set_cpu_numa_node(MachineState *machine,
>      }
>  }
>  
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

parameters

Or how about something like this:

When both maxcpus and cpus are omitted maxcpus will be calculated from the
given parameters and cpus will be set equal to maxcpus. When only one of
maxcpus and cpus is given then the omitted one will be set to its given
counterpart's value. Both maxcpus and cpus may be specified, but cpus must
be less than or equal to maxcpus.

> + *
> + * In calculation of omitted arch-netural sockets/cores/threads, we prefer
> + * sockets over cores over threads before 6.2, while prefer cores over

while preferring

> + * sockets over threads since 6.2 on. The arch-specific dies will directly

s/on//

> + * default to 1 if omitted.
> + */
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -772,19 +788,36 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  
>      maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    /* compute missing values, prefer sockets over cores over threads */
> -    if (sockets == 0) {
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -        sockets = maxcpus / (dies * cores * threads);
> -        sockets = sockets > 0 ? sockets : 1;
> -    } else if (cores == 0) {
> -        threads = threads > 0 ? threads : 1;
> -        cores = maxcpus / (sockets * dies * threads);
> -        cores = cores > 0 ? cores : 1;
> -    } else if (threads == 0) {
> -        threads = maxcpus / (sockets * dies * cores);
> -        threads = threads > 0 ? threads : 1;
> +    /* prefer sockets over cores over threads before 6.2 */
> +    if (mc->smp_prefer_sockets) {

please move the comment into the if, so...

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

...here we can put the comment in the else

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
>      }
>  
>      /* use the computed parameters to calculate the omitted cpus */
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index fd5c2277f2..9b811fc6ca 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
>      m->is_default = false;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +    m->smp_prefer_sockets = true;
>  }
>  
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b45903b15e..88efb7fde4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>      m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +    m->smp_prefer_sockets = true;
>  }
>  
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..a481fade51 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets = true;
>  }
>  
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4d25278cf2..b40e647883 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -809,6 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
>  {
>      ccw_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets = true;
>  }
>  DEFINE_CCW_MACHINE(6_1, "6.1", false);
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 2832f0f8aa..8df885c9d2 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -247,6 +247,7 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool smp_dies_supported;
> +    bool smp_prefer_sockets;
>      bool auto_enable_numa;
>      const char *default_ram_id;
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0c9ddc0274..6ef57e838c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -227,7 +227,9 @@ SRST
>      from those which are given. Historically preference was given to the
>      coarsest topology parameters when computing missing values (ie sockets
>      preferred over cores, which were preferred over threads), however, this
> -    behaviour is considered liable to change.
> +    behaviour is considered liable to change. The historical preference of
> +    sockets over cores over threads works before 6.2, and a new preference
> +    of cores over sockets over threads starts to work since 6.2 on.

Prior to 6.2 the preference was sockets over cores over threads. Since 6.2
the preference is cores over sockets over threads.

>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> -- 
> 2.19.1
>

Thanks,
drew 


