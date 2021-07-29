Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460303DAAC5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:07:34 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ARR-0004HV-Bm
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AQ4-00028v-TS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:06:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AQ2-00069w-Gw
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:06:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id t21so7856939plr.13
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EDjInxYj2qyRmvtHWNDykmQSo4QwuN+CcfoxF7qX3YE=;
 b=f8pAMMgWJqdhMpJCaApPb5GE1BFUOJZD+j8kqhm6mx5GEjaHT1rjkJAzaNGdDX58VA
 r53GsFoACbAFuQcAxvFDWykmaIjz0FInoIHDJwOvOAKFXxbmIydUAGr5246wGVAsw10u
 rfW7opnbFswrCONpm5iSELlcgF8EpKUufCiUCbs5KX9p88ttYkJjyhRaJRa7kyt7MyYi
 1Fhxgz2cICRjrbm5QsOju5uZTL4u8szqK0rbU+dkgpaNhNKrQONvBJnmfdGi7w8RlXc6
 C+z3sGZKy6QhvFN/46jKZJ5qrn7jb4OuUMmHMUDoOOT42DE3npt8C66Wzs3PB3Ywj5A0
 v2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EDjInxYj2qyRmvtHWNDykmQSo4QwuN+CcfoxF7qX3YE=;
 b=uPNoZ4nyBOJ/vGniydhtFy/3qPynGeQ8FY1QMdAKBgBYTNrPpYwTxvdnovfYjX2wK7
 o2d5U8CM2oy2qv6sRhAryx92vyensaTghIK7ftPjawObxQAj99VIh0EPTF9qiDJsHS4D
 sqsnmDpEwbEhqpUa7eIBKj4/t/KPQnVtPBL6pCdDyv/csGLDMgNnuJNVlY+foKVjkXbz
 WQ7g6R6wLL3bpfdMXdR2SXo6UExAm0lGpgwMShzsOIfwirTasyTZRizJpO0jCjhLjkgE
 /jbWhBjFpXC9E8aHIzC64VRLjGyaoiKZUCWzKgDZ7kMKSNJQS5fWI38xKOC+xdrDU3NV
 mrFA==
X-Gm-Message-State: AOAM531Rfo3YXRf3W+UQq9IHKeOVxXFZnMET/u83olwupecwt+nOrWwC
 alHsq7ZMMBZh9zJ6WdnnDQreMw==
X-Google-Smtp-Source: ABdhPJy7QR5peazTQiO+TLTeDuxYVqMHSGJSHzJF3/JYQBpisw/KflOhyPJ5xvt415Sx1SW3AyaNtg==
X-Received: by 2002:a17:902:ecc6:b029:12c:44b:40bd with SMTP id
 a6-20020a170902ecc6b029012c044b40bdmr5736721plh.33.1627581964308; 
 Thu, 29 Jul 2021 11:06:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id g3sm4259931pfi.197.2021.07.29.11.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:06:03 -0700 (PDT)
Subject: Re: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-8-richard.henderson@linaro.org>
 <CAFEAcA-SHZbfEppKBZxVw3+t4VRSRfN7yA4PNNHX9LQ=OkKhjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b20e658f-f400-3921-a31e-25c0e8451b1e@linaro.org>
Date: Thu, 29 Jul 2021 08:05:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-SHZbfEppKBZxVw3+t4VRSRfN7yA4PNNHX9LQ=OkKhjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 3:44 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 01:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We ought to have been recording the virtual address for reporting
>> to the guest trap handler.
>>
>> Cc: qemu-ppc@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/ppc/excp_helper.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index a79a0ed465..0b2c6de442 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>       CPUPPCState *env = cs->env_ptr;
>>       uint32_t insn;
>>
>> +    env->spr[SPR_DAR] = vaddr;
>> +
> 
> Is this the right SPR for all PPC variants? For instance the
> kernel's code in arch/powerpc/kernel/exceptions-64e.S looks
> in SPRN_DEAR, which is our SPR_BOOKE_DEAR or SPR_40x_DEAR.

I have no idea.  I glanced through a handful of the mmu's, and looked at the current BookS 
docs, but that's certainly not all.

I'll note that if we do need to set different regs for different mmus, we'll probably want 
to standardize on this one for user-only, like we did for the user-only copy of 
ppc_cpu_tlb_fill.


r~

