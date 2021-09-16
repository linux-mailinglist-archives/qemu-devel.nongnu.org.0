Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E265540D351
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:37:00 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQl12-0002vT-0X
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQkzF-00023y-Ll
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQkzC-0005Ki-DC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631774105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXxhCHXL5Haa9Cpgo33yHGIdDy4f6h7fzNCLGADzzV4=;
 b=HL6llRP7WB+2/hzbhCBmZW7Outy0TaKLx4QQAARd3x9MLnbSpOp+oD8N7s2VKM1/bx7NxQ
 wJTj/rPtSvW91mUzT92fG4IxCcnf/aiP5QYS1WFHxkXHBX/xhLvfcJLDZgaabUXJ6EdqNo
 BgHCwwmljj2O+QaMOy0wMna3fJTl39I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-5w4BxLvZNLi2V7Z5Ja-IJg-1; Thu, 16 Sep 2021 02:35:04 -0400
X-MC-Unique: 5w4BxLvZNLi2V7Z5Ja-IJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2688994wma.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 23:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jXxhCHXL5Haa9Cpgo33yHGIdDy4f6h7fzNCLGADzzV4=;
 b=KHEI9afQSdXCumPdRpydrTer2kj2GdTVBDyN2oqB9sdMvpy1lWQXI8cDDE5aSXjHYg
 fsSZM4zoYWuTmICqvmSBUjoJYu/A/TsoTO9a83RMzjwLcBdT/K8XRZ6qPipy3FOwm1ho
 BeyhFCeVtW0nvPqf36wmrI5Q1ECBZyGIlGSyRCbDIbUZkFcN/wBuAlLGtEbti/fPb6yC
 JdKveL3JC3eFo9K0/AseWRQj6MO0vwv72+3CQZOTsDT8tQnc80o1pzCaGYnWa+N9WDb1
 Uc+TTrboiePrwXjUCy6e7PhE7l6H1I6eBWI+AlxLzdfRmO6hktH+H/ewL00v0CfGFBIR
 2S7g==
X-Gm-Message-State: AOAM532KDasPqUxE7NDqDC3UaFq9d6infOV6qY8Qp+i5Pb7Lud85pvj+
 y8F+51ZZWEo96nHBM35pGKFWTPucuqmATIKzZgBX3j9qrN9AQd0z+NJu8DC2tUQiUCKCiiH8bRx
 ghPtEzYaNNwNl3Qo=
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr4000432wrf.312.1631774103177; 
 Wed, 15 Sep 2021 23:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw44JcMlMz/zDkbKXgTphVpjRDtz8s1gWyEgiinJQJgrzgNNisSJFO0LiL4pT/YXZHwPMgKAg==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr4000408wrf.312.1631774102973; 
 Wed, 15 Sep 2021 23:35:02 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c17sm2667635wrn.54.2021.09.15.23.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 23:35:02 -0700 (PDT)
Subject: Re: [PATCH v4 10/33] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
To: Yang Zhong <yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-11-yang.zhong@intel.com>
 <7f81ee2f-1876-3f84-8415-51031e1fd887@redhat.com>
 <20210916060841.GB31727@yangzhon-Virtual>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <99913189-cf9a-096a-8030-636486bcc1da@redhat.com>
Date: Thu, 16 Sep 2021 08:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916060841.GB31727@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com, qemu-devel@nongnu.org,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 8:08 AM, Yang Zhong wrote:
> On Tue, Sep 14, 2021 at 08:38:59AM +0200, Philippe Mathieu-Daudé wrote:
>> On 7/19/21 1:21 PM, Yang Zhong wrote:
>>> From: Sean Christopherson <sean.j.christopherson@intel.com>
>>>
>>> On real hardware, on systems that supports SGX Launch Control, those
>>> MSRs are initialized to digest of Intel's signing key; on systems that
>>> don't support SGX Launch Control, those MSRs are not available but
>>> hardware always uses digest of Intel's signing key in EINIT.
>>>
>>> KVM advertises SGX LC via CPUID if and only if the MSRs are writable.
>>> Unconditionally initialize those MSRs to digest of Intel's signing key
>>> when CPU is realized and reset to reflect the fact. This avoids
>>> potential bug in case kvm_arch_put_registers() is called before
>>> kvm_arch_get_registers() is called, in which case guest's virtual
>>> SGX_LEPUBKEYHASH MSRs will be set to 0, although KVM initializes those
>>> to digest of Intel's signing key by default, since KVM allows those MSRs
>>> to be updated by Qemu to support live migration.
>>>
>>> Save/restore the SGX Launch Enclave Public Key Hash MSRs if SGX Launch
>>> Control (LC) is exposed to the guest. Likewise, migrate the MSRs if they
>>> are writable by the guest.
>>>
>>> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
>>> Signed-off-by: Kai Huang <kai.huang@intel.com>
>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>>> ---
>>>  target/i386/cpu.c     | 17 ++++++++++++++++-
>>>  target/i386/cpu.h     |  1 +
>>>  target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
>>>  target/i386/machine.c | 20 ++++++++++++++++++++
>>>  4 files changed, 59 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index 840f825431..cea4307930 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -5673,6 +5673,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>      }
>>>  }
>>>  
>>> +#ifndef CONFIG_USER_ONLY
>>> +static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
>>> +{
>>> +    env->msr_ia32_sgxlepubkeyhash[0] = 0xa6053e051270b7acULL;
>>> +    env->msr_ia32_sgxlepubkeyhash[1] = 0x6cfbe8ba8b3b413dULL;
>>> +    env->msr_ia32_sgxlepubkeyhash[2] = 0xc4916d99f2b3735dULL;
>>> +    env->msr_ia32_sgxlepubkeyhash[3] = 0xd4f8c05909f9bb3bULL;
>>> +}
>>> +#endif
>>
>> Maybe easier to move the #ifdef'ry inside the function.
>>
> 
>   Thanks for comments, since this function is pure void function, we can move this #ifdef
>   into function.
>  
>> Where these values come from btw?
> 
>   Those MSR values are intel default values, which were defined in Skylake platform.

Could you add a comment (and reference if possible) about them please?

Thanks,

Phil.


