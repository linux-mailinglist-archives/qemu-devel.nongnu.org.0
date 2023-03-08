Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1B06B0CAA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 16:29:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZvhp-0000jO-As; Wed, 08 Mar 2023 10:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZvhm-0000Zt-5B
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:27:50 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZvhj-0000ve-W3
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:27:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so2731513pjg.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 07:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678289265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A29QZiknsGn9+f5C+jCgpVc2MBqMyfVLkxw6alIqb28=;
 b=e7PLaSCDy6vUt4x1wpGa9jMDfJhnX3kJF9phIq77cqUVpzpUpVDjScFeBR4av4qHwr
 buT2LqXaAlCNXDhHdvJj4c5RC8HkAyA3B0dhB0cG0+Lhrw9D+PCiFbdb49Td/y2jyjjs
 M8rWMWUsp1XZrCXoqkWgs1ZWmoHr2dImHgMwAP0neNJAYJq/k09aRY/RPpMF6ZsecfrX
 3lzwk3h4nSkEgJNurA2DVWHkV3lBO4ZIjddP7gEnomg3kJimks2/43ytM50FPGB+rI3B
 /IfSELvo6f5LZEIz3oF9TZ4hCnho3LIgj9xq8PcbRSW+nVNjSy2eR/mJyEh0HCZUQKj3
 UIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678289265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A29QZiknsGn9+f5C+jCgpVc2MBqMyfVLkxw6alIqb28=;
 b=7el04/Qc4ozJX0CvJTIsP/OOuBB9OEsgCUKOquWalbMY4v414jI0+CafmrY4AxCpsm
 gnJiqLK4mbplM/cXLh3PXJTxLbzgO9ecR7g4y6bKWSBayTsgEJhu3WqYQKAmc4JT4vzk
 WEszFR9ZdajcEufq6AEZaqdY575mTW4/co4xp6vdUZRXySAoPI40wvrL9OEqh8WO+1vV
 hxhbUhv1YdXz/I3gW92crCd6Mm8OvZvID+OLAmnZcZ59nXSWUvZkZ+lr06jVNcR0h44U
 nSY8DBhSSvLHda05BG1fmMyLyxatDWokuzKAKUyfZd1+HV3XtlU7u58MHp94BfT40buh
 TMpw==
X-Gm-Message-State: AO0yUKVmwSXAIn/M8L4e1DP3IhkRywVYTDj+f0gPPSICDl9MVxqpyZfC
 9rsMEuuYhQbL1G7o7JPHQObDeg==
X-Google-Smtp-Source: AK7set+lNW2UmMQgLy4pw5wu0aVKeAkx6po60Sm0t8rJCPe+OdYmO9OIV31Tuznmjlteqc5QzFElmA==
X-Received: by 2002:a17:903:2349:b0:19e:64b9:41c6 with SMTP id
 c9-20020a170903234900b0019e64b941c6mr24220629plh.60.1678289264961; 
 Wed, 08 Mar 2023 07:27:44 -0800 (PST)
Received: from [10.200.9.28] ([139.177.225.230])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903024e00b0019462aa090bsm9973529plh.284.2023.03.08.07.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 07:27:44 -0800 (PST)
Message-ID: <827ec45d-7970-36d5-2dec-48f858369636@bytedance.com>
Date: Wed, 8 Mar 2023 23:27:40 +0800
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
 <ZAiir3qXiYr/Stma@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAiir3qXiYr/Stma@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102b.google.com
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

On 2023/3/8 下午10:58, Peter Xu wrote:
> On Wed, Mar 08, 2023 at 06:03:45AM -0800, Chuang Xu wrote:
>> IIUC, Do you mean that different ways to get flatview are tricky?
> Yes, and properly define when to use which.
>
>> As you said, it's slightly beyond what this series does. Maybe it would be
>> better if we discuss it in a new series and keep this series at v6?
>> what's your take?
> Quotting your test result:
>
>                          time of loading non-iterable vmstate
> before                                  112 ms
> long's patch applied                    103 ms
> my patch applied                         44 ms
> both applied                             39 ms
> add as_to_flat_rcu                       19 ms
>
> If introducing address_space_to_flatview_rcu() can further half the time,
> maybe still worth it?
>
> The thing is the extra _rcu() doesn't bring the major complexity, IMHO.  It
> brings some on identifying which is really safe to not reference a latest
> flatview (it seems to me only during a commit() hook..).
>
> The major complexity still comes from the nested enforced commit() during
> address_space_to_flatview() but that is already in the patchset.
>
> Thanks,
>
OK, let me continue to finish v7.

Here I list some TODOs in v7:

1. squash fix into patch1 of yours.
2. introduce address_space_to_flatview_rcu()
3. add specific comment to define when to use which as_to_flat()
4. Does enforce commit() need further modification or keep current status?
    Looks like you have some new thoughts on it?

Are there any other missing points?

Thanks!


