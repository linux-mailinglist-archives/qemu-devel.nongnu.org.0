Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9367F370
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZe1-0002QA-3g; Fri, 27 Jan 2023 20:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZdy-0002OF-Is
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:04:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZdx-0006CD-0O
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:04:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id m2so1634463plg.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=il32LOCYe7+PPEzl31VO0RfH1p8EkDb88IWiFXUnxso=;
 b=DjPzx74T3qkYgKl1dPpR0vFrIl+JehzjUeUdU9rMFzS/QkGQcDC/MT1+Ki48/YwVvO
 qzTINgmhjzK20GpVdFLv9+EO/GffSvLZsBQO8xouyhj6LfipoK4I4ATae9AYTe3Sz5F/
 3uSg8U2252OwnH8ZtgEuVYaurBOJo3X3GpRS8t4dxOHGlksrdoLkhn8y9BBbmtSpWblv
 HV4Z9njZOsCaSS+wb+gjR48t6G+Qgi3yvmpQGTVrO/fuTmj8esER95KjRUNru6NskbR5
 dJCxSVVdRnf11/oC2ysyGHXL36jPIGZU5Gh0WE05rJ+QhBF0D30hrPfhPIIfmMVGktoo
 ZHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=il32LOCYe7+PPEzl31VO0RfH1p8EkDb88IWiFXUnxso=;
 b=jn1adsSVcIMv7lpXf5v9sfrRHmEMS31hKwTaNmb8QlF03yNdwT8qzVB4VP2afT0MQ8
 RFxlGyzqLO16Uk/HA7sAfzdUNSB85YRmR1dvtHI86mGUBy9XFA6upw43FCF3xC3u1P2s
 D7qkr92mdY7pBSw4Mdh/1w0fAfTMHS1s15NRe53bmD6V7onVfUoQXzXasbu1CI1QSq69
 +xH3NlYR9Kc7FPnzr/7mfgFu34PelHD7SMdkhRfclklWdX/Wwii3tpwX8OEHriKh8Cay
 1OSi13a9RRMSr06+9vdAVWXfN1Gx91ip77VTYopPOlG/pdUrTjfpo2iXUtrgatga4DTw
 uZEg==
X-Gm-Message-State: AO0yUKWv4dHpp1rwLhUdXYW9LnJ4i79QASyHujhgsNYa924d6BwCDX5X
 xfJL3F4c+pQqHoEnBzTpwKfEujsPxh+d+Iw0
X-Google-Smtp-Source: AK7set+mMECkV/vNSDkAsFNktZ4tBajNaV4Eno7ydwRaAl4rb7bO/jDQkEUZYMDqjM09P0OpeIvOHA==
X-Received: by 2002:a17:903:124e:b0:192:b2d3:4fc8 with SMTP id
 u14-20020a170903124e00b00192b2d34fc8mr361697plh.1.1674867871344; 
 Fri, 27 Jan 2023 17:04:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 t12-20020a170902a5cc00b0019667318941sm59640plq.176.2023.01.27.17.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:04:30 -0800 (PST)
Message-ID: <08069c2c-5e15-37b6-4465-cf93e1ce1ddf@linaro.org>
Date: Fri, 27 Jan 2023 15:04:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/23] target/arm: Correct syndrome for ATS12NSO* at
 Secure EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 07:54, Peter Maydell wrote:
> The AArch32 ATS12NSO* address translation operations are supposed to
> trap to either EL2 or EL3 if they're executed at Secure EL1 (which
> can only happen if EL3 is AArch64).  We implement this, but we got
> the syndrome value wrong: like other traps to EL2 or EL3 on an
> AArch32 cpreg access, they should report the 0x3 syndrome, not the
> 0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
> for these instructions.
> 
> Fix the syndrome value for these operations by correcting the
> returned value from the ats_access() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ccb7d1e1712..6f6772d8e04 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>           if (arm_current_el(env) == 1) {
>               if (arm_is_secure_below_el3(env)) {
>                   if (env->cp15.scr_el3 & SCR_EEL2) {
> -                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
> +                    return CP_ACCESS_TRAP_EL2;
>                   }
> -                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
> +                return CP_ACCESS_TRAP_EL3;
>               }
>               return CP_ACCESS_TRAP_UNCATEGORIZED;
>           }


