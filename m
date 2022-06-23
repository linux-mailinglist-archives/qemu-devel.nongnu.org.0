Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB59558B04
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:58:41 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UqW-0005NL-Ol
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UVS-00076L-5O
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:36:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UVQ-0006vt-DP
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:36:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id w24so851409pjg.5
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ewbr6ybXZt0Vsrit4vupdPqMtgGBnUh94FOQr/tbW5o=;
 b=tJ9LhuMmlmc297is72b8Z/fR0CdMq4/xkNAqO/M7PoYZ0sotCkrBKMY//doz2nzn2W
 R6ZXAWtT777mvBaj/vgOQ/Pxhw67EC8ch2AVUEzIFyhYulQyRB0fOTBmebD4fEpkLkcP
 wl9LrlfRLYhIHHfLxCFJn81h4CsHL5XTf3iaRiMUAPlmIj4zOHH/8n8JZi/bkg6prpDX
 yKWl1KuYCYQ3mY2ywIQ94WfBtVkokce5a0oUfJKZZ7c7vrzxT5BWNhjzIp4mkRVH5YGR
 fc3rv3G7rNZuBBNCLAuAbfDXZRuBe/3cKpA3Vl5Mc7Qy5uikijs4nK8+UCkHwOJ9puLF
 SYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ewbr6ybXZt0Vsrit4vupdPqMtgGBnUh94FOQr/tbW5o=;
 b=E2jvZeGeFMuq0vUo3YWGWZQf/7JfULBBHIwtfcICGErW+PdfOTdsd2w6tEi6510W3o
 GnwAaNxf/cMLNqqbg+pHRw0dIBl0Xa6QLzhAQy0qru0Jzv6KxCO6JcIq4h4VabEZd/qz
 5zjjRIkHDiQ8UiXwRWesefnolSgIbjHBj85G/KyYFxLZrLhYcIWNJbruie943oYd3yNi
 Xs7q/S8JTsk9901ZjfLWDcpBmku7B7yyvBXSmGeYFK2L5FeZsSLKTPwnpvC9ck456t+d
 BcrjPEbqRvXvXTG6swlEiL7f2y+K35+qpIsWBXKfQBZ5Uc/+N4vcOmyXw/mj5M5f543x
 pFjQ==
X-Gm-Message-State: AJIora+PlFEbeX1UXl91QmfshDceaJ1qC3gHXwKpTrc+HDBVmaTwufzI
 +PnxecRe9yBA0yfo8XBbjFcRKQ==
X-Google-Smtp-Source: AGRyM1sXXEdopBlqJzAItzV5X2TGRE2n/PKqtQ5jL0SWjilarvjnH4yCxEuTvsG0mQuXxBiZZ9NYdQ==
X-Received: by 2002:a17:902:c40c:b0:16a:1a72:56c8 with SMTP id
 k12-20020a170902c40c00b0016a1a7256c8mr25140312plk.107.1656020210680; 
 Thu, 23 Jun 2022 14:36:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902780600b0016a4db13429sm247115pll.192.2022.06.23.14.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 14:36:49 -0700 (PDT)
Message-ID: <ee210642-b0ee-e584-4412-b50d3c66f71f@linaro.org>
Date: Thu, 23 Jun 2022 14:34:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-4-leandro.lupori@eldorado.org.br>
 <87edzhaet6.fsf@linux.ibm.com>
 <2c09284c-777a-2dc0-7bf6-52e1eb23b4bc@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2c09284c-777a-2dc0-7bf6-52e1eb23b4bc@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/23/22 07:26, Leandro Lupori wrote:
> On 6/21/22 18:26, Fabiano Rosas wrote:
>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o 
>> remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre 
>> imediatamente em contato com o DTI.
>>
>> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
>>
>>> Check if each page dir/table base address is properly aligned and
>>> log a guest error if not, as real hardware behave incorrectly in
>>> this case.
>>>
>>> These checks are only performed when DEBUG_MMU is defined, to avoid
>>> hurting the performance.
>>>
>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>> ---
>>>   target/ppc/mmu-radix64.c | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>>> index 2f0bcbfe2e..80d945a7c3 100644
>>> --- a/target/ppc/mmu-radix64.c
>>> +++ b/target/ppc/mmu-radix64.c
>>> @@ -28,6 +28,8 @@
>>>   #include "mmu-radix64.h"
>>>   #include "mmu-book3s-v3.h"
>>>
>>> +/* #define DEBUG_MMU */
>>> +
>>>   static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
>>>                                                    vaddr eaddr,
>>>                                                    uint64_t *lpid, uint64_t *pid)
>>> @@ -277,6 +279,16 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>>>       if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>>>           ++*level;
>>>           *nls = pde & R_PDE_NLS;
>>> +
>>> +#ifdef DEBUG_MMU
>>> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
>>> +                " page dir size: 0x%"PRIx64" level: %d\n",
>>> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3), *level);
>>> +        }
>>> +#endif
>>
>> Maybe use qemu_log_enabled() instead of the define? I think it is a
>> little more useful and has less chance to rot.
>>
> 
> Ok. I wanted to avoid introducing any extra overhead, but I guess just checking 
> qemu_log_enabled() should be ok.

No, qemu_log_enabled is *already* taken into account by qemu_log_mask.
Just drop the ifdefs.

Do you in fact need to raise an exception here?


r~

