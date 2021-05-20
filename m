Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB538B43A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:29:43 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlYM-0006Pt-Ii
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlX6-00050Y-Ds
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:28:24 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlX4-0004Dk-DS
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:28:24 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id f9so2387826vsp.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sy2tfxNgI5IrtA71QSdU9bR8Pn6bVRz0sUzHKe39QI0=;
 b=s9Sn1Ae52nG1TV8GZD7Lr3x8qGRF+u9wHxVt3SEF8nd5+rQVnuc2b8toB+ZTIc8dVU
 Qv9FMSvLpdOcLyuNXmNn29berS1+fMnzLCeNwMlHJb9ybfPj7aoeZnjvW1C4I3dFgssz
 2hEqGMJxHAODORflSR/WFFr6fs950r9SerHbc9zZHWCkg18+nMc6g2kl1xL2xKgT0bMv
 +s+QS9HHz2XW9mVrHwGjewf1rjXwzUBgfdsMtmlupSRYm8B/lQcfzkA9GFIATVUKuo9V
 D18VzvPCHhTF3RKGPhbpvr63H2qS/k8mBVN6a6jOeaT81+7uHyqQV7HESWE/Vht0QWt8
 +UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sy2tfxNgI5IrtA71QSdU9bR8Pn6bVRz0sUzHKe39QI0=;
 b=IsXZO+7ukGfgJTv/QIS5OZ7Ei2kOd+Tkx8VKPuXWLcKF+WDvkrvryAY5GFVqGqta8c
 A51Jd0CaGPtKD95H3IJG77fE4ZGbgPHqWnJHE/Mnk38Pl8EhldLoSp49TF3RtIuYcK+T
 15cRVH1Z8BUh95jHrBtQjHj7lCc61AdT75Tq9D+R4E4B78GReE3UkSo8d7gHBia13/D0
 lgR88v8YpVqm4+fuEvu/qw/jCUe43TpQa34CdCSBG60HKMD5gC4BEDl2GwJ0F+D4Mwlj
 6JK1OxP9505XGADGQ0dqX3dAwmdJiM60ubWilot9TptK4tKiqgNN/fWB2tPiae7FuApK
 MV0g==
X-Gm-Message-State: AOAM533pqQlPHJFbOlV5AydRFdWK6fj2aTxxpjiUpwup7eip4WiQE3iX
 Jq5rI8MkaLNSFPztAEvmg4Yaug==
X-Google-Smtp-Source: ABdhPJyNPLHJSe5YiZzhdeWDR22ZJhMrQEG0RvjlQLLl4go7lnSJuNkgAGYdbm8/QgOykGfXpD97Aw==
X-Received: by 2002:a67:66c2:: with SMTP id a185mr5182769vsc.49.1621528101347; 
 Thu, 20 May 2021 09:28:21 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id n14sm515088vsq.14.2021.05.20.09.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:28:21 -0700 (PDT)
Subject: Re: [RFC PATCH 00/25] exec: Add load/store API for aligned pointers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518183655.1711377-1-philmd@redhat.com>
 <c4f5ae75-b0a6-7d70-b563-c30ad2415ae4@linaro.org>
 <7365be66-48b6-1484-7f96-32cafb1651a7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfa1597e-a6dc-01ea-85e0-aa6888f3d097@linaro.org>
Date: Thu, 20 May 2021 11:28:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7365be66-48b6-1484-7f96-32cafb1651a7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:40 PM, Philippe Mathieu-Daudé wrote:
> On 5/19/21 9:20 PM, Richard Henderson wrote:
>> On 5/18/21 1:36 PM, Philippe Mathieu-Daudé wrote:
>>> The series is decomposed as:
>>> - cleanups (1-6)
>>> - clean ldst API using macros (7-13)
>>> - add aligned ldst methods (14)
>>> - add aligned memory methods (15-16)
>>> - similar changes in virtio (17-24)
>>> - use the new methods on vring aligned values (25)
>>>
>>> There are some checkpatch errors related to the macro used.
>>
>> I think we should emphasize the atomicness of the access as opposed to
>> the alignedness.  That's the only thing that's important to virtio.
>>
>> Thus s/aligned/atomic/g and use qatomic_read/qatomic_set.
> 
> OK.
> 
> Do you think patches 1-6, 17 (Use correct type sizes) could
> go in meanwhile, or should I repost them separately?
> 

I think 1-6 can be queued; I'm had a question about 17.


r~

