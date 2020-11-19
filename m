Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D472B8E47
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:57:05 +0100 (CET)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffkW-0008NZ-7v
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kffgT-00052m-FU
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kffgR-0004yK-1l
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRr1kfem6+RfRlvBSW9anutLYSpQz0agukqEufd9wY4=;
 b=jB/Ek9bnVx3ivt0XsKR1TRaXYGMG8JgBfoRT+rQwChB6S/cUvCkK6209Vdj3uGvOcK3yCZ
 BIbbZ5+Y6kbIFhc6u/Bw5qslGW0fRNucLKnM1FsGeO5/myS4p3g4E7/Sq/ikHTflI+fnJS
 Y4WkqQfX2MgWB43lO094Me/m7wDBw4I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-EHfHJoJQOuKVmMI5w1uUNg-1; Thu, 19 Nov 2020 03:52:47 -0500
X-MC-Unique: EHfHJoJQOuKVmMI5w1uUNg-1
Received: by mail-ej1-f72.google.com with SMTP id v21so1932829ejy.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 00:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZRr1kfem6+RfRlvBSW9anutLYSpQz0agukqEufd9wY4=;
 b=X0I5HjWd3B/58Q9ylEdCw0bczMsVOUcEpp/ruBZy0MQv+EWB77HrQnpzyWYl6oq5SJ
 A+uNtGcra4SIxnVjNx1WDS+CJ2RsWGyVdHTk9OwgpZrW4vCgfGGRMr+MAbbCLOveV5Vp
 Rval12qpmb0FKaXfNvaLaGEljwqaj9JMMtAiCcyI5sgjcifgLjhDc/2tlzQevvwYZlNz
 FmUtR5Ounm9Vi2CHhwegAhMnkNyZKy6L2JIFyXn0cWIEczeRA+MkGW924JLrilMQTYp0
 fERzQBuIFi6CB1RofWC2W813cLl2CLwwLWTDDCiwsabUPzeCckcZggw/Q9yB+D22G20f
 w35w==
X-Gm-Message-State: AOAM531o9JMGn+i7dkXZHOqMsnn5ie+HteubpnF4OULHmZxDIV8Wee4N
 7hT3VB9ND/bPonFcVI/yFDLGK3HHyTfX7asISqwFEDisE0QB/564jOXbIjT2yg9zALQpLcHF12X
 5LvlWme5y2rFvG98=
X-Received: by 2002:a05:6402:17ac:: with SMTP id
 j12mr29293189edy.31.1605775966534; 
 Thu, 19 Nov 2020 00:52:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxagmxkbHG8hYW2VI/qMoQQqofstb2LRawPPfZ3xzGhheM3/GzmguK0d9IJNvcXyzfsCxhxbA==
X-Received: by 2002:a05:6402:17ac:: with SMTP id
 j12mr29293166edy.31.1605775966272; 
 Thu, 19 Nov 2020 00:52:46 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f7sm3291214ejd.13.2020.11.19.00.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 00:52:45 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC v3 23/23] i386: provide simple 'hyperv=on' option to
 x86 machine types
In-Reply-To: <20201118222526.GQ1509407@habkost.net>
References: <20201009121842.1938010-1-vkuznets@redhat.com>
 <20201009121842.1938010-24-vkuznets@redhat.com>
 <20201118222526.GQ1509407@habkost.net>
Date: Thu, 19 Nov 2020 09:52:44 +0100
Message-ID: <87y2ixu3s3.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Fri, Oct 09, 2020 at 02:18:42PM +0200, Vitaly Kuznetsov wrote:
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
>
> This patch seems to be especially useful, and I wonder if we
> could make sure this is included before all the rest of the
> series.  Especially considering that the KVM changes might take a
> while to be merged.

The required KVM changes are queued for 5.11 and I was delaying next
submission till then.

>
> Would you be able to submit this independently from the rest of
> the series?  You can add my:
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> My only (minor) suggestion is to rename
> X86MachineClass.hyperv_features to
> X86MachineClass.default_hyperv_features.

Sure, will do. I'll probably pick a few small patches from the series
(e.g. the one bringing x86_cpu_hyperv_realize()) to minimize the code
churn in the future.

>
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
>> index 3137a2008588..eeecd4e3322f 100644
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
>> @@ -1193,6 +1207,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>>      x86mc->save_tsc_khz = true;
>>      nc->nmi_monitor_handler = x86_nmi;
>>  
>> +    /* Hyper-V features enabled with 'hyperv=on' */
>> +    x86mc->hyperv_features = BIT(HYPERV_FEAT_RELAXED) | BIT(HYPERV_FEAT_VAPIC) |
>> +        BIT(HYPERV_FEAT_TIME) | BIT(HYPERV_FEAT_CRASH) |
>> +        BIT(HYPERV_FEAT_RESET) | BIT(HYPERV_FEAT_VPINDEX) |
>> +        BIT(HYPERV_FEAT_RUNTIME) | BIT(HYPERV_FEAT_SYNIC) |
>> +        BIT(HYPERV_FEAT_STIMER) | BIT(HYPERV_FEAT_FREQUENCIES) |
>> +        BIT(HYPERV_FEAT_REENLIGHTENMENT) | BIT(HYPERV_FEAT_TLBFLUSH) |
>> +        BIT(HYPERV_FEAT_EVMCS) | BIT(HYPERV_FEAT_IPI) |
>> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
>> +
>>      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>>          x86_machine_get_smm, x86_machine_set_smm,
>>          NULL, NULL);
>> @@ -1204,6 +1228,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
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
>> index d5dcf7a07fdc..2b989e5fc49d 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -38,6 +38,9 @@ struct X86MachineClass {
>>      bool save_tsc_khz;
>>      /* Enables contiguous-apic-ID mode */
>>      bool compat_apic_id_mode;
>> +
>> +    /* Hyper-V features enabled with 'hyperv=on' */
>> +    uint64_t hyperv_features;
>>  };
>>  
>>  struct X86MachineState {
>> @@ -70,10 +73,14 @@ struct X86MachineState {
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
>> index 55706c8050fe..d0961c1838ad 100644
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
>> @@ -6409,8 +6410,21 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>  
>>  static void x86_cpu_hyperv_realize(X86CPU *cpu)
>>  {
>> +    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
>> +    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
>> +    uint64_t feat;
>>      size_t len;
>>  
>> +    if (x86ms->hyperv_enabled) {
>> +        feat = x86mc->hyperv_features;
>> +        /* Enlightened VMCS is only available on Intel/VMX */
>> +        if (!cpu_has_vmx(&cpu->env)) {
>> +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
>> +        }
>> +
>> +        cpu->hyperv_features |= feat;
>> +    }
>> +
>>      /* Hyper-V vendor id */
>>      if (!cpu->hyperv_vendor) {
>>          object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
>> -- 
>> 2.25.4
>> 

-- 
Vitaly


