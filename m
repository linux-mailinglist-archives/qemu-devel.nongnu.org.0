Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88855417188
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:10:58 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk2b-0004O0-9U
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrw-0006Lg-LE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:56 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrv-0002eR-9d
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:56 -0400
Received: by mail-qt1-x82d.google.com with SMTP id a13so9115364qtw.10
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DuKb3OWfAfkw6MW+aXGDzZ6PH92UC9mW0+C/E3cNOKM=;
 b=tKDgRfAuZ8tZSl/Zqu/o6JT+dUlSTOx9Kpm2vKxxIQMD4utvyKgz0Otgo23jbcfcXl
 wCoLRwFcaL+xbHa9hu423SZo5wgKCRNbloVL40rS41S2YEnhuceyJ/wrv8Bqd4okUGUI
 S6f1pZpQQRL881I0C/CxGN/PWN283kcbH6yGIhFojpewqg3nG0fHpfs8/xNcF58DlWLD
 kGEO/oRs/wIkrQKFxFiscxqbb1tmHDLZvQ9ywPVvuhIpQ3QeLwic6CJ2Zfzs0UOteu4S
 LO0YM2i86/p2bwRKfh8Cy/cs4Px+L2dguaArvvY7tvbB6gjZZp7Sf4BL2kpLCszPZSoA
 fw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DuKb3OWfAfkw6MW+aXGDzZ6PH92UC9mW0+C/E3cNOKM=;
 b=C1aVs0J1dQZHW7QAdXeJHel/Bw2hLZCWjzYgkPm3nMUHobHMuB4Jr2oQ3wjcPEfJGn
 O24nYiAR9gxcYdS7GmNVrAIXYySH4IZ8Ww/C614lA+dfBf5nsMaFF2C3RrJsOKB+HsZK
 3UTqOiRPZEwX2QMZQbhkAAnvHzgQOppLOJ8uWTMk6i0eXqpXj8Wi6U0b6DR7YvEmg7f4
 6c9yGjcGsQhef/bODfL1JtC8pVjO530pti43soQHEdz6Un8lHoCR9J2wikUqlijJWeYX
 72nNj/EkQoetGCFMemk+Ysnjo8h3iO4Gff9deE90rTxkgslIyMAyWv8yDwG2m5XOr8rW
 U4iA==
X-Gm-Message-State: AOAM532AKwpy+LI4BoYOQlCq7MvNQSX/bc9mkqMbUjOFF+Ao/ZXpbHKy
 TKj+gVNffAiR01FJqn8XmwyhzA==
X-Google-Smtp-Source: ABdhPJwSWC6/VEvCijtKunsQJV4PC01yM3q12iu+Zs9OBPXGYbfT/LoBKDsdeeakhFQ3avLYK3VhWw==
X-Received: by 2002:ac8:411d:: with SMTP id q29mr3679328qtl.349.1632484793357; 
 Fri, 24 Sep 2021 04:59:53 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm6538022qkk.73.2021.09.24.04.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:52 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] bsd-user/mmap.c: mmap return ENOMEM on overflow
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b71aaac0-8e8c-9343-187a-73965605b63e@linaro.org>
Date: Thu, 23 Sep 2021 10:38:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> mmap should return ENOMEM on len overflow rather than EINVAL. Return
> EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
> Found by make check-tcg.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

