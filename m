Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424C6A8B62
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqzP-0007et-Ap; Thu, 02 Mar 2023 17:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXqyz-0007Yp-IQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:01:15 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXqyx-0001QY-Ri
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:01:01 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso398123pjs.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677794458;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oIOoUOAg/8VBILKg+2gKz8fnCmvsAlBCetTC1n3+e2s=;
 b=h2r9VUvo+p5hR/jN/nmeyCR5pEQ94GG4xXJb+nCqAs8T1MFlpYzoftorW3KJ3qGZjr
 5CCznI9hn9CAL17QWx0+HTC0NwSp5FUTtQObPejddRPucmVI/siB5lwqFtM5akX5uhCq
 DfXaw5xuwAPoPsNNBLRQ59exUbEQi8Qtde2B27LCfd0miTltxQQz3cFWupZHoYp0HhG7
 BuH1YrkYHafIC0xprNrU3Up7kbORzyTJ3lZgsjScxZ3MoZsBSHX1mfHfZJ3q/gHHO+eU
 K8vvv7DivY/r1/806MZzHKo2GrMVkb5kJHxFPgo7Uk8jmR2GULKUlqLrxwHO+Ax+XxTs
 XoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677794458;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIOoUOAg/8VBILKg+2gKz8fnCmvsAlBCetTC1n3+e2s=;
 b=hCx75eNHzdUkYIMcVe8b2rlSBoO5WldojAj6pYCHkAL+73QoUpUGworLX58oWKqJ7U
 fuZF8bPMSiPZoabkazwdG3s9nr0eeFHIm6CcZCw7YMtkrDf9cKBXaw/gfX27PSXE2i+G
 QjApbRI5m/At66zEehF+ElI04PUo+jzgVgm/9dabzzxMad6pLknrxEY4fjDT6eaIY1/U
 GrAHlk2mDvF5YbXE9oYbbAIKqyI7OhfG7Ud/pY89sSgJoMQHMZIxQwNTt8Pwt24Cdusy
 ukEa+mzH2lWoedRmN84adJgDVLngZtdez6M35+N0lw2/v0tq66NGPl5XzJvx+db5HFO2
 bF9g==
X-Gm-Message-State: AO0yUKUcwSKchBLANC5xpBw/Ol3mJI/nPLGZL5m/uf0V9qMmnk5+HuIJ
 9Hjg8/SfA1Iv99xct7cA/5EQdQ==
X-Google-Smtp-Source: AK7set/vUbQv3n2OkMxtX8v9dutKcj6HHxrEaQRcjQdfjuuFVaGlO2bGOyD+OhHPh8s7+bBIYd8KiQ==
X-Received: by 2002:a17:902:6b8a:b0:19e:8c78:8cf6 with SMTP id
 p10-20020a1709026b8a00b0019e8c788cf6mr181194plk.62.1677794457698; 
 Thu, 02 Mar 2023 14:00:57 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a170903231000b0019a997bca5csm152021plh.121.2023.03.02.14.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:00:57 -0800 (PST)
Message-ID: <ac460109-5670-e8a7-d1b4-146d59176585@linaro.org>
Date: Thu, 2 Mar 2023 14:00:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 22/26] gdbstub: only compile gdbstub twice for whole
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302190846.2593720-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 09:08, Alex Bennée wrote:
> Now we have removed any target specific bits from the core gdbstub
> code we only need to build it twice. We have to jump a few meson hoops
> to manually define the CONFIG_USER_ONLY symbol but it seems to work.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v3
>    - also include user and softmmu bits in the library
> v4
>    - include genh for config-poison.h
> ---
>   gdbstub/gdbstub.c   |  4 +---
>   gdbstub/meson.build | 30 ++++++++++++++++++++++++++----
>   2 files changed, 27 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

