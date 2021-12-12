Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76575471CF7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:33:46 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVXU-0005By-7e
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVVO-00030j-W1
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:31:35 -0500
Received: from [2607:f8b0:4864:20::534] (port=38858
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVVM-0004Om-R4
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:31:34 -0500
Received: by mail-pg1-x534.google.com with SMTP id s137so12776586pgs.5
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IMh1HKuTCrNTPjLu4ZRuSgPRr0bBwS4tyKbnHSOVO+A=;
 b=ToOa+wHpYwC3Ig8Gws2+0VAPYhRGz3RMgd+/iTJHnekG7tU9ZEyM8vI8EHU72TVKjU
 GOT1pGL+rKduvRcPslgly20hSWbh+AOKFd5e1bohxTi8ewOHmOGf9E1l4561LARhMJdW
 LwKZfYw8c/vqKZHBXTT7bJOVTf3jUnJXVCg7CxZbQf+u44xMCDl+4ZJeVKG0SoYPY/yO
 GuTCdYWGlQG7PMSXYsmkFpmjMTt+XEXOkrhmYA6lfTdxDkNczUsdJUsCOzC1gakZPqQF
 j1OLXnn7T+1Z1QaHX4QuTeSikdJGqfmJ33zPgFHcWDWU+heIbN+j/1ISr1/tB92ztgM1
 mOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IMh1HKuTCrNTPjLu4ZRuSgPRr0bBwS4tyKbnHSOVO+A=;
 b=OLVqTxIOmiAyJM+Zn+ZTLetORHM0UV2aL6nfqpJdMH65A4WDaUWb+J6leaeRcrz3rm
 0e7mubvhDrli9ZZic4TWSZRPPN6oBFdJcl0GFNpH61Bd3t9Cxcwia+stQts8DNyLNNDt
 wNAsh8xIdtffHhD+cGBzxk1PDCT1ciig89Xl6Wjm4/rTuMjiSzthn2MfrHX1TPka9j0D
 1XG0GHV5bjPqs6EqxasqggYNW3hci2r2yv3a1bBC3mtELzp/bwlmW4q3mXUl0vx+bhtZ
 G9D4+L7Usut1C7XKn3eJkMDGsMgyDylzNZYenGlKnbnynbJinf5WfwlrneTiMzM3J8+J
 TsMQ==
X-Gm-Message-State: AOAM533HqxkpUCxfx7mLfNUN7il57wUKG3Qm9sBCpuBSQJLWP4/l5fZG
 uqFrFekpISnqlpCBlMi2Miu5xw==
X-Google-Smtp-Source: ABdhPJyHCEn0Z9G182eXepV7/5C8C5cUqp2q7epcQKPWm+CHbqwrndEOJ8uZuq9PMUWhwCbkm96RlQ==
X-Received: by 2002:a65:5c05:: with SMTP id u5mr46230185pgr.471.1639341091211; 
 Sun, 12 Dec 2021 12:31:31 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t191sm2645611pgd.3.2021.12.12.12.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:31:30 -0800 (PST)
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d30f706-538f-f477-f9a6-f3b5ce4f38ab@linaro.org>
Date: Sun, 12 Dec 2021 12:31:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The DTE.SIZE field is 5 bits, which means that DTE.SIZE + 1
> might in theory be 32. When calculating 1 << (DTE.SIZE + 1)
> use 1ULL to ensure that we don't do this arithmetic at 32 bits
> and shift the 1 off the end in this case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

But then you assign the result to a uint32_t, so the patch is incomplete.


r~

