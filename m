Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134AB2C2398
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:07:22 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWAL-0007mb-5U
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khW6E-00046P-Op
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khW6D-0007NU-5U
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606215784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ht1osUWr+/iBiHcqbmjs8Ejk8LN9EobYIxOM11jsBrY=;
 b=dDzK5Ugy7J21uZA4FAIg2SDA6KuFclF0yrtRYIIblCTu/Dux4KZno1MyHkhgqxqQEtlZHL
 ZuLSsX0fa8LImFgdqJ8ZtcROohs+3mI9AFNPnHlY86voNkW3DN9blyA0wlJ6DjRV/jxAW7
 1Xy0RzsluG6KpGVHYrpO1fyJvbWpFSc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-gasPAIb6MCaL6aYivatzCQ-1; Tue, 24 Nov 2020 06:03:00 -0500
X-MC-Unique: gasPAIb6MCaL6aYivatzCQ-1
Received: by mail-ej1-f72.google.com with SMTP id dx19so6695689ejb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 03:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ht1osUWr+/iBiHcqbmjs8Ejk8LN9EobYIxOM11jsBrY=;
 b=rC3/TlA2QJGEAWFbsp2wGx+V+iyBHslrlYMGXOKwKh2XjLY6TyDQx+X3uUHNs1NR9a
 w9d7J5sQQg0ijJIvibkAUMWLde//ejNiLxZZAIeijgqyOxnZpnzlh8sX97EP4BZ9uvao
 ZPEy4wcMet3ppSrXreB0728KXjMDs84lCbgiMVnQ3rg9Dj5eB/6Qnhz0CnaN8ZfiVFfa
 IhV3Omcbaz1rlcY7sFyxGdLps/Z1ZbsatBlv0FC4gU2tUar/8xb4d8GWmtyA+NVIWRbz
 PoCbXBfEOcLErSK/tcL1lW18peJk3lIBmuCSj4pYzNwmD4p9d6l7W4umjtQ55m847NnN
 wTkQ==
X-Gm-Message-State: AOAM532IGjp5KeDxHaUISEnomAMgd/IHU3KJUUlx2Z5lJbY0c3/xCCDh
 XxoltFr3AlCl350YoyCyEWVT7mK7xX2eIzlhSLr2wElMpiqNZOdS14x99f5BEPL4uYB5Emf7y1u
 RrXMtkqS8DcpAFIY=
X-Received: by 2002:aa7:ca57:: with SMTP id j23mr3261944edt.292.1606215779114; 
 Tue, 24 Nov 2020 03:02:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN+uoeMlVKvRdl2am2DFsnF0AJKn8Aa8iM9O9ra7ptokH+tXVCTGm3nX4pwmjYfuvo5rc/Iw==
X-Received: by 2002:aa7:ca57:: with SMTP id j23mr3261918edt.292.1606215778920; 
 Tue, 24 Nov 2020 03:02:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id pg24sm6660375ejb.72.2020.11.24.03.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 03:02:58 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Huacai Chen <chenhuacai@gmail.com>
References: <20200429082916.10669-1-f4bug@amsat.org>
 <20200429082916.10669-3-f4bug@amsat.org>
 <e33820ee-0013-bed9-ef06-9a66995f6405@amsat.org>
 <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] target/mips/kvm: Assert unreachable code is not used
Message-ID: <98e6a5b3-15b5-0365-67dd-23830687d949@redhat.com>
Date: Tue, 24 Nov 2020 12:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhc@lemote.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 11:41, Philippe Mathieu-Daudé wrote:
> Huacai, ping?
> 
> On 5/12/20 9:09 AM, Philippe Mathieu-Daudé wrote:
>> +Paolo
>>
>> On 4/29/20 10:29 AM, Philippe Mathieu-Daudé wrote:
>>> This code must not be used outside of KVM. Abort if it is.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    target/mips/kvm.c | 8 ++------
>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
>>> index de3e26ef1f..050bfbd7fa 100644
>>> --- a/target/mips/kvm.c
>>> +++ b/target/mips/kvm.c
>>> @@ -196,9 +196,7 @@ int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq,
>>> int level)
>>>        CPUState *cs = CPU(cpu);
>>>        struct kvm_mips_interrupt intr;
>>>    -    if (!kvm_enabled()) {
>>> -        return 0;
>>> -    }
>>> +    assert(kvm_enabled());
>>>          intr.cpu = -1;
>>>    @@ -219,9 +217,7 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int
>>> irq, int level)
>>>        CPUState *dest_cs = CPU(cpu);
>>>        struct kvm_mips_interrupt intr;
>>>    -    if (!kvm_enabled()) {
>>> -        return 0;
>>> -    }
>>> +    assert(kvm_enabled());
>>>          intr.cpu = dest_cs->cpu_index;
>>>   
>>
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

For kvm_mips_set_ipi_interrupt, however, it would be nicer if 
hw/intc/mips_gic.c always used gic->vps[vp].env->irq[], and the qemu_irq 
handler took care of calling kvm_mips_set_ipi_interrupt.

Likewise, there is some duplication between kvm_mips_interrupt's caller 
and kvm_arch_pre_run.  I'm not sure if kvm_arch_pre_run is needed at all.

Paolo


