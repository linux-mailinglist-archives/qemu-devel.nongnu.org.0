Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1C2E019F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:43:02 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krS1F-0006b8-CF
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1krRye-0004XB-0R
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1krRyS-000518-U9
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608583202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGre0Rt4KQL0ozBxKFZQAewgX9K7vtvG8f+CzwLzMMM=;
 b=F7eL3oOdfnoNwGtt62GB8JR/K6dyz4QkL5U3L3EEFtjZYNb2xMZvNKzJS59cxz8BDnkb9H
 aibhOQ+77xQEZvgtdXTR1Aft/JV5XLW3cyVdi9y4sLmio+Oh9lkDufGoQomneiwXb+1TVd
 km4Hk15ZvJwo/udgcz4AvosFqjsVVvU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-xqNH0huOPHixpLybg7WGLg-1; Mon, 21 Dec 2020 15:40:01 -0500
X-MC-Unique: xqNH0huOPHixpLybg7WGLg-1
Received: by mail-wr1-f72.google.com with SMTP id r11so9630567wrs.23
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=blasLLPLdSgnW6L4mOpxxpJIiJzOoP1mATbRXNHrOOE=;
 b=MtyxOVwyutoWVx8+qxNsUZxWLTfysGGiR806qDEVN7ZUTX3p1MS6Z1aPUXBIVh/Zcj
 XYOFWRVrWzvBLJJu+YTwayASUrT4BadxT51Fx8vBvjJXiypDIeDMLLYneh9Bcibj5j9+
 O6uE22EkOhqm7FsH1ouJxdllR6bt9zD4Mer0i+qnqI96vFqA/y8eACGWrGm6VPJ8Y7yw
 DpPGHMObowVVAysxO7X/XKhIKNMR8retayIfl7KxBYNtWiE7z6ztAHo3xjM+//5WFyut
 6y9hOXj5+0yKdDpS8XEvGJNQGY/rxMMruiNutnA5gJHUjC7I3mOJoV4jxE55w6sNtO44
 Ic/Q==
X-Gm-Message-State: AOAM531PrgBIkXg0v9oCWfE9lOycdkfaiOZnXX7jp+Nq3NO09R6FP81I
 DtM5VtZCvIxDFN1gyPPthf6IFdKhWb1qrFyUM1PIyrCELr4rKNtWEszGIFtfetp/Lh8Jo5vTC1H
 ekHr8BzHOwL0DoeA=
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr20411621wrt.287.1608583198934; 
 Mon, 21 Dec 2020 12:39:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdymlPJqucXKgRetlfNGP2FBCI2a4TxEIPCogenoibIug+zQn2+bKYNt3bC90IRDoGoF9QGg==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr20411589wrt.287.1608583198650; 
 Mon, 21 Dec 2020 12:39:58 -0800 (PST)
Received: from [192.168.3.108] (p5b0c65c5.dip0.t-ipconnect.de. [91.12.101.197])
 by smtp.gmail.com with ESMTPSA id q15sm25993833wrw.75.2020.12.21.12.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:39:57 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Date: Mon, 21 Dec 2020 21:39:56 +0100
Message-Id: <F3397471-9C42-4FAA-B793-C853DEBF3C56@redhat.com>
References: <20201221194743.GD6040@habkost.net>
In-Reply-To: <20201221194743.GD6040@habkost.net>
To: Eduardo Habkost <ehabkost@redhat.com>
X-Mailer: iPhone Mail (18C66)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 21.12.2020 um 20:47 schrieb Eduardo Habkost <ehabkost@redhat.com>:
>=20
> =EF=BB=BF+s390 maintainers, a question about feature groups below:
>=20
>> On Mon, Dec 21, 2020 at 02:24:18PM +0100, Igor Mammedov wrote:
>> On Fri, 18 Dec 2020 13:07:21 -0500
>> Eduardo Habkost <ehabkost@redhat.com> wrote:
>>=20
>>> On Fri, Dec 18, 2020 at 06:13:40PM +0100, Igor Mammedov wrote:
>>>> On Wed, 16 Dec 2020 15:52:02 -0500
>>>> Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>=20
>>>>> On Thu, Nov 19, 2020 at 11:32:21AM +0100, Vitaly Kuznetsov wrote: =20
>>>>>> Enabling Hyper-V emulation for a Windows VM is a tiring experience a=
s it
>>>>>> requires listing all currently supported enlightenments ("hv_*" CPU
>>>>>> features) explicitly. We do have a 'hv_passthrough' mode enabling
>>>>>> everything but it can't be used in production as it prevents migrati=
on.
>>>>>>=20
>>>>>> Introduce a simple 'hyperv=3Don' option for all x86 machine types en=
abling
>>>>>> all currently supported Hyper-V enlightenments. Later, when new
>>>>>> enlightenments get implemented, we will be adding them to newer mach=
ine
>>>>>> types only (by disabling them for legacy machine types) thus preserv=
ing
>>>>>> migration.
>>>>>>=20
>>>>>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>>>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>   =20
> [...] =20
>>>>>> @@ -1194,6 +1208,16 @@ static void x86_machine_class_init(ObjectClas=
s *oc, void *data)
>>>>>>     x86mc->save_tsc_khz =3D true;
>>>>>>     nc->nmi_monitor_handler =3D x86_nmi;
>>>>>>=20
>>>>>> +    /* Hyper-V features enabled with 'hyperv=3Don' */
>>>>>> +    x86mc->default_hyperv_features =3D BIT(HYPERV_FEAT_RELAXED) |
>>>>>> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>>>>>> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>>>>>> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>>>>>> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>>>>>> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENM=
ENT) |
>>>>>> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
>>>>>> +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT); =20
>>>> I'd argue that feature bits do not belong to machine code at all.
>>>> If we have to involve machine at all then it should be a set property/=
value pairs
>>>> that machine will set on CPU object (I'm not convinced that doing it
>>>> from machine code is good idea though). =20
>>>=20
>>> The set of default hyperv features needs be defined by the
>>> machine type somehow, we can't avoid that.
>>>=20
>>> You are correct that the policy could be implemented using
>>> compat_props, but I don't think we should block a patch just
>>> because we're not using a pure QOM property-based interface to
>>> implement that.
>> I'm fine with 1-4/5 patches but not with this one.
>> With this patch I don't agree with inventing
>> special semantics to property handling when it could
>> be done in a typical and consistent way (especially for
>> the sake of convenience).
>>=20
>>=20
>>> We need the external interface to be good, though:
>>>=20
>>>>=20
>>> [...]
>>>>>> static void x86_cpu_hyperv_realize(X86CPU *cpu)
>>>>>> {
>>>>>> +    X86MachineState *x86ms =3D X86_MACHINE(qdev_get_machine());
>>>>>> +    X86MachineClass *x86mc =3D X86_MACHINE_GET_CLASS(x86ms);
>>>>>> +    uint64_t feat;
>>>>>>     size_t len;
>>>>>>=20
>>>>>> +    if (x86ms->hyperv_enabled) {
>>>>>> +        feat =3D x86mc->default_hyperv_features;
>>>>>> +        /* Enlightened VMCS is only available on Intel/VMX */
>>>>>> +        if (!cpu_has_vmx(&cpu->env)) {
>>>>>> +            feat &=3D ~BIT(HYPERV_FEAT_EVMCS);
>>>>>> +        }
>>>>>> +
>>>>>> +        cpu->hyperv_features |=3D feat; =20
>>>> that will ignore features user explicitly doesn't want,
>>>> ex:
>>>> -machine hyperv=3Don -cpu foo,hv-foo=3Doff =20
>>>=20
>>> Oops, good point.
>>>=20
>>>=20
>>>>=20
>>>> not sure we would like to introduce such invariant,
>>>> in normal qom property handling the latest set property should have ef=
fect
>>>> (all other invariants we have in x86 cpu property semantics are commin=
g from legacy handling
>>>> and I plan to deprecate them (it will affect x86 and sparc cpus) so CP=
Us will behave like
>>>> any other QOM object when it come to property handling)
>>>>=20
>>>> anyways it's confusing a bit to have cpu flags to come from 2 differen=
t places
>>>>=20
>>>> -cpu hyperv-use-preset=3Don,hv-foo=3Doff
>>>>=20
>>>> looks less confusing and will heave expected effect
>>>>=20
>>>>>> +    }   =20
>>>>>=20
>>>>> I had to dequeue this because it doesn't compile with
>>>>> CONFIG_USER_ONLY:
>>>>>=20
>>>>> https://gitlab.com/ehabkost/qemu/-/jobs/916651017
>>>>>=20
>>>>> The easiest solution would be to wrap the new code in #ifndef
>>>>> CONFIG_USER_ONLY, but maybe we should try to move all
>>>>> X86Machine-specific code from cpu.c to
>>>>> hw/i386/x86.c:x86_cpu_pre_plug(). =20
>>>> this looks to me like a preset of feature flags that belongs to CPU,
>>>> and machine code here only as a way to version subset of CPU features.
>>>>=20
>>>> Is there a way to implement it without modifying machine? =20
>>>=20
>>> Maybe there is, but why modifying machine is a problem?
>>=20
>> 1. it doesn't let do the job properly (realize time is too late)
>> 2. unnecessarily pushes CPU specific logic to machine code,
>>   it just doesn't belong there.
>>   Sure we can do that here, then some where else and in the end
>>   code becomes unmanageable mess.
>>=20
>>> I agree the interface needs to be clear and consistent, though.
>>> Maybe making it a -cpu option would make this clearer and more
>>> consistent.
>>>=20
>>>>=20
>>>> for example versioned CPUs or maybe something like this:
>>>>=20
>>>> for CLI:
>>>> -cpu hyperv-use-preset=3Don,hv-foo=3Doff =20
>>>=20
>>> In either case, we must clearly define what should happen if the
>>> preset is (HYPERV_FEAT_X | HYPERV_FEAT_Y), and the command line
>>> has:
>>>=20
>>>  -cpu foo,hv-A=3Don,hv-X=3Doff,hyperv-use-preset=3Don,hv-B=3Don,hv-Y=3D=
off
>>=20
>> current x86 cpu code (it doesn't have typical properties handling
>> for keeping legacy semantics), it will basically reorder all features
>> with 'off' value to the end, so hv-X=3Doff will still have an effect.
>>=20
>> However I plan to deprecate those reordering semantics (x86/sparc cpus),
>> to make it consistent with typical property handling
>> (last set value overwrites any previously set one).
>>=20
>> That will let us drop custom parsing of -cpu (quite a bit of code) and
>> more importantly make it consistent with -device/device_add cpu-foo.
>=20
> Right.
>=20
>>=20
>>=20
>>> or:
>>>=20
>>>  -machine hyperv=3Don -cpu foo,hv-A=3Don,hv-X=3Doff,hv-B=3Don,hv-X=3Dof=
f
>>>=20
>>> Personally, I don't care what the rules are, as long as: 1) they
>>> are clearly defined and documented; 2) they support the use cases
>>> we need to support.
>>=20
>> I'd like to stick with typical property handling rules, and resort to
>> inventing/using other invariant only if there is no other choice.
>=20
> What would be the typical handling rules, in this case?  I don't
> remember other cases in x86 where a single property affects
> multiple feature flags.
>=20
> We have something similar on s390x, though.  So, a question to
> s390x maintainers:
>=20
> If "G" is a feature group including the features X, Y, Z, what is
> the result of:
>=20
>   -cpu foo,X=3Doff,G=3Don,Y=3Doff
>=20
> Would X be enabled?  Would Y be enabled?
>=20
> I would expect X to be enabled and Y to be disabled, but I'd like
> to confirm.

IIRC, the last one wins. Properties are applied left to right.


