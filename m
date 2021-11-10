Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338F44C50F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:33:29 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqXQ-0008Mm-6D
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqVz-0006mr-9U
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:31:59 -0500
Received: from [2a00:1450:4864:20::432] (port=38479
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqVw-0005Uy-MF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:31:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so5043427wrg.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RRiMz3znJmGWhuKEgUxCPJ+EjQg7cBMkSSYp5MG1VIg=;
 b=pP6g+0oU09HXOhwLF3xgKP4RZE4Ur/iBOXkrQHGHzY9cRxTC4oHOb0v3y7bY+/m34D
 DG4tzjPOYBLv3U3GyzoQFIqKEbr2L+1rY3XsCN/VgHul02Q4pt2XIS1ux5Pu9MziQ+Dc
 tECC8sDRUl58rYMWafwD7AE6Slvg0sgIxMkZqt0hc3IuJnTO2V4PBnwX1j5hWJgvVw2p
 m2QCYQ1h4nDqhHl6At0wnHuPG9z4ADKYeUW9nuxhPkGGqrY+AwbC1juW2WuEBUCmO9lK
 uW4huWFO6z8ZnCxTXkNwDCfMGOdx/2Se/9sdxvW9vfzoPgkNNPu/LlN28QO5ANCi66So
 rXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RRiMz3znJmGWhuKEgUxCPJ+EjQg7cBMkSSYp5MG1VIg=;
 b=Ft+/bW17gHhTwsQNL+J8qn8HXdFrpu2+mw7Fyumz9kfjGbrqJxcuhboj058JHH+hrF
 anqDq3u5HCJWBO6b9XcnXt6GFPrJCopTHPEbLYTxzk2muDsr2zqada/eypY1pUU+POpG
 +zjGoyKkXv/fGoQB428M1zkUZnQYS4qEdu776gJyg3ocy1T1anM5W7u9Ydv7BeHOGL/I
 hdpTb1vtExcCB4HqnfvrqJvohzBrA9mJkN3MCf//Ihu2AcFaRFMEnwigDrxF63WN6ZFV
 4nHyKqupVRovf0k/xGau0cHAiiLqcYP0WHB+MTdAIDIVaLEDn4jtjJD3/3vjNU8MDNYS
 JnZw==
X-Gm-Message-State: AOAM530gBhBDBtIfm10NM/qUe8r6OXRPU2zZwMEPPh7AqO69qKtAsWPB
 aKRg7w7LKEHfvQV94JW9NLV1OA==
X-Google-Smtp-Source: ABdhPJwqQ6IZmEzBpTk3eru1sebkCdKminCQuwf1a/8S0jG4wpRqBQxOVT8q5YeT/UuLu50BFAj0Fw==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr299919wrd.369.1636561914487;
 Wed, 10 Nov 2021 08:31:54 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id p19sm279680wmq.4.2021.11.10.08.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:31:54 -0800 (PST)
Subject: Re: [RFC 2/4] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Warner Losh <imp@bsdimp.com>
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-3-imp@bsdimp.com>
 <fa216460-3fa2-a5bc-f974-ea2c8cf6430e@linaro.org>
 <CANCZdfq5SbUE8Wq8MKsHHJdWuu++suZNuL490E7gqEjGHY+V0g@mail.gmail.com>
 <CANCZdfokdTN7QvNwhSCw1VoiZo5qvHM_c+XOU9JF+CMV3GZFjA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87bcf9b8-499c-c5e2-9d13-7afb0c58d991@linaro.org>
Date: Wed, 10 Nov 2021 17:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfokdTN7QvNwhSCw1VoiZo5qvHM_c+XOU9JF+CMV3GZFjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:20 PM, Warner Losh wrote:
>         Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.  It is required for
>         proper
>         operation.  As with host-signal.h, really.
> 
>     Yes. The only possible use I can see for it is to allow people to bring up new
>     platforms more easily by deferring the signal-safe system call details until later in
>     that process.
> 
> If we do, we'd need to remove the linux-user on a mips host tests from the CI pipeline. 
> Those are the only ones left that don't use this that we test.

Ack, thanks.  I'll take care of this next release.


r~

