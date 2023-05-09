Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06F6FCA59
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:37:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPP3-0008Tw-6s; Tue, 09 May 2023 11:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwPP2-0008Tf-28
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:37:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwPP0-0003tp-F6
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:37:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso22014745e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683646641; x=1686238641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E2mElTc5z2UnAb7r2MIIkTqebmaN6ND+TvDtNXyHTXY=;
 b=PkAe7/q7oG4g8AurTcbh+kYQkLsO86hrVZXXyiXNBPgY+EV3l1sunrmS6fTB+MvMfB
 E/CZkOvBXFgBbA25Ddja59k4Chnv5Cctrg1WLq6+/YISvFuLXMbuDP1Pat4JMmaLvPCY
 z2aO8W2LGXtbGjLq29qo6eKZyPdZ5t8JBKGE71soWNYnCN6eJzveIvxiTJpiu3Sufi8m
 A/bonN01TGqQOj49tfHRKh6zXHQq64udsEjY6Q2/vhAP1bL6fqH6v9fLbWTe4hUn6rmy
 yIjieSikv27MXjfCezgxiwkV5oQ3iKCUwXIcgOFisHMNjHBufX9ZeHs6QHBjI3MOLmDd
 qekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646641; x=1686238641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E2mElTc5z2UnAb7r2MIIkTqebmaN6ND+TvDtNXyHTXY=;
 b=CiZKmtKmg3YFrnkW1jfg3zPp0e55lucJPMfDiQcwmqShtKnJVTcGu+x6Qjkgm2ROFD
 Myac9Zixu9N8CdiOmGzhoOr73J8XZQrZHFkAkUkcAqmUdkXv6yEgx8Im5X0Kg1q6eWCa
 v6JnUgBB8Q0tSwHJOku5qAnmnyqKHCQE8IEzGcxvMUcOOEWfpPSNi9LXq0h/jC/ZcB7W
 WY3dVSyokq1WgUIxm+1c9fsHREDkvS9ysEM2HnYN2sPOo2VbP+23MCY43GfeaX2RRXuq
 gh5K6C4OGZL12V7H/SFwXaqZc/CX/jaNVUonqmIE65PzHLjmuRSH5P/pCPktCz0j3f3D
 cP8w==
X-Gm-Message-State: AC+VfDxDWd6xTfaEWGaaUgMZAqUeq7X7OgTzZ3/Y8VKpKt0Yt75phrcy
 pB+Cuo84/TcwZTVn36xmv10kcU/mQSzGGlu2hB4=
X-Google-Smtp-Source: ACHHUZ6V8Fpz/giT22yT9OSvRqGMYkYR0kJ7HbptWdMrjPaO+CFYKngPDFK4u8wQDWi70deCP7B+yg==
X-Received: by 2002:a05:600c:3658:b0:3f4:2374:3512 with SMTP id
 y24-20020a05600c365800b003f423743512mr5847231wmq.18.1683646640843; 
 Tue, 09 May 2023 08:37:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a7bc053000000b003f09d7b6e20sm20125691wmc.2.2023.05.09.08.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:37:20 -0700 (PDT)
Message-ID: <5478a311-676e-6cfb-985e-15e0f2a24f20@linaro.org>
Date: Tue, 9 May 2023 17:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] hw/mips/malta: Fix minor dead code issue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230406153721.3349647-1-peter.maydell@linaro.org>
 <d26a0128-10b5-0dae-cf12-15072a564396@linaro.org>
 <CAFEAcA-2hrnjnMnA+GA1w0M-=rfcsO_FwJ2RkysMXpyCmCkO7g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-2hrnjnMnA+GA1w0M-=rfcsO_FwJ2RkysMXpyCmCkO7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/5/23 15:07, Peter Maydell wrote:
> On Thu, 6 Apr 2023 at 16:54, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 6/4/23 17:37, Peter Maydell wrote:
>>> Coverity points out (in CID 1508390) that write_bootloader has
>>> some dead code, where we assign to 'p' and then in the following
>>> line assign to it again. This happened as a result of the
>>> refactoring in commit cd5066f8618b.
>>>
>>> Fix the dead code by removing the 'void *v' variable entirely and
>>> instead adding a cast when calling bl_setup_gt64120_jump_kernel(), as
>>> we do at its other callsite in write_bootloader_nanomips().
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    hw/mips/malta.c | 5 +----
>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Are you planning to take this into a mips pullreq?
> If not, I can throw it into my next target-arm series.

I'll appreciate if you can take this single patch via your
arm tree. Thanks!


