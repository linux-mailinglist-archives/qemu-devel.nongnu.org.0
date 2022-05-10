Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E915522801
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 01:59:32 +0200 (CEST)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZlL-0006Ys-9h
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 19:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZkC-0004rt-OL
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:58:20 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZkB-0008GI-3B
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:58:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso3371460pjw.0
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 16:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lNMUddU42tt3C3RNLng4NAaY2vu5gv/FStbhVQOB+Hw=;
 b=koiuoP8u0jl6VwgmZf5p+fqGo9va60+V0H/tJ2fMGhcW7ry38mTTXdDphMVW7Qo9O3
 snE3DVkYuBSwKDxq7mj9oZtidFfddlNnyzac6xAhU+ptH69kWHamlhaUWzFRoXnrrRvs
 IGujjmXq/+o5qi7Q6eUjzBvsGDc3m2rL3Hizdv3gWBQJKgba3qOq3fWuIBeMF+8mhN0q
 b5bUlQOnweuaarmclMBRFV/U4cqNxOcMyKiOP5uaIQkYU8XYCutSIgQpJOabAZSIwGOh
 dqxFqlsutgOoc/tPxFnBvwBDSrA/tHZuXPj9VeOBrbDoqp5b8xzU7A7oxXAa9fZvCuMk
 ihOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lNMUddU42tt3C3RNLng4NAaY2vu5gv/FStbhVQOB+Hw=;
 b=Ty3mRBno2IHN0dplDCpwvWTTSBcBbZVcPkf6exou1l2aBdxd2DJvGa8maqf6/77TmF
 CCipYsJaqxR5fIh9f63xTSxlUs79F+JlUoMsKfde6DQ/sN0zkQU7EHa2MqLQJfxIPYtg
 9Xe3o9BEmUemeLGUFeNXN81GNwt2DBiAyFX4nalpyylBQKTrV3KJYs8IrIpYLtvgnjEs
 fW2EohYIsMgS62bLLlgzau8G5G6eRUQYRbL4XXR2wWkY32zHb6UgQuXhEgf2W8z3b5BX
 Oi2yz+jp/Cp3Q1HARMYjUxNIMZxHuEyALDurrL4v18VSepFnKIs3FHYa8ujmC7YUzm/F
 ymoA==
X-Gm-Message-State: AOAM53077lHj0vQ+fbzkw4732LRxiy4PBGiEgXS/VNUIS0LeeBPptt7q
 1GlSd+p4r07B3hEp/w//Ef210g==
X-Google-Smtp-Source: ABdhPJy48u+1dhro6eeN6ZsiypeQqEmhOsCYwEPJdCPgBOE6WVWHcWm7IsrkoVHqNStfC9c3A67WSQ==
X-Received: by 2002:a17:902:ec92:b0:15e:9c61:2acb with SMTP id
 x18-20020a170902ec9200b0015e9c612acbmr23067049plg.141.1652227097604; 
 Tue, 10 May 2022 16:58:17 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:923e:f0df:3e3a:c73f:64e4?
 ([2607:fb90:806a:923e:f0df:3e3a:c73f:64e4])
 by smtp.gmail.com with ESMTPSA id
 25-20020a17090a191900b001cd4989ff42sm264180pjg.9.2022.05.10.16.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 16:58:16 -0700 (PDT)
Message-ID: <64829092-1cb3-9048-d842-798d76afc994@linaro.org>
Date: Tue, 10 May 2022 16:58:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] target/ppc: Fix FPSCR.FI changing in
 float_overflow_excp()
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220510204610.100867-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/22 13:46, Víctor Colombo wrote:
> This patch fixes another not-so-clear situation in Power ISA
> regarding the inexact bits in FPSCR. The ISA states that:
> 
> """
> When Overflow Exception is disabled (OE=0) and an
> Overflow Exception occurs, the following actions are
> taken:
> ...
> 2. Inexact Exception is set
> XX <- 1
> ...
> FI is set to 1
> ...
> """
> 
> However, when tested on a Power 9 hardware, some instructions that
> trigger an OX don't set the FI bit:
> 
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> CLEARED
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> CLEARED
> (just a few examples. Other instructions are also affected)
> 
> The root cause for this seems to be that only instructions that list
> the bit FI in the "Special Registers Altered" should modify it.
> 
> QEMU is, today, not working like the hardware:
> 
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> SET
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> SET
> 
> (all tests assume FI is cleared beforehand)
> 
> Fix this by making float_overflow_excp() return float_flag_inexact
> if it should update the inexact flags.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2:
> - remove the setting of FI from float_overflow_excp, making
>    do_float_check_status() the only responsible for it.
> - make float_overflow_excp() return float_flag_inexact if it should
>    update the inexact flags.
> ---
>   target/ppc/fpu_helper.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

