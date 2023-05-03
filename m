Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A36F54F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:42:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8zf-00049u-5e; Wed, 03 May 2023 05:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8zd-00046M-5D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:41:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8zZ-0001Xn-WC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:41:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so2438602f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683106904; x=1685698904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LD8VPjBC6l2J6jT7ZzyVMmo6WvrSa+0PI6lS90rhdYE=;
 b=mmZLrRZsEhjObtZgFAmX85ub/0rYacAXOVU5pEUxAb5mFxsgljOg8ZmoalAI/y8l9+
 huLuksxLAMOCvDLCDg8QHbPWoZ9nU5biVXAxTkn3VzMvDfaiCexEvt263LC5zC6hcblB
 0Eo/JmunGc0Pt8iQbXG2Gp+/OKvWAC7qF9P/sRTelafA1JuBxzHy8ymjNSRNyjapg0Uw
 3xVqfm0UAyZWOKcXQ0lfsHJvnSUDS7mzEcW/Q2bJRgwuH2g2X6x3qUiAvyN2eZ4Y9VhA
 gnYXdyRAQXfxX+GG/z1yVXkQl31T5YnGm1x0db+nE00P5kFMpFot2NsnxGL4IycTTgbK
 X8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683106904; x=1685698904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LD8VPjBC6l2J6jT7ZzyVMmo6WvrSa+0PI6lS90rhdYE=;
 b=PTpkNt49O5hpVaDXhDOkhblNrjJBtTLJawksPEutve2/+Ksw0dGHGHXVP5fczalNxT
 /4Nsb25LS/F1z9Q+ywOdsYCzXkgmRcqbDiac/Dj8z1OoF3cbq75R3Vzmuf8AozhWQ8ZV
 SKcK9s4N4rcAHruEKvc6h4CNpcYdfNAQVv+tjgBuJtAVat5qbb2Grfg++5uWj3hdnWTx
 wZr3RyA8RGbHgqf+YHZecY43niti9yjMfOvfOCLiMnbm4eFpjqnut2mGZe5P4fJHNbId
 mHGZ9syh+Mphg9vb9dhxmPqv0gy7bUEPtdOstYbCQTl1kBxa9pZMgUtlpAvjoFM71Ss1
 Lglw==
X-Gm-Message-State: AC+VfDwSfJnoXHk0jdG+0aakte/PPREyOBTHvzMzGrlixQeBa2n7aFrF
 6SvJr6cpE2Vbbc7/oXhDkrJ1Jg==
X-Google-Smtp-Source: ACHHUZ7tydu1EZtUtlbkH1J+u7bN4Cl+E1yysEQ5GyDJYhaZifMQVEhTvWLhYCl3Pzey8Xs/SLl6sQ==
X-Received: by 2002:adf:f686:0:b0:306:370e:6b13 with SMTP id
 v6-20020adff686000000b00306370e6b13mr2929447wrp.13.1683106904518; 
 Wed, 03 May 2023 02:41:44 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 a6-20020adffac6000000b00306415ac69asm1398319wrs.15.2023.05.03.02.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:41:44 -0700 (PDT)
Message-ID: <e3fabb1d-7bf6-f251-9649-5a813b409200@linaro.org>
Date: Wed, 3 May 2023 10:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-4-shorne@gmail.com>
 <933ff5d8-3875-34ac-9bc4-ed06f74efad7@linaro.org> <ZFIl6db3isktCOk8@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZFIl6db3isktCOk8@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:14, Stafford Horne wrote:
>>> +    set_default_nan_mode(1, &cpu->env.fp_status);
>>> +    set_float_detect_tininess(float_tininess_before_rounding,
>>> +                              &cpu->env.fp_status);
>>
>> You don't mention the nan change in the commit message.
> 
> Right, and I am not sure I need it.  Let me remove it and run tests again.  I
> was just adding it as a few other architectures did who set
> float_tininess_before_rounding.

What that does is *not* propagate NaN payloads from (some) input to the output.  This is 
certainly true of RISC-V, which specifies this in their architecture manual.  OpenRISC 
does not specify any NaN behaviour at all.

It's not a bad choice, really, and it almost certainly simplifies the design of the FPU, 
as you can do NaN propagation and silencing in one step.


r~

