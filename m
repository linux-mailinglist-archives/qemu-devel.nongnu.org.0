Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49EA666BF8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFsW4-0006xs-CP; Thu, 12 Jan 2023 03:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pFsVv-0006wn-Eh
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:00:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pFsVs-0005yh-Cq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:00:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bj3so15158156pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtUAUhhYMthRahvlYIY4kygswQQW5rZLfrHVro0B0Pw=;
 b=1jKEncPrGH+qd1dxLcKETCo7a3w2zYSsP5nHQs14eTIZBJhshAijV9HuVukwr5k4yZ
 URXZ/2xp5qjnenELRF4sH11sJvEoAzHpbIF0xPhNJILGUfyfT1Ge64dF8ihXiAq0C1HL
 FQlDfcE5Gtj/GdT2atg6wi59GHuzQzPxBZwwlVHfqXk5XEwH4DGqADJzL5gheug+hcNe
 f4w/whLzNXmV7SZvSr5PEXuDLqYQLKkkJpLA558AcPcFbEG6dQpY/9LEz4tThmECDXrD
 QoDbtVFiSU9FUBsMm1uOyYXxTUKnHA2Myg3FpPK/QfifXpuPpjGjgNGhU+b60zbVHASR
 4/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wtUAUhhYMthRahvlYIY4kygswQQW5rZLfrHVro0B0Pw=;
 b=cIQItK9kpeR0VgAzSitkxhRDA2Z/1dA5tLPibDnd5HJZC1mC/IvrfQdhkOIpzvsghj
 uImP+yU/rmFxmgzqXSUghRpp93vjt4E5tgMP3Z7ZuCizs/L4fATwCEHC4IhS2mjBbwOl
 5XEWvm3aFKShXGX+nzVFKs2C7lvSUVt6sjqaLQ+VpJg4r4UK5DXi1tv4EmEIlCdIPw09
 OFUibEHrkfTK2II2RNm850imnEFqMhVgVdOc7AKdpIeDxoR14wxj7KAqKyojOQfFrAy2
 sPgYoi4BJ9diDBmcHxFIP31nw0arshOoPz7wxjZpA+c5AzVgPCRyNi5d/JBgznb+Ib+3
 KX9Q==
X-Gm-Message-State: AFqh2kpKVAqWFI/Mjt3URPVnzJ3ZnixRDVap9dZKyjElvBTpLag7dlEe
 OiglgdNWMhU+bawdQ3gr0msQTA==
X-Google-Smtp-Source: AMrXdXvxwIJTbn37RRTjVimXQQ5q0lSZB2iU+NBUKOymvOyaEx8IsKztV/Tkv3CoOoW2i/bEgci5xA==
X-Received: by 2002:a17:902:6ac5:b0:193:3980:98d5 with SMTP id
 i5-20020a1709026ac500b00193398098d5mr5983862plt.57.1673510409701; 
 Thu, 12 Jan 2023 00:00:09 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a17090311ce00b00189c536c72asm11575657plh.148.2023.01.11.23.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 00:00:09 -0800 (PST)
Message-ID: <ad0c804b-5ba3-511b-2516-64172565c20b@bytedance.com>
Date: Thu, 12 Jan 2023 15:59:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
To: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>,
 "Quintela, Juan" <quintela@redhat.com>, David Hildenbrand
 <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, zhouyibo@bytedance.com
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com> <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
 <Y7RpPwGd0WvrENlz@x1n>
 <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
 <Y716CoJeHKZ6nP1x@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y716CoJeHKZ6nP1x@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter, Paolo,

On 2023/1/10 下午10:45, Peter Xu wrote:
> On Tue, Jan 10, 2023 at 12:09:41AM -0800, Chuang Xu wrote:
>> Hi, Peter and Paolo,
> Hi, Chuang, Paolo,
>
>> I'm sorry I didn't reply to your email in time. I was infected with
>> COVID-19 two weeks ago, so I couldn't think about the problems discussed
>> in your email for a long time.😷
>>
>> On 2023/1/4 上午1:43, Peter Xu wrote:
>>> Hi, Paolo,
>>>
>>> On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
>>>> Il ven 23 dic 2022, 16:54 Peter Xu ha scritto:
>>>>
>>>>>> This is not valid because the transaction could happen in *another*
>>>>> thread.
>>>>>> In that case memory_region_transaction_depth() will be > 0, but RCU is
>>>>>> needed.
>>>>> Do you mean the code is wrong, or the comment? Note that the code has
>>>>> checked rcu_read_locked() where introduced in patch 1, but maybe
>> something
>>>>> else was missed?
>>>>>
>>>> The assertion is wrong. It will succeed even if RCU is unlocked in this
>>>> thread but a transaction is in progress in another thread.
>>> IIUC this is the case where the context:
>>>
>>> (1) doesn't have RCU read lock held, and,
>>> (2) doesn't have BQL held.
>>>
>>> Is it safe at all to reference any flatview in such a context? The thing
>>> is I think the flatview pointer can be freed anytime if both locks are
>> not
>>> taken.
>>>
>>>> Perhaps you can check (memory_region_transaction_depth() > 0 &&
>>>> !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?
>>> What if one thread calls address_space_to_flatview() with BQL held but
>> not
>>> RCU read lock held? I assume it's a legal operation, but it seems to be
>>> able to trigger the assert already?
>>>
>>> Thanks,
>>>
>> I'm not sure whether I understand the content of your discussion correctly,
>> so here I want to explain my understanding firstly.
>>
>>  From my perspective, Paolo thinks that when thread 1 is in a transaction,
>> thread 2 will trigger the assertion when accessing the flatview without
>> holding RCU read lock, although sometimes the thread 2's access to flatview
>> is legal. So Paolo suggests checking (memory_region_transaction_depth() > 0
>> && !qemu_mutex_iothread_locked()) || rcu_read_locked() instead.
>>
>> And Peter thinks that as long as no thread holds the BQL or RCU read lock,
>> the old flatview can be released (actually executed by the rcu thread with
>> BQL held). When thread 1 is in a transaction, if thread 2 access the
>> flatview
>> with BQL held but not RCU read lock held, it's a legal operation. In this
>> legal case, it seems that both my code and Paolo's code will trigger
>> assertion.
> IIUC your original patch is fine in this case (BQL held, RCU not held), as
> long as depth==0.  IMHO what we want to trap here is when BQL held (while
> RCU is not) and depth>0 which can cause unpredictable side effect of using
> obsolete flatview.

I don't quite understand the side effects of depth>0 when BQL is held (while
RCU is not).

In my perspective, both BQL and RCU can ensure that the flatview will not be
released when the worker thread accesses the flatview, because before the rcu
thread releases the flatview, it will make sure itself holding BQL and the
worker thread not holding RCU. So, whether the depth is 0 or not, as long as
BQL or RCU is held, the worker thread will not access the obsolete flatview
(IIUC 'obsolete' means that flatview is released).

>
> To summarize, the original check didn't consider BQL, and if to consider
> BQL I think it should be something like:
>
>    /* Guarantees valid access to the flatview, either lock works */
>    assert(BQL_HELD() || RCU_HELD());
>
>    /*
>     * Guarantees any BQL holder is not reading obsolete flatview (e.g. when
>     * during vm load)
>     */
>    if (BQL_HELD())
>        assert(depth==0);
>
> IIUC it can be merged into:
>
>    assert((BQL_HELD() && depth==0) || RCU_HELD());

IMHO assert(BQL_HELD() || RCU_HELD()) is enough..

Or you think that once a mr transaction is in progress, the old flatview has
been obsolete? If we regard flatview as obsolete when a mr transaction is in
progress, How can RCU ensure that flatview is not obsolete?

What does Paolo think of this check?

Thanks!

>> I'm not sure if I have a good understanding of your emails? I think
>> checking(memory_region_transaction_get_depth() == 0 || rcu_read_locked() ||
>> qemu_mutex_iothread_locked()) should cover the case you discussed.
> This seems still problematic too?  Since the assert can pass even if
> neither BQL nor RCU is held (as long as depth==0).
>
> Thanks,
>

