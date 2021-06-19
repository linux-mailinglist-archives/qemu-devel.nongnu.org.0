Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5F3ADA3E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 15:53:27 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubPa-0000AX-Dx
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 09:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubOF-0007Q3-NW
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:52:04 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubOC-0007Zx-Fj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:52:03 -0400
Received: by mail-pg1-x529.google.com with SMTP id n12so1520107pgs.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w41wGA7+uK28oyaww1KypdGZ7lgVAd1ROmdRoiXt7SQ=;
 b=k00thAEt2qPf3s/CWSebFwFrpS2Ouzp6Bkli113rv/U3kLXjisQ5ZdGQPM7twOEapq
 ymk2KinfymVmhl3ZEu5pTCM87Nyixr2l8rl7uqMlv53cY/t0ng1Jkqk6xSK6TQO8eAAV
 ULR+HilPV0IyQjE4afjJ2ro3jBcVWLjl4GC7puUoVRGprE09wS1DTCq2C/i7ILnJ9bJz
 KvByE+tPrvo8CZrJnWjefLGBjjTNJQxoMCijRzj+uzVEg+R9PTmELNmwcL6RZBW9Bmi9
 KRKlf2utKg2qvTUEvC3MZ7gfaPfXPhxXZ4WHntR0Xw/T7dm//ReiqgyOWCzvzQ8baXbL
 +gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w41wGA7+uK28oyaww1KypdGZ7lgVAd1ROmdRoiXt7SQ=;
 b=TuHoa3FyL8olbRIFu8SaJ32RCxH1c62fdrzhwD6/uGoigf1uwNXkk6tTwSLkg/4aKy
 y/B6RrlCenDdR1sO9CTEK4IuGfqjcSnhtLR4R8mNmYzj5YDwn352bXjA6147/Kffbp9c
 TjfgnQXQGfnDDgi/9ABxpE7ixk08aVJtbC3oI6PzGE7Ng+1S0F+Xwcqlx0cLcPjTDjsE
 WLtjwJ2wAr2faw3TcTNxKSWslRkfmjzTJri3kUEsHblNufn4h5B2BiKNKTdoR2l8aLXj
 u8sh/4j8hWXUvZ6WZGHt7fny0Yajx5rwIOc1v0poAMnltwGC7v6++bV2UXZXva0KnJs5
 JH7A==
X-Gm-Message-State: AOAM532zuN9nhg/NGe/UPon7QfZZZFox9/CGSIbXA5fY5izMUUQcMSnX
 94h8gy+3hKfAEIsY3i/ci4gEkQ==
X-Google-Smtp-Source: ABdhPJyzXnfRBcO1w8gav1YHsj41JhUy8x7peXsWI7T4Zu3oz8NZkYotoA8lZzd/KI6zGM4uW7g9yQ==
X-Received: by 2002:a63:a019:: with SMTP id r25mr15017171pge.139.1624110719026; 
 Sat, 19 Jun 2021 06:51:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 125sm1597498pfx.175.2021.06.19.06.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 06:51:58 -0700 (PDT)
Subject: Re: [PATCH v5 01/14] tcg: expose TCGCond manipulation routines
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-2-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acbf3906-f981-4a01-be23-6072f8ef8760@linaro.org>
Date: Sat, 19 Jun 2021 06:51:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619093713.1845446-2-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 2:37 AM, Alessandro Di Federico wrote:
> From: Alessandro Di Federico<ale@rev.ng>
> 
> This commit moves into a separate file routines used to manipulate
> TCGCond. These will be employed by the idef-parser.
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> Signed-off-by: Paolo Montesel<babush@rev.ng>
> ---
>   include/tcg/tcg-cond.h | 101 +++++++++++++++++++++++++++++++++++++++++
>   include/tcg/tcg.h      |  70 +---------------------------
>   2 files changed, 102 insertions(+), 69 deletions(-)
>   create mode 100644 include/tcg/tcg-cond.h

Thanks, queued to tcg-next.


r~

