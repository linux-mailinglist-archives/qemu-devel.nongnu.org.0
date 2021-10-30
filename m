Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276C440BAF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 23:18:40 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgvkN-0001X1-2G
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgviy-0000Wz-EN
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:17:12 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgviw-0005VU-Ow
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:17:12 -0400
Received: by mail-pg1-x535.google.com with SMTP id g184so13371068pgc.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4sTr2Lq5x+F801TI62Qks0jQJ+80icHM+yaBvLDpxgE=;
 b=tOYRd3sk3OXJUfqpFHTiywIjc3uYkjDDJ36A6ORdpTHIrMtX6Hdl6LmhCi+sa+Mlsb
 bISEDhw9xqVASr0hTyh/DJQy96lKdm3pXlbnD/s8zg5cxKOKgI6SgpqzK0rGK91YHV3Y
 4yX7g8cIDFjjQwyXs0bgTEOtRFPeU8GdTD0Au5p/2YDpHSaZWYdd95vE1ihQUzJ6h2MT
 xv46Oce32IE/1NJ5z2c+fahr0FpP+qI6jm3+Z1pfbWwbXwmTj5f444Q9GXZowvhIYEGF
 f7V7e3gcO1CPvkNRA8MyRwYBUzlnREgWHTX5Cz+TLDMdgv2nCpHssSPJQIRLXP3RVCn+
 plNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4sTr2Lq5x+F801TI62Qks0jQJ+80icHM+yaBvLDpxgE=;
 b=O+fyYIb67D8Tw9xoPz0AnK6FkyAUvvk4aNgYZe/9RSuaiw9+xn/22AbmU8XIzp5a70
 5h9frzsIAY9lg/em1qEItIR4SKV3NnxIfSjFHLygz3F8oUJuA9rQ+ZEbTe8jz7RFDgan
 jjoH21drAHDJQupSIOAySbPg4aGXYGUe9wdXU84w4h9kvR+AU91tZeKetMmYFxlPcAy4
 jxOYIqK17/9uuW/Rw7DIfV6k9EDelo4sU172BGErg85FPkSRMpOaDEZvvS7Taqv/Jnfe
 mTHuFHqiw40U0tf6DyYdqtxRks8aUCDpGL8R9+uITXiKA2GhcUoLxGABGuV8ptHBbNXt
 JD+w==
X-Gm-Message-State: AOAM5324pfkghtci++zixbdWdChuQ9sHWuh6IVJEW9EHcH4uBVLMiuPj
 gBT2yuNXUL8pOe5zNK+HAYxVSA==
X-Google-Smtp-Source: ABdhPJwI8tnxQQPo3weret4McdJcjBj+QTXOBjq5HnmKynJR2THyx21kh7WsKxebCYfBLW/F0nc5OQ==
X-Received: by 2002:a63:ae09:: with SMTP id q9mr14218218pgf.63.1635628628965; 
 Sat, 30 Oct 2021 14:17:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id me18sm9392628pjb.33.2021.10.30.14.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 14:17:08 -0700 (PDT)
Subject: Re: [PATCH v2 07/34] target/ppc: Implement cntlzdm
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65bd3052-fbe9-33ff-585c-b5259ebd46e0@linaro.org>
Date: Sat, 30 Oct 2021 14:17:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:23 PM, matheus.ferst@eldorado.org.br wrote:
> From: Luis Pires <luis.pires@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instruction:
> cntlzdm: Count Leading Zeros Doubleword Under Bit Mask
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Inline implementation of cntlzdm
> ---
>   target/ppc/insn32.decode                   |  1 +
>   target/ppc/translate/fixedpoint-impl.c.inc | 36 ++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 9cb9fc00b8..221cb00dd6 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -203,6 +203,7 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
>   ## Fixed-Point Logical Instructions
>   
>   CFUGED          011111 ..... ..... ..... 0011011100 -   @X
> +CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
>   
>   ### Float-Point Load Instructions
>   
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index 0d9c6e0996..c9e9ae35df 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -413,3 +413,39 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
>   #endif
>       return true;
>   }
> +
> +#if defined(TARGET_PPC64)
> +static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
> +{
> +    TCGv_i64 tmp;
> +    TCGLabel *l1;
> +
> +    tmp = tcg_temp_local_new_i64();
> +    l1 = gen_new_label();
> +
> +    tcg_gen_and_i64(tmp, src, mask);
> +    tcg_gen_clzi_i64(tmp, tmp, 64);
> +
> +    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
> +
> +    tcg_gen_subfi_i64(tmp, 64, tmp);
> +    tcg_gen_shr_i64(tmp, mask, tmp);
> +    tcg_gen_ctpop_i64(tmp, tmp);
> +
> +    gen_set_label(l1);
> +
> +    tcg_gen_mov_i64(dst, tmp);

This works, but a form without brcond would be better (due to how poorly tcg handles basic 
blocks).

How about

     tcg_gen_clzi_i64(tmp, tmp, 0);

     tcg_gen_xori_i64(tmp, tmp, 63);
     tcg_gen_shr_i64(tmp, mask, tmp);
     tcg_gen_shri_i64(tmp, tmp, 1);

     tcg_gen_ctpop_i64(dst, tmp);

The middle 3 operations perform a shift between [1-64], such that we are assured of 0 for 64.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

