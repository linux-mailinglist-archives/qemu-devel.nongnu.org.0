Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C92698434
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:12:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNBh-00015O-Ic; Wed, 15 Feb 2023 14:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNBf-000118-DK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:11:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNBd-0001h7-NN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:11:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n2so13428693pfo.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5hy5/F/7wVE2L763K3uxM5Ho8w1YwXRWKXNLgZ9Bz0=;
 b=Pgh6WgOJQysDfkKUD9NcvuL+sNPdmErJ32Ss3u3HoO8PP+/lQ4zX0/K7kMlKO6E3gY
 40qukryp8Svv11BFgY3XjzANLIWvUY1Y/viInNfGO3pX7jct4R+zIHkGbpUxO4AXjzdv
 dfvjl0w8dOLPuJyB8xa0VBgCLnqBKak3c7q8tITapMwzAsEMPNFCcgXKybjXT6SQ4YyW
 21jf7MlqU0xSEf6OZwqMHB99Dktg03OuovfpeNhUj7vOYdBAYXRmVepm9+Ph56ufwqEC
 qxeuU5XH9mGtYEP2lqgwkHl0WgFiRA4oD/8nzmlV/Ue03TIkeoF20Wtk18euXdQ2cFIm
 ANlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5hy5/F/7wVE2L763K3uxM5Ho8w1YwXRWKXNLgZ9Bz0=;
 b=ap1ihz8t6MLpQl58z4qGMr8LG077FAh2YEJPMFy9Mf8kEbA0hh326my8kkfexS8TsV
 7R0eqPs1UfH35+IY7GhgHHAs6k4lo2153srcWugpG+PaPUC6bYtgdR8mrvK2gNyoAg9g
 fY+tENPeL9XENmEiBy9YXRvRexKEkjAYFa3GMUcd4FctsXXUj9syTbKwvYeGQCOSAQhK
 tl6E0JUZnCOhoyzEKi+6mccE1tsILeBVR5cwWEfwVrhbdbXAQmgM2cHglJWz2jTPbhpW
 tLbje9NUcg8/11q9HLzbX5Cqmj/xTwo1PqdN7LdABnXMixU/WxPHska1GFqfZkFhwynk
 VJUw==
X-Gm-Message-State: AO0yUKX3hLc8a31ydLnHmW0RiJQM9Q+Pxt70f/D7f8AIPROH9KNR86+r
 dEu7u/8L+JKfC+QpL4bSOnvdiA==
X-Google-Smtp-Source: AK7set8pyKxS++Xf8mN54FJsANqCCcZX0w0mzf0WTNUvPVOkbSyruUyL3Wv/pPFy2LKUEwLMFxHfdg==
X-Received: by 2002:aa7:9ad2:0:b0:5a8:b958:e348 with SMTP id
 x18-20020aa79ad2000000b005a8b958e348mr2798231pfp.28.1676488284236; 
 Wed, 15 Feb 2023 11:11:24 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d24-20020aa78e58000000b00580fb018e4bsm9983669pfr.211.2023.02.15.11.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:11:22 -0800 (PST)
Message-ID: <30baf427-2918-4fe3-7d0a-fc5bb949cf09@linaro.org>
Date: Wed, 15 Feb 2023 09:11:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/20] hw/ide: Un-inline ide_set_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc@nongnu.org
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> Only include "hw/irq.h" where appropriate.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ahci.c             | 1 +
>   hw/ide/core.c             | 8 ++++++++
>   hw/ide/ich.c              | 1 +
>   hw/ide/macio.c            | 1 +
>   hw/ide/microdrive.c       | 1 +
>   hw/ide/pci.c              | 1 +
>   hw/misc/macio/gpio.c      | 1 +
>   hw/sparc64/sun4u.c        | 1 +
>   include/hw/ide/internal.h | 9 +--------
>   9 files changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

