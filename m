Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C416B27D1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHd2-0000oC-RW; Thu, 09 Mar 2023 09:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paHd0-0000o2-NS
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:52:22 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paHcy-0001jm-Dx
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:52:22 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6153887pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678373532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3Oiq0E3aSAqu7A/XP+5d0kvG5e1RNGuWUB6aRuujSs=;
 b=iw3h+oR/gSsEsL20TiszICkAHbhkAy4nw3PtOZtUM9ai+SiI393hsAQb5414y3wJxK
 JOE+xSf8I+0a7d4RHgXEvrgb1ltF0yoGDWRGLIBBtTTDuVWsXJyrrAwkoWelDMCBt/Ps
 llmXrc1ywduphcBZNh6tG9GyXnxwJewxXUZWSgtJVmskqH7BLRaLGxT+Jj0L2ZzECGgd
 +gLWdK++BdpKyY42/ElNzM1rQplXAHkIXpLODkrYtd80nzsoesr1/gSRELuonzuHPT2S
 1gucRlNdySr59znhFo7Hxqbc6aSl5FlYPy/uFqc0sVV8Qq9aOiaitz71KTheOCsvrxC8
 WWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T3Oiq0E3aSAqu7A/XP+5d0kvG5e1RNGuWUB6aRuujSs=;
 b=p8ucPmeVd0w3t+GMHyUOfGJln3/YOFXzAmo11+/t5EDjvpd9/Q1bXjW9p9zLYUSfcQ
 6LlD4qSGCw0wLL21jdGLkroM1E2Re41MzhFTQPGzQJip6ka1NlN8wkZVKF4h8o8Qz9on
 R80oVjDGthYPoeZ9nvo7VKSVPuU/hoQwh8suJpMG/Amv5LotpLPdMxWlcAPdyuiS3V32
 R9yqg9Eetk21fh22XCgxznN9kNL6ijPr7oCb5fscaLxmZJs3S7vLFYsT+QVF9vmL8o5V
 DDtcAy7l5BwX3np9k8xaKOJPbRqHUV12shmsizowGkSpP1tgPBVUU8AIxF99lc70A42x
 ifCQ==
X-Gm-Message-State: AO0yUKXV/7YNENFmSUa98sqF+2gtYN4XOO7wxSSNh424+bjlGHiGhLdW
 WgQZKtcsoFZsBXqefdA4FCSC0w==
X-Google-Smtp-Source: AK7set9w+VmQI2/KxDPcp6hiAd2dL1mub5GsgRgc2syk7uUcTwF8QAaojskuzkvHm7fs9IKMVsWc6Q==
X-Received: by 2002:a17:90b:3b90:b0:234:b35b:f905 with SMTP id
 pc16-20020a17090b3b9000b00234b35bf905mr23937619pjb.2.1678373531826; 
 Thu, 09 Mar 2023 06:52:11 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a17090a3ea700b002340b2c62e7sm11113pjc.55.2023.03.09.06.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 06:52:11 -0800 (PST)
Message-ID: <1543e6ff-f569-cfce-bfcc-a763121de73d@bytedance.com>
Date: Thu, 9 Mar 2023 22:52:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n> <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n> <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
 <ZAdupAAJjbSbJiss@x1n>
 <CALophus_dTA6U3zGP6u0YnRr65GrhF665mBtX7SkBdLMVJKxBw@mail.gmail.com>
 <ZAiir3qXiYr/Stma@x1n> <827ec45d-7970-36d5-2dec-48f858369636@bytedance.com>
 <ZAit8yypJ2Mv44BH@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAit8yypJ2Mv44BH@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter,

On 2023/3/8 下午11:46, Peter Xu wrote:
>> 1. squash fix into patch1 of yours.
>> 2. introduce address_space_to_flatview_rcu()
>> 3. add specific comment to define when to use which as_to_flat()
> This can be together with 2).
>
> We should suggest using address_space_to_flatview() by default in the
> comment, and only use _rcu() with cautions e.g. we can mention commit()
> hooks as example, and also mention the possibility of seeing very old (or
> purely empty flatview) if during vm load.  In that sense this can be the
> last patch of your set so there's the vm load context to reference.
>
> I hope there'll be no outliers that takes only RCU (no bql) but still
> expect a very new flatview then it'll crash easily if called in a vm load.
> But let's see..  I assume your test cases are already a much larger set so
> covers a lot of code paths already.
>
>> 4. Does enforce commit() need further modification or keep current status?
>>     Looks like you have some new thoughts on it?
> I don't.
>
> PS: I do have some thoughts but I don't think I mentioned them..  My
> thoughts were that we can actually avoid calling begin()/commit()/... hooks
> during a nested do_commit() at all but only update current_map.  That'll
> further avoid the _rcu() patch to be introduced, but I think that needs
> more changes and may not be necessary at all.  Ignore this.
>
Got it.

>> Are there any other missing points?
> No from my side.
>
> Note that 8.0 reached soft freeze.  Sorry to say so, but it seems this work
> will only be possible (if no further objections coming) for 8.1 merge
> windows, so the early merge will be after middle of Apirl.  Thanks for
> being consistent with it already so far.

I also want to thank you for your long-term guidance and suggestions for
this series.

To tell the truth, as a new comer, this is the first patch I try to send
to the community. Your active discussion in the emails makes me feel that
I am doing something really meaningful, so I am willing to continuously devote
my energy to participate in the discussion, and at the same time, I benefit
a lot from the discussion with you.

Thanks!


