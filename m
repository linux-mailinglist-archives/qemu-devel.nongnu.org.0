Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E13CE3D0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:30:19 +0200 (CEST)
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5W9q-0003oD-3n
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5W8W-00037C-TD
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5W8T-0006QZ-KN
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626712131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YHbkBs3WTEzDqgiPwqZZZxTT92sgcRIWoNPRiBsllBc=;
 b=i/LS17BdnpuPtl88LbuYATa5JS8zb3e7o4TCfeEalmHVWmV8IXq60eoVj93+CL7qj23rmq
 KdiV+FDJoqoak8vOva3II3KxuvpIixgD7PA/P4ZOuU/aAS64kR1IyGtQC5jSmKeIa/JhwL
 rnNngtPgd/pZykLyAZhpZdD0J7Ykjic=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-9Q8k6PVzPjCCIgOB0j-gIg-1; Mon, 19 Jul 2021 12:28:50 -0400
X-MC-Unique: 9Q8k6PVzPjCCIgOB0j-gIg-1
Received: by mail-il1-f199.google.com with SMTP id
 c7-20020a92b7470000b0290205c6edd752so11004872ilm.14
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YHbkBs3WTEzDqgiPwqZZZxTT92sgcRIWoNPRiBsllBc=;
 b=XGAsqmxbF5FAsL1uuPSXCTy2cahKAlii53Gvz1Vcu9C6RYcdCmXC42ai2SXF0C0eHn
 VkdFzlg5vgWjZKQ4mMNl9nH/om0qHqer1ywWexl8ZrgTk7JIHuTk+nzcIQcwM49EVBQ8
 tXJ7X2lACkfDPqCiQl0A9KHtAk4z1qmEhYsKeXwPnaEMHgIjj2YGQ54uWWKK5MLCjSGG
 BQAD4iNF5PcgUMpb7D7cvaChzAlQwrByCk1p0SFMKp2+YMZ8Ulb5U0gSJx6RxHMpx2G7
 pOXInSJ1DbC5RHpyswiTq0Uu/llyebJlCPOzlckouC6PgYQsSgSx8yjzbDVoOlU3HNno
 V1mA==
X-Gm-Message-State: AOAM530AV9r3FPDeHBbYX0c8Ib+6nBfmrj0+vq5tIeMAFB04Zwum58P2
 RetV+uvhonezUgvJxGI9FQliiUqNVWol3o8bLW3+b2uZU/tMCKEzYBADHhHROPfN0u778u0JidC
 JMQmzElAyBThF4kM=
X-Received: by 2002:a05:6602:2801:: with SMTP id
 d1mr12389358ioe.73.1626712129992; 
 Mon, 19 Jul 2021 09:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEx/INrx5k0pmoWkRtR+NHRe+L9mRibGd4qx4nyJ89QTnI4BxugTw+do5Mp3wMpjQ3P1MW7Q==
X-Received: by 2002:a05:6602:2801:: with SMTP id
 d1mr12389333ioe.73.1626712129740; 
 Mon, 19 Jul 2021 09:28:49 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id f3sm11213180iob.30.2021.07.19.09.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:28:49 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:28:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <20210719162846.dcltg22pbdpnyjcl@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-3-wangyanan55@huawei.com>
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

On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of multi-dies and the related error reporting code.
> With an arch compat variable "bool smp_dies_supported", we can
> easily make smp_parse generic enough for all arches and the PC
> specific one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 28 ++++++++++-------
>  hw/i386/pc.c        | 76 +--------------------------------------------
>  include/hw/boards.h |  1 +
>  3 files changed, 19 insertions(+), 86 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d73daa10f4..ed6712e964 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>  
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned dies    = config->has_dies ? config->dies : 1;
> @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    if (dies > 1) {
> +    if (!mc->smp_dies_supported && dies > 1) {

Won't this allow a user on an arch with !mc->smp_dies_supported to specify
dies=1? To not allow that, can we do

   if (!mc->smp_dies_supported && config->has_dies)

instead?

>          error_setg(errp, "dies not supported by this machine's CPU topology");
>          return;
>      }
> @@ -772,23 +773,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          threads = threads > 0 ? threads : 1;
>          if (cpus == 0) {
>              sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * sockets;
> +            cpus = sockets * dies * cores * threads;
>          } else {
>              maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads);
> +            sockets = maxcpus / (dies * cores * threads);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * threads);
> +        cores = cpus / (sockets * dies * threads);
>          cores = cores > 0 ? cores : 1;
>      } else if (threads == 0) {
> -        threads = cpus / (cores * sockets);
> +        threads = cpus / (sockets * dies * cores);
>          threads = threads > 0 ? threads : 1;
> -    } else if (sockets * cores * threads < cpus) {
> +    } else if (sockets * dies * cores * threads < cpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>          error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>                     "smp_cpus (%u)",
> -                   sockets, cores, threads, cpus);
> +                   sockets, dies_msg, cores, threads, cpus);
>          return;
>      }
>  
> @@ -799,17 +802,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    if (sockets * cores * threads != maxcpus) {
> +    if (sockets * dies * cores * threads != maxcpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>          error_setg(errp, "Invalid CPU topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) "
>                     "!= maxcpus (%u)",
> -                   sockets, cores, threads,
> +                   sockets, dies_msg, cores, threads,
>                     maxcpus);
>          return;
>      }
>  
>      ms->smp.cpus = cpus;
>      ms->smp.sockets = sockets;
> +    ms->smp.dies = dies;
>      ms->smp.cores = cores;
>      ms->smp.threads = threads;
>      ms->smp.max_cpus = maxcpus;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c6b63c00a5..d94ef582b5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -708,80 +708,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
>      }
>  }
>  
> -/*
> - * This function is very similar to smp_parse()
> - * in hw/core/machine.c but includes CPU die support.
> - */
> -static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> -{
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
> -    /* compute missing values, prefer sockets over cores over threads */
> -    if (cpus == 0 || sockets == 0) {
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * dies * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads * dies);
> -        }
> -    } else if (cores == 0) {
> -        threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * dies * threads);
> -        cores = cores > 0 ? cores : 1;
> -    } else if (threads == 0) {
> -        threads = cpus / (cores * dies * sockets);
> -        threads = threads > 0 ? threads : 1;
> -    } else if (sockets * dies * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, dies, cores, threads, cpus);
> -        return;
> -    }
> -
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -    if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }
> -
> -    if (sockets * dies * cores * threads != maxcpus) {
> -        error_setg(errp, "Invalid CPU topology deprecated: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> -                   "!= maxcpus (%u)",
> -                   sockets, dies, cores, threads,
> -                   maxcpus);
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
>  static
>  void pc_machine_done(Notifier *notifier, void *data)
>  {
> @@ -1735,7 +1661,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      mc->auto_enable_numa_with_memdev = true;
>      mc->has_hotpluggable_cpus = true;
>      mc->default_boot_order = "cad";
> -    mc->smp_parse = pc_smp_parse;

Can we also get rid of MachineClass::smp_parse now?

>      mc->block_default_type = IF_IDE;
>      mc->max_cpus = 255;
>      mc->reset = pc_machine_reset;
> @@ -1746,6 +1671,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug = pc_machine_device_unplug_cb;
>      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>      mc->nvdimm_supported = true;
> +    mc->smp_dies_supported = true;
>      mc->default_ram_id = "pc.ram";
>  
>      object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index accd6eff35..b6161cee88 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -246,6 +246,7 @@ struct MachineClass {
>      bool smbus_no_migration_support;
>      bool nvdimm_supported;
>      bool numa_mem_supported;
> +    bool smp_dies_supported;
>      bool auto_enable_numa;
>      const char *default_ram_id;
>  
> -- 
> 2.19.1
>

Thanks,
drew 


