Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CC666804
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaq-0007wP-I7; Wed, 11 Jan 2023 19:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlao-0007vs-8Q
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlam-0001sa-QR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:18 -0500
Received: by mail-pl1-x633.google.com with SMTP id v23so13660889plo.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l9App3jW8qVuiMNt5K2EeZDGvR6Z74yGDixZZP1zX9E=;
 b=j8gRp0uSxcwp09/xZD+HnyySUq4V60/AVCwDRmFtDkSvfyk2QVY5Kbf7uIrbwg1lHj
 St1870SZcwIo37pjGBhcp9rlyb2cVl5o5I1ywPjmA1mDK6his8scHTSWz7aBC3aX75nx
 uaqkSQ03DLiQuRTWYOaYerHEMqFnXPFUwQQl6wfCSP7oQK68G8G3KQnKf+kzwPjwIjK7
 RjJbvhPFwjSONg3KvhFE2yQTLWPRFm4zrHXCppvAssfT/np0Z3z7lDVNNn9nuwlGk15f
 s653MMt1OoJXGdqMYwoUVVSX4QkrCaxBrf2HtPovn/qkbVt4wHKTu9dJLkowZcGaihfb
 nH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9App3jW8qVuiMNt5K2EeZDGvR6Z74yGDixZZP1zX9E=;
 b=lrgso1ZV8yXW+BMNhJV23GQWn23fAaEsJy5vT/qFN0IEnSJORBzC0Dy/0n7LY12/Nj
 lv3bjJmhfXbGxoDlZjP3O01Bo3ptcSW4lKjyVangVMQZcEOFZAu0iqHd00z5xZuRN71r
 i1ew4RJHTCKGU9xqc5FLgDz6o8SRrGTpa+gtbY+HP1i/NiKfFka0457F3Ak5Ym53KezF
 Ted1N7y8AOjv1ogsEFDtT7MDg7G2WpfEOkyzk7NPa6GgYA1b5yKSxNtevfJHCUmvXq0i
 cIFTpiDms4eJi4s6eEBTvgAhLjMEHR6IE/khv0puZxfxR7+JrX18tWmEJWN9Z3fzaZIE
 jQnA==
X-Gm-Message-State: AFqh2kqA+KX0z4SgpDEsRzcFpwF4TTCXcPzpXv1z56wFgkSNVNX3Eojn
 6vIfH+KPYeAQKaRMLjkGNBnmU3ppWI7ov5e+
X-Google-Smtp-Source: AMrXdXtcEATyuFcb385dKTxa/IRUbqWlZFkkpmIbwaBRw9Bju9FLjMP1QfeUc0C/Hf7r35Nmgghqfg==
X-Received: by 2002:a17:902:e2c2:b0:191:1545:a652 with SMTP id
 l2-20020a170902e2c200b001911545a652mr3510064plc.31.1673483835477; 
 Wed, 11 Jan 2023 16:37:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170902784e00b00186f608c543sm10654086pln.304.2023.01.11.16.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:15 -0800 (PST)
Message-ID: <325310d0-aad6-fc39-748a-80762d644dd8@linaro.org>
Date: Wed, 11 Jan 2023 10:02:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/18] target/arm: Move CPU QOM type definitions to
 "hw/arm/cpu.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
> +++ b/target/arm/cpu.h
> @@ -26,6 +26,7 @@
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
>   #include "qapi/qapi-types-common.h"
> +#include "hw/arm/cpu.h"

I'm not a fan of this.

If you want a smaller version of cpu-qom.h here in target/arm/, for use by hw/, that's one 
thing.  But target/ should not be reaching back into hw/, IMO.


r~

