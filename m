Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0019319B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 09:51:10 +0100 (CET)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUAP-0002AB-Nh
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 03:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAU9D-0001hC-Ut
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAU9A-0007Ct-9P
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613119790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QZA/GejRySRuOZHt24nCJ6j8eu0a6098hmPHwE6lUAA=;
 b=RH9jbrJ/+whi/W98q75ZJoGRoofI1rCeRJsffUte/QqJUPxYJyTsYq+a1+XSjjDBoqL5mg
 IaXufoAZgDikiOKPoI5vXA7IMdUsRYf/mL8TzcBhSqk+5y2K5M8V88srXAzV5g0hHLa+Js
 p2KtaeKWQykCVo83rncvGaRHNmGBTA4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-PWBgGvYuN6CXz2q5DznumA-1; Fri, 12 Feb 2021 03:49:48 -0500
X-MC-Unique: PWBgGvYuN6CXz2q5DznumA-1
Received: by mail-ej1-f72.google.com with SMTP id p1so6379728ejo.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 00:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=QZA/GejRySRuOZHt24nCJ6j8eu0a6098hmPHwE6lUAA=;
 b=rUIjLHBOTfkJY0uWJddSqM3y1MtqQ+b4VrNsVjAURyepdgmd3rA9qIjntgUiFKvhB3
 5ZHq65ur737BFsZ+Wtu4EdDLQthscXVLJUw0vXdDytwhXswE5umJ/eUReeX3Ihg92ugR
 4aIoqdN7fImPlgo3kyI2cRQQqtiJvCm2UwnWiSMts2Dv8EBi5V2WjlC58BMfDMu17HO/
 fwUp6Lx8f5q0pTB5icR/QPl8pIn2Xmq2jQpOUym3UYybZ2krtpTTno272SM8HfGSIBmL
 4pgPWMTY+spR02jDp8jVsSoLy+9d5nttUFyr+4UNC8gsmhsIfe66C+/mN8RQtn6MPTi3
 EzDg==
X-Gm-Message-State: AOAM531yj95YH338brbzbOwPJQ2/OE9QZUU7321alqACfPTfHccWhCU5
 qJzeH6z4Qsx+YVb9N9js/lYV6AvKAJ9yLHzhsFM3Ezd7+kd99U88NPT4+g/NVKtNpTVxqi6WALM
 aAtYtC5oasANirzE=
X-Received: by 2002:a17:906:17d7:: with SMTP id
 u23mr2005313eje.390.1613119787705; 
 Fri, 12 Feb 2021 00:49:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBdpav8QTnpRKYmaOWcF5i/pE/zg6+kWQkYngsfwfTl1ePiCOZLl8HoIT7g6QAtDLnXyHHTw==
X-Received: by 2002:a17:906:17d7:: with SMTP id
 u23mr2005304eje.390.1613119787566; 
 Fri, 12 Feb 2021 00:49:47 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id t23sm6023720ejs.4.2021.02.12.00.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 00:49:47 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 17/21] i386: support 'hv-passthrough, hv-feature=off'
 on the command line
In-Reply-To: <20210211181459.08f14c22@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-18-vkuznets@redhat.com>
 <20210211181459.08f14c22@redhat.com>
Date: Fri, 12 Feb 2021 09:49:46 +0100
Message-ID: <87r1llllg5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 10 Feb 2021 17:40:29 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Currently, we support 'hv-passthrough,hv-feature=on' enablement, this
>> is supposed to mean "hv-feature is mandatory, don't start without it". Add
>> support for 'hv-passthrough,hv-feature=off' meaning "enable everything
>> supported by the host except for hv-feature".
>> 
>> While on it, make 'hv-passthrough' parse semantics in-line with other
>> options in qemu: when specified, it overrides what was previously set with
>> what's supported by the host. This can later be modified with 'hv-feature=on'/
>> 'hv-feature=off'.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/cpu.c     | 28 +++++++++++++++++++++++++++-
>>  target/i386/kvm/kvm.c |  4 ++++
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index e8a004c39d04..f8df2caed779 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4725,6 +4725,29 @@ static void x86_hv_stimer_direct_set(Object *obj, bool value, Error **errp)
>>      x86_hv_feature_set(obj, value, HYPERV_FEAT_STIMER_DIRECT);
>>  }
>>  
>> +static bool x86_hv_passthrough_get(Object *obj, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    return cpu->hyperv_passthrough;
>> +}
>> +
>> +static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    cpu->hyperv_passthrough = value;
>> +
>> +    /* hv-passthrough overrides everything with what's supported by the host */
>> +    if (value) {
>> +        cpu->hyperv_features = 0;
>> +        cpu->hyperv_features_on = 0;
>> +        cpu->hyperv_features_off = 0;
>
> why do we have _on|_off fields?
>

You mean 'why do we have them at all' or 'why do we reset them here'?
For the former, we need to distinguish between
'hv-passthroug,hv-feature=off' and just 'hv-passthrough';
'hv-passthrough,hv-evmcs=on' and just 'hv-passthrough'. For the later,
I'd like to make the samentics you've asked for:
'hv-feature,hv-passthrough' == 'hv-passthrough'
(though I still see it as a gotcha for an unprepared user)


>> +    }
>> +
>> +    return;
>> +}
>> +
>>  /* Generic getter for "feature-words" and "filtered-features" properties */
>>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>>                                        const char *name, void *opaque,
>> @@ -7281,7 +7304,6 @@ static Property x86_cpu_properties[] = {
>>                         HYPERV_SPINLOCK_NEVER_NOTIFY),
>>      DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
>>                              hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
>> -    DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
>>  
>>      DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
>>      DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
>> @@ -7460,6 +7482,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>                                     x86_hv_stimer_direct_get,
>>                                     x86_hv_stimer_direct_set);
>>  
>> +    object_class_property_add_bool(oc, "hv-passthrough",
>> +                                   x86_hv_passthrough_get,
>> +                                   x86_hv_passthrough_set);
>> +
>>      for (w = 0; w < FEATURE_WORDS; w++) {
>>          int bitnr;
>>          for (bitnr = 0; bitnr < 64; bitnr++) {
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 30013f0d7cee..fca088d4d3b5 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1153,6 +1153,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
>>          return 0;
>>      }
>>  
>> +    if (cpu->hyperv_passthrough && (cpu->hyperv_features_off & BIT(feature))) {
>> +        return 0;
>> +    }
>> +
>>      deps = kvm_hyperv_properties[feature].dependencies;
>>      while (deps) {
>>          dep_feat = ctz64(deps);
>

-- 
Vitaly


