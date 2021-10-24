Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC4438708
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 07:07:07 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meVis-0003mu-51
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 01:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVgn-0002Zb-GL
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:04:57 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVgl-0008Md-OR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:04:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m26so7479495pff.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 22:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AenESqhkL9kgq9nTaWhvj84M6vtsycr7tB9M384USBc=;
 b=LP8NlV+RrxvMh/nwihUhArRXBkhcVIiB1XMliIEkfBwEwtOIp4css6wTD9UNTmTe55
 mTkwYrBm/33w4YlGYiWUscfz4+hSdVFHDd/HYgAM8IxsfE1zO7TNblNYpcKZzbOaJziY
 5w97MshI3wodwyBdM7/KW5Ozb9gyFprZySCANwcKItL32wMavufxCAjLk5NjIMw9PCeN
 MP8CvRUvNaFqHelc1AD/X3vEXDVaoLSTA+jqnuWHqM/4SzreTVx/op1qYTXzKJXsZs0J
 HHKA3UMp2zpSa511HZzvPk/dOTysSFwzaWyT0AhpSZwP9SagawVfwgUKAshJi/hNucrL
 gKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AenESqhkL9kgq9nTaWhvj84M6vtsycr7tB9M384USBc=;
 b=IzBqCJ0SkgBAXUmSkt6ulFx0FwBBuIrSfJtUva9Li/wLI5sPxbbcX6T6nIvE19R6fH
 GtuA75x6PX4ZsZ0uFlkul1HTeibSBmpKUf6gM0O0icd+ne6BgfLwEHbjkFHVeoyAHxG/
 g1yv48TnxKO4vA2NsC9o5j/ITnZgs1SM5nxM7derXc2pE5/Ez4KuJEMHCDV1zzumLSiI
 HRQ1cbyKbFi8zsR1hvEyzc1iSSYUhlD7pNxVK4x0cW/5PwmpsH7MRqeQsXvwHW2XB4C+
 W8wWOb45vgzP7Wwh81EMWVVbJ2oBMaa6cz6dsx/aHukzwH4FtbHxioyK96/+vIQc4unk
 LnFQ==
X-Gm-Message-State: AOAM532P37axbdeTHKfaFKHkuGcIEKTrBUO254UbecmqY8AgrC1L7o8U
 KWb6kRs2O0TNtEYdCoYEs0AuPw==
X-Google-Smtp-Source: ABdhPJzwp40p2rnpk7cFK632EGG5RCasb6Zd2yc1iUcDysqPhmrxiauHMfkBCJLjOchqC7nW5Umf3A==
X-Received: by 2002:a63:201:: with SMTP id 1mr7471620pgc.22.1635051893985;
 Sat, 23 Oct 2021 22:04:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 23sm17299310pjc.37.2021.10.23.22.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 22:04:53 -0700 (PDT)
Subject: Re: [PATCH 17/33] target/mips: Convert MSA FILL opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05abb10d-25c6-3b39-dd43-cc269dc1dcb0@linaro.org>
Date: Sat, 23 Oct 2021 22:04:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Convert the FILL opcode (Vector Fill from GPR) to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      |  2 ++
>   target/mips/tcg/msa_translate.c | 40 +++++++++++++++++++++++----------
>   2 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
> index 2997bfa24e3..e97490cf880 100644
> --- a/target/mips/tcg/msa.decode
> +++ b/target/mips/tcg/msa.decode
> @@ -21,6 +21,7 @@
>   @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
>   @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
>   @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
> +@2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
>   @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
>   @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
>   @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
> @@ -76,6 +77,7 @@ BNZ                 010001 111 .. ..... ................    @bz
>     SRARI             011110 010 ....... ..... .....  001010  @bit
>     SRLRI             011110 011 ....... ..... .....  001010  @bit
>   
> +  FILL              011110 11000000 .. ..... .....  011110  @2r
>     FCLASS            011110 110010000 . ..... .....  011110  @2rf
>     FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
>     FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index c6a77381c0e..fc0b80f83ac 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -53,7 +53,6 @@ enum {
>       OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
>   
>       /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
> -    OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
>       OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
>       OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
>       OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
> @@ -1844,17 +1843,6 @@ static void gen_msa_2r(DisasContext *ctx)
>       TCGv_i32 tws = tcg_const_i32(ws);
>   
>       switch (MASK_MSA_2R(ctx->opcode)) {
> -    case OPC_FILL_df:
> -#if !defined(TARGET_MIPS64)
> -        /* Double format valid only for MIPS64 */
> -        if (df == DF_DOUBLE) {
> -            gen_reserved_instruction(ctx);
> -            break;
> -        }
> -#endif
> -        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
> -                               twd, tws); /* trs */
> -        break;
>       case OPC_NLOC_df:
>           switch (df) {
>           case DF_BYTE:
> @@ -1913,6 +1901,34 @@ static void gen_msa_2r(DisasContext *ctx)
>       tcg_temp_free_i32(tws);
>   }
>   
> +static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
> +{
> +    TCGv_i32 twd;
> +    TCGv_i32 tws;
> +    TCGv_i32 tdf;
> +
> +    if (!check_msa_access(ctx)) {
> +        return false;
> +    }
> +
> +    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
> +        /* Double format valid only for MIPS64 */
> +        gen_reserved_instruction(ctx);
> +        return true;
> +    }

I expect this reserved check should be above the MSA is disabled check, within 
check_msa_access.

> +    twd = tcg_const_i32(a->wd);
> +    tws = tcg_const_i32(a->ws);

tcg_constant_i32.

r~

