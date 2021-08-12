Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468973E9DB0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 06:47:07 +0200 (CEST)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE2cU-0004CQ-Bx
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 00:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2b9-0003SB-UU
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:45:43 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2b8-0003jL-IP
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:45:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id a20so5707074plm.0
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k+2mA4Q36RTWJ5sfpI0V9+OLbAzxCLS7/EZ+WUAG54g=;
 b=QKz8gnzvE2gvisW4+fl3JWUpGcwLAYH3guGNXfT4i9hy+cvdYsoQHClToKH48x5v6n
 HKnmTxpZznjDTVACItAEV9XhV9h6BEzuZCaXe3j9I9fqDpx9C2JaJdONOGRdmpgtnjOz
 /RnFOMK87abhCi48aqgYWRixfJAUjKc0x0pCi7d1KbGW2Mp1b5jUr0gp8k+Bw17youVY
 poGH2cz+4i3MQ7eN3iZ4SlboFy8p27c7gzvRWH3Hk0pW6P6nrxAAuAEwnzx8VC0UuJEe
 HUld5uPN7nX59Hok/Kbvp1tzOIkdnT2ollYggffmnOhXnBNzOQVozTQ4b4LNhRAh0sa6
 v7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+2mA4Q36RTWJ5sfpI0V9+OLbAzxCLS7/EZ+WUAG54g=;
 b=FpxGbrKKJ2746BFr7Qjm6bz4Vnp8OKv3ldRYP+dffmY/LwloOqeXeYhDBYUxbgZifj
 P13r3d+XW1FYZ9jvFEf6J5nUKqvDTYdgS3VV8pBw9pPr66Rf1Iotdh1c0btHMhsP0Tyl
 oZ1UJXMCgQdho4yNsrL3em43woV7Z4qNFVE4XnPiZprBn8K5nRf/pp7/zqPf10mTQTA6
 WD9zizf2lXiA/9B+ff9dDLKH9nZ65QxQckhnDtBcofWcyBxLVljdXYVXFChrXWI5Ra/y
 tLlWxkWN7zj9r1R95L9OKKkMbjutCJun2qC5I3MUIUYDjagZj3Yfx17l4asiZq/p2rum
 BBLA==
X-Gm-Message-State: AOAM531DcXZQNLnnFFdeXsJ72EBLQwNQGa/Q9Gp0w5BBRKtGGl+NHAtw
 wfNF7dauLrm0hr/r7AEOU2ihAA==
X-Google-Smtp-Source: ABdhPJwqhAlPA6CFewdNz2O8LgHH+yy4hB492ZKi6QMkUyzkphyfeO2NqMtzuw/7vpkHep+qikCMPA==
X-Received: by 2002:a05:6a00:22c8:b029:3cd:d4be:e0e0 with SMTP id
 f8-20020a056a0022c8b02903cdd4bee0e0mr2316717pfj.43.1628743540858; 
 Wed, 11 Aug 2021 21:45:40 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id o22sm1306170pfu.87.2021.08.11.21.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 21:45:39 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
Date: Wed, 11 Aug 2021 18:45:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRSX+kRCEh1oQjWP@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 5:39 PM, David Gibson wrote:
>> I mean, nothing is stopping us from calculating cycles using time, but in the
>> end we would do the same thing we're already doing today.
> 
> Oh.. ok.  I had assumed that icount worked by instrumenting the
> generate TCG code to actually count instructions, rather than working
> off the time.

David, you're right, icount instruments the generated tcg code.
You also have to add -icount to the command-line.


r~

