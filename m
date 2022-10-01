Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4995F1C93
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:02:59 +0200 (CEST)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oed4z-0000x0-LJ
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oed1C-0004p7-N1
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 09:59:04 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oed16-0002d1-0y
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 09:59:02 -0400
Received: by mail-qk1-x734.google.com with SMTP id u28so4402066qku.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cjd8hE8iP1ZR08ExbBRJt4GUXrFyEKHDtiBJkSsG+Lg=;
 b=kqGoEVcKRd04eKOZbaIm57ax7a8Nfp/SeRva/mngjuGaDVKgfiSeBje14xjR05DQfL
 rMouk4k2ltuBxgkmhvfOhd+j8iKq88jdv0EQYR1Dce3wRxPKbi9JlsPGGEUGSYLWylB2
 6ModecUQysrXAPcGUrvZCpIclJyK3UkQidJq4b/PvFoYMK0eirHcASjEVXqZF3bGDLUm
 nGVPJYbAIuM2r/23ufrad3lwEiH8X6j+6pqXWODPGqLSZ1tslMBAb40ve0xVZlThNIGO
 /WSwOqu76sb86UdR7Jiih1o6ehHOKxcGe5J0g8744CMUs4GXrV/I1EZ7fD28Vw2Ub9Kw
 20UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cjd8hE8iP1ZR08ExbBRJt4GUXrFyEKHDtiBJkSsG+Lg=;
 b=7XCMVRuXlzjx1g0GGd+6LdFiTSMaF+V19F4oYswXMHBjAyHTBG9kLbcfPDsF+iI403
 9sj2PVUmPmBoAhlGkW4CR8ojZ7OrQLYEt6nR3heffJQdieG/JwDNZhfFXQecgKNpCHRR
 8hGT8w2QsjFOUzT0UEAGifpXy44ge9+ZLiKDy16sNzM6qFDG4Mmrd5QLyAVOyYQsh+V5
 GbL2NpPyvlGs0ulL+hwujpYiH+wKZzu5pV/zUMYBJDMuzCKDUzbLtuigaW1nk1aKrzb/
 Uoi6PyW87jN1+IOwsbwO672VZFlbvx6m0aseu958Q3z6edkFM4c7Ni1nVN30qjst/Knz
 Xh6A==
X-Gm-Message-State: ACrzQf2Vn3UYiQ5Oz8kvsKq2xg4N71eSnebCndYRg+QOS2XLf8+55OdV
 zapwFw11xT+6/MtXiN02anaFfg==
X-Google-Smtp-Source: AMsMyM5JsfiX34JUV9xKAJHv+z8NlHJNzavmBjeo//3PizUPSFkchgMUiru64SgK0MS5mHjocQ/D6A==
X-Received: by 2002:a05:620a:1239:b0:6ce:24c1:12d7 with SMTP id
 v25-20020a05620a123900b006ce24c112d7mr9134799qkj.496.1664632728890; 
 Sat, 01 Oct 2022 06:58:48 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8080:8162:afc7:8362:2616:ac15?
 ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05620a298700b006ce3e4fb328sm5693562qkp.42.2022.10.01.06.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 06:58:48 -0700 (PDT)
Message-ID: <d7f6e229-c836-9140-ab83-ff9abb425850@linaro.org>
Date: Sat, 1 Oct 2022 06:58:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 19/23] target/i386: Use gen_jmp_rel for gen_jcc
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-20-richard.henderson@linaro.org>
 <CABgObfa3RE3o6cfUk-7qagubCcxUO7J3sFfp63O5z08-RQHBiQ@mail.gmail.com>
 <fba2a072-e50f-4321-d923-07500d969b33@linaro.org>
 <CABgObfYAQQ5hVg0iDdU+Lro=4_Q=tbPS7=4MtpvJvUVp=QJynQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfYAQQ5hVg0iDdU+Lro=4_Q=tbPS7=4MtpvJvUVp=QJynQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.743,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/1/22 00:03, Paolo Bonzini wrote:
> On Sat, Oct 1, 2022 at 3:04 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/21/22 06:09, Paolo Bonzini wrote:
>>> On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>> +    gen_jcc1(s, b, l1);
>>>> +    gen_jmp_rel(s, ot, 0, 1);
>>>> +    gen_set_label(l1);
>>>> +    gen_jmp_rel(s, ot, diff, 0);
>>>
>>> Might be worth a comment that jumps with 16-bit operand size truncate
>>> EIP even if the jump is not taken.
>>
>> Hmm.  But is that correct?  That's not reflected by the pseudocode for Jcc.
> 
> No, it's not:
> 
> int main() {
>          asm("clc; data16 jc 1f; 1:");
> }
> 
> does not crash (it does with stc) on real hardware, but it does with
> this series applied.  So the various occurrences of gen_jmp_rel(s, ot,
> 0, 1) or gen_jmp_rel(s, MO_32, 0, 1) should stay as gen_jmp_tb(s,
> s->pc - s->cs_base, 1).

Nice test.  I had an idea this would be the case, so I had already added a helper to 
perform the jump with truncation to the "current code size".  It turned out that I needed 
that in other places too, like rep.

New patch set coming up.


r~

