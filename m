Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE47666802
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:42:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlac-0007qA-9C; Wed, 11 Jan 2023 19:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaZ-0007pc-PV
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:03 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaY-0001ql-9u
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:03 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso21835514pjp.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2C/LlEXUpnaxawFkFdrRRFO0Eq0Rg5AY/TL35y0F1A=;
 b=myKkZf2hbFNJCft9PjNLTdkac0F5Hw4VXvyCzUiE8mcd1ysR8a1xgjJ87z4dDK7WXl
 /EmSRGNsIRJRwUyhmD8Q6CChFcjfNQ8nIFQ6zWLKrhRtx0KbN2d6gpViopVuRfJaAARm
 jMH8Uy5G10dFg0FYVhPA0ogE3bP2DtXf4MktmS6jtMetrD14CpuMdhJw7POYbhfuKAp7
 D/2KjNvfwlXxpmUSQg9hiWv2XwNak04aHMMJGKuA5osne/eMra4A6wOeQUSFgNRC4gur
 18C5cFGLYAZYGn/AMHbkUBABufCXoa44Zin529d4YZ8Ba+ftUKOoPxYfrBAQLd4WFtOw
 DG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2C/LlEXUpnaxawFkFdrRRFO0Eq0Rg5AY/TL35y0F1A=;
 b=F1GvOudpR2Bi7MVg6gsVLkcqPIAab2+4hEhJHgdaUoHAOegx+FbvL6hrx+iq/jD2BF
 2hvUrZQNRZmWwLW6abQz6ge1W7xQ1vLsNvkN4iA9PXtNTznum0S9H2b/kwWTynuYdaiE
 G+LKJ5HwvOE4kNpmZupqIuJu19nJMe7CdyPWPOkteGrdN6fD1ovg7fX6XhCcOflHEIjq
 sW58L5gy4JjPFW4UbeKW/OIXgN0Y7RAInSUZhUUpGKxCR2gDN0+njd+7jZAnbEDAS01a
 B6gsdcAHzhnTgm/I4OvPZGJvrUlCEwkdS8N6YKvB3Bh5NgwhJ29J7sXOe/6nh4WWZReb
 K2xw==
X-Gm-Message-State: AFqh2koD/PM6hmBjwy7GOd6bY4qc3JRp8aeFs1YUTqTMhA2XmuijSvKp
 d01sxm/3teRTmreCAbgH/GmfyHWhqcAGeGOp
X-Google-Smtp-Source: AMrXdXtOkeU3C2hoyT6ef99TBKQo7RkKfjNKLGCoo1ZGPHOAaiwje4M38fm1ToD+ehN8YnQ7hFQ35Q==
X-Received: by 2002:a17:90b:a4d:b0:228:d620:5b3c with SMTP id
 gw13-20020a17090b0a4d00b00228d6205b3cmr7359876pjb.36.1673483821069; 
 Wed, 11 Jan 2023 16:37:01 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 nm7-20020a17090b19c700b0022717d8d835sm5878710pjb.16.2023.01.11.16.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:00 -0800 (PST)
Message-ID: <0dc8caa8-48ba-c3f3-cce2-05f806828802@linaro.org>
Date: Wed, 11 Jan 2023 09:53:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/18] hw/arm: Move various units to softmmu_ss[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> arm_ss[] units are built twice: once for 32-bit word size and
> once for 64-bit. The following units don't require any word
> size knowledge and can be moved to softmmu_ss[] (where they
> are built once):
> 
>   - smmu-common.c
>   - exynos4_boards.c
>   - bcm2835_peripherals.c
>   - tosa.c
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/meson.build | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

