Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF126964A9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvKY-00059C-DI; Tue, 14 Feb 2023 08:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvKO-000587-RO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:26:36 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvKM-0006o8-OO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:26:36 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1442977d77dso18961929fac.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fr4GFMgkj85YM3uur0lNAHIztfuXtBtONvd4DS5otzw=;
 b=cAEhJHVRK1f87fMoaYqeJufa+Gi8amR192ci17ymq26kcG8WCQej0MreflD46Xk95A
 NgWThZCAJdYUb19PjOogXrZjuziaKo8E9hCuEr7ke+jBD9gLeDtzpxXaXW714W7Y45Yd
 l8QzZfnIO0VtvDYc4krURNHoOQ3P6du3b9xGs4cm4Dvfly+xPOi9xH9nTSXHgKi4RGbW
 4yEOBWTvIdMZTUmCQB7zyrM/5GZQbblTR52EvfVKjbTGMBiBuoAfUyHRmW8QTMfuwuW5
 +5Vjks30HLF55WEx+JHGf21RB151WNISTWx+1GJ1AbpFLjWgqFTiwtqS0lzmHPS9FXF1
 z4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fr4GFMgkj85YM3uur0lNAHIztfuXtBtONvd4DS5otzw=;
 b=yEYoogiklvYMrZf/pwiY/IZFrHURYkn+LcgzG9rHq2IFHE5KlkpEsYGOYigldt8RUK
 LjAGVzQBHA9cdrxbWLRs799mwYPa9QnaK+qxUm8gzORpd8FeHDNmS4SVqj8fdTge3eLd
 4sXUiCKs7qzOeoD0UfSoZo6MkbuAzsZCOiPkFetRTXOZZky75qdc/IRz0gVjPyyPKzkQ
 yv0hJ/dcqxQlHi6k2UEisRsmYYelyR+HZxdW5sLK/ryoQ/73LY7hkMXaRJdvBk2FyL9Q
 WYUkOa34Y2f0Y9YaZMZwxN7ovrJOMhRH2nZIGqXJWBlrLPYqQLiPoJvwXBK2tmPrvhy7
 PlXA==
X-Gm-Message-State: AO0yUKUF11Bog46dV4D1+uzRqGX6Fq7vVX+ToLvkAT5EgZKQhz2nZTBs
 CSqT5Yk0kFBr+VGi3D0nvEVuLw==
X-Google-Smtp-Source: AK7set+fhObBkVpruRkUK1xboy7BE98OZgstTpeHRpWuJpddteqVhxnhXICTaMIv5hU6SYplLcKH9Q==
X-Received: by 2002:a05:6870:b627:b0:16e:1b7d:21f5 with SMTP id
 cm39-20020a056870b62700b0016e1b7d21f5mr1041536oab.25.1676381193545; 
 Tue, 14 Feb 2023 05:26:33 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 y132-20020a4a458a000000b0049fd5c02d25sm5967313ooa.12.2023.02.14.05.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:26:33 -0800 (PST)
Message-ID: <3955ed21-11b5-feba-9119-f9f1d5eb44e0@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:26:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 09/14] target/riscv: Replace check for F/D to
 Zve32f/Zve64d in trans_rvv.c.inc
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-10-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-10-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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



On 2/14/23 05:38, Weiwei Li wrote:
> Check for Zve32f/Zve64d can overlap check for F/D
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6f7ecf1a68..9b2711b94b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -41,9 +41,9 @@ static bool require_rvf(DisasContext *s)
>       switch (s->sew) {
>       case MO_16:
>       case MO_32:
> -        return has_ext(s, RVF);
> +        return s->cfg_ptr->ext_zve32f;
>       case MO_64:
> -        return has_ext(s, RVD);
> +        return s->cfg_ptr->ext_zve64d;
>       default:
>           return false;
>       }
> @@ -58,9 +58,9 @@ static bool require_scale_rvf(DisasContext *s)
>       switch (s->sew) {
>       case MO_8:
>       case MO_16:
> -        return has_ext(s, RVF);
> +        return s->cfg_ptr->ext_zve32f;
>       case MO_32:
> -        return has_ext(s, RVD);
> +        return s->cfg_ptr->ext_zve64d;
>       default:
>           return false;
>       }

