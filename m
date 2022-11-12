Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456AA626724
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:27:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otj2a-0004s4-Ce; Sat, 12 Nov 2022 00:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj2W-0004qk-SK
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:26:48 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj2V-0001II-6d
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:26:48 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l2so5792595pld.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M4iOABLsvTOfHyIwr3LPLYLCnW0f7X8O3lqFBR8/FJQ=;
 b=BSh/DBgnWGYMeVMyOSLc/gnMeXPQyB3RqsvDyXc7xPM9ZpYjfIVZ/fmcznc+b0iAte
 OG78wqrK2URTX3fHw8uTuhpZg0+eax9HjgVUWS9eGG3njvUwHvoPvDJbYb6U/0GErvj9
 Dzw1eKKVEV17zHMtev3wlgN68aaIPkypnvs1qFZWcDkeGCihtSDWy5d7fn0HQWexNH87
 XjgiL9ExyOkLDvzktr2eu3/CubjwRKVnY5FDXY0sAarMVezH5kFORIjweyxIppkvWdkq
 gkJcfcCGuzc7Jh99NyDYyytXKtuOgS9YEbfyIZk6Ap8HkRTNY/vvMCTyodnunw6j7ATV
 jxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4iOABLsvTOfHyIwr3LPLYLCnW0f7X8O3lqFBR8/FJQ=;
 b=kOxmoxHMlhGewbdXbkSnhBAHIAYKTR0/ePgMHyn6Iu8xE/dVnXwddOXYDqpo2Rm0+o
 YH8p7Ys+0o3Js8WWBUn0FTIka21QJcKZ0b5ybtTmkSpexMxcbsMYr1CUwmPQQofJfgib
 oqmMkqqrelAcc2Sp6DR+JeLvN5LFbd6FCsjbvAeGT9uDD+mm0UropyyPKZQs1HfxaHKb
 iDbkLqa0OgA7xcwCPMnvNur8J2REGQElS+0wQLEu8BtdXTI1AkmNw+xON9kHmggMk+Iu
 yoO2G2fzINPRkkbEFNH+Nq19Jy6B7+jjq8f4KhmgNoKYz3lSiEU1/usxcxs1zpybIM6h
 HiXg==
X-Gm-Message-State: ANoB5pkaP1TJSp7Y+dZVoEL9+JTRC90q2qDVTI0YgAwCtKBqVd05CNy6
 vY7cYFMzsabbQ6o/d4O05ar4SQ==
X-Google-Smtp-Source: AA0mqf422ww7zjKubGN4XP1zXrrKZOcL3U7mj3uO3dITnrhGwyCZuMGmG5z+apnLfd8xcEkVbXhmqA==
X-Received: by 2002:a17:90a:6845:b0:212:eb51:85eb with SMTP id
 e5-20020a17090a684500b00212eb5185ebmr5187636pjm.232.1668230805964; 
 Fri, 11 Nov 2022 21:26:45 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a655a84000000b00473c36ea150sm2086530pgt.92.2022.11.11.21.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:26:45 -0800 (PST)
Message-ID: <64aa311e-efc3-ce6a-c663-10fefb469695@linaro.org>
Date: Sat, 12 Nov 2022 15:26:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 05/20] target/arm: ensure m-profile helpers set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 04:25, Alex Bennée wrote:
> There are a number of helpers for M-profile that deal with CPU
> initiated access to the vector and stack areas. While it is unlikely
> these coincided with memory mapped IO devices it is not inconceivable.
> Embedded targets tend to attract all sorts of interesting code and for
> completeness we should tag the transaction appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>    - rebase fixes for refactoring
> ---
>   target/arm/m_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 355cd4d60a..2fb1ef95cd 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>       CPUState *cs = CPU(cpu);
>       CPUARMState *env = &cpu->env;
>       MemTxResult txres;
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };

This entire patch goes away with .attrs set properly in get_phys_addr_with_struct.


r~

