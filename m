Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A638E63E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:06:44 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9M4-0002nF-0f
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9Kr-00026J-Kj
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9Ko-0005x1-Q7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621857925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fucYAhgCd1b3xtArrJB4k0H/0gejusWKBkwmBN45KHQ=;
 b=Jr6CkDPhxJBlD5x0t9U1ojp47l3q1I7WgAJUytjFPO/9qULnShIf2o/Df3m5MJ31u/vqEE
 kSmMP2Tji8msfJTkj4JGVutysUNKro1akMg2tqqQFFl4B13Q2P0n6DZKThgoh4OFDveBwB
 qCiuQBp7NOT+pnPc2lFC7DGADYR59Gs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-m7LOAOcIPxGpTt-h1WTTXA-1; Mon, 24 May 2021 08:05:24 -0400
X-MC-Unique: m7LOAOcIPxGpTt-h1WTTXA-1
Received: by mail-wr1-f71.google.com with SMTP id
 7-20020adf95070000b02901104ad3ef04so13028973wrs.16
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=psoDmTsISyI7cVPCsyprfCjp2PL9W/bmzs3HnwGksXc=;
 b=UH8kP4b9nt1wf91r7EUXEQRUubjhTrQuu+ruk+ExCgoaEK5W0D8uKiRjiYMFvYUA6W
 MNvPWQwf+fGu/FSBQ7fYYmnfK6aDAoclCAd6/ZOuMM85ROOI7GL3sLVxVVnEGdAz+d0S
 lrqXKcP5Wqb0pHwBmgbfr3S4sdZRw7+kS1MOQxLrg+a4s1f8tJZGQEyrO5G5yb95r2Xg
 noupEzBiAtxeOo5HtA587S30hNcUemU1zO1DjQ1bnJCiNcq7YA865Cktqads/Svvb1ES
 nODn1EYOK3sIt3eEjQwdl8e8CGwtIzm0ZDmRJrrY+TX5XBUMBce/Yb55VkcEVQnCpCct
 4+4Q==
X-Gm-Message-State: AOAM531CIqMhK4n6mrZuxQwPXGt4J/bI0+RDUFcBxqdmcn5FVXoJTfHC
 lQZfe5qm73WEEVvjGAQeYhqnZWqAW1WnG3te/efsEp8HPSs8sqQjWFxUvvYx6C4bGaky5/G53Zb
 czHlwuGJNyXD/eIo=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr21490853wrd.21.1621857923125; 
 Mon, 24 May 2021 05:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuT6enPlff1McobKxg5hEuKQLKZYQTMMaOh7pxZSPR4fFezRmvkuC/ZpHQ1l5QmranHuuc/g==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr21490828wrd.21.1621857922866; 
 Mon, 24 May 2021 05:05:22 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id h15sm7448178wmq.1.2021.05.24.05.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:05:22 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 11/19] i386: switch hyperv_expand_features() to using
 error_setg()
In-Reply-To: <20210521213724.yfseimdet4uv3kj7@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-12-vkuznets@redhat.com>
 <20210521213724.yfseimdet4uv3kj7@habkost.net>
Date: Mon, 24 May 2021 14:05:21 +0200
Message-ID: <87k0no72wu.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 22, 2021 at 06:11:22PM +0200, Vitaly Kuznetsov wrote:
>> Use standard error_setg() mechanism in hyperv_expand_features().
>>=20
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> No objections, but only suggestions below:
>
>> ---
>>  target/i386/kvm/kvm.c | 101 +++++++++++++++++++++++++-----------------
>>  1 file changed, 61 insertions(+), 40 deletions(-)
>>=20
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index a2ef2dc154a2..f33ba325187f 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1135,7 +1135,7 @@ static bool hyperv_feature_supported(CPUState *cs,=
 int feature)
>>      return true;
>>  }
>> =20
>> -static int hv_cpuid_check_and_set(CPUState *cs, int feature)
>> +static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **er=
rp)
>
> If changing the function signature, and the function only returns 0 or 1,=
 maybe
> it's a good opportunity to change to a bool return value format?
>
> From include/qapi/error.h:
>
>  * - Whenever practical, also return a value that indicates success /
>  *   failure.  This can make the error checking more concise, and can
>  *   avoid useless error object creation and destruction.  Note that
>  *   we still have many functions returning void.  We recommend
>  *   =E2=80=A2 bool-valued functions return true on success / false on fa=
ilure,
>  *   =E2=80=A2 pointer-valued functions return non-null / null pointer, a=
nd
>  *   =E2=80=A2 integer-valued functions return non-negative / negative.
>
>
>>  {
>>      X86CPU *cpu =3D X86_CPU(cs);
>>      uint64_t deps;
>> @@ -1149,20 +1149,18 @@ static int hv_cpuid_check_and_set(CPUState *cs, =
int feature)
>>      while (deps) {
>>          dep_feat =3D ctz64(deps);
>>          if (!(hyperv_feat_enabled(cpu, dep_feat))) {
>> -                fprintf(stderr,
>> -                        "Hyper-V %s requires Hyper-V %s\n",
>> -                        kvm_hyperv_properties[feature].desc,
>> -                        kvm_hyperv_properties[dep_feat].desc);
>> -                return 1;
>> +            error_setg(errp, "Hyper-V %s requires Hyper-V %s",
>> +                       kvm_hyperv_properties[feature].desc,
>> +                       kvm_hyperv_properties[dep_feat].desc);
>> +            return 1;
>>          }
>>          deps &=3D ~(1ull << dep_feat);
>>      }
>> =20
>>      if (!hyperv_feature_supported(cs, feature)) {
>>          if (hyperv_feat_enabled(cpu, feature)) {
>> -            fprintf(stderr,
>> -                    "Hyper-V %s is not supported by kernel\n",
>> -                    kvm_hyperv_properties[feature].desc);
>> +            error_setg(errp, "Hyper-V %s is not supported by kernel",
>> +                       kvm_hyperv_properties[feature].desc);
>>              return 1;
>>          } else {
>>              return 0;
>> @@ -1209,13 +1207,12 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs=
, uint32_t func, int reg)
>>   * of 'hv_passthrough' mode and fills the environment with all supporte=
d
>>   * Hyper-V features.
>>   */
>> -static int hyperv_expand_features(CPUState *cs)
>> +static void hyperv_expand_features(CPUState *cs, Error **errp)
>
> Same as above: returning a value to indicate error is preferred.  If you =
are no
> longer returning an integer error code, I suggest returning bool instead.
>

hv_cpuid_check_and_set() is eliminated later in the series but
hyperv_expand_features() stays, I can make it bool.


>>  {
>>      X86CPU *cpu =3D X86_CPU(cs);
>> -    int r;
>> =20
>>      if (!hyperv_enabled(cpu))
>> -        return 0;
>> +        return;
>> =20
>>      if (cpu->hyperv_passthrough) {
>>          cpu->hyperv_vendor_id[0] =3D
>> @@ -1262,37 +1259,60 @@ static int hyperv_expand_features(CPUState *cs)
>>      }
>> =20
>>      /* Features */
>> -    r =3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI);
>> -    r |=3D hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT);
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED, errp)) {
>> +        return;
>> +    }
>
> What about a loop?
>
>     for (feat =3D 0; feat < ARRAY_SIZE(kvm_hyperv_properties); feat++) {
>         if (hv_cpuid_check_and_set(cs, feat, errp)) {
>             return;
>         }
>     }
>

This is done later in the series ("i386: kill off hv_cpuid_check_and_set()"=
).

>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT, errp)) =
{
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
>> +        return;
>> +    }
>> +    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT, errp)) {
>> +        return;
>> +    }
>> =20
>>      /* Additional dependencies not covered by kvm_hyperv_properties[] *=
/
>>      if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
>>          !cpu->hyperv_synic_kvm_only &&
>>          !hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
>> -        fprintf(stderr, "Hyper-V %s requires Hyper-V %s\n",
>> -                kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
>> -                kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
>> -        r |=3D 1;
>> -    }
>> -
>> -    if (r) {
>> -        return -ENOSYS;
>> +        error_setg(errp, "Hyper-V %s requires Hyper-V %s",
>> +                   kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
>> +                   kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
>>      }
>> -
>> -    return 0;
>>  }
>> =20
>>  /*
>> @@ -1527,9 +1547,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      env->apic_bus_freq =3D KVM_APIC_BUS_FREQUENCY;
>> =20
>>      /* Paravirtualization CPUIDs */
>> -    r =3D hyperv_expand_features(cs);
>> -    if (r < 0) {
>> -        return r;
>> +    hyperv_expand_features(cs, &local_err);
>> +    if (local_err) {
>> +        error_report_err(local_err);
>> +        return -ENOSYS;
>>      }
>> =20
>>      if (hyperv_enabled(cpu)) {
>
> I don't want to block this series because of the suggestions above, so:
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> But I still encourage you to implement those suggestions, anyway.

'Loop' idea is already implemented and hv_cpuid_check_and_set() is gone
but I'll remember to make hyperv_expand_features() bool. Thanks!

--=20
Vitaly


