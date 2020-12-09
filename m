Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF42D4831
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:44:26 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3Vo-0004Ls-TT
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3MQ-0003YU-2c
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3ML-0004YG-UA
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607535277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jtuOv5VyRnnjoy7x+runziRHfYDCNsuporWeMEeA9E=;
 b=HV6V+mYRZR647uvXY0Qx4n89hlZRizE1TLbFq/eTx9bQa8EGB5EbfiDQU2M3b92BH6IRBo
 0P6V2gJIG0YCklumyif3V0d2LMS7YdVuIUwQxOCzCTnM7xR07s/BbLupLdHfzV4r/Rqd0m
 CNLxxbZWZM7u2mgm4KwV31Iu7MucAqg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-DrrsZFCCOomzJnEocXvhIg-1; Wed, 09 Dec 2020 12:34:35 -0500
X-MC-Unique: DrrsZFCCOomzJnEocXvhIg-1
Received: by mail-wm1-f69.google.com with SMTP id r1so826854wmn.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8jtuOv5VyRnnjoy7x+runziRHfYDCNsuporWeMEeA9E=;
 b=f6JrvKP7Nmf9HPipHCV3DiioD84TZxrsiSGPC/9jE78lH3AWDzXSsmiLjy/SIMLJC4
 M0almWPBVlvD/A0fZ7MmF7MDuH2BCayczoyxOni2AbbwEnV90a3b10eayDN0/EEOmegF
 sVu4MWCvWxDAtxQZ9m9k1DedkwyCxfizar/pwQyHsI8cI+t7ZxE+UJCbbUZgeSnM8zWg
 ukcYGC405gGoU4WGTI2LNiEA3zD02hhejd3j6U9VzhZIvo6GfQCoiqGwxJJJCYJDQ03v
 FgR3/J/4U3hE+4FQhd4/IkzpOyzgaOLMb3/t4/q/GnYqvC/s3wNehSBrfXT9VAkma86W
 uWqw==
X-Gm-Message-State: AOAM533a4kz4i1uLiRAnkb1jKgzsF4i97+H8GOJycyd4UZEmNm+5ScH0
 VvAUa+N5nMiLfi89Hcqyi8UpCOhcvO1FnPux1CCFv/hSkhR/3x60W8C1IUSsN3Cj29Ih+8xSAP5
 fiGTLaXMa8poa6i0=
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr3916532wmr.162.1607535274608; 
 Wed, 09 Dec 2020 09:34:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE5WTlDazBwiUypbKm7siAR41hScCEFpTPwjDe7+NMIlSPrIqtXnU1iMdGFmEReatoSzwgxw==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr3916517wmr.162.1607535274423; 
 Wed, 09 Dec 2020 09:34:34 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n3sm2314854wra.13.2020.12.09.09.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 09:34:33 -0800 (PST)
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
Date: Wed, 9 Dec 2020 18:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209170052.1431440-2-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 6:00 PM, Greg Kurz wrote:
> The sPAPR CPU core device can only work with pseries machine types.
> This is currently checked in the realize function with a dynamic
> cast of qdev_get_machine(). Some other places also need to reach
> out to the machine using qdev_get_machine().
> 
> Make this dependency explicit by introducing an "spapr" link
> property which officialy points to the machine. This link is
> set by pseries machine types only in the pre-plug handler. This
> allows to drop some users of qdev_get_machine().
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_cpu_core.h |  2 ++
>  hw/ppc/spapr.c                  |  4 ++++
>  hw/ppc/spapr_cpu_core.c         | 17 +++++++----------
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
> index dab3dfc76c0a..0969b29fd96c 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -10,6 +10,7 @@
>  #define HW_SPAPR_CPU_CORE_H
>  
>  #include "hw/cpu/core.h"
> +#include "hw/ppc/spapr.h"
>  #include "hw/qdev-core.h"
>  #include "target/ppc/cpu-qom.h"
>  #include "target/ppc/cpu.h"
> @@ -24,6 +25,7 @@ OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
>  struct SpaprCpuCore {
>      /*< private >*/
>      CPUCore parent_obj;
> +    SpaprMachineState *spapr;
>  
>      /*< public >*/
>      PowerPCCPU **threads;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d1dcf3ab2c94..4cc51723c62e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3816,6 +3816,10 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>      int index;
>      unsigned int smp_threads = machine->smp.threads;
>  
> +    /* Required by spapr_cpu_core_realize() */
> +    object_property_set_link(OBJECT(dev), "spapr", OBJECT(hotplug_dev),
> +                             &error_abort);
> +
>      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
>          error_setg(errp, "CPU hotplug not supported for this machine");
>          return;
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 2f7dc3c23ded..dec09367e4a0 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -25,14 +25,13 @@
>  #include "sysemu/hw_accel.h"
>  #include "qemu/error-report.h"
>  
> -static void spapr_reset_vcpu(PowerPCCPU *cpu)
> +static void spapr_reset_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr)
>  {
>      CPUState *cs = CPU(cpu);
>      CPUPPCState *env = &cpu->env;
>      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>      SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>      target_ulong lpcr;
> -    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>  
>      cpu_reset(cs);
>  
> @@ -186,7 +185,7 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
>      if (!sc->pre_3_0_migration) {
>          vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
>      }
> -    spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
> +    spapr_irq_cpu_intc_destroy(sc->spapr, cpu);
>      qdev_unrealize(DEVICE(cpu));
>  }
>  
> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
>      int i;
>  
>      for (i = 0; i < cc->nr_threads; i++) {
> -        spapr_reset_vcpu(sc->threads[i]);
> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);

Why reset() needs access to the machine state, don't
you have it in realize()?

>      }
>  }
>  
> @@ -314,16 +313,12 @@ err:
>  
>  static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
>  {
> -    /* We don't use SPAPR_MACHINE() in order to exit gracefully if the user
> -     * tries to add a sPAPR CPU core to a non-pseries machine.
> -     */
> -    SpaprMachineState *spapr =
> -        (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
> -                                                  TYPE_SPAPR_MACHINE);
>      SpaprCpuCore *sc = SPAPR_CPU_CORE(OBJECT(dev));
> +    SpaprMachineState *spapr = sc->spapr;
>      CPUCore *cc = CPU_CORE(OBJECT(dev));
>      int i;
>  
> +    /* Set in spapr_core_pre_plug() */
>      if (!spapr) {
>          error_setg(errp, TYPE_SPAPR_CPU_CORE " needs a pseries machine");
>          return;
> @@ -345,6 +340,8 @@ static Property spapr_cpu_core_properties[] = {
>      DEFINE_PROP_INT32("node-id", SpaprCpuCore, node_id, CPU_UNSET_NUMA_NODE_ID),
>      DEFINE_PROP_BOOL("pre-3.0-migration", SpaprCpuCore, pre_3_0_migration,
>                       false),
> +    DEFINE_PROP_LINK("spapr", SpaprCpuCore, spapr, TYPE_SPAPR_MACHINE,
> +                     SpaprMachineState *),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> 


