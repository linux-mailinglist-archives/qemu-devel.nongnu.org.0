Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E213D96C7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:31:20 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qD0-0004dH-Gt
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qAd-0000cz-1a
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qAa-0000nG-PB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgjexZTlT1+SeHBVmeSckgwuP2/KeVHaTXGKKze3A90=;
 b=AxVjoyCTEaka5UpwTgyqtWeTfc82vaaS86N2PgcRGf3k94gDRVVcKKz0rFAZHjMzn4ECFz
 Yk7QpGYczbnfrFB+KcG+aGBp2xQBFViNUD66G2CtrKf6YWcHCGGnvj26elH4X7FjtshdHH
 qMyZlbMmt7yy8Qh3sADgqyih8cAXk/s=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-UZARBGJcOS-Rwh5vw68XdA-1; Wed, 28 Jul 2021 16:28:44 -0400
X-MC-Unique: UZARBGJcOS-Rwh5vw68XdA-1
Received: by mail-il1-f197.google.com with SMTP id
 o6-20020a056e020926b0290221b4e37e75so2058615ilt.21
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mgjexZTlT1+SeHBVmeSckgwuP2/KeVHaTXGKKze3A90=;
 b=t8I6d4Bgubamm85SoOh8liEewKum53bNVyx7anuJNCPWvndvUa9CXKiC5TdcDfFU5G
 KnlH2Cco1/bh0PI4EJL6EFSr5L08JAYTq3Tr2djJe5kC11cdB1X/OLliPPRLUsL9Z4rB
 rnWc75lhfs2HhiUcoM/3DtCNJ5EtGwic7wdsaObvG7732ck9bcPS7+eGdt44kDVk1hRa
 YU97dzEoRfawpnebgL/KUnTYRZN7ZybKfy4o9Z8/P88D8nWTWi1PmhssHcgPERO+/nUp
 Gzr16PmYiV7cmODtUkCCEPk283NdQD5njLTaMu6YGl3E4pSgBcTSxbMgR53o1qTdTX6X
 1FkQ==
X-Gm-Message-State: AOAM532A2cQQNBsDG4zFqEdRtVnDy4Gekh6MKOLTq7ptdRRIyD8ijCsE
 Zhk5DwCHscAuT0Cp9W803h78GbeZAQuocAmjF5YBhdBTR/9JLE+FXTBrJF2tHMl5gnWm2lkkpX/
 I3rFaF/0LDCeaQ5w=
X-Received: by 2002:a92:1a44:: with SMTP id z4mr1134336ill.244.1627504123831; 
 Wed, 28 Jul 2021 13:28:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCG0oQomJrmH5eJ8vdp+hb01YuHus9Z4GjU/+trgQV1ps6Blmnd9LDXjD34oEb/ENwtw+iQA==
X-Received: by 2002:a92:1a44:: with SMTP id z4mr1134317ill.244.1627504123521; 
 Wed, 28 Jul 2021 13:28:43 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id g4sm589125ilc.11.2021.07.28.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:28:43 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:28:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 06/11] machine: Prefer cores over sockets in
 smp parsing since 6.2
Message-ID: <20210728202840.qts7yursf23cxkcz@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Jul 28, 2021 at 11:48:43AM +0800, Yanan Wang wrote:
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
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              |  1 +
>  hw/core/machine.c          | 36 ++++++++++++++++++++++++++----------
>  hw/i386/pc.c               | 36 ++++++++++++++++++++++++++----------
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  include/hw/boards.h        |  1 +
>  qemu-options.hx            |  3 ++-
>  9 files changed, 60 insertions(+), 21 deletions(-)
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
> index 458d9736e3..a8173a0f45 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -746,6 +746,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>  
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned cores   = config->has_cores ? config->cores : 0;
> @@ -757,7 +758,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    /* compute missing values, prefer sockets over cores over threads */
> +    /* compute missing values based on the provided ones */
>      if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
> @@ -765,15 +766,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      } else {
>          maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -        if (sockets == 0) {
> -            cores = cores > 0 ? cores : 1;
> -            threads = threads > 0 ? threads : 1;
> -            sockets = maxcpus / (cores * threads);
> -        } else if (cores == 0) {
> -            threads = threads > 0 ? threads : 1;
> -            cores = maxcpus / (sockets * threads);
> -        } else if (threads == 0) {
> -            threads = maxcpus / (sockets * cores);
> +        if (mc->smp_prefer_sockets) {
> +            /* prefer sockets over cores over threads before 6.2 */
> +            if (sockets == 0) {
> +                cores = cores > 0 ? cores : 1;
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (cores * threads);
> +            } else if (cores == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * threads);
> +            } else if (threads == 0) {
> +                threads = maxcpus / (sockets * cores);
> +            }
> +        } else {
> +            /* prefer cores over sockets over threads since 6.2 */
> +            if (cores == 0) {
> +                sockets = sockets > 0 ? sockets : 1;
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * threads);
> +            } else if (sockets == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (cores * threads);
> +            } else if (threads == 0) {
> +                threads = maxcpus / (sockets * cores);
> +            }
>          }
>      }
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8c2235ac46..77ab764c5d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -717,6 +717,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
>   */
>  static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned dies    = config->has_dies ? config->dies : 0;
> @@ -727,7 +728,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      /* directly default dies to 1 if it's omitted */
>      dies = dies > 0 ? dies : 1;
>  
> -    /* compute missing values, prefer sockets over cores over threads */
> +    /* compute missing values based on the provided ones */
>      if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
> @@ -735,15 +736,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      } else {
>          maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -        if (sockets == 0) {
> -            cores = cores > 0 ? cores : 1;
> -            threads = threads > 0 ? threads : 1;
> -            sockets = maxcpus / (dies * cores * threads);
> -        } else if (cores == 0) {
> -            threads = threads > 0 ? threads : 1;
> -            cores = maxcpus / (sockets * dies * threads);
> -        } else if (threads == 0) {
> -            threads = maxcpus / (sockets * dies * cores);
> +        if (mc->smp_prefer_sockets) {
> +            /* prefer sockets over cores over threads before 6.2 */
> +            if (sockets == 0) {
> +                cores = cores > 0 ? cores : 1;
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (dies * cores * threads);
> +            } else if (cores == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * dies * threads);
> +            } else if (threads == 0) {
> +                threads = maxcpus / (sockets * dies * cores);
> +            }
> +        } else {
> +            /* prefer cores over sockets over threads since 6.2 */
> +            if (cores == 0) {
> +                sockets = sockets > 0 ? sockets : 1;
> +                threads = threads > 0 ? threads : 1;
> +                cores = maxcpus / (sockets * dies * threads);
> +            } else if (sockets == 0) {
> +                threads = threads > 0 ? threads : 1;
> +                sockets = maxcpus / (dies * cores * threads);
> +            } else if (threads == 0) {
> +                threads = maxcpus / (sockets * dies * cores);
> +            }
>          }
>      }
>  
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
> index 463a5514f9..2ae039b74f 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -247,6 +247,7 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool auto_enable_numa;
> +    bool smp_prefer_sockets;
>      const char *default_ram_id;
>  
>      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0912236b4b..450f511ca7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -234,7 +234,8 @@ SRST
>      Historically preference was given to the coarsest topology parameters
>      when computing missing values (ie sockets preferred over cores, which
>      were preferred over threads), however, this behaviour is considered
> -    liable to change.
> +    liable to change. Prior to 6.2 the preference was sockets over cores
> +    over threads. Since 6.2 the preference is cores over sockets over threads.
>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> -- 
> 2.19.1
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


