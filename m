Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691369FD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvuG-0005fU-DU; Wed, 22 Feb 2023 15:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvuE-0005et-DL
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:40:02 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvuC-0007Q5-SH
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:40:02 -0500
Received: by mail-pj1-x102f.google.com with SMTP id pt11so11085200pjb.1
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKSDfODMV2VAcFgs/0HYFyD2vnyh4rsLX915QyzLoUs=;
 b=OyEF3956Sud81We+dlKy/28dFHUJ5zXmij7Zc0Ns53OkuPbyEhHBQWcmY/RQV7C15M
 BHaOkTfFnQCVRVM1WgUyODjdF62hNojlMsq0fUIZHJQm7l9G/IoqCH7Czpc4k/xw8WZZ
 NR6MLTzHSN2x7MSwJWf5eYyhlJZ0nNLfZgXXaPXS2e6bOlWc5eyXAzJLFoG6NbQw5uEi
 m4Pc/TwrHp67f6y2RE7Qr8823F2RoGAzoV0asnOBtqCfsJxtBnIMLi+iQxiXYfnWeyT4
 Shwm2/Pt6W/N5GSaNBFpzaVKUrouOLsbQ1HPvTWdRTpiLzGDZMB+GsOtuDItgGyXEAaj
 kXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKSDfODMV2VAcFgs/0HYFyD2vnyh4rsLX915QyzLoUs=;
 b=HK7m4QuxrZYSQhSWQAJxaeKtLwi5zvPEESBC4enexktYPq+r6k7lA4nGGLCKTHyp/8
 dR+NiE4YmIaN+aYtLdr/qYWoIzAieVfcVSsAL94Ph0anzbYHTZGBO9CyEPI+bDJxUEKO
 VhGU3LENuqZuoemLwDw7d9gQNFXr/KGI6wVhA9PNfN/HYuGpntoQ49KexgDtPXN7B6Jg
 k+WgPsYmWA2c1ycrCc7vkc0W2rWVg2cKUMpmeraVYSetgG46/h7ZFwxCjvvjfK9op4Ve
 DUIhxbUf6kcVQlBVkypPQUum5B7dMmPOLv/ATbEkQ4ZpCb1swh00aywTZB/07viAJ00B
 D0VA==
X-Gm-Message-State: AO0yUKUBpywKB/pJ2OT39rLHK69WTGMKuv24p7f7Uu32o8QPH9DDrpDe
 +OqgW9P9LYfsUFsh591Q3ebwzSsRdKLMT5Q6MOI=
X-Google-Smtp-Source: AK7set97Dq73azu9rb52WDOKpFJYFOoatjF9pByNGmHctaTq0aFrvHEC4/qoXqZugMbOy2o5dA8naQ==
X-Received: by 2002:a17:90b:1d82:b0:233:f3c2:a86d with SMTP id
 pf2-20020a17090b1d8200b00233f3c2a86dmr12332509pjb.47.1677098399511; 
 Wed, 22 Feb 2023 12:39:59 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ie14-20020a17090b400e00b002372107fc3dsm3185560pjb.49.2023.02.22.12.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:39:58 -0800 (PST)
Message-ID: <64398ad9-f480-82a0-1083-ef66a75ba7b8@linaro.org>
Date: Wed, 22 Feb 2023 10:39:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] target/arm: Implement v8.3 EnhancedPAC
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-4-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-4-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/pauth_helper.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

