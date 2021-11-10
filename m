Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41D44C447
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:21:08 +0100 (CET)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpPP-0005rK-5n
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkpNQ-0004TQ-Uq
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:19:04 -0500
Received: from [2a00:1450:4864:20::42c] (port=35446
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkpNP-0003I3-6o
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:19:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i5so4681727wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KkX5qQ+H7nX2kho9QwuuFmMlCc1o2PrmldtauP6mj5o=;
 b=ZpR1bnqOT9xTKOZxdUD4TN+PGPJ1YY71wEqP3aUirrYbp53f0Zf2Gz5201Jsq/PA5h
 gMLkur8EITmOauaguOpEDM8Ntm2CPW8JqH8VppwOjY1b+5bT8LLXpppYIaIPkjEaNe0n
 xOcfvAKPMJsV7QXJvYlHdduTkw/LwPcmyfraTlM2FudJUGBFhqS3ZdWyeiI+7OUPXF/g
 qzJyUU5mS66gpPJ2u8IIrnUP16zOUEiGBFAgUu5CJN0LyEB3sGExWDhgRitnaipyb9U5
 w2iSj1hzsfs6xdBnotHZMAjYZ9irGhK8TsnBl7tWep4dKZ5yyN+slHkzzfGo+dHfSSUe
 f6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KkX5qQ+H7nX2kho9QwuuFmMlCc1o2PrmldtauP6mj5o=;
 b=FQOnRqaus6Rr0z2BXPea+sYb9Bz2NhIjJkqUsg1EkOBWARTkL8sJUT2+4/y3VeKEFY
 VbUmLzwAEOq81trjLaorfn3lJzbRWB08LbfJUc8b/rbbD3dKrB283IBQ7JiFPPF6N1wR
 LpcJzeqKJTJwLp11yLtwjAr/OPXXE+8EOu71NvbSAGFyAjfsRgfsZ5BfqmTmOyZqRlfD
 MvyndrimisBT9SBaojFAIz6GKLILK0aQxir4djVEd++F1MjPwSRwZXcc25rKx2JR4Q7M
 4Ar8ounTNwoXAgTUj4H+oAMvkKB8NPJvy4h1ksrcnwf5s3rUYe5qmGrj3bX92Cbim3SD
 ABFw==
X-Gm-Message-State: AOAM532DnMXH3QQfeATEZ1MOh55xqBrRjP/kMHOCrgSkfw8taxuWKRMx
 VKPgwTR8SokDIY3zUGj9QShc7A==
X-Google-Smtp-Source: ABdhPJzbk5DNQR3dhxehoEoTnL0M7u0SmWlN8sM5M8+UWWtKTIpg1vn0zCxwtkH+jxHxl37GFkwPyQ==
X-Received: by 2002:adf:aac5:: with SMTP id i5mr581867wrc.67.1636557541735;
 Wed, 10 Nov 2021 07:19:01 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id l8sm7309026wmc.40.2021.11.10.07.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:19:01 -0800 (PST)
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
From: Richard Henderson <richard.henderson@linaro.org>
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
References: <20211108194230.1836262-1-raj.khem@gmail.com>
 <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
 <01900319-d1fc-b677-1f35-5ee2da5bc8a4@linaro.org>
Message-ID: <cda72b6b-e34c-2c99-834a-5897f128a5ae@linaro.org>
Date: Wed, 10 Nov 2021 16:18:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <01900319-d1fc-b677-1f35-5ee2da5bc8a4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/21 4:12 PM, Richard Henderson wrote:
> On 11/10/21 10:25 AM, Richard Henderson wrote:
>> On 11/8/21 8:42 PM, Khem Raj wrote:
>>> uint64_t is available in all userspaces via compiler include stdint.h
>>> therefore use it instead of __u64 which is linux internal type, it fixes
>>> build on some platforms eg. aarch64 systems using musl C library
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   linux-user/host/aarch64/hostdep.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
>>> index a8d41a21ad..34d934f665 100644
>>> --- a/linux-user/host/aarch64/hostdep.h
>>> +++ b/linux-user/host/aarch64/hostdep.h
>>> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>>>   static inline void rewind_if_in_safe_syscall(void *puc)
>>>   {
>>>       ucontext_t *uc = puc;
>>> -    __u64 *pcreg = &uc->uc_mcontext.pc;
>>> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
>>>       if (*pcreg > (uintptr_t)safe_syscall_start
>>>           && *pcreg < (uintptr_t)safe_syscall_end) {
>>
>> Queued to tcg-next, since that's where the original patch came from.
> 
> Dequeued.  We need something more, because on debian we now get:
> 
> ../linux-user/host/aarch64/hostdep.h:28:23: error: initialization of 'uint64_t *' {aka 
> 'long unsigned int *'} from incompatible pointer type 'long long unsigned int *' 
> [-Werror=incompatible-pointer-types]
>       uint64_t *pcreg = &uc->uc_mcontext.pc;
>                         ^
> cc1: all warnings being treated as errors
> 
> Perhaps we need to use __typeof() to get the correct pointer type?  Oh for c++11 auto 
> declarations... :-)

No, we need to not use a pointer at all and grab Warner's

   https://patchew.org/QEMU/20211108023738.42125-1-imp@bsdimp.com/

Even grabbing the first two patches of that series for 6.2 would fix this.


r~

