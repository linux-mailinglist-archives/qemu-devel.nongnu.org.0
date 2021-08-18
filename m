Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A43F09BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:57:27 +0200 (CEST)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOsX-0004Mk-S7
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGOrL-0003go-70
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:56:11 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGOrJ-0001NA-Iw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:56:10 -0400
Received: by mail-pg1-x534.google.com with SMTP id 17so2861867pgp.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5SnmcPvDnfiK/c6251mDe60GA/GSliOAW3We1Jdqnew=;
 b=rTRCdQg/BbDwue1ClHe9HQG99W2bTuyKc5Gt04Ri7pPeFu4tINu++6rj5ykOmRd7wb
 FNgVl5N4H6LaD3pvISQ5+DEafuO0WQaFgNWIS3T/bnWKMjAohrdOqH3sbuv63iDnWXRU
 XgYfKOIfzPvqXNEKC4KbfY0Z+OrBDsZTSfJ7Frks0CuMurfE0DP0IP/R3Z9WdMoyY2Gv
 kcDuY3tG0W8BdJZmEOx8KDg5/u7zSv8eJ+wl8lfpE1w5/7wxc90MYkdufJ4Pw6homGai
 vHwMJLKDtAySFA/00arhUPvWZwRkcle5QrOqfBflpi6y0AD2CT3Idk1dHcG4si9k9KEm
 yQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5SnmcPvDnfiK/c6251mDe60GA/GSliOAW3We1Jdqnew=;
 b=D6Y9Qjoi4YebAAOBx9h7dSwHunBqRQlj9Rx5+6BsseFL6PZowW4dw6a5E1K2+yAEof
 +zyzx+WScxkuRn0K8wQKyFw4H4kUMFtMx95ER9NCVcNcmsyz42LWNo2R7i/UNbhIzdMG
 wbZRYW0jKo1LARiBm/6X7SF7yi/6cjaz0+zA/OLh41AX1BYr9n+oPgF59kUNf8poDBlJ
 ADv+BB5XTYD2B12zo6VH1PwWE2vHnyu5GteFfzK0HmJBvgxsCUdpiHkdlOAJB4iZwr3O
 noi6A5dyfZH0pgcr3vsZsrBFKixez8jJwWRGrxe5f82dC098i0yqc/Lt6H/Wxyk122wG
 YqxA==
X-Gm-Message-State: AOAM5327W79nmQjURDV0Tzk0r6b870ejNpSqrEIfZtlX6XWREL77a8q3
 oJ5e2cmKc10CB3Tn4dgd8qEDWw==
X-Google-Smtp-Source: ABdhPJz0SFmPjhsecU2OT6S2IPythGQr3gH9D/i98L8H5D7s7HIsKvXnaGqiph3uY57yznuzfgLI1w==
X-Received: by 2002:a63:4d15:: with SMTP id a21mr9644716pgb.245.1629305767806; 
 Wed, 18 Aug 2021 09:56:07 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id i11sm335575pgo.25.2021.08.18.09.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 09:56:07 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/mips: Replace GET_OFFSET() macro by
 get_offset() function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb7b7211-def7-b2fb-e843-57d0266ea20a@linaro.org>
Date: Wed, 18 Aug 2021 06:56:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818164321.2474534-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
> The target endianess information is stored in the BigEndian
> bit of the Config0 register in CP0.
> 
> As a first step, replace the GET_OFFSET() macro by an inlined
> get_offset() function, passing CPUMIPSState as argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/ldst_helper.c | 57 +++++++++++++++++++++--------------
>   1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
> index d42812b8a6a..97e7ad7d7a4 100644
> --- a/target/mips/tcg/ldst_helper.c
> +++ b/target/mips/tcg/ldst_helper.c
> @@ -52,31 +52,44 @@ HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
>   
>   #endif /* !CONFIG_USER_ONLY */
>   
> +static inline bool cpu_is_bigendian(CPUMIPSState *env)
> +{
> +    return extract32(env->CP0_Config0, CP0C0_BE, 1);
> +}
> +
>   #ifdef TARGET_WORDS_BIGENDIAN
>   #define GET_LMASK(v) ((v) & 3)
> -#define GET_OFFSET(addr, offset) (addr + (offset))
>   #else
>   #define GET_LMASK(v) (((v) & 3) ^ 3)
> -#define GET_OFFSET(addr, offset) (addr - (offset))
>   #endif
>   
> +static inline target_ulong get_offset(CPUMIPSState *env,
> +                                      target_ulong addr, int offset)
> +{
> +    if (cpu_is_bigendian(env)) {
> +        return addr + offset;
> +    } else {
> +        return addr - offset;
> +    }
> +}
> +
>   void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
>                   int mem_idx)
>   {
>       cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
>   
>       if (GET_LMASK(arg2) <= 2) {
> -        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
> +        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1), (uint8_t)(arg1 >> 16),
>                             mem_idx, GETPC());
>       }
>   
>       if (GET_LMASK(arg2) <= 1) {
> -        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
> +        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2), (uint8_t)(arg1 >> 8),
>                             mem_idx, GETPC());

So... yes, this is an improvement, but it's now substituting a constant for a runtime 
variable many times over.  I think you should drop get_offset() entirely and replace it with

     int dir = cpu_is_bigendian(env) ? 1 : -1;

     stb(env, arg2 + 1 * dir, data);

     stb(env, arg2 + 2 * dir, data);

Alternately, bite the bullet and split the function(s) into two, explicitly endian 
versions: helper_swl_be, helper_swl_le, etc.


r~

