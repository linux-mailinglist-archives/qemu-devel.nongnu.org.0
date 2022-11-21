Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A10631EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4V1-0007P2-Ms; Mon, 21 Nov 2022 05:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4V0-0007LK-B9
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:58:02 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Uy-0005SN-K1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:58:01 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so10135221wmi.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l7LSS1if4evq1BMx5f1VYSzf4f46oD4MfXQSwgKIWwI=;
 b=fyObu5PW6qwAxPOLWIfvQeTiXfjXmB9MVEVNuFfSxyzhfCUKC0e6WUwx8c8UKksLFJ
 DE++V/42fvlgsMrDXbp1pUC/ASXx0+YnGHJaHKUJkB/Blt5rwouLPxZfWtcBEFnXdVbE
 Gj7ewuFADNEMxcB1jSrhuvbsI3y8jMmAIyHIFmoTzc/XGFu9PfpS0aBk3yQLRcbwRn7n
 I2hzmMh3HMKyEghjaW9QEk6AwJNl7gcT1VK/ouH9Ib/MXVcW1TIrH/q14rcoFrBYBvnw
 4XsNfLZGPrXzjAdXCucgVtNo4f7ZWqSPuRUfNXGTt41rPnwjVwzjg7FYkD7zZJEP7Q9p
 p+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l7LSS1if4evq1BMx5f1VYSzf4f46oD4MfXQSwgKIWwI=;
 b=th2najlJrmLgfOSxGVKLGQeBgMYe5G9/qFLGIjqdv7Z354MTc9at7vfb3C+w+CGrqA
 el+u+SuiipGbloPPvcKpIwL8NPIHkqCn2Cyk1ce1NrRgN2EExnQoDIJbcYCczL4popTy
 lb0T0AQZ7VE+ktPKATshhDpa2m2SP7bQ+s3HejMiKd+EeaoP5XsvJeNLCqeB2aR+aihi
 mcugEWIYIAhQGGYEtOCzZXuEtx9bFTTZ7KqaX/90aoMtD8vUt3cJLqLs+4Aa+DoakBNm
 y0bt2GZlxbBAyO/v4rqFZLWgvYDGTh2tF66Ls6jw0KiZzn4Ty2/Are1SdfbWhq5xUv3s
 JuEQ==
X-Gm-Message-State: ANoB5pluqamiSgH2nwNTqcM7gyT7RSISzyRkOoEHuoc0NjFXn80RfykZ
 9Egh2KRHOALtD0n9D3KjI+8ya+XUnl1ZtA==
X-Google-Smtp-Source: AA0mqf7R3JqBYRCgDOf3z1hgpuZnPn6Uw65Ci8pb1xUfQjs+4EC5lEBGQHjLk8hGdzhIjO4+eIjv3A==
X-Received: by 2002:a05:600c:1d14:b0:3cf:925e:198c with SMTP id
 l20-20020a05600c1d1400b003cf925e198cmr2604248wms.144.1669028278982; 
 Mon, 21 Nov 2022 02:57:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b003cf878c4468sm19914844wms.5.2022.11.21.02.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:57:58 -0800 (PST)
Message-ID: <104d9182-99ac-4984-7068-8094fbf9c23e@linaro.org>
Date: Mon, 21 Nov 2022 11:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 6/7] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_set_irq
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/11/22 10:18, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-ppc@nongnu.org
> ---
>   hw/ppc/ppc.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

