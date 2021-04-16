Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD4362577
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:14:56 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXR7P-0002OH-Jw
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXR0m-0003h6-BD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:08:05 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXR0j-00086y-C0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:08:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id p12so19505115pgj.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WkFBCkkkicIKnBE9nNBDT9WuWGWcL0lUZBXFEw9pw8M=;
 b=bFAcaHHjGxiVrow+BpJJW0h/YsGs0kVXjQxOqpEJbE55J+/JIWkMi7LKklFTjSrB/l
 OV4pBBS+186wIHUrLIq0hWKqpEyTPec6fJL2DJHvig161bpvAesinoED/gDIdyKq1/+1
 ieEkAHur9IJixv/ZNwPYiK3Fj77A/zJijbK/VkODSvVXvE4NNtf7CdTyOt/u9vrI5tkJ
 qCfclic8LGRdliJ9PVz1N/oMOwusvbpee2sr/A47NMH9ms3nOxqlwuDtxVGei0QUM1ac
 PZKa2du27CfSWTjWzdu6PtB3chV4T3GGH0CHaOz+PCpmGkxBj1BJwME/eLtzisIh8Bu2
 ljOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WkFBCkkkicIKnBE9nNBDT9WuWGWcL0lUZBXFEw9pw8M=;
 b=kbBNU/ZiUhQmAviXdX4JU/ep/FAkarhn005wiAQSuvid28pkf0tBQ0kqX9R7vs5vFn
 NuABYlhxF3wspC3xlwK3jXfL7IB0RgEk0iIc2KBtzQ7VH95cvZC86XLdV7nac1lOOCbR
 +XHh2mWZVMP11E5z11t9xtDaHlBxF4I4K4jfPvnrBwyuAfYXHeH/vhsbqnmta/v4//4R
 ImxwzqWj6E6vHNpceCMMi6RnmsMidld4s6c3JikVNzLdys7jwHxGj8U2HeKCIXT2f7Vs
 q9BzRvbQDYdkpP8MgbNDub5UVhaeeoA9FFBZh8yOYpzRXdxbES4uPTgeJqhTTs7VrzWH
 3psw==
X-Gm-Message-State: AOAM531G/A+1PlF2JkysvjFL5i17mqkG+BmBKpo3ZBuQ2ylP+kCOjGJH
 A1Z1/w3Z03DLEpZMVxAR+esJ/A==
X-Google-Smtp-Source: ABdhPJz/NYNWyovFx2/O4+pJloC5xRhAvX9MkaPBjyAs7NCCsxEGTOooQMQMccga7SnSYlnH9vKSvw==
X-Received: by 2002:a62:6585:0:b029:241:cf5d:93b2 with SMTP id
 z127-20020a6265850000b0290241cf5d93b2mr8647186pfb.15.1618589279093; 
 Fri, 16 Apr 2021 09:07:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h16sm5158682pfo.191.2021.04.16.09.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 09:07:58 -0700 (PDT)
Subject: Re: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210416154908.21673-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f27dc8f-c62c-fd8e-4f4e-3ad4b51122fa@linaro.org>
Date: Fri, 16 Apr 2021 09:07:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416154908.21673-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 8:49 AM, Alex Bennée wrote:
> This is a left over erroneous check from the days front-ends handled
> io start/end themselves. Regardless just because IO could be performed
> on the last instruction doesn't obligate the front end to do so.
> 
> This fixes an abort faced by the aspeed execute-in-place support which
> will necessarily trigger this state (even before the one-shot
> CF_LAST_IO fix). The test still seems to hang once it attempts to boot
> the Linux kernel but I suspect this is an unrelated issue with icount
> and the timer handling code.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Cédric Le Goater<clg@kaod.org>
> ---
>   target/arm/translate.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

