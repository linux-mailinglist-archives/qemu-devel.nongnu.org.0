Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D897014F0
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:29:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjg2-0001Gg-T1; Sat, 13 May 2023 03:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjfz-0001Fy-Gg
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:28:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjfx-0005w5-DZ
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:28:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so342367135e9.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962899; x=1686554899;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DJBLgLSQ09TmkB1V8Hbkjp+P2cygVDR6hTObNJoviM=;
 b=vtUX4kOvsZHn9siUSTEn/x47BxXmelgV4s6E99Hp5XQsUQ+IzISKR63VEL2aB6A/jn
 AYT39iXo+R3eKVLXtgUd7TUuaz/FmWXzB7nFhNTBNpqhXeZqqmQi3HaLcvQB4mnlfgNy
 XqCNjG1bJAfwo5gv0gkYSpoA/AtyTTE9W5Bx/Jus+sicJrGAmWqaDS9JEp8f5tUIEpZX
 KmRZgt5yzN94gflu4puv+q9vCTUJv0hpwKrrK3kqa2GNAwvDsBrjTR0UbOYiF+o2o2r5
 CYAw0LCTGrSJwzWM2mcWZ0HhT6uzKbHfsLtmxNedhbFXOZSxUbqZsoGJ2LEIcgUKZp5l
 qw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962899; x=1686554899;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DJBLgLSQ09TmkB1V8Hbkjp+P2cygVDR6hTObNJoviM=;
 b=BlyuJsvoKULCjsjuXQ/ytqlsiGm6ezr+bC0SEFJIYxazQOS0ZN5rOa+/Jo0lSrpfCW
 5OStxbwEdj8qFd1KIrQyFDSeceqgseSoULNiLf5g2BW2Fje7bhGhg1eass72Bs0uQ4O1
 y45/KuuLF6W+KbX58zrHKb2GjltbmlKPcgsQ4amXG2clLC75s/emUlOwUY5gaB/4/FpX
 RETQTPYinhmiUoiRI5cOtVV50g6UzqZhPqGTkOm4aC5DxQcgd78lIcrD1pZxK5s1bBZr
 d9MhZ/cXx4Fsn1deqGK8xxynzbmCUvZkzVJKI6jFsrJyVd8VFuousgK9DX+kHxe9iM3N
 Iicw==
X-Gm-Message-State: AC+VfDyEpP/m4KKCvgZegnOJw4XgD6rcVKIBbBZvwWjh+P4QW6GCOhmW
 QydDad6fJWp0EwbnSc0znb8jVA==
X-Google-Smtp-Source: ACHHUZ6gGBz/8wclq6wlcQjg9R3E6l2W+y2tKgK89v99nQpnbjmVVt/Xkp9zqmP4tpJNBkNwJwiHIw==
X-Received: by 2002:a5d:4b0f:0:b0:2cf:e313:2860 with SMTP id
 v15-20020a5d4b0f000000b002cfe3132860mr16196097wrq.33.1683962899330; 
 Sat, 13 May 2023 00:28:19 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d508b000000b00307a86a4bcesm12228028wrt.35.2023.05.13.00.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:28:19 -0700 (PDT)
Message-ID: <2fc18b8c-26e6-e65c-4cc2-937b4e6715b9@linaro.org>
Date: Sat, 13 May 2023 08:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 15/20] target/arm: Convert TBZ, TBNZ to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the test-and-branch-immediate insns TBZ and TBNZ
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  7 +++++++
>   target/arm/tcg/translate-a64.c | 25 +++++--------------------
>   2 files changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 86220569e13..68dc820ece0 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -121,3 +121,10 @@ BL              1 00101 .......................... @branch
>   @cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
>   
>   CBZ             . 011010 . ................... ..... @cbz
> +
> +%imm14     5:s14 !function=times_4
> +%imm31_19  31:1 19:5
> +&tbz       rt imm nz bitpos
> +@tbz            . ...... nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=%imm31_19
> +
> +TBZ             . 011011 . ..... .............. ..... @tbz

Similarly with the single-use @format.

> -    tcg_gen_andi_i64(tcg_cmp, cpu_reg(s, rt), (1ULL << bit_pos));
> +    tcg_gen_andi_i64(tcg_cmp, cpu_reg(s, a->rt), (1ULL << a->bitpos));

Can we drop the () around the bit, or use BIT()?.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


