Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6A69DB92
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNVf-0003mS-20; Tue, 21 Feb 2023 02:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNVd-0003mG-6A
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:56:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNVb-0001iV-7F
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:56:20 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so2445666wmc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sw6SJyGjDiG+hDVh2L5z58E7kxqeYqR3RCNI23/fJUQ=;
 b=JYM4wAFk+UmaG5ZrP4LlC2x+Vj7lUcuyPH+isHH0QoB3J1xAlcs3X9+Ip7AT0Vexd5
 AnLmYDYEkHq/wAr1ihHQLwScKOpuspcbdA7AckykZBoL01Z9BFg0WEPuX5riAdWBKPs/
 jql+pdvzyEldHYO8aJgr36YZqprG8hl29/IfCazt2nYOqMOuWCnOkbNKyqNtSqvGLhWF
 Oe9b+RvaF4BXUtXgTms2A97CjvDBPci9Knr1wrgy9Ozm9KPeX8TzD0jJgnX7k/qeqlrA
 Ya17zc7XfqyNM74eSsX4RTrhxwpEbwKN+I20IYbfOifScZCTwxnWtXaZ6agx0kgYtkPj
 I1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sw6SJyGjDiG+hDVh2L5z58E7kxqeYqR3RCNI23/fJUQ=;
 b=GeQ7GNWWyuKFB0Xqb5uwYN5MnNjWKEcEP11GcR5vEQ5kUEjrwmTvZp7JHgiALbcsC8
 XJkR+thtFvZe676K4Kf6k743+C4JMg0fek4HY80cFoybhY/Rm53cC17iiSBMX5RELJi9
 kAo+1rtl4vFABe0DWKYQwdfnqeIKRyD8yPC9mI6XMOOUF6xIkwc8caqTnRYmRZPSmPEY
 UflSJK5PFeqCZjyuGfl35wddnbYo25fPiVjkEg2atohJQDRFlRCIkv4Q+1qhMgWbj8l4
 S5qycnZU1DYMPCfmJ7x6m+lG7evO9aOF0vkXAAkKIEuIPxP1cl1JrtmVcDcsCTxjAWdw
 GWwg==
X-Gm-Message-State: AO0yUKWvd5bBViyvV/toWbSt1YR0zq0eOmI+8kLDkm9iS6Yj7BeFz9yJ
 wKcvwGFGC1echYBZ9rhCa9nhpw==
X-Google-Smtp-Source: AK7set9WHT8afUrPnqYN/dYoecw8yZzf7ueJmnr35oFHoznsHTNIKlUEqh8oGqVLavVkMH0GpKWpVg==
X-Received: by 2002:a05:600c:22ce:b0:3e7:6a59:d9d3 with SMTP id
 14-20020a05600c22ce00b003e76a59d9d3mr1145644wmg.37.1676966176415; 
 Mon, 20 Feb 2023 23:56:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003dc5b59ed7asm4219669wmo.11.2023.02.20.23.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:56:15 -0800 (PST)
Message-ID: <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Date: Tue, 21 Feb 2023 08:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220232626.429947-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 00:26, Richard Henderson wrote:
> We will need 2 bits to represent ARMSecurityState.
> 
> Do not attempt to replace or widen secure, even though it
> logically overlaps the new field -- there are uses within
> e.g. hw/block/pflash_cfi01.c, which don't know anything
> specific about ARM.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memattrs.h | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..d04170aa27 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
>        * "didn't specify" if necessary.
>        */
>       unsigned int unspecified:1;
> -    /* ARM/AMBA: TrustZone Secure access
> +    /*
> +     * ARM/AMBA: TrustZone Secure access
>        * x86: System Management Mode access
>        */
>       unsigned int secure:1;
> +    /*
> +     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
> +     * easier to have both fields to assist code that does not understand
> +     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
> +     */
> +    unsigned int space:2;
>       /* Memory access is usermode (unprivileged) */
>       unsigned int user:1;

'secure' & 'user' seem mutually exclusive. If we get short in bits,
they could be shared.

