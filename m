Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF56B113D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 19:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZyjk-0004dI-QH; Wed, 08 Mar 2023 13:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZyji-0004cx-Mx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:42:02 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZyjg-00087E-Hi
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:42:02 -0500
Received: by mail-pj1-x102a.google.com with SMTP id x34so17404353pjj.0
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 10:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678300918;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3CMl+y7DSzC/nVkd1IeCfGb/MLoG9BCQx1gh+14kvI=;
 b=rtLJGC5MSFtxVPmMmFxsV/3frlVSX6OdJGI9vTZKNecwKdBsSXHQE02/EqA5qfWRVL
 nFSZ1pfC6Mh/f9fUKa79sLgHEpN4Xfrns8vcNb0B+A2PbYbAihiAhk0CC9eQzEqtijf9
 iY3pG4ikJdoTEDvZWou6gX6iZynBsui+y9v+VG3bBG+z17CM2s1NJiLZctPo6i4LHjQD
 K3VZ/x4Vwyc6qGbyJrD3+BlFBkc+7No6Muc4OyeSa90mNDSuWRX/nZ9uckre/RFWpaTC
 eJTsrZX/+XDYl+NCm3+XQjfSynRl4c5dEWQTDKZe41QPCNQaqmyvme0dJw9NRrlK9TTw
 mULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678300918;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3CMl+y7DSzC/nVkd1IeCfGb/MLoG9BCQx1gh+14kvI=;
 b=lAQZnksHetYQE9OX2tA1g6pRyTHFavHqoPKZZTjQ1oLYAfF7ElQU/ZIi9W/DOy00O/
 T80+Ht0j7GNJUJWFu23Q25KRpB3ELh3o1Rnu5whIOgYpjaTvo9P84I1NAdywEZaX6b1i
 THeNOYolKbjD3tgVJKKz/iaJmS5uOx2gSQjoyVdeQkIXWBc3Y1KCMtyEhnAqiuKljcv0
 Wh3oJEQ/BOMrGF45kNLPxfI0fktA5xdN5QZ7lYMS/9elUlJFWZiATPoPhwgkD0BA8sre
 pq8U8mN+15fD1QfHwwSMXyXOMQgUQEleohzY6TO2aEtadCn9jkGzmxXwSUsGKnHucrgJ
 1ETA==
X-Gm-Message-State: AO0yUKUjby/d4CngsllxedzBgpgK68oZM9fut2UODJQMP1htw7yt/4CR
 r3jUR8zR/c95pQRB537ql1lVqQ==
X-Google-Smtp-Source: AK7set89GOkrC2ruqaFtF04X8l774eSbHUcTn39T8k2RIZmh/OKBluPap8U8aQ89IGUO6GRCfvko2g==
X-Received: by 2002:a17:902:e745:b0:19c:eaab:653d with SMTP id
 p5-20020a170902e74500b0019ceaab653dmr22869910plf.15.1678300918453; 
 Wed, 08 Mar 2023 10:41:58 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 ky6-20020a170902f98600b0019cbec6c17bsm10141441plb.190.2023.03.08.10.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 10:41:58 -0800 (PST)
Message-ID: <16b182f4-b77f-7aef-4010-ad335bae5862@linaro.org>
Date: Wed, 8 Mar 2023 10:41:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
 <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
 <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
 <d661c4dd-309b-be7c-e60e-a035ae787c14@linaro.org>
 <d33a6fda-5b38-c136-9ec0-3c07b2031cd4@redhat.com>
 <aa14b8ad-8756-082b-3694-3c6177f6d46d@linaro.org>
 <9da5c9c5-0675-157d-f099-2b0b14c26002@redhat.com>
 <3c2362c4-1d2f-f749-db1e-201d985e67be@linaro.org>
 <b7af7150-af5d-de86-e237-7dafa326b862@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b7af7150-af5d-de86-e237-7dafa326b862@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/8/23 10:08, Paolo Bonzini wrote:
> On 3/8/23 17:47, Richard Henderson wrote:
>>> The case that I was imagining for smp_mb__before_rmw() is something like this:
>>>
>>>      wake_me = true;
>>>      smp_mb__before_rmw();
>>>      if (qatomic_xchg(&can_sleep, true)) { ... }
>>>
>>> where you really need a full barrier.
>>
>> What is different about this that doesn't apply to the remove-head case we've been 
>> talking about?
> 
> For remove-head, nothing is going to change the BH_PENDING flag while the code runs.  This 
> would be an okay transformation of the code, at both the compiler and the processor level:
> 
>    // first part of atomic_fetch_and
>    old_flags = LDAXR of bh->flags
> 
>    // QSLIST_REMOVE_HEAD ends up between load and store of
>    // atomic_fetch_and
>    all the loads and stores for remove-head
> 
>    // second part of atomic_fetch_and
>    new_flags = old_flags & ~(BH_PENDING|BH_SCHEDULED|BH_IDLE);
>    (successful) STLXR of new_flags into bh->flags
> 
> 
> Instead in the case above, I was thinking you would get a missed wakeup without the 
> barriers.  Here is the full pseudocode:
> 
>    // this store can move below the load of can_sleep
>    qatomic_set(&wake_me, true);
>    if (qatomic_xchg(&can_sleep, true)) sleep;
> 
>    // this store can move below the load of wake_me
>    qatomic_set(&can_sleep, false);
>    if (qatomic_xchg(&wake_me, false)) wake them;
> 
> The buggy case is where the threads observe can_sleep = true, wake_me = false, i.e. the 
> original value of the variables.

Oh, I see, buggy in a larger context.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

