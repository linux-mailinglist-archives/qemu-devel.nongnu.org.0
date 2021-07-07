Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4233BE093
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:31:52 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wPn-0000un-Mw
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wNu-0007nh-AX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:29:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wNq-0005zX-PA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:29:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id v13so155482ple.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25d6DCx4JES3PoAwzElArCol0of7Z0Fgihm3kJ0b5BU=;
 b=EOinxNmK/tE9EQ992NdxOOmvKnHwINojSH6bs+5KS7I98J1w3Q4QJUyKkUTyoayvU8
 bzZ99wAnnzPvrI9gisnllO9SMNxGwmMe2cFds/WT4KjiLrUtK6MRoPKfIMFfB/YREl1z
 H2+22uZUSD5VlikeAdooh/85gnaKEK4sTk3t3lkLeWXcBFsWoYT0pQMKvQN59Ma9sibU
 scZB8q/9D4XxMGCK3i6u3LmjKocX2wXfEb22SE2ygsh6XtvMbBshh0yU9SSQnA7Pch24
 kkaGlO3hTwbAtp9X3qR4kBwpk7NeyhfO/gvM2lajZuIuYXnkUXs3ZeNuAX0c1rX+czfG
 rNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25d6DCx4JES3PoAwzElArCol0of7Z0Fgihm3kJ0b5BU=;
 b=Axvakl4G7U8AJWyGzz3EHSqlSu1AEnapxhRpsCGcO/tF2zpDkjjk5PgT+31a08dSqH
 UsumQs4w1fU7CEla8krUKBBmyM75/fUl85WDwAQsXENZaySpbdX5dCBFtTzLmg7eknnd
 m88/vNu5gq9bz9mrN6IdgqX8BHLnGZf8O+QvEo5dqNUsbH9YmqIwxMB79C/B0YxOjJrb
 0rBEw0/O7Mr/BJKZGvv8vllxunLBRllC6vpRxeQzNJrH9Fy/T4jr9YUexDZzbV5+di2r
 ZSz4sKtD5iANLEt+l4U64vQoNBpSRIPvHrdWdUOtFqXZtuGGXP2UTnq5iDRC3PjlRda4
 mh7w==
X-Gm-Message-State: AOAM531XUfECd/sbOAVljpL52ViNL7VhTwai18TfzQGpIVRZK4F0/a6/
 uu9C0M9UVi0/AcvYm+KbOsIRfQ==
X-Google-Smtp-Source: ABdhPJzUoC4AEmCKyaNx1uxUCmNXVaGp6+FI0cAqLBuyhFqD54JwdLinVgc++DjoOAzxFiEJSpNRww==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr3315518pjb.141.1625621389342; 
 Tue, 06 Jul 2021 18:29:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y15sm7863488pfl.92.2021.07.06.18.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:29:49 -0700 (PDT)
Subject: Re: [PATCH 06/11] hw/gpio/pl061: Honour Luminary PL061 PUR and PDR
 registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdd8f2f1-471c-e3d1-ccdd-524ba3ae15c8@linaro.org>
Date: Tue, 6 Jul 2021 18:29:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> The Luminary variant of the PL061 has registers GPIOPUR and GPIOPDR
> which lets the guest configure whether the GPIO lines are pull-up,
> pull-down, or truly floating. Instead of assuming all lines are pulled
> high, honour the PUR and PDR registers.
> 
> For the plain PL061, continue to assume that lines have an external
> pull-up resistor, as we did before.
> 
> The stellaris board actually relies on this behaviour -- the CD line
> of the ssd0323 display device is connected to GPIO output C7, and it
> is only because of a different bug which we're about to fix that we
> weren't incorrectly driving this line high on reset and putting the
> ssd0323 into data mode.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 58 +++++++++++++++++++++++++++++++++++++++++---
>   hw/gpio/trace-events |  2 +-
>   2 files changed, 55 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

