Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6138C128
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:59:16 +0200 (CEST)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk03v-0002xH-Qm
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk02X-0001Yq-M9
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk02U-0002WS-Ch
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621583865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCK3/Q/S96lPk/+7W3Hia9+IShiUjjfhOtWUuuc2GN8=;
 b=AyGIFTK18gr3JJU2doeoN2aLBpJ/L/ncB5Awxtj+zM+5nflhV19tmFU8+wguboVn00Ree5
 R92EA5u2H7XkrPczEw7+Pks2zGipViGPoteimt9dwq1XSVWOr6hpCWyfWyv+lC6uMhUh22
 G73BwXBwOGr+RTz1CMLuLX7Q3w9TT7Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-sQnKrfl8M8uM7DWEsDNcmg-1; Fri, 21 May 2021 03:57:44 -0400
X-MC-Unique: sQnKrfl8M8uM7DWEsDNcmg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so9037073wrm.13
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OCK3/Q/S96lPk/+7W3Hia9+IShiUjjfhOtWUuuc2GN8=;
 b=SzoTBKR/VuRFKaeZWDB0GztBG6LfTAZfYRQ8J7PgsbuALIDyadSyJArgC173TZChJP
 IwCOGObbW/uZQogAALWN3CAz8VPTNOCu7Gi6TEYJaG1x6t4qxU1plYt5hoxvTFkdaj89
 nugVw8is1YohDsieIUTK6S8rJd7eP9W/x5LTXmRdYw7ks30wL1jCdp1SSeuam+46VmKp
 pqj+cBcpVJBqQE+mUkuYy3gnxYwKCh2nRFIjGp358njt6Ha4pyU0vtDKp37arQ62XZry
 OhLNw+T8Xj5u0L4w1v/n9gziywzqdd7T8u/VPlX5pYfGg46iqswl6oWXgH0PRdTn4BOi
 zFrQ==
X-Gm-Message-State: AOAM532Je8F9iBU5673iBIIAWaIRBpajztLRH+e4bFF+f3EtAyQrw5kZ
 w18mnL5z79+jtx2AKWG5aS2dhBf7yZKaqQzMRDi71I/ewkxooIGV/Ouit7p7Qmwwp/2Gnyb2N6O
 TVihio2Y2RfLo0hM=
X-Received: by 2002:a05:6000:110f:: with SMTP id
 z15mr8140709wrw.199.1621583863297; 
 Fri, 21 May 2021 00:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb/eTNBuXDmS1N2lXulAOnIgcPvJoS+TVQgyvtZsYqXOR+NEAD4amuJNB7/dIWe9qVP2pjrQ==
X-Received: by 2002:a05:6000:110f:: with SMTP id
 z15mr8140697wrw.199.1621583863143; 
 Fri, 21 May 2021 00:57:43 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id t17sm1077518wrp.89.2021.05.21.00.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:57:42 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 06/19] i386: introduce hv_cpuid_get_host()
In-Reply-To: <20210520200141.w7zxt4e2dtephpdq@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-7-vkuznets@redhat.com>
 <20210520200141.w7zxt4e2dtephpdq@habkost.net>
Date: Fri, 21 May 2021 09:57:41 +0200
Message-ID: <871ra0jz7u.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

> On Thu, Apr 22, 2021 at 06:11:17PM +0200, Vitaly Kuznetsov wrote:
>> As a preparation to implementing hv_cpuid_cache intro introduce
>> hv_cpuid_get_host(). No functional change intended.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 102 +++++++++++++++++++++++-------------------
>>  1 file changed, 57 insertions(+), 45 deletions(-)
>> 
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index ba093dba4d23..7aeb704b016e 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1107,6 +1107,19 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
>>      return 0;
>>  }
>>  
>> +static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
>> +                                  int reg)
>> +{
>> +    struct kvm_cpuid_entry2 *entry;
>> +
>> +    entry = cpuid_find_entry(cpuid, func, 0);
>> +    if (!entry) {
>> +        return 0;
>
> One possible difference here is that leaves not supported by the
> host will now be zeroed out.
>
> ...which I expected to be the correct behavior of hv-passthrough,

Yes, at least that's the intention.

> so:
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>

Thanks!

>
>> +    }
>> +
>> +    return cpuid_entry_get_reg(entry, reg);
>> +}
>> +
>>  static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
>>  {
>>      uint32_t r, fw, bits;
>> @@ -1203,7 +1216,7 @@ static int hyperv_handle_properties(CPUState *cs,
>>  {
>>      X86CPU *cpu = X86_CPU(cs);
>>      struct kvm_cpuid2 *cpuid;
>> -    struct kvm_cpuid_entry2 *c, *c2;
>> +    struct kvm_cpuid_entry2 *c;
>>      uint32_t cpuid_i = 0;
>>      int r;
>>  
>> @@ -1235,46 +1248,47 @@ static int hyperv_handle_properties(CPUState *cs,
>>      }
>>  
>>      if (cpu->hyperv_passthrough) {
>> -        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
>> -        if (c) {
>> -            cpu->hyperv_vendor_id[0] = c->ebx;
>> -            cpu->hyperv_vendor_id[1] = c->ecx;
>> -            cpu->hyperv_vendor_id[2] = c->edx;
>> -            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
>> -                                           sizeof(cpu->hyperv_vendor_id) + 1);
>> -            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
>> -                   sizeof(cpu->hyperv_vendor_id));
>> -            cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
>> -        }
>> -
>> -        c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
>> -        if (c) {
>> -            cpu->hyperv_interface_id[0] = c->eax;
>> -            cpu->hyperv_interface_id[1] = c->ebx;
>> -            cpu->hyperv_interface_id[2] = c->ecx;
>> -            cpu->hyperv_interface_id[3] = c->edx;
>> -        }
>> -
>> -        c = cpuid_find_entry(cpuid, HV_CPUID_VERSION, 0);
>> -        if (c) {
>> -            cpu->hyperv_version_id[0] = c->eax;
>> -            cpu->hyperv_version_id[1] = c->ebx;
>> -            cpu->hyperv_version_id[2] = c->ecx;
>> -            cpu->hyperv_version_id[3] = c->edx;
>> -        }
>> -
>> -        c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
>> -        if (c) {
>> -            cpu->hv_max_vps = c->eax;
>> -            cpu->hyperv_limits[0] = c->ebx;
>> -            cpu->hyperv_limits[1] = c->ecx;
>> -            cpu->hyperv_limits[2] = c->edx;
>> -        }
>> -
>> -        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
>> -        if (c) {
>> -            cpu->hyperv_spinlock_attempts = c->ebx;
>> -        }
>> +        cpu->hyperv_vendor_id[0] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
>> +        cpu->hyperv_vendor_id[1] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_ECX);
>> +        cpu->hyperv_vendor_id[2] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EDX);
>> +        cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
>> +                                       sizeof(cpu->hyperv_vendor_id) + 1);
>> +        memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
>> +               sizeof(cpu->hyperv_vendor_id));
>> +        cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
>> +
>> +        cpu->hyperv_interface_id[0] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EAX);
>> +        cpu->hyperv_interface_id[1] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EBX);
>> +        cpu->hyperv_interface_id[2] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_ECX);
>> +        cpu->hyperv_interface_id[3] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EDX);
>> +
>> +        cpu->hyperv_version_id[0] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EAX);
>> +        cpu->hyperv_version_id[1] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EBX);
>> +        cpu->hyperv_version_id[2] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_ECX);
>> +        cpu->hyperv_version_id[3] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EDX);
>> +
>> +        cpu->hv_max_vps = hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS,
>> +                                            R_EAX);
>> +        cpu->hyperv_limits[0] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EBX);
>> +        cpu->hyperv_limits[1] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_ECX);
>> +        cpu->hyperv_limits[2] =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EDX);
>> +
>> +        cpu->hyperv_spinlock_attempts =
>> +            hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
>>      }
>>  
>>      /* Features */
>> @@ -1348,10 +1362,8 @@ static int hyperv_handle_properties(CPUState *cs,
>>      if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
>>          c->eax |= HV_NO_NONARCH_CORESHARING;
>>      } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
>> -        c2 = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
>> -        if (c2) {
>> -            c->eax |= c2->eax & HV_NO_NONARCH_CORESHARING;
>> -        }
>> +        c->eax |= hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
>> +            HV_NO_NONARCH_CORESHARING;
>>      }
>>  
>>      c = &cpuid_ent[cpuid_i++];
>> -- 
>> 2.30.2
>> 

-- 
Vitaly


