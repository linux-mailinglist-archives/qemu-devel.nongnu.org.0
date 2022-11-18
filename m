Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCF62EADA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 02:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovq6c-0004TC-LM; Thu, 17 Nov 2022 20:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovq6a-0004Sx-Oy
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:23:44 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovq6Z-00020p-8C
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:23:44 -0500
Received: by mail-pf1-x434.google.com with SMTP id g62so3465874pfb.10
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 17:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fCD8kuogHrJHbZ/MDeY3eCgiaSkVbaRismh3Su0K9BI=;
 b=ipiXsbr62bGoQ+aIkJW5HacQcc/X0Z92V6uEJ2PbBjfI/YjqZx/c1z4PSGUTcmlD78
 +tY+BqA5nupy8hm+pfBmM71OpZOTn3zAFU8wJc8HHTJj+4s8OEF9udsnGynveQGPr1Pg
 JG8fAZA6HNScBtyQlaBs6AFIZ5+94E/H1eFYGx2j4o0B15sDo5yYn3w61comDsZ0awDj
 58o3G7dG3vZtwThJTZHfrOyxaeznvUOlZeDVV8Q2DZjfoQjsSQvQ7k0h0w2vBQeXMF9G
 axkzbF4BwcI6OYFZBfFzctHeBbi6mZ2DAfAr3jwqr606uKgXIq51IafFdAWfyMQvUhmp
 Xp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fCD8kuogHrJHbZ/MDeY3eCgiaSkVbaRismh3Su0K9BI=;
 b=qyMhVIfTYbcJPTaLAin7hmZ0rnoPv5Gz2xcrZlhkkJ/26ABKQz53sp1JiS2G9wVOwD
 V/UdhCgx/F63VQipKezdWSpYIDsmsqEkS/qNzuUaYklYtJByA96vJCah5WWKfrg/dEj+
 tXiyusNJlXlKP7wYxRHxjR9xstSU01ss7aQmK+QOBTC+Es2RvAa8kcpQZFrjdS9/AMUr
 rQf8kexlo/7JgudTkUjYJjrWHNQr5Qsuof4UIJDmHwhFUQvQOEN2nQRkzvRw1ZuJ/EjF
 zMjJ88nP5WbZ3I1vZZEm3auiCHpYw676viG+EUmMh8N5ixqH8vqKbl2F7dUBp3P9Y7sn
 DgqQ==
X-Gm-Message-State: ANoB5pkr0S4zawyCmwAtrxOBpEBQWYvz32xrVDYIKrIWrZjmkco0j6rV
 qW4iuDNM252H//pZvKCozUS/Gw==
X-Google-Smtp-Source: AA0mqf7O3z3zD5SbYwD9bi+8147G/y5LDSvwbfIyAFVnL1Dl+rJP8sMJoqfbUc2lZQCFYqNUt/qcwQ==
X-Received: by 2002:aa7:81d8:0:b0:561:c694:80b with SMTP id
 c24-20020aa781d8000000b00561c694080bmr5517954pfn.47.1668734621405; 
 Thu, 17 Nov 2022 17:23:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b00188f7ad561asm943758pli.249.2022.11.17.17.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 17:23:40 -0800 (PST)
Message-ID: <c5374c91-79f7-580e-431f-41dc222f3cbd@linaro.org>
Date: Thu, 17 Nov 2022 17:23:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/avr: fix long address calculation
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, philmd@linaro.org
References: <166870147452.1401333.9619815077606562766.stgit@pasha-ThinkPad-X280>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <166870147452.1401333.9619815077606562766.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/17/22 08:11, Pavel Dovgalyuk wrote:
> AVR ELPMX instruction (and some others) use three registers to
> form long 24-bit address from RAMPZ and two 8-bit registers.
> RAMPZ stores shifted 8 bits like ff0000 to simplify address calculation.
> This patch fixes full address calculation in function gen_get_addr
> by changing the mess in offsets of deposit tcg instructions.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   target/avr/translate.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index e65b6008c0..c9a0a39c2d 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -1572,8 +1572,8 @@ static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
>   {
>       TCGv addr = tcg_temp_new_i32();
>   
> -    tcg_gen_deposit_tl(addr, M, H, 8, 8);
> -    tcg_gen_deposit_tl(addr, L, addr, 8, 16);
> +    tcg_gen_deposit_tl(addr, H, M, 8, 8);
> +    tcg_gen_deposit_tl(addr, addr, L, 0, 8);
>   
>       return addr;
>   }
> 
> 


