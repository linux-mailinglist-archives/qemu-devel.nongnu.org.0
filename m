Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A138E687
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:25:12 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9dq-0008RV-Kn
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9bk-0007kU-9g
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9bh-0000Es-Jx
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621858972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+NSCsE764sHn/GxvJLbh9n9gDeOINc9j3ai3X//eHoU=;
 b=EBBRGZdRjxHCh6AWyp/AY6KLTQKJ2bo8Qm/tb3PWlMoJrkIfNIl5ktG256LsKBSXaI17ar
 AX/ckUdK6q27B48iQKrZHqjNWXrnlElgTaIULwQMsHS6vwilhubs7enO2J7UjvdOhMgggv
 6cbkkpm8zEKmKeYHyqXl8euI8pFLmpg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-rNlYN6WuOSiMXgFgiIyi9w-1; Mon, 24 May 2021 08:22:50 -0400
X-MC-Unique: rNlYN6WuOSiMXgFgiIyi9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so13050481wrp.15
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+NSCsE764sHn/GxvJLbh9n9gDeOINc9j3ai3X//eHoU=;
 b=j0R4ZopDiSekL54uOAa1BolFZkY+ScpEJfxVo7fjPaJuexlLEccRH23wmpszNKICba
 w+XkVv56wqiPse+YUpIUjI8L6qoNx3YT7LdC/tJ9V/cS2Pstwx3SkcLAHM/SK39xCPgl
 f20dm7komUNPEWko/nmNh9CWVWxStpwpYBKm6KTRnlzoDvWao55+yfHU3UjALJZm2PZb
 LeQhISxb23Tr1VI/h6GpzydFprc2RIb63G+OF2AiUwsWZ4J0Eyxs1nmzZ/7Zs8AOfCDI
 3qD9O4Eyn4kBY3uZdJkJJbfGRdd6EFDyg5FIWsAuxl9deXCOoP4JRcsER/Dpd+z0/N3M
 kccg==
X-Gm-Message-State: AOAM531yzfF704LP1KRZ0+IcFsxO+mLEj3AXyrX3oChog5vo59ZFd8wN
 C4MOcoTvKXzIHzksWYOgahT9RAkIahSdp1cgtgQ0LpIYcMR+dIZR1FjG1k10fTyK0Bmbec43Hbk
 d/mG2jcVMzZjak64=
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr21320224wrt.422.1621858969350; 
 Mon, 24 May 2021 05:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTuuf/3O7k4hUOKAGqJenFNh3DgMv6wECB5MifLSfAUoBQfwhB1SAWAZUPUTmHnElOH4PwhA==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr21320199wrt.422.1621858969108; 
 Mon, 24 May 2021 05:22:49 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f18sm6281252wmc.40.2021.05.24.05.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:22:48 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is
 always needed
In-Reply-To: <20210521220637.kg6g7lfvpwasnzez@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-18-vkuznets@redhat.com>
 <20210521220637.kg6g7lfvpwasnzez@habkost.net>
Date: Mon, 24 May 2021 14:22:47 +0200
Message-ID: <878s44723s.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

> On Thu, Apr 22, 2021 at 06:11:28PM +0200, Vitaly Kuznetsov wrote:
>> According to TLFS, Hyper-V guest is supposed to check
>> HV_HYPERCALL_AVAILABLE privilege bit before accessing
>> HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
>> Windows versions ignore that. As KVM is very permissive and allows
>> accessing these MSRs unconditionally, no issue is observed. We may,
>> however, want to tighten the checks eventually. Conforming to the
>> spec is probably also a good idea.
>> 
>> Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> Are all VMs being created with HV_HYPERCALL_AVAILABLE unset,
> today?
>

No, we have HV_HYPERCALL_AVAILABLE encoded in 'hv-relaxed','hv-vapic'
and 'hv-time' features but not 


> Wouldn't it be simpler to simply add a new
> HYPERV_FEAT_HYPERCALL_AVAILABLE bit to hyperv_features, and
> enabling it by default?
>

We could do that but as I note above, we already have it for three
features.


> We don't necessarily need to make it configurable by the user,
> but probably it would be a good idea to keep the bit unset by
> default on older machine types.  Even if guests don't mind seeing
> the bit changing under their feet, it would make it easier for
> automated test cases that check for unexpected changes in raw
> CPUID data.

I see current situation as a bug. While most likely nobody runs with
a configuration like 'hv-vpindex,hv-synic' it is still valid. And if KVM
was enforcing the features (not yet), Windows would've just crashed in
early boot. Normal configurations will likely always include at least
'hv-time' which has HYPERV_FEAT_HYPERCALL_AVAILABLE enabled.

That being said, I'm not sure we need to maintain 'bug compatibility'
even for older machine types. I'm also not aware of any specific tests
for such 'crazy' configurations out there. The last patch of the series
adds a very simple test to qtest but this is about it.

>
>
>> ---
>>  target/i386/kvm/kvm.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>> 
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 2c1a77f9b00f..d81451276cd8 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -835,6 +835,8 @@ static struct {
>>      [HYPERV_FEAT_CRASH] = {
>>          .desc = "crash MSRs (hv-crash)",
>>          .flags = {
>> +            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> +             .bits = HV_HYPERCALL_AVAILABLE},
>>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>>               .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
>>          }
>> @@ -843,28 +845,28 @@ static struct {
>>          .desc = "reset MSR (hv-reset)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_RESET_AVAILABLE}
>> +             .bits = HV_HYPERCALL_AVAILABLE | HV_RESET_AVAILABLE}
>>          }
>>      },
>>      [HYPERV_FEAT_VPINDEX] = {
>>          .desc = "VP_INDEX MSR (hv-vpindex)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_VP_INDEX_AVAILABLE}
>> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_INDEX_AVAILABLE}
>>          }
>>      },
>>      [HYPERV_FEAT_RUNTIME] = {
>>          .desc = "VP_RUNTIME MSR (hv-runtime)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_VP_RUNTIME_AVAILABLE}
>> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_RUNTIME_AVAILABLE}
>>          }
>>      },
>>      [HYPERV_FEAT_SYNIC] = {
>>          .desc = "synthetic interrupt controller (hv-synic)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_SYNIC_AVAILABLE}
>> +             .bits = HV_HYPERCALL_AVAILABLE | HV_SYNIC_AVAILABLE}
>>          }
>>      },
>>      [HYPERV_FEAT_STIMER] = {
>> @@ -879,7 +881,7 @@ static struct {
>>          .desc = "frequency MSRs (hv-frequencies)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_ACCESS_FREQUENCY_MSRS},
>> +             .bits = HV_HYPERCALL_AVAILABLE | HV_ACCESS_FREQUENCY_MSRS},
>>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>>               .bits = HV_FREQUENCY_MSRS_AVAILABLE}
>>          }
>> @@ -888,7 +890,8 @@ static struct {
>>          .desc = "reenlightenment MSRs (hv-reenlightenment)",
>>          .flags = {
>>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> -             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
>> +             .bits = HV_HYPERCALL_AVAILABLE |
>> +             HV_ACCESS_REENLIGHTENMENTS_CONTROL}
>>          }
>>      },
>>      [HYPERV_FEAT_TLBFLUSH] = {
>> -- 
>> 2.30.2
>> 

-- 
Vitaly


