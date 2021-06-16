Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E63AA371
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:46:37 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaYe-00019e-6C
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaVW-0007GO-JC
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:43:22 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaVV-0004cq-0C
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:43:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q15so2703528pgg.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BkMUx/rAQS6c98YmcU6FRsKvRE5HtpohYrIf5S68j6k=;
 b=acCSgAmKgIqPC8SJ61RGMtJPRxDCX1ZbExHeDBL0cikRN4UM2ifyW0xj43+BENUMfY
 OaQzBktH2hMi5SQZzc3y1krHHSwi/scaSClwEOd1Tmqj+JFaHcOSO8tAe68pooBscdeN
 HrqqXAKRCjjsIu3DKUtIz4B7ex78fiBck1UJr4R01AIpv4O+ETzekoB8FOKb3F4b5y2x
 1/yWMfSNg0Yp8nHTm/PGX/Kv9/7DWj0RXJNgVcV81jJN+yxyRb/B7mLSliZZ0q0sqypE
 qcFXGOGNnZOv5VzWrguzw4Y26oW9lKZabSqYlbGAjUpAG7+p9IMREYNbplzg/GrabSK5
 /DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BkMUx/rAQS6c98YmcU6FRsKvRE5HtpohYrIf5S68j6k=;
 b=F50Pcd5WdqSrbx5S9Nt83qEZLw7nRtioUWU2ucMekVGeho9fDjEfdYPQ4tWho8m6GJ
 tmyHfdfjlZAyahzzKUUko7X2627u8/DrztfkC6ekEipT9Z4RD9STxZ9dYDjNNH/qKy9q
 ogsg1Z/mZMQrgpRVg9GBxDLDF8fDJBqqvEHk31hywqu9wM8nbTICmR3MdR9wOYk0vh+a
 1qHlc0QViTmfpyK9yvwHpVkthP98JN4vjpJHZ06RkWa9Qp/1P/sPmubKgk1vEAf6+WGW
 lh2FsuBZAqeU32eJm8C+nNU2FKqvfyPj5TNr9mb/ezNQMn2oeyFE74lmQ8Lqs91oUZ+U
 PJrw==
X-Gm-Message-State: AOAM533Qrk2BzIHqbThSg1z2i9JE2xSQ+KiZJSH4MkQInJf5m2p0heDp
 dj43ZhP2UbdnocLt6RK2iBhRyw==
X-Google-Smtp-Source: ABdhPJz//r9cjTQrlWIo3WtQxBCUXpTlF2ciZ8Q1CvLASWzU8kFCw9xSJWBhlgXwA3vTwYAR17qDAA==
X-Received: by 2002:a63:5a47:: with SMTP id k7mr1010602pgm.9.1623868999619;
 Wed, 16 Jun 2021 11:43:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 e24sm2955203pgi.17.2021.06.16.11.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:43:19 -0700 (PDT)
Subject: Re: [PATCH v3 09/13] hw/misc/auxbus: Replace 'is_write' boolean by
 its value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1449c95-c455-39c7-d255-100bcd35dcc7@linaro.org>
Date: Wed, 16 Jun 2021 11:43:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Remove the 'is_write' boolean by directly using its value in place.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/misc/auxbus.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

