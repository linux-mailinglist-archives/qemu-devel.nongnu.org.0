Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BD391CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:13:28 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llw9u-0002G7-SA
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llw8c-0001PX-Rh
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:12:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llw8a-0004jo-F5
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:12:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h12so847313plf.11
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QL7fxb7ICaZSds2UjoU/vT5z18OWxlBIosWBsAzwt3A=;
 b=m7xBn/c1awih5LSXBmo3qgZomEibAQOB2txvD9Mc+lt0ymtS93yFIQTCsgHpxV7x1f
 chax++yA5c2T1laTjDu1VUwTf5fk8RJ3iAyPcn+pAx7a8qbmByETGPOYnMxVOHlemjsF
 GV0abYxUun27Jw02lGRX9dN5AOIeSXgxLqFJ1XAz0NdQpH/mE8XQxEHS1IfpfTSK3f+M
 CBeyn5k6kHQTxDihf7FPTK3ouPjU+mdnLX5PcXPYOdEcHp+GjEVE/rgMUyyAMSiIEIEO
 MY3JcAr/dv4xrKavK5KEVdVWJaD4ElfPtSjBEBWFYg1bhDk5KahJwu240e6kcXka+rhc
 C6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QL7fxb7ICaZSds2UjoU/vT5z18OWxlBIosWBsAzwt3A=;
 b=rHRsh3pV3xC8ya2pcxl12gL3pwZyW5clRcuiDmpJqnIVuTma4pqGEHPq6Cr50ynIle
 n2vPg0psf8a+tHDZ6vBIw9KtNKSqwUwUxO5srDfuMs/BC7/vB5P0lfx2GYWR3w2h4juQ
 P5D4IUjAau/IGW1um8YSaA5IXEsS/gMa9rv0BIL/6F2BUREOphX/FfeA8YBoMdM0JGl3
 vUm8mu2yx9k+iIQnCYrZmjFeRhtQsHLf2vZ1dQQJ65D9p7KQRVMYieY+ubGKZXDePZOy
 BIfXg/7lvOLiIUa9WDKnFT0a1w9ne1UFbm4lkwj4OIFnOPPYRXRc4ZJQ63TOk5HWKEDj
 Q1dw==
X-Gm-Message-State: AOAM530ED+RGJL/0cqM0UAEtMsDjn+BfYjxtR6jK5kfCBopj6xZKnju4
 YFEjH9BBAmbwkz9ef2ztPWwqtg==
X-Google-Smtp-Source: ABdhPJxwfEz4KVNQFZNVqBapNHKvVO7Ej43vgtnt68If3yx6y1+j+/sZqkpG7fwjxixCgYNUcfBoXw==
X-Received: by 2002:a17:90a:e553:: with SMTP id
 ei19mr2370964pjb.175.1622045521888; 
 Wed, 26 May 2021 09:12:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q10sm4534398pjv.24.2021.05.26.09.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 09:12:01 -0700 (PDT)
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
 <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
 <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
 <720be115-3aad-f4bd-e636-5dab76478806@linaro.org>
 <fc7fde45-a8ae-7249-7cac-b9f7fbfbee0f@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b059e8ee-f850-bbce-2ec2-3e3427b1e0c3@linaro.org>
Date: Wed, 26 May 2021 09:11:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fc7fde45-a8ae-7249-7cac-b9f7fbfbee0f@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lagarcia@br.ibm.com, luis.pires@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 8:17 AM, Matheus K. Ferst wrote:
> On 24/05/2021 15:51, Richard Henderson wrote:
>> On 5/21/21 10:25 AM, Matheus K. Ferst wrote:
>>> On 18/05/2021 07:12, Richard Henderson wrote:
>>>> On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
>>>>> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
>>>>
>>>> Space after IF.
>>>> > If I look back to the 6xx manual, I see
>>>>
>>>>    NOTE: If L = 1, the instruction form is invalid.
>>>>
>>>> The fact that we're allowing L=1 for ppc32 is an existing bug, afaics. We 
>>>> should fix that.
>>>>
>>>>
>>>> r~
>>>
>>> The previous commit on this line in translate.c says that "on most 32bit 
>>> CPUs we should always treat the compare as 32bit compare, as the CPU will 
>>> ignore the L bit", so maybe it was intentional. Should we change it anyway?
>>
>> The actual change of 36f48d9c78c is about NARROW_MODE, which is about the 
>> MSR.SF bit, and is correct.
>>
>> The commit message mentions the e500mc specifically does check the L bit, and 
>> then hand-waves about the others not checking.  But the text I found in the 
>> 6xx manual says that one checks too.
>>
>> I wonder if the IBM folk can shed any further light on this?
>>
>>
>> r~
> 
> I was pointed to the 601 manual, which says:
> 
> "While the PowerPC architecture specifies that the value in the L field 
> determines whether the operands are treated as 32- or 64-bit values, the 601 
> ignores the value in the L field and treats the operands as 32-bit values."
> 
> There is also a section in Appendix B called "Reserved Bits in Instructions", 
> which says:
> 
> "These are shown with '/'s in the instruction opcode definitions. In the POWER 
> architecture such bits are ignored by the processor. In PowerPC architecture 
> they must be 0 or the instruction form is invalid. In several cases the PowerPC 
> architecture assumes that such bits in POWER instructions are indeed 0. The 
> cases include the following:
> - cmpi, cmp, cmpli, and cmpl assume that bit 10 in the POWER instructions is 0.
> - mtspr and mfspr assume that bits 16–20 in the POWER instructions are 0."
> 
> Searching the manuals for other processors, I identified that the manuals for 
> 405, 440, e500, and e500mc explicit says that the L bit should always be 0, and 
> manuals for 603e, 604, 604e, 740/745/750/755, 750CX, 750CL, 750FX, 7400/7410, 
> 7447/7447A/7448/7450/7455, e300, and e600 list the bit L in operand syntax but 
> do not mention any restrictions on its value.
> 
> Alfredo Dal Ava Junior (adalva) did some tests for us on his G4 MacBook, 
> confirming that the bit is ignored in PowerPC 7447A v1.2, one of which the 
> manual does not specify the behavior, but I don't know if can assume the same 
> for other processors.
> 
> If we do bother to emulate the specific behavior for each CPU, what would be 
> the default for those whose manual is not explicit and we cannot test? Also, I 
> not sure how to check for it, do we need a new POWERPC_FLAG in pcc->flags?

Thanks for the research.

There's an argument for following the architecture, even when implementations 
vary.  Especially when implementations very, as this makes testing with qemu 
more likely to catch software bugs.

There's another argument for following implementations.  I would generally 
reserve this interpretation for historical cpus, where we are trying to emulate 
something specific (e.g. a games console) where the legacy software relies on 
specific behavior.

I'll let David have the final call on this, but my inclination is to follow the 
architecture and require 0s for reserved bits.


r~

