Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E12D488F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:06:11 +0100 (CET)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3qs-0007SZ-SO
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3ek-0005HR-55
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3eg-00039M-NW
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607536413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYljsHoEsiI/o4TzUjy7xfOraEfUSdTQPMWrlsm7s4A=;
 b=URPWj2372fQ+Mq6oICV8xiNY2PoZAMkM5v3N6tJbXFHLWRPepgtDc1BTUykBwEVfWIWU0J
 WS2uyzS2orlMk+QERivSmCixB9qasL/QqglIC3MZCGtF5LISmbqrqBTMe1/J4fShvHZ6HX
 OsoD0V0O3POqlcRWKMp+JsF7z0BfJGk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-smSbkV0RNz-U9ybYEK2HSg-1; Wed, 09 Dec 2020 12:53:31 -0500
X-MC-Unique: smSbkV0RNz-U9ybYEK2HSg-1
Received: by mail-wr1-f70.google.com with SMTP id w17so932414wrp.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AYljsHoEsiI/o4TzUjy7xfOraEfUSdTQPMWrlsm7s4A=;
 b=BbASG0Qy0oyFHGWklVnkZcAihOqAhFA1zX91h1Jmdb9a6ae893dSUKU7AgduUYyPtK
 b8gfLBL9VJspTvkU22HZlJ/kSl6E+Tctwf0s6PmNBl3seiz9Veh9yIrexyYgr11Lv8XL
 ruxEry5Jg9VwTo53Fx/yOe6GlNs5rqImgcD60pcTlt0T875tp/WWODLlAw9zQYny909n
 ACr4tseXLg0Ubyuvel3Iz3ddtm121anCc359Cpp7htOyj0fdDr/VPTkFvjTYMRA5JGOS
 p4Zat6VRVHnCEYMwqZll1PhPoUM0bkvJzhlE7fMvdOr2z2HaPuhfa4JAi2ueyDAMZRmT
 iR6g==
X-Gm-Message-State: AOAM531QpulNlecxYHwqcTol3dHoF2CGQrUMVL/i/nbEhZBg/291/srz
 d7125Rpo5XPNRfGfTBxkPUSN/4RwNVgnoOicXO3SF8u6Q4BmKXCuMi/lMkGuPyT5fclMLjPm/zZ
 k9bPW6J2zuNwSFhc=
X-Received: by 2002:a1c:2003:: with SMTP id g3mr4062367wmg.136.1607536410593; 
 Wed, 09 Dec 2020 09:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiZFzRw5NU73AOL7XBfKtUyPbkzDs7OubbuWZud9hkVRerkzv80MKFQowk0iWWExpXE2asIw==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr4062349wmg.136.1607536410391; 
 Wed, 09 Dec 2020 09:53:30 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s13sm4425693wmj.28.2020.12.09.09.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 09:53:29 -0800 (PST)
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
To: Greg Kurz <groug@kaod.org>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
Date: Wed, 9 Dec 2020 18:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209184225.1b544523@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 6:42 PM, Greg Kurz wrote:
> On Wed, 9 Dec 2020 18:34:31 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 12/9/20 6:00 PM, Greg Kurz wrote:
>>> The sPAPR CPU core device can only work with pseries machine types.
>>> This is currently checked in the realize function with a dynamic
>>> cast of qdev_get_machine(). Some other places also need to reach
>>> out to the machine using qdev_get_machine().
>>>
>>> Make this dependency explicit by introducing an "spapr" link
>>> property which officialy points to the machine. This link is
>>> set by pseries machine types only in the pre-plug handler. This
>>> allows to drop some users of qdev_get_machine().
>>>
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>> ---
>>>  include/hw/ppc/spapr_cpu_core.h |  2 ++
>>>  hw/ppc/spapr.c                  |  4 ++++
>>>  hw/ppc/spapr_cpu_core.c         | 17 +++++++----------
>>>  3 files changed, 13 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
>>> index dab3dfc76c0a..0969b29fd96c 100644
>>> --- a/include/hw/ppc/spapr_cpu_core.h
>>> +++ b/include/hw/ppc/spapr_cpu_core.h
>>> @@ -10,6 +10,7 @@
>>>  #define HW_SPAPR_CPU_CORE_H
>>>  
>>>  #include "hw/cpu/core.h"
>>> +#include "hw/ppc/spapr.h"
>>>  #include "hw/qdev-core.h"
>>>  #include "target/ppc/cpu-qom.h"
>>>  #include "target/ppc/cpu.h"
>>> @@ -24,6 +25,7 @@ OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
>>>  struct SpaprCpuCore {
>>>      /*< private >*/
>>>      CPUCore parent_obj;
>>> +    SpaprMachineState *spapr;
>>>  
>>>      /*< public >*/
>>>      PowerPCCPU **threads;
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index d1dcf3ab2c94..4cc51723c62e 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -3816,6 +3816,10 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>>      int index;
>>>      unsigned int smp_threads = machine->smp.threads;
>>>  
>>> +    /* Required by spapr_cpu_core_realize() */
>>> +    object_property_set_link(OBJECT(dev), "spapr", OBJECT(hotplug_dev),
>>> +                             &error_abort);
>>> +
>>>      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
>>>          error_setg(errp, "CPU hotplug not supported for this machine");
>>>          return;
>>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>>> index 2f7dc3c23ded..dec09367e4a0 100644
>>> --- a/hw/ppc/spapr_cpu_core.c
>>> +++ b/hw/ppc/spapr_cpu_core.c
>>> @@ -25,14 +25,13 @@
>>>  #include "sysemu/hw_accel.h"
>>>  #include "qemu/error-report.h"
>>>  
>>> -static void spapr_reset_vcpu(PowerPCCPU *cpu)
>>> +static void spapr_reset_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr)
>>>  {
>>>      CPUState *cs = CPU(cpu);
>>>      CPUPPCState *env = &cpu->env;
>>>      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>>>      SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>>>      target_ulong lpcr;
>>> -    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>>>  
>>>      cpu_reset(cs);
>>>  
>>> @@ -186,7 +185,7 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
>>>      if (!sc->pre_3_0_migration) {
>>>          vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
>>>      }
>>> -    spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
>>> +    spapr_irq_cpu_intc_destroy(sc->spapr, cpu);
>>>      qdev_unrealize(DEVICE(cpu));
>>>  }
>>>  
>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
>>>      int i;
>>>  
>>>      for (i = 0; i < cc->nr_threads; i++) {
>>> -        spapr_reset_vcpu(sc->threads[i]);
>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
>>
>> Why reset() needs access to the machine state, don't
>> you have it in realize()?
>>
> 
> This is for the vCPU threads of the sPAPR CPU core. They don't have the
> link to the machine state.

They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
something?

> 
>>>      }
>>>  }
>>>  
>>> @@ -314,16 +313,12 @@ err:
>>>  
>>>  static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
>>>  {
>>> -    /* We don't use SPAPR_MACHINE() in order to exit gracefully if the user
>>> -     * tries to add a sPAPR CPU core to a non-pseries machine.
>>> -     */
>>> -    SpaprMachineState *spapr =
>>> -        (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
>>> -                                                  TYPE_SPAPR_MACHINE);
>>>      SpaprCpuCore *sc = SPAPR_CPU_CORE(OBJECT(dev));
>>> +    SpaprMachineState *spapr = sc->spapr;
>>>      CPUCore *cc = CPU_CORE(OBJECT(dev));
>>>      int i;
>>>  
>>> +    /* Set in spapr_core_pre_plug() */
>>>      if (!spapr) {
>>>          error_setg(errp, TYPE_SPAPR_CPU_CORE " needs a pseries machine");
>>>          return;
>>> @@ -345,6 +340,8 @@ static Property spapr_cpu_core_properties[] = {
>>>      DEFINE_PROP_INT32("node-id", SpaprCpuCore, node_id, CPU_UNSET_NUMA_NODE_ID),
>>>      DEFINE_PROP_BOOL("pre-3.0-migration", SpaprCpuCore, pre_3_0_migration,
>>>                       false),
>>> +    DEFINE_PROP_LINK("spapr", SpaprCpuCore, spapr, TYPE_SPAPR_MACHINE,
>>> +                     SpaprMachineState *),
>>>      DEFINE_PROP_END_OF_LIST()
>>>  };
>>>  
>>>
>>
> 


