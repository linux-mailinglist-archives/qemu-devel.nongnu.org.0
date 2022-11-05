Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9461DE92
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 22:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orQag-0001Ro-7Z; Sat, 05 Nov 2022 17:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orQad-0001Re-AP
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:20:31 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orQaa-0007NK-JL
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 17:20:30 -0400
Received: by mail-io1-xd2b.google.com with SMTP id h206so6233966iof.10
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 14:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mf+QvkQJDbiiiOLZTAlFAVgDSNgIvJp/dpYmJSCM6Xk=;
 b=x4AdXAthfXVe39pdEJ6vi+c1mZQi0/yYuv4aG6PR5oCDq7LRwATNaQJlwFX65H/h5u
 /Rn2g5hvDiemnI1fYOinCVnXRM9CQw4WSiTmyzTcabhoXI3VdbyBLfIoQl6hcVKS7D42
 d+RuqfmBo3UnaoKm4MFVKQ/ZeKR2dBhE6BcaN96hqVB8p6IYznNLiFnsYrZSzxbM4xRr
 S1ypBvfIaXAw8IGLt6OoKry4DVlNRz8UR4cGOh8SamekshP1V3vVdhfZMhRMumWbtqOg
 443edW6cSoGFKNJHjy7CXSctLDFWKIltswWzeGuxYrTAE6jPY37GkmwZKngOJ0ttYr+k
 1/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mf+QvkQJDbiiiOLZTAlFAVgDSNgIvJp/dpYmJSCM6Xk=;
 b=MeCTQeEWRUlv5RqKQW9nBotycRoyy93u92MjQZ0EHQe7wedTohq25g8BN85q7wEbfp
 LschqEGMXqy2SMjPunrEPokCITTSs9bLer3exMODGAMMZ+de0L2a7mOSm4hy7p28nMW2
 WRu1IEfwieSqXqiRZ+VkkQZ5jHcenDKIaDbtOzxZd3vsmWdKa0bK6+kF1MnHXky/5Ge1
 vAc88CBxqcovXK4ktfTIk8e6roFkD7NI7rgopWlthJ1MRjOgcyoq7OVfjD4ZuILhEG2u
 dXIbUA9iAXLrD5rY/zDWNrTgFe/gHl8OvYj00Wfqnm+blRqflWEuP8GyFteyR4B3alJM
 Lvsw==
X-Gm-Message-State: ACrzQf1SnVzasF1/vPHvhkJYM9MPjqAhBynoQujrB0LtKsmjyqF6H/b0
 QM7j7fVG3EzdvXDlymsZCkDoow==
X-Google-Smtp-Source: AMsMyM6BaY95voT4vaoH9n8JvesHla3KWlWko+01xfgg7GrKklOOe1L3dHTWMrmsiDq5TGBO3TxrZQ==
X-Received: by 2002:a02:a682:0:b0:34c:14fc:b490 with SMTP id
 j2-20020a02a682000000b0034c14fcb490mr25933763jam.196.1667683226139; 
 Sat, 05 Nov 2022 14:20:26 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.160.8])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a92c143000000b002f165ceb09bsm1201718ilh.64.2022.11.05.14.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 14:20:25 -0700 (PDT)
Message-ID: <8c52dad5-8754-ec38-fd3f-cc4bdc5a14f7@linaro.org>
Date: Sun, 6 Nov 2022 08:20:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL v3 0/7] loongarch-to-apply queue
To: Stefan Hajnoczi <stefanha@gmail.com>, Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org
References: <20221105032736.3789274-1-gaosong@loongson.cn>
 <CAJSP0QXYByLhFQs1ifgDN1YV2rHQGRCUdyQ58BjHhPmnZ7J10A@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJSP0QXYByLhFQs1ifgDN1YV2rHQGRCUdyQ58BjHhPmnZ7J10A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 23:39, Stefan Hajnoczi wrote:
> On Fri, 4 Nov 2022 at 23:28, Song Gao <gaosong@loongson.cn> wrote:
>>
>> The following changes since commit ece5f8374d0416a339f0c0a9399faa2c42d4ad6f:
>>
>>    Merge tag 'linux-user-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-11-03 10:55:05 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221105
>>
>> for you to fetch changes up to 6a284614d485f36af6467ce0925df0042aca7a1f:
>>
>>    target/loongarch: Fix raise_mmu_exception() set wrong exception_index (2022-11-05 10:52:19 +0800)
>>
>> ----------------------------------------------------------------
>> pull-loongarch-20221105
>>
>> V3:
>> - According to Richard's latest comments, drop patch 8, 9.
> 
> v2 has already been merged.
> 
> I was going to revert the commits manually but couldn't find Richard's
> comments on qemu-devel.
> 
> Please send a new pull request with more information about why these
> commits should be reverted. You can use git-revert(1) and state the
> reasoning in the commit description.

Don't revert, just send a follow-up patch.


r~

