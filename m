Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B804F8514
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 18:39:45 +0200 (CEST)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncVAe-0004ND-5Y
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 12:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ncV9o-0003eg-Cc
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 12:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ncV9l-0007U9-3M
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 12:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649349527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXoWnBS2sD19MsejeYecpc+fcNrWjXGXmzggffKM+QI=;
 b=I3CnJEsBDfS4wQsadFUAbEKFKdGd6UWiBm/IwJjlMtjR+gTgLpK46jk04s2s7HI1q/f2/4
 C7QNf72IHF0rfSRqzv3EjwK5sMGOfywxhyldfP15LzLYy/bEbD9YpqBERc4wJC8HALU+QT
 TsQLIFf2UPJfyTkbt1OltCOMCyMsiVM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-Unz1bAt6MfyRw6xjjcrLkg-1; Thu, 07 Apr 2022 12:38:46 -0400
X-MC-Unique: Unz1bAt6MfyRw6xjjcrLkg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc14-20020a1709078a0e00b006e773507c0cso3394444ejc.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 09:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pXoWnBS2sD19MsejeYecpc+fcNrWjXGXmzggffKM+QI=;
 b=x55750VDquo1EtFC31izolbNOJhw3d5NacK3h+tMPigjPYfH4AOSm56pX/ElmyDDjp
 WwH3wo0QwVG/eUuLOEmBWieoLkv7i038PxfTmWahDs4o1rFx5KVuDQx9pQaWM9xWrBzk
 KENX5jX79GO4ahGpRyorDr4xDOQqvT/qWFUMFrVOfZeuNVOmdY7ZhBcX2Z+3XojVKhpi
 C657Rypv6o+ey0PccTTpzC430973iRdg62aKLGH0CCl5VFuhPeIVZYxtrKHUw8Y+BH+x
 LUC1JZ0govlIeBB6mjfJjophn0FzRCEeMNv4PoFfhB98DrxVfGv73mx/gxtLq2dux1nq
 Wm8w==
X-Gm-Message-State: AOAM532XB2LyJ59D308V35p00ooP1gbNjeByPIBu/XfV19aoFW/n8P3+
 GWeMPx2laHkucc/ahEucHeq56HroqeXPpiNYNVvCl4O1Yxno4g0b0sgItOjKG9MrkaFUpA8QAou
 Lgd0Bw7Eq1OT84a8=
X-Received: by 2002:a17:907:6296:b0:6da:745b:7b40 with SMTP id
 nd22-20020a170907629600b006da745b7b40mr14517798ejc.750.1649349524779; 
 Thu, 07 Apr 2022 09:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Vg8dkImnfJV7UjdtDJLoEzC6H04hc+pBarKJrs/TENnA/f3OIJgvsssPedI76/x5fGfebA==
X-Received: by 2002:a17:907:6296:b0:6da:745b:7b40 with SMTP id
 nd22-20020a170907629600b006da745b7b40mr14517779ejc.750.1649349524530; 
 Thu, 07 Apr 2022 09:38:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm7719844ejc.78.2022.04.07.09.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 09:38:43 -0700 (PDT)
Message-ID: <d6455021-2522-c4e0-8c5a-b7852ec0d967@redhat.com>
Date: Thu, 7 Apr 2022 18:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
 <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
 <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
 <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/22 17:27, Kirill A. Shutemov wrote:
> On Thu, Apr 07, 2022 at 07:28:54AM -0700, Richard Henderson wrote:
>> On 4/7/22 06:18, Kirill A. Shutemov wrote:
>>>> The new hook is incorrect, in that it doesn't apply to addresses along
>>>> the tlb fast path.
>>>
>>> I'm not sure what you mean by that. tlb_hit() mechanics works. We strip
>>> the tag bits before tlb lookup.
>>>
>>> Could you elaborate?
>>
>> The fast path does not clear the bits, so you enter the slow path before you
>> get to clearing the bits.  You've lost most of the advantage of the tlb
>> already.
> 
> Sorry for my ignorance, but what do you mean by fast path here?

The fast path is the TLB lookup code that is generated by the JIT 
compiler.  If the TLB hits, the memory access doesn't go through any C 
code.  I think tagged addresses always fail the fast path in your patch.

>> While a proper tagged address will have the tag removed in CR2 during a
>> page fault, an improper tagged address (with bit 63 != {47,56}) should
>> have the original address reported to CR2.
> 
> Hm. I don't see it in spec. It rather points to other direction:
> 
> 	Page faults report the faulting linear address in CR2. Because LAM
> 	masking (by sign-extension) applies before paging, the faulting
> 	linear address recorded in CR2 does not contain the masked
> 	metadata.
> 
> Yes, it talks about CR2 in case of page fault, not #GP due to canonicality
> checking, but still.
> 
>> I could imagine a hook that could aid the victim cache in ignoring the tag,
>> so that we need go through tlb_fill fewer times.  But I wouldn't want to
>> include that in the base version of this feature, and I'd want take more
>> than a moment in the design so that it could be used by ARM and RISC-V as
>> well.
> 
> But what other options do you see. Clering the bits before TLB look up
> matches the architectural spec and makes INVLPG match described behaviour
> without special handling.

Ah, INVLPG handling is messy indeed.

Paolo


