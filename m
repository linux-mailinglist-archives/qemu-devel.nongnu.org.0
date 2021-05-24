Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EE38E64E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:09:37 +0200 (CEST)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9Oq-0007Id-O7
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9Np-0006BL-P4
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9Nn-0007rS-WF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621858111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29W7XvIjl8HJZrVykscBE26L7aUGsS1jWhIMpq98dyg=;
 b=BIj0pWcQOvB2Zfk3gZaJBFrRaDgopWCkxr+Vtmc3cbE4XHE5yQPY4CZ7XEAuor6KO32PRp
 XqToaxtwChPGhcfjguR30067vKUEgr3ZhzFXfjoBu28E5YJkxUvLLqjQ50Vj3/HjrOabZ0
 gII/UTehZL9VD0dBi1QV+QIGaM/Emv4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-lQ9DGBO5NFa7JkP_DrCOfA-1; Mon, 24 May 2021 08:08:29 -0400
X-MC-Unique: lQ9DGBO5NFa7JkP_DrCOfA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso13033108wrj.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=29W7XvIjl8HJZrVykscBE26L7aUGsS1jWhIMpq98dyg=;
 b=p1XpezUV1MaKZDKW/1QGRDsgwf+w7INw40pkK5Iyik0Lub9CmyEQZBMY7QzYOqKsMK
 DbTtobnyQCXGv9RfGzzwJq75i3hant7EumWBY1EIsqCXR0kQvPuflr/IP69xV28QNCBS
 sDaERZzEpRBswdat7Q3xK24O//xmO6+ICIzY1ahJ8r7glHVgWFAt+iQm50sh8qpZWAyb
 zTzRn8GVgKVcjITcMeZcxhRVGNgLb3dUp9OWet4VQJ9hyefc15yIIOFmCke090IX+Uwd
 4uMOPFOf/Iz5+tsYysBtSyBZofMg3Yp8YNc/n2rBULReifAQVFyaSDxdlGtvlQ9m3Ivn
 gjbg==
X-Gm-Message-State: AOAM531WmWJI2PtKOH2o3gbhd5z3LJMPon2sjN8rw+pEECPteyaiXlPf
 cXG3jeyJZOhfJ0Uz2M3J6yddLiaU/+hripvQsg9Ye0s/pQ38FWh/TobXyCGC0wH49jCeo48X4cR
 aJKJi07PiyqcVrDo=
X-Received: by 2002:adf:d4d1:: with SMTP id w17mr22461044wrk.413.1621858107982; 
 Mon, 24 May 2021 05:08:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYkEGHDt4bvi/n9lJYnGqeD+WkVc8SSKWwo9ZqXv4Th6h3wnghDSaA5enq4OXMlkvL/xAMXQ==
X-Received: by 2002:adf:d4d1:: with SMTP id w17mr22461021wrk.413.1621858107798; 
 Mon, 24 May 2021 05:08:27 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id h14sm7360763wmb.1.2021.05.24.05.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:08:27 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 13/19] i386: prefer system KVM_GET_SUPPORTED_HV_CPUID
 ioctl over vCPU's one
In-Reply-To: <20210521214202.g222ullptiseaesq@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-14-vkuznets@redhat.com>
 <20210521214202.g222ullptiseaesq@habkost.net>
Date: Mon, 24 May 2021 14:08:26 +0200
Message-ID: <87h7is72rp.fsf@vitty.brq.redhat.com>
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

> On Thu, Apr 22, 2021 at 06:11:24PM +0200, Vitaly Kuznetsov wrote:
>> KVM_GET_SUPPORTED_HV_CPUID was made a system wide ioctl which can be called
>> prior to creating vCPUs and we are going to use that to expand Hyper-V cpu
>> features early. Use it when it is supported by KVM.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>> 
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index feec9f25ba12..5d08f3a39ef7 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -928,7 +928,8 @@ static struct {
>>      },
>>  };
>>  
>> -static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
>> +static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
>> +                                           bool do_sys_ioctl)
>>  {
>>      struct kvm_cpuid2 *cpuid;
>>      int r, size;
>> @@ -937,7 +938,11 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
>>      cpuid = g_malloc0(size);
>>      cpuid->nent = max;
>>  
>> -    r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
>> +    if (do_sys_ioctl) {
>> +        r = kvm_ioctl(kvm_state, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
>> +    } else {
>> +        r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
>> +    }
>>      if (r == 0 && cpuid->nent >= max) {
>>          r = -E2BIG;
>>      }
>> @@ -964,13 +969,17 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>>      /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
>>      int max = 10;
>>      int i;
>> +    bool do_sys_ioctl;
>> +
>> +    do_sys_ioctl =
>> +        kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
>>  
>>      /*
>>       * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
>>       * -E2BIG, however, it doesn't report back the right size. Keep increasing
>>       * it and re-trying until we succeed.
>>       */
>> -    while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
>> +    while ((cpuid = try_get_hv_cpuid(cs, max, do_sys_ioctl)) == NULL) {
>>          max++;
>>      }
>>  
>> @@ -980,7 +989,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>>       * information early, just check for the capability and set the bit
>>       * manually.
>>       */
>> -    if (kvm_check_extension(cs->kvm_state,
>> +    if (!do_sys_ioctl && kvm_check_extension(cs->kvm_state,
>>                              KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
>
> Oh, this conditional replaces the comment I suggested in patch
> 10/19.  It makes it obvious that the hack can be deleted if we
> remove support for the VCPU ioctl.
>
> So, when exactly will we be able to delete the VCPU ioctl code
> and support only the system ioctl?

When QEMU drops support for kernels < 5.11? Note, current RHEL8 already
supports system version so we're talking about upstream kernels/Ubuntu
LTS/... 

I remember there was a list of supported kernels for QEMU somewhere but
don't seem to be able to find it quickly, could you maybe point me in
the right direction?

>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>

Thanks!

>>          for (i = 0; i < cpuid->nent; i++) {
>>              if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
>> -- 
>> 2.30.2
>> 

-- 
Vitaly


