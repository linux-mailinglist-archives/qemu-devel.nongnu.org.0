Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1630AF37
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 19:28:39 +0100 (CET)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dwE-0005nF-8k
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 13:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l6dus-00051Y-0z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:27:14 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l6duo-00069I-AP
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:27:13 -0500
Received: by mail-pf1-x431.google.com with SMTP id y142so4178050pfb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 10:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BtNN2Lk+7eBUSm7eTdFMwUKJBXqYN43oQoqTegAfTMc=;
 b=dwJLozm4G0dJA+hOzjdBddhQJNQIkK9sOm5zuDKLJdst48XWuvrRtSiNn9Y88X/rVG
 TIp7Inc2cUAlF0B7KBLZdeDdMPj6iGZz2Fwg9CIMUezdT1fd3or6YM7P18BDU0iP5uV0
 XOH+RrThWCXEs0Jip19rBxm3F55n4E7EydwpECgiAPdG7uvX7FAcsOpgX9O4/VpYkN7+
 JH7Sy7dUygDmzjzgVabc6Zu/4IAeFO/EmyWT+mIIwePWJqHg8LyjqhEoEl2Nb4ijav4s
 isPsCCt9LcFP9JJOb/+9X9e6BqOsFCpKDPPnHeJKVBUZ/Yden1MBYYZFJzA/c7h+IQ9o
 dblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtNN2Lk+7eBUSm7eTdFMwUKJBXqYN43oQoqTegAfTMc=;
 b=GkxT6FmVSYKK1DUdqA55x3DWabdqVPxvhb8AzFWcvja+ii0V+XEIlxfvCmE56at2yR
 BQM3jFp2Zh4goLy+BNlfQufzsj/c30DC+SsoRqbvx6gwbN9Rn6sgyu4mAwTt7riUrGBz
 WoT7OmuvKsQZHrykvqC+mibHPrJTlCDT9/LLz9NeWwDypFMLprNfgiadakMCSGt0wyeG
 dwp4fiqJ79IkN+TK8/+d+cV2t9nVDkOQczBDBK2B8NBldFoXanIzI1RXgeV7WfOsASGi
 2TS+n+Gy4R5fb58CHaLHm/KILTPfE++c5UM3LiKYXQEttxxymF7Ov/3iHnl6wS2yqrAC
 qNXQ==
X-Gm-Message-State: AOAM5320lSCMjwNS21h4cwPe/dEhlspyzMYGlQkD9qOtERdYyG+O/9Ig
 MbMDxwMcUTdFkkm9Dl6E0Rb2pEj0Xs77LUPS
X-Google-Smtp-Source: ABdhPJyHhDzUSEAQgNvX7HRwWYMMsL43BjwsnqnwJVPuM05GnM0jOltacMdJOz6whHWwfWgB55zlcw==
X-Received: by 2002:a63:e343:: with SMTP id o3mr17632436pgj.317.1612204028240; 
 Mon, 01 Feb 2021 10:27:08 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x19sm18469266pff.192.2021.02.01.10.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 10:27:07 -0800 (PST)
Subject: Re: [QUESTION] tcg: Is concurrent storing and code translation of the
 same code page considered as racing in MTTCG?
To: Liren Wei <lrwei@bupt.edu.cn>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <60169742.1c69fb81.90ae8.cdc6SMTPIN_ADDED_BROKEN@mx.google.com>
 <cebad06c-48f2-6dbd-6d7f-3a3cf5aebbe3@linaro.org>
 <60183365.1c69fb81.8afce.3d7bSMTPIN_ADDED_BROKEN@mx.google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2989e977-79ec-83ad-ecc4-10b4873957f2@linaro.org>
Date: Mon, 1 Feb 2021 08:27:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60183365.1c69fb81.8afce.3d7bSMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 6:59 AM, Liren Wei wrote:
> On 2/1/21 7:01 AM, Richard Henderson wrote:
>> Yes, this is a bug, because we are trying to support e.g. x86 which does not
>> require an icache flush.
> 
> That is too bad :(
> 
> I know nothing about the modern hardware, it's really hard to imagine what
> is done in CPU to maintain the coherence when this kind of cross-modifying
> scenario happens.

Indeed.  Complicated cache shootdown stuff, no doubt.  It also helps that the
cpu is decoding one instruction at a time, whereas qemu is decoding many
instructions.

>> I think the page lock, the TLB_NOTDIRTY setting, and a possible sync on the
>> setting, needs to happen before the bytes are read during translation.
>> Otherwise we don't catch the case above, nor do we catch
>>
>>     CPU1                  CPU2
>>     ------------------    --------------------------
>>     TLB check -> fast
>>                           tb_gen_code() -> all of it
>>       write to ram
>>
>> Also because of x86 (and other architectures in which a single instruction can
>> span a page boundary), I think this lock+set+sync sequence needs to happen on
>> demand in something called from the function set defined in
>> include/exec/translator.h
>>
>> That also means that any target/cpu/ which has not been converted to use that
>> interface remains broken, and should be converted or deprecated.
> 
> I failed to figure out what do you mean by lock+set+sync,

I used "lock+set+sync" as shorthand for the sequence I described in the first
paragraph above.

> in particular:
>   - What is the use of the page lock here (Is this the lock of PageDesc?)

Yes, this would be the PageDesc lock.  It would prevent TLB_NOTDIRTY from being
removed by the slow-path write until any translation is complete.

>   - Is the "possible sync" means some kind of wait so that TLB_NOTDIRTY is
>     definitely able to catch further "write to ram"?

That's what the sync is for -- to make sure that no other cpu can have seen a
dirty page and not be finished with the write.

> Therefore maybe we can mark the RAM backing page in QEMU's page table as
> non-writable at an early stage in tb_gen_code() using the ability of the
> underlying OS...

It's very expensive to change page tables.  It's also complicated to capture
and re-start with signal handlers.  We do that sort of thing for
qemu-linux-user, where there *is* no slow path and we have no other option.

I think it would be much easier to reason with locks.


r~


