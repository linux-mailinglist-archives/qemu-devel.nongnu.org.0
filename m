Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C02CF271
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 17:56:50 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klEO1-0008FD-OO
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 11:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEMd-0006hI-GB
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:23 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEMb-000217-DZ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:23 -0500
Received: by mail-oi1-x244.google.com with SMTP id s75so3768560oih.1
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VulumupbWFfWXY5OG6YthXh9X7KfotRO1X3TG0cLq5o=;
 b=y5+pU2Jvlzjp42IYGpCP5qNRKGaODc6PcyZDCsxpgzVzZoLBcLml1Y0Li6BA6hK0W3
 fEcBJHIvtHyqaA/hlF3pt/rs11mg8N+3//4LSG2UHbY2VxiygaUMPs2LRdBIwDwhF2o8
 OjHV+5FJO7l9M7/jPQWmhDR3Y4oJE125p6gMEXYmIe5mY+SFlt/qwQ3xBvzY45zby4e0
 y4+ynES5l/P5qMMun3Sl0iEiJD6Q5wPxFW709tAQncrXVO12luIyQgBo146H92preROa
 Wg01yVycanWot+GE7o+zgFtBUhod9h+HKlQ7T9oBjsvMSUgq+76npYKdt54XGG54tb2Y
 zIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VulumupbWFfWXY5OG6YthXh9X7KfotRO1X3TG0cLq5o=;
 b=GoyNRPRk9aaA7AQJZj2GxrvG/+5MQ8wjQqKAL+1oThDvG9GP41wlV3wy6yEYBaU1w6
 O43c3WLy+xexDVC5we66b0/sKDVoVw9/lOVo8GufAuDU92tYXqet34VVBtDa0v3SQE7F
 cXkm2AzDhXPCJSZExkVGHy0hQFlYabuu4HehEYE5uWeJ/usFUkPsYe5GLwNqJiTabEiw
 DsbYh1jdjUAbp0R5iZJhdMBCKtUgY8+QJrC1XmehKyZ8y7WDKojrJUL/sMmMqCmOYP3l
 4PowDojz2Ejq+I73Mo85KRkuKxC6YO6h3V1q5oM638U8waYx46EN9K/IOzEA9rsxYeIi
 28xw==
X-Gm-Message-State: AOAM532s6M2cn1b39t+dyZR6JuB3hdfdSm+atrWmFtZXGFCbZTJBBW+W
 FkrB0jYtMrOStQ1wE+aG1UY5mnJlOgUkcMeZ
X-Google-Smtp-Source: ABdhPJz16+QuenQnBN9dbsIK53H8feE252gDEsotvffzRl1Vg/apyHPKCzhHZVvg1Kj8aYfG69L7JQ==
X-Received: by 2002:aca:fd84:: with SMTP id b126mr2202995oii.85.1607099450853; 
 Fri, 04 Dec 2020 08:30:50 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z188sm732654oia.32.2020.12.04.08.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 08:30:50 -0800 (PST)
Subject: Re: [PATCH 7/9] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a103671-d4e7-bcff-c600-931655efbd2b@linaro.org>
Date: Fri, 4 Dec 2020 10:30:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Extract the logic initialization of the MSA registers from
> the generic initialization.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)

Why?

> -        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
> +        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);

Maybe fold this back to the previous patch?


r~

