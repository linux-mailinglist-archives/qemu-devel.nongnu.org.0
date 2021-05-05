Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8237434C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:06:02 +0200 (CEST)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKyH-0000bT-CH
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leKli-0006x6-4F
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:53:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leKlP-0007HA-OU
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:52:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so1179420pjv.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WDbWXWzwMUpIUnHYeB8+AjkjsuAxuX6dNiEcCSYJcVE=;
 b=kjnsmM9jGfxE5MJpXH7VNLLurt6E/4gbpG5ZH+Qty9ho0wsZIqbmTWIXLQbuKTQVvI
 LALlndGoIltgGFjpax00jCApH1P1QtU71fxiYol+BIB9d57pCkbUSTRUuw9QLr7fxhZW
 h7Hmeleupg4fT8aokRHZsljnplSiggQzEwQfNZJ9EuOuVm6VlIpT7RcyfivfiGLwrXwM
 5m1jxpyi46oGdkIypH/2UXKJe1F1Vcu7BaUmTUuTjRKILfNQL23ES/JpK8dbF9xn6rNZ
 R8mafvjt+CJMzliu8VbcSS9Dbb3TjR5439D/MzP++NbXV+G+xg+ODZTrorpVAUU3sgxJ
 G68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WDbWXWzwMUpIUnHYeB8+AjkjsuAxuX6dNiEcCSYJcVE=;
 b=Lx5+KVEN59+Z7WbqChkvGOmO1msR5LQX/ibDhlzLfj5Jjvsn7GFpCxau92x4t5fh5B
 1q7ok23j1amIU/Wbxclr+Vqti4+0PcEQ73C4hSCbZU3MtUN9QbdumMUR2RLwkunaaWKz
 CiIw/2uNGMuLHSoZVosnC9+NN9Lz8QlHkTnnlvfBIjs1GWfxKokANLfra2b5q9JYwtl4
 x7lie1DvkGx77kZo8jIGNGgRnsD2CplRb6gnvWZX7bbd/ZWtmK8T2l5gcdFP5oyJGfCs
 zdUNkTdY9+PL436OwSLpKHFSQi7+fgqfDh7k/Zo95GnFKLQk7PaFjl2pOAJ4njxF+CPO
 6XFw==
X-Gm-Message-State: AOAM5317s/ga3RcNxkQx4lOhOOVuPww5MbFAufJFrz9dk8tVHFmfT+DD
 mZ0yw0LNzGWuz1nCsgdtzoeLgw==
X-Google-Smtp-Source: ABdhPJwuvON04hiLo0dSKkp8Z96+7EaJapxcjSb+cBkz3kEbj36Z+V39b324azmpTdv1oTItXnACsA==
X-Received: by 2002:a17:90b:e95:: with SMTP id
 fv21mr34869315pjb.107.1620233560154; 
 Wed, 05 May 2021 09:52:40 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id j7sm14675244pfc.164.2021.05.05.09.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 09:52:39 -0700 (PDT)
Subject: Re: [PATCH] target/sh4: Return error if
 CPUClass::get_phys_page_debug() fails
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210505161046.1397608-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ecdbf03-9936-104d-0e1f-01089a814804@linaro.org>
Date: Wed, 5 May 2021 09:52:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505161046.1397608-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:10 AM, Philippe Mathieu-Daudé wrote:
> If the get_physical_address() call fails, the SH4 get_phys_page_debug()
> handler returns an uninitialized address. Instead return -1, which
> correspond to "no page found" (see cpu_get_phys_page_debug() doc
> string).
> 
> This fixes a warning emitted when building with CFLAGS=-O3
> (using GCC 10.2.1 20201125):
> 
>    target/sh4/helper.c: In function ‘superh_cpu_get_phys_page_debug’:
>    target/sh4/helper.c:446:12: warning: ‘physical’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>      446 |     return physical;
>          |            ^~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sh4/helper.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

