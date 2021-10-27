Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E143D1D2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:40:01 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfomG-00030I-L7
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoFm-0000zg-2g
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:06:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoFk-000085-Ek
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:06:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id v16so2662854ple.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ck4uqWymRhWC6zoreqvLiEMpMjKMJPep+oL167bWgq4=;
 b=uwIWGeMByyRNSyyBYbFTXU0KBcftZHq6P47wA6dvSoovNjNtgGXutuRBlq4av4GkvH
 1WbdHNet9xOVxJFnMYqyfP3yP5Z0odz4/93mmcQSPFczJ1rUbCRK6mp3rLNMaG70/zNC
 BBgixoMjqNwFe0zH/3+6eGYizfiEiO9U8bUzkPpBkDihgzmK9XCj/7TkObb7u8sgQ6I5
 rlKsfDrFzGWVHaxRqCSCugpNr+w4WzkoZ0nCw5vGtq0rqAKl3EtGpsxstoXnGoA8eJim
 hzdP9godE0WIdXjXkqcfBh35+P/j8OjpnXQNNusAMgtQkhv+yRum08zsIxbAFqrTx1ag
 Bzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ck4uqWymRhWC6zoreqvLiEMpMjKMJPep+oL167bWgq4=;
 b=YHoT57/9TMkNvHaBRI26yLRXrKsOBesr0hHEvooqyt2wPHka8bYJ2fl5XX/AmwMNWN
 kgG1LrBvNXeB5L4HaGEiSiEE9bj9wtt+0qizX4q5Po9LWtuMhuaeTVOFyDV2RuxWkxb+
 NhfdLkPnMeundr/f2QZ+Ouoh1ajZRTnGtsKvVa2vDZCY2vY5SwjBn42FsaCKahmQeuHZ
 gJltJRSz3Ciz/PdRd88XAjMw4APZEzTeyhP9Lct15vLezogbe/ncfuiSAADd62kNNM/+
 Av/4AyIAeaBDhWVstDmredSU0Vn272owSFYtuCmkLjNojgybwSY/xnpNSgevOEH3MX+p
 sZ3A==
X-Gm-Message-State: AOAM532yJn4GVmNcVVXZX/86JPlxDT+hGigTROuFvSz8H7ndfEluYnNS
 1YAMj/z7G7v0WxkIu53DlXs9sA==
X-Google-Smtp-Source: ABdhPJx3Oh/aCSrsjKb87r3lA/+HfSD+kFoi8E3zYOgYWoHhjicSXIBLiB3cam/KyWqlxsxHYaCgJA==
X-Received: by 2002:a17:902:bf02:b0:13f:cfdd:804e with SMTP id
 bi2-20020a170902bf0200b0013fcfdd804emr29940276plb.1.1635361582954; 
 Wed, 27 Oct 2021 12:06:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fr12sm5250475pjb.36.2021.10.27.12.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:06:22 -0700 (PDT)
Subject: Re: [PATCH v2 04/32] target/mips: Use dup_const() to simplify
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2df200f6-8961-ec07-1df6-fbaa83997f95@linaro.org>
Date: Wed, 27 Oct 2021 12:06:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +    uint64_t eval_big = dup_const(df, 0x80);
>       TCGv_i64 t0 = tcg_temp_new_i64();
>       TCGv_i64 t1 = tcg_temp_new_i64();
> -    switch (df) {
> -    case DF_BYTE:
> -        eval_zero_or_big = 0x0101010101010101ULL;
> -        eval_big = 0x8080808080808080ULL;
> -        break;
> -    case DF_HALF:
> -        eval_zero_or_big = 0x0001000100010001ULL;
> -        eval_big = 0x8000800080008000ULL;
> -        break;
> -    case DF_WORD:
> -        eval_zero_or_big = 0x0000000100000001ULL;
> -        eval_big = 0x8000000080000000ULL;
> -        break;
> -    case DF_DOUBLE:
> -        eval_zero_or_big = 0x0000000000000001ULL;
> -        eval_big = 0x8000000000000000ULL;

The conversion is incorrect for eval_big.
The conversion creates e.g.

     0x0080 0080 0080 0080
not
     0x8000 8000 8000 8000

You'd have to do something like

     uint64_t eval_one = dup_const(df, 1);
     uint64_t eval_big = eval_one << ((8 << df) - 1);

r~

