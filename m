Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7467F36F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZbX-0001SU-7y; Fri, 27 Jan 2023 20:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZbU-0001Rc-Ol
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:02:00 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZbT-0005s7-3O
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:02:00 -0500
Received: by mail-pl1-x634.google.com with SMTP id k13so6691668plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3YNopm1l4APvtM09FY3Pp8OxzDKGyDTRdUzeB6kxjvg=;
 b=Nl1KYUrXHe4rFdz5aQxkC+B6eZxx9V9gpatdQ9WuCHMLrrk3udwLVdjCHT7WcihGUg
 HJKkIOTHq72xRDikSNbeAOXx/8Elta8XKKl8NpG0l72qN1PtNA+XmuyDnoXwBtximcnm
 AnUSORZ9h5k+znaq4mV/wKclqDMzBeTKT0gsMEpVbEqq6JD5x1IvZjMgt7zY2uAcq+Vk
 a/+yxx04YvUtTxursOfN4ElZtol3YX2iZauTJ7rc1mv+BvkRBF/9S0Q6vA+7cMkA7dDo
 0CZlTON8Xl2mvniQJHflIMMkGnVb5OT+DGHMCb7b5Z2wqaTSC2xj3D4eOEFu36H4PJOy
 57NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YNopm1l4APvtM09FY3Pp8OxzDKGyDTRdUzeB6kxjvg=;
 b=RhkhQPUY/zAhKEl3vtudZ89NXHU4HlHOrMAo6cDOGOdcRWsUXGjFebYTbi3oA8SCDR
 SnU39+6GeSh2PfGadJCUpjZsQYc2tMcCyVCu4wOBpon5N330IbPqWOwIUr2kgdAU/31n
 j5FWabA6YoZtijEQZKFeDO78sL14uG0RWtvKHKNtIyL2YCcwJYZJDoctlFTx2Iyt2hm0
 dgS8C083r2i5GyR13LxczqdTBcEH2Itcm93Q3qgXLrP1ssen/MBKlbWIfVWfLd3ZYiNU
 nRPLqiu1RZ79j6Aa2FNXqZVBsevQtlkxK7QcYTEI89to3o9ZrcL9TPwGZnEFzEbK1uAZ
 bo2g==
X-Gm-Message-State: AFqh2kqIriq7GFwMNwjzNUHbazU33ZlhF3HvsNaevaMLVosZTEgcjtEL
 7xoKY61Uhc1lAMVyqQAYtFKbjQ==
X-Google-Smtp-Source: AMrXdXsYdMJqmhKXBn/sdUZM1dHRr3V4iMNfyD3klzFeO4uxaHUhR/fD3C8IYrHepBEy4/2LwOmg2A==
X-Received: by 2002:a05:6a20:3ca7:b0:9d:efbf:48e3 with SMTP id
 b39-20020a056a203ca700b0009defbf48e3mr56933644pzj.39.1674867717089; 
 Fri, 27 Jan 2023 17:01:57 -0800 (PST)
Received: from [192.168.50.174] ([173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a656908000000b0047063eb4098sm2967341pgq.37.2023.01.27.17.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:01:56 -0800 (PST)
Message-ID: <818674a6-da16-77c0-2a2c-aad1d72f04d0@linaro.org>
Date: Fri, 27 Jan 2023 15:01:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
> S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
> them AT S1E1R and AT S1E1W (which are entirely different
> instructions).  Fix the names.
> 
> (This has no guest-visible effect as the names are for debug purposes
> only.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf17..ccb7d1e1712 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const ARMCPRegInfo ats1e1_reginfo[] = {
> -    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
> +    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
>         .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
>         .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
>         .writefn = ats_write64 },
> -    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
> +    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
>         .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
>         .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
>         .writefn = ats_write64 },


