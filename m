Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785D43D641
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:06:03 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfr3a-00016O-ET
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr09-0007eO-Kh
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:02:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr05-0005rO-Hs
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:02:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so3117389pjb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dbonmSIUEkyJiFO7NeW3CRCrv2Vq1acm+wwZOv8UXDA=;
 b=Z7MqKpBwUedWdBDwJwbLGYsbZ1+lcA+o/++Eb0LEoIZE/6dcoiEajA1Uj8mSmQO5nd
 W7O5gOfnqs8Ub+K/MOHAb5ySbtuPIpWh/iBvbYXwK/PTyG1CVXD2ioO2BxDxE9JWMYLk
 +3jFJ+dykzq7y55Lau4LAnq+WcGFzIZEFzh8N5I9TdGzbAVaA9uqQDXxMX0IA6fx0Mef
 J8OX0vJK8F+ka3qu7Hl+W4yz28VESWksQUYY9gJzriqvGoSsWKnLQlGYNG2Ic13Cb7yq
 RR8/CndZp4rnquagfEB/Q4oM3VjwTpTRwET9AzXBo9T3QA4ImVqt0petP1648oiM6GkO
 Y0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbonmSIUEkyJiFO7NeW3CRCrv2Vq1acm+wwZOv8UXDA=;
 b=XNd/TSGVOUljcwrIX0T2RhLYETCuPjzYf7s2JcL1QMW0nC/yU6WA6Q1NShpg8oCrNS
 PZZMt9aoZ/1H6X/AVU5K1n9hiOP087BUswUOodM74Tzt/kPDrT8771fryYMi+jjCta7H
 8OVO9ezzmPemF6Mnstv2os0qCCXPcG05nh764laUPQDCMLLlc/OjgsjJf9v3iKXKVuH3
 MqjmduKVbZ1QU6YDda5lt+l+0+pJ42Q3VIybz+H/9Wcd530RIan0fhJF8G+Uhn8RnUFF
 K3/zohqganJWW1FQROy8o1JpTJZ7Mu8UBiI9v55uqA8DatKosxT7BT1jZgWXeSeoRJuj
 HEPw==
X-Gm-Message-State: AOAM531wgfrTWd7gLhpWaXvqb9SNtbCmBztR04AvEHv8m5uH31m+CDqx
 eYZqUC6/cziYeriNCRFdnAcIyg==
X-Google-Smtp-Source: ABdhPJz1iCLRqyHfrAOn/TSzZSXPXfX/xNV8BGtosBQTU8rICTgle+ZcTi9iI7ncyHGVnsxirj+dzg==
X-Received: by 2002:a17:902:c94f:b0:13f:4b5:cddd with SMTP id
 i15-20020a170902c94f00b0013f04b5cdddmr375940pla.58.1635372143049; 
 Wed, 27 Oct 2021 15:02:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b4sm952605pfl.60.2021.10.27.15.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:02:22 -0700 (PDT)
Subject: Re: [PATCH v2 21/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 2/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5125d756-1496-bd9a-cce6-83c2d63c6ce6@linaro.org>
Date: Wed, 27 Oct 2021 15:02:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> Convert 3-register operations to decodetree.
> 
> Per the Encoding of Operation Field for 3R Instruction Format'
> (Table 3.25), these instructions are not defined for the BYTE
> format. Therefore the TRANS_DF_iii_b() macro returns 'false'
> in that case, because no such instruction is decoded.
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: TRANS_DF_iii_b() uses array[4]
> ---
>   target/mips/tcg/msa.decode      |  11 ++
>   target/mips/tcg/msa_translate.c | 195 ++++++--------------------------
>   2 files changed, 48 insertions(+), 158 deletions(-)
> 
> diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
> index 7201b821ae0..f6471b92fc7 100644
> --- a/target/mips/tcg/msa.decode
> +++ b/target/mips/tcg/msa.decode
> @@ -87,10 +87,21 @@ BNZ                 010001 111 .. ..... ................    @bz
>     SRARI             011110 010 ....... ..... .....  001010  @bit
>     SRLRI             011110 011 ....... ..... .....  001010  @bit
>   
> +  DOTP_S            011110 000.. ..... ..... .....  010011  @3r
> +  DOTP_U            011110 001.. ..... ..... .....  010011  @3r
> +  DPADD_S           011110 010.. ..... ..... .....  010011  @3r
> +  DPADD_U           011110 011.. ..... ..... .....  010011  @3r
> +  DPSUB_S           011110 100.. ..... ..... .....  010011  @3r
> +  DPSUB_U           011110 101.. ..... ..... .....  010011  @3r
> +
>     SLD               011110 000 .. ..... ..... ..... 010100  @3r
>     SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
>   
>     VSHF              011110 000 .. ..... ..... ..... 010101  @3r
> +  HADD_S            011110 100.. ..... ..... .....  010101  @3r
> +  HADD_U            011110 101.. ..... ..... .....  010101  @3r
> +  HSUB_S            011110 110.. ..... ..... .....  010101  @3r
> +  HSUB_U            011110 111.. ..... ..... .....  010101  @3r
>   
>     FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
>     FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index c7ca629d684..5cc704c9ace 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -47,13 +47,11 @@ enum {
>       OPC_ADD_A_df    = (0x0 << 23) | OPC_MSA_3R_10,
>       OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
>       OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
> -    OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
>       OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
>       OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
>       OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
>       OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
>       OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
> -    OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
>       OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
>       OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
>       OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
> @@ -61,7 +59,6 @@ enum {
>       OPC_ADDS_S_df   = (0x2 << 23) | OPC_MSA_3R_10,
>       OPC_SUBSUS_U_df = (0x2 << 23) | OPC_MSA_3R_11,
>       OPC_MSUBV_df    = (0x2 << 23) | OPC_MSA_3R_12,
> -    OPC_DPADD_S_df  = (0x2 << 23) | OPC_MSA_3R_13,
>       OPC_PCKEV_df    = (0x2 << 23) | OPC_MSA_3R_14,
>       OPC_SRLR_df     = (0x2 << 23) | OPC_MSA_3R_15,
>       OPC_BCLR_df     = (0x3 << 23) | OPC_MSA_3R_0D,
> @@ -69,7 +66,6 @@ enum {
>       OPC_CLT_U_df    = (0x3 << 23) | OPC_MSA_3R_0F,
>       OPC_ADDS_U_df   = (0x3 << 23) | OPC_MSA_3R_10,
>       OPC_SUBSUU_S_df = (0x3 << 23) | OPC_MSA_3R_11,
> -    OPC_DPADD_U_df  = (0x3 << 23) | OPC_MSA_3R_13,
>       OPC_PCKOD_df    = (0x3 << 23) | OPC_MSA_3R_14,
>       OPC_BSET_df     = (0x4 << 23) | OPC_MSA_3R_0D,
>       OPC_MIN_S_df    = (0x4 << 23) | OPC_MSA_3R_0E,
> @@ -77,30 +73,24 @@ enum {
>       OPC_AVE_S_df    = (0x4 << 23) | OPC_MSA_3R_10,
>       OPC_ASUB_S_df   = (0x4 << 23) | OPC_MSA_3R_11,
>       OPC_DIV_S_df    = (0x4 << 23) | OPC_MSA_3R_12,
> -    OPC_DPSUB_S_df  = (0x4 << 23) | OPC_MSA_3R_13,
>       OPC_ILVL_df     = (0x4 << 23) | OPC_MSA_3R_14,
> -    OPC_HADD_S_df   = (0x4 << 23) | OPC_MSA_3R_15,
>       OPC_BNEG_df     = (0x5 << 23) | OPC_MSA_3R_0D,
>       OPC_MIN_U_df    = (0x5 << 23) | OPC_MSA_3R_0E,
>       OPC_CLE_U_df    = (0x5 << 23) | OPC_MSA_3R_0F,
>       OPC_AVE_U_df    = (0x5 << 23) | OPC_MSA_3R_10,
>       OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
>       OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
> -    OPC_DPSUB_U_df  = (0x5 << 23) | OPC_MSA_3R_13,
>       OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
> -    OPC_HADD_U_df   = (0x5 << 23) | OPC_MSA_3R_15,
>       OPC_BINSL_df    = (0x6 << 23) | OPC_MSA_3R_0D,
>       OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
>       OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
>       OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
>       OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
> -    OPC_HSUB_S_df   = (0x6 << 23) | OPC_MSA_3R_15,
>       OPC_BINSR_df    = (0x7 << 23) | OPC_MSA_3R_0D,
>       OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
>       OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
>       OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
>       OPC_ILVOD_df    = (0x7 << 23) | OPC_MSA_3R_14,
> -    OPC_HSUB_U_df   = (0x7 << 23) | OPC_MSA_3R_15,
>   
>       /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
>       OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
> @@ -257,6 +247,21 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
>   #define TRANS_DF_ii(NAME, trans_func, gen_func) \
>       TRANS_DF_x(ii, NAME, trans_func, gen_func)
>   
> +#define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
> +    static gen_helper_piii * const NAME##_tab[4] = { \
> +        gen_func##_h, gen_func##_w, gen_func##_d \
> +    }; \
> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
> +    { \
> +        if (a->df == DF_BYTE) { \
> +            return false; \
> +        } \
> +        if (!check_msa_enabled(ctx)) { \
> +            return true; \
> +        } \
> +        return trans_func(ctx, a, NAME##_tab[a->df - DF_HALF]); \

Either reduce the size of the array by one, or place the NULL in its proper place at the 
beginning rather than the end of the array.  I think the latter is in the end clearer.

You could just as well place the checks within trans_msa_3r:

     if (gen_msa_3r == NULL) {
         return false;
     }
     if (!check_msa_enabled(ctx)) {
         return true;
     }


r~

