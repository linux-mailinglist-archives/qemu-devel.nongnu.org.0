Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00433AF725
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:01:32 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvR2x-00072q-5S
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvR1I-0006FX-DS
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:59:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvR1G-0001H8-R5
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:59:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id h11so3674446wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rE0bNt1Pl9mXAU87UMw8759V7QmU0mGgv6X2jNEvTLE=;
 b=pudGb0DEPRuFruRObMHQQIdMZjDctJ0KPwv1cD+QPvodK6oPvpPUM4iITvHRHhMBGA
 7D8mwm2021LsWlpZnVNSFWkKtpmb04OxzQh5qglr5ZYSPdtMVwoCK68v8dfxxZTsqejj
 RP03pzjtUnXtfSrIEYDYSg2VY/9H7Ui8JOloS8JO60TTz9kjitByzV9wYKc1IsChz5yl
 lanRDaDcKXMOG0/U43w2isN4l+Zu4lmDbzUj/0J9JUmnaA5KT/eJRHwtBGeBYWEmYhvQ
 DX/pwwK16e5wW9CeqV2BOTIy4xgBGlviBxsGldRPl6++nof50iFM/d7/+4ZCVxHQjKxa
 CoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rE0bNt1Pl9mXAU87UMw8759V7QmU0mGgv6X2jNEvTLE=;
 b=i+q6i390elOXSMd2kG/O58vKmrfguWv4dWFhr2zUvL8iL0IFmYNcF23AVpLUEN5/e/
 lN3y60vQJ0AVsUTQdcjYSYqHnovrAvI/3dfMHAd57xsx4Gi2SzqXpNc/1w577gkQu6sw
 dq+FmO5uctzdxjYTfpRpg6CsiOypoUoYm03QeDIP7KQ5EW1CBY8SsNoeoAmzXwAwvkBV
 OYEQ7OCoE3QOD6wlYBw/pyazgQoNoEGjpz5RKhRCDHbOl/8fHuZQ4qJokqVXT+62L0iY
 F24whzCRng1eX8XxN0qs2LYer/9SS7Jb2VRMj0ObPuq/VLEvGEpdbTX65tzL28sRA+iP
 4o5w==
X-Gm-Message-State: AOAM530lJqtiM6N3jyvxHeCDeyntBa2jC3VyA/ZDm4AWDzUyWmfTyCcP
 jnhdGs+jKsYJtJlCsFRGFSM=
X-Google-Smtp-Source: ABdhPJxMF9u5TQU5LQVLy5P5/54iXycr7U21oieQj3EYTbWRP+rIgS6KuCQNNZc4Qpf7AjsVpS1Nvg==
X-Received: by 2002:a05:6000:1047:: with SMTP id
 c7mr392800wrx.305.1624309185316; 
 Mon, 21 Jun 2021 13:59:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k42sm232805wms.0.2021.06.21.13.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 13:59:44 -0700 (PDT)
Subject: Re: [PATCH 25/28] target/mips: Fix gen_mxu_s32ldd_s32lddr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca6018d0-b711-8b30-a9ca-a4daad180d59@amsat.org>
Date: Mon, 21 Jun 2021 22:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Craig

On 6/14/21 10:37 AM, Richard Henderson wrote:
> There were two bugs here: (1) the required endianness was
> not present in the MemOp, and (2) we were not providing a
> zero-extended input to the bswap as semantics required.
> 
> The best fix is to fold the bswap into the memory operation,
> producing the desired result directly.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/mxu_translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
> index c12cf78df7..f4356432c7 100644
> --- a/target/mips/tcg/mxu_translate.c
> +++ b/target/mips/tcg/mxu_translate.c
> @@ -857,12 +857,8 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
>          tcg_gen_ori_tl(t1, t1, 0xFFFFF000);
>      }
>      tcg_gen_add_tl(t1, t0, t1);
> -    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_SL);
> +    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
>  
> -    if (sel == 1) {
> -        /* S32LDDR */
> -        tcg_gen_bswap32_tl(t1, t1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
> -    }
>      gen_store_mxu_gpr(t1, XRa);
>  
>      tcg_temp_free(t0);
> 

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

