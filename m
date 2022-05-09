Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D9520680
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:12:04 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAfj-000210-Hf
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noAe6-0000ST-UJ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noAe3-0006x4-27
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652130617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6v4Sxkns65+L6tHAindOzqO6MmW+gYsoyBMOCgeDNM=;
 b=IvIhZ7xoNAtIja5PJDyvX9UrQjEYW4uGqPkcBiIc2GYQGmDEgOc2XIeXh8dzP+EliCgVE5
 e6gDOzvjjoHenhHVXHIyEevQdBcKg5Ki1Ak/Jp7VEo0RyhGGdkixF7+uxnCpRdE2NO6qlk
 fSPHPShbz1b5FVeu8nkvnqI4ijis4I4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-e0qyf10yNo-Cesyf-ABhwQ-1; Mon, 09 May 2022 17:10:16 -0400
X-MC-Unique: e0qyf10yNo-Cesyf-ABhwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec44-20020a0564020d6c00b00425b136662eso9028942edb.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=k6v4Sxkns65+L6tHAindOzqO6MmW+gYsoyBMOCgeDNM=;
 b=SrczCf+0vROF2S5m5t8P08aokLHBEiwjupOS9UMAIRuXuvoLRLBqisStmxoQs+DL/k
 Dt9V9MDM5p/4Kw+fVfBuL6o4Fr2WLaLGiV74fcMkFZwOID6BPpBEHTletPLQJPHnywBm
 YwGprvh1HFdkGH1OqdeDoUnYcm9WnjsCnaImgBgKEQfZynSWWN5VR9wf+Dtm7QM7KE3W
 iXzSBy2AVljcQOE28lnyZpwJif92oGRALeQRwAslvqZcwdmAzpLNKFRF0nIlfyxVY/cO
 oOYs4VzX6KgbA2vzpdKNtL4z2pqXjyK7c0mSfxKhOG3NSsy3f67jwwW2OLmdFrGDC1Jm
 kxnA==
X-Gm-Message-State: AOAM530r9WZ+GvunhXEWJw5APR3yv2YQeAqNJH6PAsqNkLeIhIcfSTsf
 VhPAq68yHhwjYEUKI8bPQsOlUBpkL1/xFez3Jj5DegHkEPLfbBXN5KS4HR8eNrG8vI6kNWxYG36
 iUp50z8JCiEkvw9I=
X-Received: by 2002:a17:907:8c85:b0:6f4:6b2a:5f0 with SMTP id
 td5-20020a1709078c8500b006f46b2a05f0mr16628194ejc.491.1652130615331; 
 Mon, 09 May 2022 14:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOJsceB7gABRBNnolEYMAFK8fJQTn7aNXyZRy9fHtnaVz2n6QN7skTP6ZvU9M2/YMaR6ohSw==
X-Received: by 2002:a17:907:8c85:b0:6f4:6b2a:5f0 with SMTP id
 td5-20020a1709078c8500b006f46b2a05f0mr16628176ejc.491.1652130615022; 
 Mon, 09 May 2022 14:10:15 -0700 (PDT)
Received: from ?IPv6:::1? ([2001:b07:6468:f312:10d8:3386:7b83:5891])
 by smtp.gmail.com with ESMTPSA id
 wi7-20020a170906fd4700b006f3ef214dd4sm5344128ejb.58.2022.05.09.14.10.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 14:10:14 -0700 (PDT)
Date: Mon, 09 May 2022 23:10:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
CC: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Subject: Re: [PATCH] target/i386: properly reset TSC on reset
In-Reply-To: <YnkrCFDa6zE6wV4Q@fuller.cnet>
References: <20220324173136.222647-1-pbonzini@redhat.com>
 <YnkrCFDa6zE6wV4Q@fuller.cnet>
Message-ID: <3007B2D1-5DCB-43E9-9FA1-37AE4CB79986@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed with Marcelo offlist, KVM notices multiple CPUs being set to t=
he same value within a small amount of time and keeps them synchronized=2E =
This is the same code that handles TSC synchronization on the destination s=
ide of  migration=2E

Paolo

Il 9 maggio 2022 16:54:00 CEST, Marcelo Tosatti <mtosatti@redhat=2Ecom> ha=
 scritto:
>On Thu, Mar 24, 2022 at 06:31:36PM +0100, Paolo Bonzini wrote:
>> Some versions of Windows hang on reboot if their TSC value is greater
>> than 2^54=2E  The calibration of the Hyper-V reference time overflows
>> and fails; as a result the processors' clock sources are out of sync=2E
>>=20
>> The issue is that the TSC _should_ be reset to 0 on CPU reset and
>> QEMU tries to do that=2E  However, KVM special cases writing 0 to the
>> TSC and thinks that QEMU is trying to hot-plug a CPU, which is
>> correct the first time through but not later=2E  Thwart this valiant
>> effort and reset the TSC to 1 instead, but only if the CPU has been
>> run once=2E
>>=20
>> For this to work, env->tsc has to be moved to the part of CPUArchState
>> that is not zeroed at the beginning of x86_cpu_reset=2E
>>=20
>> Reported-by: Vadim Rozenfeld <vrozenfe@redhat=2Ecom>
>> Supersedes: <20220324082346=2E72180-1-pbonzini@redhat=2Ecom>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat=2Ecom>
>
>Paolo,
>
>Won't this disable the logic to sync TSCs, making it possible
>for TSC of SMP guests to go out of sync? (And remember the logic
>to sync TSCs from within a guest is fragile, in case of VCPU overload
>for example)=2E
>
>> ---
>>  target/i386/cpu=2Ec | 13 +++++++++++++
>>  target/i386/cpu=2Eh |  2 +-
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/target/i386/cpu=2Ec b/target/i386/cpu=2Ec
>> index ec3b50bf6e=2E=2Ecb6b5467d0 100644
>> --- a/target/i386/cpu=2Ec
>> +++ b/target/i386/cpu=2Ec
>> @@ -5931,6 +5931,19 @@ static void x86_cpu_reset(DeviceState *dev)
>>      env->xstate_bv =3D 0;
>> =20
>>      env->pat =3D 0x0007040600070406ULL;
>> +
>> +    if (kvm_enabled()) {
>> +        /*
>> +         * KVM handles TSC =3D 0 specially and thinks we are hot-plugg=
ing
>> +         * a new CPU, use 1 instead to force a reset=2E
>> +         */
>> +        if (env->tsc !=3D 0) {
>> +            env->tsc =3D 1;
>> +        }
>> +    } else {
>> +        env->tsc =3D 0;
>> +    }
>> +
>>      env->msr_ia32_misc_enable =3D MSR_IA32_MISC_ENABLE_DEFAULT;
>>      if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
>>          env->msr_ia32_misc_enable |=3D MSR_IA32_MISC_ENABLE_MWAIT;
>> diff --git a/target/i386/cpu=2Eh b/target/i386/cpu=2Eh
>> index e31e6bd8b8=2E=2E982c532353 100644
>> --- a/target/i386/cpu=2Eh
>> +++ b/target/i386/cpu=2Eh
>> @@ -1554,7 +1554,6 @@ typedef struct CPUArchState {
>>      target_ulong kernelgsbase;
>>  #endif
>> =20
>> -    uint64_t tsc;
>>      uint64_t tsc_adjust;
>>      uint64_t tsc_deadline;
>>      uint64_t tsc_aux;
>> @@ -1708,6 +1707,7 @@ typedef struct CPUArchState {
>>      int64_t tsc_khz;
>>      int64_t user_tsc_khz; /* for sanity check only */
>>      uint64_t apic_bus_freq;
>> +    uint64_t tsc;
>>  #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>>      void *xsave_buf;
>>      uint32_t xsave_buf_len;
>> --=20
>> 2=2E35=2E1
>>=20
>>=20
>>=20
>


