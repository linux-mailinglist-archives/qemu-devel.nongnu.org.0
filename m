Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D292DCE8D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:41:26 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppmn-00047r-A0
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kppg4-0007O3-8P
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kppfz-0005Sd-RP
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608197662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=evVaArkvP70/zAr0KrGmxpGPiqSjyOE25/YkH7xVeZs=;
 b=PkNARryxwaDxX6wTVRdcNw8PI4+lyqpI7EquphUIW0iJNQATfyBUUNYJm7YyynnUHNSVZM
 QkQxHMHcYIAUWWSAI3q3LkhkblDTUCXir3w1jH25nVrfi/xpLUqsVWH9p03fz7DaN7RaaH
 bhL2NqhIZzop3EjR5jodFhGaguv6mRk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-NSkJB8TjNEO51lpCOZq_pw-1; Thu, 17 Dec 2020 04:34:20 -0500
X-MC-Unique: NSkJB8TjNEO51lpCOZq_pw-1
Received: by mail-ed1-f72.google.com with SMTP id c24so13159488edx.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=evVaArkvP70/zAr0KrGmxpGPiqSjyOE25/YkH7xVeZs=;
 b=bfWCN2LkkId/Q4LS1MeT/C2SslR9o5Ye27b040Ly7SQXO9JhhozxM0D2XEld1AaPeA
 o7jNpOChmay97UJAJOjY+LpQfH3/aCs450a3r1P56hpBSlsUx9UhvwYLztK7Cyun4oPt
 Lrq9gbiiUeVclet/jLy8W7Y8hFo//yfjjxiK8+yMqfgqG2Qep2vRf960U0dtViN9NXEW
 l1wCRaZMmh7AqfjlHLMIHE5haB7T+ML8C0qZ6hm3zUd7yzHTc/5Yn/5Ad9Y+1X1Weh12
 O7ftgXbuXNaUf8QPVB8fnrg7QdZ545YfvElqhWfotJTyxY16tn9CPzOA9eCDkFDGzicL
 9C9g==
X-Gm-Message-State: AOAM530pslpzq/mNKrnzETJ0ToEk9Lpyvs6c9J2bhcPMCA7UPyDVGk+f
 s7i87ArF1saX2wz14QxyvC5XlQ7UwwXe5wXFylBHtJ4rLZAr9s7xo5weyBzA8IEyAWT9joTqiE/
 CJrnUXcwmQu5Dgj8=
X-Received: by 2002:a17:906:3a55:: with SMTP id
 a21mr34814482ejf.516.1608197659319; 
 Thu, 17 Dec 2020 01:34:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYE1/sEQbaSF3uXLYB72pfskJlgljGyk7meayAZuvEw7m3JaLOj8iZAFmGn2j7yG8+5PCphA==
X-Received: by 2002:a17:906:3a55:: with SMTP id
 a21mr34814467ejf.516.1608197659094; 
 Thu, 17 Dec 2020 01:34:19 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id e21sm22784354edv.96.2020.12.17.01.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:34:18 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20201216205202.GJ3140057@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
Date: Thu, 17 Dec 2020 10:34:17 +0100
Message-ID: <877dpgvkrq.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Nov 19, 2020 at 11:32:21AM +0100, Vitaly Kuznetsov wrote:
>> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
>> requires listing all currently supported enlightenments ("hv_*" CPU
>> features) explicitly. We do have a 'hv_passthrough' mode enabling
>> everything but it can't be used in production as it prevents migration.
>> 
>> Introduce a simple 'hyperv=on' option for all x86 machine types enabling
>> all currently supported Hyper-V enlightenments. Later, when new
>> enlightenments get implemented, we will be adding them to newer machine
>> types only (by disabling them for legacy machine types) thus preserving
>> migration.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> [...]
>> ---
>>  docs/hyperv.txt       |  8 ++++++++
>>  hw/i386/x86.c         | 30 ++++++++++++++++++++++++++++++
>>  include/hw/i386/x86.h |  7 +++++++
>>  target/i386/cpu.c     | 14 ++++++++++++++
>>  4 files changed, 59 insertions(+)
>> 
>> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> index 5df00da54fc4..1a76a07f8417 100644
>> --- a/docs/hyperv.txt
>> +++ b/docs/hyperv.txt
>> @@ -29,6 +29,14 @@ When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
>>  identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
>>  and features are kept in leaves 0x40000100..0x40000101.
>>  
>> +Hyper-V enlightenments can be enabled in bulk by specifying 'hyperv=on' to an
>> +x86 machine type:
>> +
>> +  qemu-system-x86_64 -machine q35,accel=kvm,kernel-irqchip=split,hyperv=on ...
>> +
>> +Note, new enlightenments are only added to the latest (in-develompent) machine
>> +type, older machine types keep the list of the supported features intact to
>> +safeguard migration.
>>  
>>  3. Existing enlightenments
>>  ===========================
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 5944fc44edca..57f27d56ecc6 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1171,6 +1171,20 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
>>      visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
>>  }
>>  
>> +static bool x86_machine_get_hyperv(Object *obj, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    return x86ms->hyperv_enabled;
>> +}
>> +
>> +static void x86_machine_set_hyperv(Object *obj, bool value, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    x86ms->hyperv_enabled = value;
>> +}
>> +
>>  static void x86_machine_initfn(Object *obj)
>>  {
>>      X86MachineState *x86ms = X86_MACHINE(obj);
>> @@ -1194,6 +1208,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>>      x86mc->save_tsc_khz = true;
>>      nc->nmi_monitor_handler = x86_nmi;
>>  
>> +    /* Hyper-V features enabled with 'hyperv=on' */
>> +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
>> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
>> +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);
>> +
>>      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>>          x86_machine_get_smm, x86_machine_set_smm,
>>          NULL, NULL);
>> @@ -1205,6 +1229,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>>          NULL, NULL);
>>      object_class_property_set_description(oc, X86_MACHINE_ACPI,
>>          "Enable ACPI");
>> +
>> +    object_class_property_add_bool(oc, X86_MACHINE_HYPERV,
>> +        x86_machine_get_hyperv, x86_machine_set_hyperv);
>> +
>> +    object_class_property_set_description(oc, X86_MACHINE_HYPERV,
>> +        "Enable Hyper-V enlightenments");
>>  }
>>  
>>  static const TypeInfo x86_machine_info = {
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index 739fac50871b..598abd1be806 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -38,6 +38,9 @@ struct X86MachineClass {
>>      bool save_tsc_khz;
>>      /* Enables contiguous-apic-ID mode */
>>      bool compat_apic_id_mode;
>> +
>> +    /* Hyper-V features enabled with 'hyperv=on' */
>> +    uint64_t default_hyperv_features;
>>  };
>>  
>>  struct X86MachineState {
>> @@ -71,10 +74,14 @@ struct X86MachineState {
>>       * will be translated to MSI messages in the address space.
>>       */
>>      AddressSpace *ioapic_as;
>> +
>> +    /* Hyper-V emulation */
>> +    bool hyperv_enabled;
>>  };
>>  
>>  #define X86_MACHINE_SMM              "smm"
>>  #define X86_MACHINE_ACPI             "acpi"
>> +#define X86_MACHINE_HYPERV           "hyperv"
>>  
>>  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>>  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 83aca942d87c..63a931679d73 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -53,6 +53,7 @@
>>  #include "sysemu/tcg.h"
>>  #include "hw/qdev-properties.h"
>>  #include "hw/i386/topology.h"
>> +#include "hw/i386/x86.h"
>>  #ifndef CONFIG_USER_ONLY
>>  #include "exec/address-spaces.h"
>>  #include "hw/i386/apic_internal.h"
>> @@ -6511,8 +6512,21 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>  
>>  static void x86_cpu_hyperv_realize(X86CPU *cpu)
>>  {
>> +    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
>> +    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
>> +    uint64_t feat;
>>      size_t len;
>>  
>> +    if (x86ms->hyperv_enabled) {
>> +        feat = x86mc->default_hyperv_features;
>> +        /* Enlightened VMCS is only available on Intel/VMX */
>> +        if (!cpu_has_vmx(&cpu->env)) {
>> +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
>> +        }
>> +
>> +        cpu->hyperv_features |= feat;
>> +    }
>
> I had to dequeue this because it doesn't compile with
> CONFIG_USER_ONLY:
>
> https://gitlab.com/ehabkost/qemu/-/jobs/916651017
>
> The easiest solution would be to wrap the new code in #ifndef
> CONFIG_USER_ONLY, but maybe we should try to move all
> X86Machine-specific code from cpu.c to
> hw/i386/x86.c:x86_cpu_pre_plug().

Bummer, 

let me try the suggestion.

-- 
Vitaly


