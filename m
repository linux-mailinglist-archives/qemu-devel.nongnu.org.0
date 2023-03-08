Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C26B0F29
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 17:48:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZwwi-0000pV-90; Wed, 08 Mar 2023 11:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZwwg-0000oV-DB
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:47:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZwwe-0000mS-NL
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:47:18 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a2so18243367plm.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678294035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKTljWH3Mka3eVW5oi2spu/greBtMreMcoTGxRCCmBE=;
 b=dXqO5Cou76Rzw1eMzrV87NTfj59jZE1MYDofVP/x0oOeVH79uFZEbT9+jIBQsxRf7p
 W5xqzsuLAUHoYW/v4XeFC2VsPKYjQ1rOO5ikEvtspQBjl7dWgGoorW46FtGbEyli9QZs
 aXtHBiha2OsSMrFoKX5j5Gb3o6JiN6NxAoGYFKtnBL4sIjM6FXbgwvXHYw0dGhHkOpCq
 hZ1EUuUJC+4AocWO8bNpEeWDSk3T+Cka2xdgKKI0E7ssH8wWqQwHqe5c415OkxSegEMs
 4MnGv2tVuHXRymow0NbafgL7oYul7GkWwMBZqmY7uC1MRweelyr9OJn4CKkFyGsenwd7
 DmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678294035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKTljWH3Mka3eVW5oi2spu/greBtMreMcoTGxRCCmBE=;
 b=y6pK2IoAqNJJnKfp4DpfqZumPEGBcTc/HQLvT5aA25iBfGSLKJiThwf/Rfe8flAlhf
 /GrQk46ybR18+UJL/5QF2Hq/Ib4dqHPQQA3NvwGQEpaRALgqFN44GPmzLEwGKGlBgCLE
 jrk23ydOfPEdpE83sO+leY4cB1zkXUvC2n6vTo4qIANW+L8wK9l/1tmg+MIjnDr1rfwA
 lhSTcYyPr+b2zoKKYDHPf9tAee87xMEqplHCy8uyHPAbjwgMb/16aYiCFonw1smyGwzg
 kC00a827CijgYTbR/CyKxHSm06L0xipk/TTyJxwTlt7gavl+LmzIC4YChXTepc3nIwFM
 pCeA==
X-Gm-Message-State: AO0yUKUTjvqiROehLINM65UTx9oBEAsl5MdQGy7VPDi2LHElO7IUuQ9F
 3r5TEGM+KbmcTp7mkYg0bB9pVg==
X-Google-Smtp-Source: AK7set+dHQRwktQihCMnUjNMLo+3jjAYyVf0BVAbpFjaj1yJWsfufdW3gIOIRs5rX6/Oy6eXlBm9Yw==
X-Received: by 2002:a17:90b:3e89:b0:237:ae7c:15be with SMTP id
 rj9-20020a17090b3e8900b00237ae7c15bemr19035365pjb.30.1678294035215; 
 Wed, 08 Mar 2023 08:47:15 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 bv7-20020a17090af18700b00230cbb4b6e8sm9230956pjb.24.2023.03.08.08.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 08:47:14 -0800 (PST)
Message-ID: <3c2362c4-1d2f-f749-db1e-201d985e67be@linaro.org>
Date: Wed, 8 Mar 2023 08:47:12 -0800
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9da5c9c5-0675-157d-f099-2b0b14c26002@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 3/8/23 02:49, Paolo Bonzini wrote:
> On 3/7/23 18:26, Richard Henderson wrote:
>> On 3/7/23 09:00, Paolo Bonzini wrote:
>>> while QSLIST_REMOVE_HEAD in the dequeuing thread is not ordered at all:
>>>
>>>          y.store(0, mo_relaxed);           // QSLIST_REMOVE_HEAD
>>>          x.store(0, mo_release);           // fetch_and
>>>
>>>> As I read aio_bh_queue, this is exactly the situation you describe in patch 1 
>>>> justifying the introduction of the new barriers.
>>>
>>> Only store-store reordering is required between QSLIST_REMOVE_HEAD and 
>>> atomic_fetch_and(); and that one *is* blocked by atomic_fetch_and(), since mo_seq_cst 
>>> is a superset of both mo_release.  The new barriers are needed for store-load reordering.
>>
>> In patch 1 you say:
>>
>> # in C11, sequentially consistent atomics (except for seq-cst fences)
>> # only affect the ordering of sequentially consistent operations.
>>
>> and the store in QSLIST_REMOVE_HEAD is not a sequentially consistent operation.
>> Therefore by your own logic we must have a separate barrier here.
> 
> You're right that the comment is contradictory.
> 
> It's the comment that is wrong.  The right text should be
> 
> ---
> in C11, with the exception of seq-cst fences, the order established by sequentially 
> consistent atomics does not propagate to other memory accesses on either side of the 
> seq-cst atomic.  As far as those are concerned, loads performed by a seq-cst atomic are 
> just acquire loads, and stores are just release stores.  Even though loads that occur 
> after a RMW operation cannot move above the load, they can still sneak above the store!
> ---

Ok, thanks.

>> I wonder if your definition/description of smp_mb__before_rmw() isn't actively 
>> misleading in this case.
>>
>> - We could drop it entirely and be less confusing, by not having to explain it.
>> - We could define it as  signal_barrier() for all hosts, simply to fix the
>>    compiler-theoretic reordering problem.
> 
> The case that I was imagining for smp_mb__before_rmw() is something like this:
> 
>      wake_me = true;
>      smp_mb__before_rmw();
>      if (qatomic_xchg(&can_sleep, true)) { ... }
> 
> where you really need a full barrier.

What is different about this that doesn't apply to the remove-head case we've been talking 
about?


r~


