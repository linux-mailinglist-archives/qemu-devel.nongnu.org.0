Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1C3F3226
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:21:37 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8D2-0000QV-60
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8BZ-00083H-Fy
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:20:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8BX-0004yW-PA
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:20:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id t13so9173107pfl.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DHf1jA+gn72hWgymdRd1+97ia+17Mz9oDfyrCAsNqrQ=;
 b=dy7W59kcaRGxCRkh0CxmqculsF7BDzxwHgCwTOr4xInKXJlQaGMQMZEgFZPYW71cSl
 cYN2t41aZ+kmC0YEXfdzc31UNiSllILiwQMiyZsYHcU116mXDqTWqOMfrYlTarByfvYw
 TSExLJ6xxUe+0i/l5fG+EhVXGzDPtQXzrVJ9l/4WWowXBvqpBZ1lVZWpMonUNT1Fd2NJ
 18rtdNT5OOCeMIKpUm6Njd8jESWqEwVbkr5mknOZ5ladM2dlieEpSh/2RiPZgI7biCR/
 X7ZC0Kg32/7KxUl4wRRFZdb1Uxf12C44xmJpQcuU+C9SzpLZD0IIjjH7M/IyeU8To2I8
 cftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DHf1jA+gn72hWgymdRd1+97ia+17Mz9oDfyrCAsNqrQ=;
 b=sw8i6mytXlleXNIRcH7TPBAX7u/EtBjDgKEZddIRRM1lhrWnD/J5kE2C5lKSMAzXnW
 t8rdUl5goIB6bO0baBu3nPadz/MRLprY90gtyGAHtWCT5EBCMluASXnhpwqJNJ3oVyRv
 1WbC834WyQ+9e98LwkYaWuKETPBT2U3wtTaDnVvN9WCfLa4SivmkBlM3bijmT1ZIRV4z
 zcJyjM1ZFgCTIrt02KaXPmTK8df99a5IOFGqjs6bPh7RE5tBO7z8DXR+xe1iOHr5GY9l
 uLx77oWORH4U2GDZtaV+UCppfCjLFrYGe79QxTHN1wZfEMbAtpgJwHqMrDYhkN0nbTil
 T9LA==
X-Gm-Message-State: AOAM530ra6drG+7UsrYjCXsNKNbebTl35oiwQ4fn3odtIjr6w9tawZyW
 Cj6CkL5dXhbHreJttlWxkU8tgUS3pxbclQ==
X-Google-Smtp-Source: ABdhPJz6uXlOERSIwXkKuAhbHE6TRHyRej1XfXajMdODpz6fNH22TurpLyqcLpimbB1zmdBfTj8vXA==
X-Received: by 2002:a65:67c6:: with SMTP id b6mr19438123pgs.332.1629480001633; 
 Fri, 20 Aug 2021 10:20:01 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id s22sm7236018pfu.52.2021.08.20.10.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 10:20:01 -0700 (PDT)
Subject: Re: [PATCH v3 06/14] tcg/arm: Support unaligned access for softmmu
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-7-richard.henderson@linaro.org>
 <CAFEAcA9KYVCwOR8ExCQqw-gcM=7EfEpdiRwSP+GGH3rNMh4zFQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3d94c13-5f18-c3fd-656c-ee94117d0910@linaro.org>
Date: Fri, 20 Aug 2021 07:19:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KYVCwOR8ExCQqw-gcM=7EfEpdiRwSP+GGH3rNMh4zFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 3:34 AM, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 22:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>>  From armv6, the architecture supports unaligned accesses.
>> All we need to do is perform the correct alignment check
>> in tcg_out_tlb_read and not use LDRD/STRD when the access
>> is not aligned.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> @@ -1578,27 +1576,32 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>>
>>       /*
>>        * Check alignment, check comparators.
>> -     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
>> +     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
>>        * to reduce the number of sequential conditional instructions.
>>        * Almost all guests have at least 4k pages, which means that we need
>>        * to clear at least 9 bits even for an 8-byte memory, which means it
>>        * isn't worth checking for an immediate operand for BIC.
>>        */
>> +    /* For unaligned accesses, test the page of the last byte. */
>> +    t_addr = addrlo;
>> +    if (a_mask < s_mask) {
>> +        t_addr = TCG_REG_R0;
>> +        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
>> +                        addrlo, s_mask - a_mask);
>> +    }
> 
> I don't understand what this comment means or why we're doing the
> addition. If we know we need to check eg whether the address is 2-aligned,
> why aren't we just checking whether it's 2-aligned ? Could you
> expand on the explanation a bit?

We want to detect the page crossing case of a misaligned access.

We began computing the softtlb data with the address of the start access (addrlo).  We 
then compute the address of the last (aligned) portion of the access.  For a 4-byte access 
that is 1-byte aligned, we add 3 - 0 = 3, finding the last byte; for a 2-byte aligned 
access we add 3 - 1 = 2; for a 4-byte aligned access we (logically) add 3 - 3 = 0.

This second quantity retains the alignment we need to test and also rolls over to the next 
page iff the access does. When we compare against the comparator in the tlb, a bit set 
within the alignment will cause failure as will a differing page number.


r~

