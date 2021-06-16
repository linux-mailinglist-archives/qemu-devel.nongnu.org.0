Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD453AA370
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:45:55 +0200 (CEST)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaXy-00083Z-L8
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTX-00023a-CV
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTU-0003Mf-V3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so4155987pjb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wnARhIGc/0qm84c3ucb4LILfDgeSPHL11j4qKdo3bQ4=;
 b=K2pMndFPV+RU2BNp0DwUdQwCfIn5/Sdkb/naDrktepwrXNlF6d8zMLOm3bHCLKsb4n
 Gii0UVE2YfxpfDfa6DZz4PQq9lDScnzu2mi6hkmvALs5Y8yvzlpXKCZgC8N/oc2U52s0
 IbJYagWuY+sKG2TrNPiGaJsKJaLox4odTE0iGDYKh0CqBbjKIbPuKsatpvEB3FDinens
 KldmnKTnL8P883IDJ3Px8Ptygw+YhQge8i+0G20Kc5f9wO7Z8kK0ATZEHlCFE+SJEpOR
 oNJ4/hwBsBoz6lxiFvYdiYH429Rn1BxS+5A7wKW8abD7QCXl5gzZZyGlT2wJhPJuqbRl
 cYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wnARhIGc/0qm84c3ucb4LILfDgeSPHL11j4qKdo3bQ4=;
 b=hqgjcca3C7DQ5UPoA1KY6cPmNQmjJ2xkTfwRkjtABFcjaS3/MsftxaURFCh9fF1Swg
 nmAxyhodU1QmzF9DHvW6m3PWhOQ33UfDOI9JTbt2QydFgkfqmq3h6/du0WE7YKuxBBY5
 T4P5SXBkn7dGAWksk9XjQnWnihq0wz6PsF1RTsJMrqnPyujVDPTdV/+siZN7y9X3Tmb3
 ceMFIauH+UmxnasbsqA1Mihni76cJPswp5+vPARe4wwOutwH2aYS2pYiCWCgQsIKuKRY
 5XP0hqmFPRrIr8aHEYwZPg1NuLbkT6vGoW9r/BVUnstuMefdkdvtE6C+enFoWSBLaNtp
 q4ng==
X-Gm-Message-State: AOAM532EthzesvJxhi8ZyN6Ab6GlHx8SXTo0EO/BmKpmt+sBOmxHdD5r
 eGJnN9G9BaMr1aD/ggSmOrJw3w==
X-Google-Smtp-Source: ABdhPJw9iyCHnHer4/FJXJqmqsA6giTHHLQfTIqRC+cmQOdvNDiVIcD6ty3qTeE724gdIog20BP+CA==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id
 fr20mr12399359pjb.92.1623868875606; 
 Wed, 16 Jun 2021 11:41:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z15sm3246114pgu.71.2021.06.16.11.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:15 -0700 (PDT)
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0fd17f4-2c39-463e-f8eb-a8f5305cb327@linaro.org>
Date: Wed, 16 Jun 2021 11:41:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.

easier.

> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

