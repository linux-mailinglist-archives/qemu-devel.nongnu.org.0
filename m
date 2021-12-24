Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825AE47F0D4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 20:59:42 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0qj7-0005gh-Bn
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 14:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0qhV-0004kh-Ka
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 14:58:02 -0500
Received: from [2607:f8b0:4864:20::62b] (port=44727
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0qhT-00077e-MQ
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 14:58:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h1so3954188pls.11
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 11:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5I8C6BkE+v0Rjbgbva+lCPl1aGyV3jMIR9Wru31+2pk=;
 b=tw5KujIlqGe1aw1gr35eGDYKG8O5NzXdKcXfUxJ8gqw/a5L7Cfw5ToHwAzNREZ0TpV
 iuXUbnJI9fDbYV2tOSgF/7IPNBnbTLa01/sEV9cR52UKCRfETwgbMY1+jMWPNA+yVMwJ
 5MiflN+If3Vhoe+OQlIM1CIrsDhqckLTTC6Onkj2/z4Mlsor4XeuAOP5gPITnU5UEjW9
 UMpJWgktvtAZEIqQESFrj040gTL5lrbFoFT17+1p2r1Z3EQ4LYMocPA0bdIVs1TJHHEK
 p//UDQCdNNaYT3Tn9wGOlJEVZvgVZAMVGFzkJPeg/348+ZveOVP3E2VsdTy+hKPxe28+
 5e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5I8C6BkE+v0Rjbgbva+lCPl1aGyV3jMIR9Wru31+2pk=;
 b=iAv6Cijz+KKVdPUX2BxG+LSSzP3oE3VjXGMINascpmaf4BgpWmWnN1IwllxhZvHwHB
 m8GQF0q8MuLTcTqmqY/Vg4+26CX0zsd3y48168JNUTMmbUJKYhLF0RlSOnoC9GQt3FpM
 gU6eFSnXD+p1PJM2U/foRZgs9Vtc3W/7aLf4wBF5moiLBQ6Rquo5/1Kf+2JamvW3Iu+Y
 9ogJWs7yB3pHQpznBvVDvK/u9q/6Xxkj3uBes3CZojT6eBXrBAmuQVWp7meHPQx37TtF
 VF9zHx2pYHx5ENW9Bhdqkf8fFdfQ7dkD0pFy/cnkeGFRDAEQGOs+YKMAy8N/DXNdl+O7
 vacw==
X-Gm-Message-State: AOAM531uCVSYWdSCYMzd7FVoMm2ixrMbFA+ZcUfTgw/3cJPmL2WBmNty
 sByG3tzM1AHfwYxDiBl7XlIp+Q==
X-Google-Smtp-Source: ABdhPJyHrHa7iztaePqc1fOIYsFN3jMsQWfNimr1yuyPemf4qjFT1Bt4ty9dggN1Di6O51vJAfHAvQ==
X-Received: by 2002:a17:90a:1bc5:: with SMTP id
 r5mr9265033pjr.133.1640375878407; 
 Fri, 24 Dec 2021 11:57:58 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id i15sm8236621pgd.16.2021.12.24.11.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 11:57:58 -0800 (PST)
Subject: Re: [PATCH 3/8] ppc/ppc405: Activate MMU logs
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-4-clg@kaod.org>
 <6e2fa6b4-16cd-4c84-0969-a8de82820059@linaro.org>
 <c047662-56d9-be64-4b76-fecb9715fcd4@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ab89876-62d0-5556-07ba-073db2089725@linaro.org>
Date: Fri, 24 Dec 2021 11:57:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c047662-56d9-be64-4b76-fecb9715fcd4@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 4:57 AM, BALATON Zoltan wrote:
> On Thu, 23 Dec 2021, Richard Henderson wrote:
>> On 12/21/21 10:40 PM, Cédric Le Goater wrote:
>>> There is no need to deactivate MMU logging at compile time.
>>>
>>> Signed-off-by: Cédric Le Goater<clg@kaod.org>
>>> ---
>>>   target/ppc/mmu_common.c | 4 ++--
>>>   target/ppc/mmu_helper.c | 2 +-
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> There's also no need to use #defines.
>> You should just remove these and the ifdefs.
> 
> I thought the same unless these are disabled by default for performance reasons. MMU is 
> already quite slow, would this make it even slower?

I don't believe the difference will be measurable.


r~

