Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84A363776
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:07:37 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDhg-0005yC-1c
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDgU-0005Fe-Dn
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:06:22 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:38824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDgS-0000NB-Fl
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:06:22 -0400
Received: by mail-qk1-x729.google.com with SMTP id s5so25227115qkj.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RWSCiMR7GPL1xpArRur4JeQWRCJotJHhtsP4hu2EEK4=;
 b=J6nCj2ENv1eiHg0vzjpHvT+ZeKV/rp1+sc7ke4izyob4hgRPRcac1tiA2nC7/MwCFn
 FDAtZCUi1GKaT7ongCId93kWye6rGLlHN6UmsmlQIKihgydeGI3fFCLOAGFBlo+a5GJ+
 PM6bMLBZREOqZ3awu6QzIQZH9rN2Xt+HWE/61n+yIxji0+NiWi0LTMqukTTpDOjdlJmN
 euRflA2BqE+A1LlwN+JiMa9Hkl3cLKYQwC93ki9HHt4j2iw6qc5NUNpCfJwcUlXhJWLW
 nhs1gVrLthaIfhQ9ab3evFK+OR0chd5A0LWYbPg+sNy9jfsTtD+9cOXGS8M3fg3dt508
 OLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RWSCiMR7GPL1xpArRur4JeQWRCJotJHhtsP4hu2EEK4=;
 b=V+CWFZu2Z2FB6e5SsN5abth9vegJaiSWCxp5qgPtkgEWzc5ekbZz/08wRT874fByqW
 XVUVkweBYXsRRHgDFil6GBhcdYDD1O8/FCZrzHZeaTd2NOQxtnnNRCwEDQJ2htBe0emw
 1X8Rum7EqNfd61VIGJuE7ViMCeQ21srR06KXMxAN49qP8bfuh5HaM6quPjr1byQBZSml
 ZdjOJobbM/i1rzqprxAzTyjxnc4QYJGoaRyar5ISw6Egvx2Cj0V3sy7Qcx+DiwvsFL0R
 RWZL9BdlW755G+FfB+AboT9Rs/mE/GwIhVftnWpKHdph1TT9UsPm0tUHPR+FZkqmNCMO
 AZVw==
X-Gm-Message-State: AOAM533x5dYNVlcH8XfMb30bWT5qFfBtKmFR4qgQBQ9Q15wMZPaOUQfz
 YoEcgAFqKjhGE7XmIWULIhpQDQ==
X-Google-Smtp-Source: ABdhPJzBXYjfqt3ho62kuwFaJbe8H09RCB/X9hsLn64AtVpGOyKiC94iiP9+H/XstBdmevYzkonmBw==
X-Received: by 2002:a37:b206:: with SMTP id b6mr9061036qkf.275.1618776379379; 
 Sun, 18 Apr 2021 13:06:19 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id g1sm4951652qtp.41.2021.04.18.13.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:06:19 -0700 (PDT)
Subject: Re: [PATCH 20/26] target/mips: Move TLB management helpers to
 tcg/sysemu/tlb_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88a3a6a3-8fb7-d1df-9f0d-ef3c980e1a73@linaro.org>
Date: Sun, 18 Apr 2021 13:06:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Move TLB management helpers to tcg/sysemu/tlb_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> 4 checkpatch errors:
> 
>    ERROR: space prohibited after that '&' (ctx:WxW)
>    #414: FILE: target/mips/tcg/sysemu/tlb_helper.c:71:
>    +    tlb->XI0 = (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;
>                                                      ^
> 
>    ERROR: space prohibited after that '&' (ctx:WxW)
>    #415: FILE: target/mips/tcg/sysemu/tlb_helper.c:72:
>    +    tlb->RI0 = (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;
>                                                      ^
> 
>    ERROR: space prohibited after that '&' (ctx:WxW)
>    #420: FILE: target/mips/tcg/sysemu/tlb_helper.c:77:
>    +    tlb->XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;
>                                                      ^
> 
>    ERROR: space prohibited after that '&' (ctx:WxW)
>    #421: FILE: target/mips/tcg/sysemu/tlb_helper.c:78:
>    +    tlb->RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;
>                                                      ^

Wow, that's amazingly bogus.  I'm amazed that no one has re-written checkpatch 
in e.g. sparse...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

