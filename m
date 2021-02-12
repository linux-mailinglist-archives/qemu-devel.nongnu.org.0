Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18150319B80
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 09:53:36 +0100 (CET)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUCl-0003Hp-6Q
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 03:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAUBQ-0002rf-CK
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAUBO-0008Kk-GZ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613119929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwpV2vKnnvZyG9pwwjjN2pFD2cF/7hddyMcR7DQPDfM=;
 b=TIDP6ublm3iQ3/bBD+Hfdba26RFc+9SUYLyVtzclTxURVuwqLAUPX/QK6mQAJpLn155iFf
 Nx6doVlWtWwlcYCBZF4fWvnwfOUu9cN3/TDXGww6p4DX4vV8uq3bYWkt/X/TpkLDZ8SWZL
 ywWgRbI4YaPeZ6bmBQl44pxUUkP5ZTI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-cLCX0to2OEqPMuJY6mP91Q-1; Fri, 12 Feb 2021 03:52:07 -0500
X-MC-Unique: cLCX0to2OEqPMuJY6mP91Q-1
Received: by mail-ed1-f70.google.com with SMTP id f21so6195778edx.10
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 00:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OwpV2vKnnvZyG9pwwjjN2pFD2cF/7hddyMcR7DQPDfM=;
 b=J2Yq3SmslAK9qRAR6AsD86stnON5AepEEnyUunOzptimTbnyhSnhRD37uIPfJ1lGoU
 AZixVXAjLt/HaF+TnY2yJY3lmSzmGIJ2NOMzQIiJTViwju9SsFCbqgeCsAJaOPHvU6BM
 TTaTsZgq3tem/NDZRrieIRe38sMGUWaK5Wzca9Rzu+bdiutWC/2huKhvldAUbv/x4W1K
 5DzAqx6vNJCw35BHMGEgt0hS6ReGkzkOqiIhpltjWK+1UDhCBuVTmj/Jw1TiqX2cHbwe
 2AQBmu7FC8m0riehLqTPuZT/h2oNdfHfxO6UZWaJtxgrVNTzBl1Xm5Q8fHm9VJ2Lflvp
 VNuA==
X-Gm-Message-State: AOAM533+F8Qgmlf/XfTKUt66BNLiMQa0Zy2EXc0sr9QZ1hZUheoqY3jk
 7fLBh4gCQxrLt2+yM+P4hMv5DNVvB73Sa53ZhwLH6Irfx1dW/2sSUkSWFTbZFaP1IVzfEgEOoJC
 iSTbkX0yq2htgrKk=
X-Received: by 2002:a50:d51d:: with SMTP id u29mr2227678edi.167.1613119926550; 
 Fri, 12 Feb 2021 00:52:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLePnxwVuh+j/PPlmoMajrT1LmZERq6PjChJ803Ot0orfueywGfUCs8GbwdRItv4Yfr94sbA==
X-Received: by 2002:a50:d51d:: with SMTP id u29mr2227655edi.167.1613119926232; 
 Fri, 12 Feb 2021 00:52:06 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id u17sm6075532ejr.59.2021.02.12.00.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 00:52:05 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 20/21] i386: provide simple 'hv-default=on' option
In-Reply-To: <20210211182337.209986c1@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-21-vkuznets@redhat.com>
 <20210211182337.209986c1@redhat.com>
Date: Fri, 12 Feb 2021 09:52:05 +0100
Message-ID: <87o8gpllca.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 10 Feb 2021 17:40:32 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
>> requires listing all currently supported enlightenments ("hv-*" CPU
>> features) explicitly. We do have 'hv-passthrough' mode enabling
>> everything but it can't be used in production as it prevents migration.
>> 
>> Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
>> Hyper-V enlightenments. Later, when new enlightenments get implemented,
>> compat_props mechanism will be used to disable them for legacy machine types,
>> this will keep 'hv-default=on' configurations migratable.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  docs/hyperv.txt   | 16 ++++++++++++---
>>  target/i386/cpu.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
>>  target/i386/cpu.h |  3 +++
>>  3 files changed, 68 insertions(+), 3 deletions(-)
>> 
>> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> index 5df00da54fc4..a54c066cab09 100644
>> --- a/docs/hyperv.txt
>> +++ b/docs/hyperv.txt
>> @@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
>>  
>>  2. Setup
>>  =========
>> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
>> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
>> +All currently supported Hyper-V enlightenments can be enabled by specifying
>> +'hv-default=on' CPU flag:
>>  
>> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
>> +
>> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
>> +e.g:
>> +
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...
>> +
>> +It is also possible to disable individual enlightenments from the default list,
>> +this can be used for debugging purposes:
>> +
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
>>  
>>  Sometimes there are dependencies between enlightenments, QEMU is supposed to
>>  check that the supplied configuration is sane.
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index f8df2caed779..013aa60272d8 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4736,6 +4736,12 @@ static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>>  {
>>      X86CPU *cpu = X86_CPU(obj);
>>  
>> +    if (cpu->hyperv_default) {

^^^ here ^^^

>> +        error_setg(errp,
>> +                   "'hv-default' and 'hv-paththrough' are mutually exclusive");
>> +        return;
>> +    }
>> +
>>      cpu->hyperv_passthrough = value;
>>  
>>      /* hv-passthrough overrides everything with what's supported by the host */
>> @@ -4748,6 +4754,33 @@ static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>>      return;
>>  }
>>  
>> +static bool x86_hv_default_get(Object *obj, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    return cpu->hyperv_default;
>> +}
>> +
>> +static void x86_hv_default_set(Object *obj, bool value, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    if (cpu->hyperv_passthrough) {
>> +        error_setg(errp,
>> +                   "'hv-default' and 'hv-paththrough' are mutually exclusive");
> this check will work only half way, i.e.: hv-paththrough=on,hv-default=on|off
> (where off value looks a bit wierd)
> but not other way around: hv-default=on,hv-paththrough=on

The check in x86_hv_passthrough_set() chechs the opposite scenario.

>
> were you thinking about following error:
>   "hv-default can't be used after hv-paththrough were enabled"
>
> or if it symmetric, then putting this check in realizefn() will do the job
> as both properties are processed by that time.

I can move the check there but I think that two checks I add here cover
what we need (and we don't need to care what to set 'hyperv_features' to
in the interim).

>
>> +        return;
>> +    }
>> +
>> +    cpu->hyperv_default = value;
>> +
>> +    /* hv-default overrides everything with the default set */
>> +    if (value) {
>> +        cpu->hyperv_features = cpu->hyperv_default_features;
>> +        cpu->hyperv_features_on = 0;
>> +        cpu->hyperv_features_off = 0;
>> +    }
>> +}
>> +
>>  /* Generic getter for "feature-words" and "filtered-features" properties */
>>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>>                                        const char *name, void *opaque,
>> @@ -7152,6 +7185,21 @@ static void x86_cpu_initfn(Object *obj)
>>      if (xcc->model) {
>>          x86_cpu_load_model(cpu, xcc->model);
>>      }
>> +
>> +    /* Hyper-V features enabled with 'hv-default=on' */
>> +    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
>> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
>> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
>> +
>> +    /* Enlightened VMCS is only available on Intel/VMX */
>> +    if (kvm_hv_evmcs_available()) {
>> +        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
>> +    }
>>  }
>>  
>>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
>> @@ -7486,6 +7534,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>                                     x86_hv_passthrough_get,
>>                                     x86_hv_passthrough_set);
>>  
>> +    object_class_property_add_bool(oc, "hv-default",
>> +                              x86_hv_default_get,
>> +                              x86_hv_default_set);
>> +
>>      for (w = 0; w < FEATURE_WORDS; w++) {
>>          int bitnr;
>>          for (bitnr = 0; bitnr < 64; bitnr++) {
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index b4fbd46f0fc9..59350e70fb51 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -1670,6 +1670,9 @@ struct X86CPU {
>>      uint64_t hyperv_features_on;
>>      uint64_t hyperv_features_off;
>>      bool hyperv_passthrough;
>> +    /* 'hv-default' enablement */
>> +    uint64_t hyperv_default_features;
>> +    bool hyperv_default;
>>      OnOffAuto hyperv_no_nonarch_cs;
>>      uint32_t hyperv_vendor_id[3];
>>      uint32_t hyperv_interface_id[4];
>

-- 
Vitaly


