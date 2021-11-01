Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4F4420F7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:38:36 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhd8d-00046X-22
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbJ5-0008Go-G6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:41:15 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbJ2-0006kC-T1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:41:15 -0400
Received: by mail-qk1-x734.google.com with SMTP id bp7so12033115qkb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6hf7t5wanOhfIpE/odMgA6Vp2TU64TQ4Pa0qFNbLaCM=;
 b=qaVGYTRQ/U2rncI6jj5cXHqJOk+OoivKlpHQbktWsTrULPGETBfa2e1sZRpXYkze/g
 u3fM7XWF1rykQcHYZ62BeziQLl4q9iySgSwrTu2FLDF5Vt3M9Jw6NFmY2IexbNgmkEbh
 fGXwltOXa9d0g+SzkvfW8Vx9mz1T0D2CzN5B9AUHFlvA4dYmmaublulS4G0wKFFzF1NA
 wXekHTfRQbJUnsJKYSOwp3/3bwusP8au27L22ruApSDhf68MiwjL8nEsR4AhxYxU3wcM
 KTZzQ6stY2UKKKQtAjiHRIUPRmvU5kByc8iLH8JNZCQQkMzTHYM6DOnIF5s/uJzyJypN
 TFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hf7t5wanOhfIpE/odMgA6Vp2TU64TQ4Pa0qFNbLaCM=;
 b=jS27eNK7rJwGsQORjhys21H5kYwgmThSA5HlRrbPQXZjhlDIbdKvC3TYvHZlh4H+wb
 pDWUlOQUhM8DFAu0uZW2yhzbKHhFwlVti4O0GUaXZUGsGwxE06vTEBv8vv8nSPZBdWYX
 /9/RjOehgdEq/iJd+aATemfBoH5cxilkGIv0T22Gw7iguTUY7yHPxLmYCBf8eTj+/0EN
 Ejqr+2FPOzHsUVXs8JrHnBHQ6Bad/XDlTe+XM9m7Jklg+0/XDMSzEHwEKekO+lfp0UCS
 tmi8b0dMjnnb8dQWXgilQ9Lt9FEU/1qw9iTzvgojjbGAgtWZgsDKV5uLhvckmgA34t6z
 hulg==
X-Gm-Message-State: AOAM531HxPLWmWYQA1U+u+V3TSkTeIm0Hu2lC2qWZk4MA8ytT/xmdQgk
 ctPD0hLGUvAreEb74srttw1tNg==
X-Google-Smtp-Source: ABdhPJz1ZvyB+P+0oaASkdZ46CEb8qWg1NZ3q8SXueBZ80iWdElw5VijYTF7fxIvKQEFxKyrM3AsFQ==
X-Received: by 2002:a05:620a:29c8:: with SMTP id
 s8mr7300890qkp.250.1635788471837; 
 Mon, 01 Nov 2021 10:41:11 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id j20sm11330300qtj.72.2021.11.01.10.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:41:11 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] target/arm: Use tcg_constant_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c74589f-dea1-6e56-c173-fc8e88b577bf@linaro.org>
Date: Mon, 1 Nov 2021 13:41:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 7:18 PM, Philippe Mathieu-Daudé wrote:
> Missing review: patches #2 & #5 (new)
> 
> Introduce store_cpu_field_constant() helper to avoid using temporary
> when the value is constant (and read-only).
> 
> Since v2:
> - Simplify store_cpu_field_constant(), do not modify store_cpu_field()
> - Added another use in gen_rev16()
> 
> Philippe Mathieu-Daudé (5):
>    target/arm: Use tcg_constant_i32() in op_smlad()
>    target/arm: Introduce store_cpu_field_constant() helper
>    target/arm: Use the constant variant of store_cpu_field() when
>      possible
>    target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
>    target/arm: Use tcg_constant_i32() in gen_rev16()
> 
>   target/arm/translate-a32.h |  3 +++
>   target/arm/translate-sve.c | 17 ++++++++---------
>   target/arm/translate.c     | 27 ++++++++-------------------
>   3 files changed, 19 insertions(+), 28 deletions(-)

Thanks, applied to target-arm.next.


r~


