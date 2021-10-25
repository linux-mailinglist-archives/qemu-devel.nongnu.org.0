Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62524439F02
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:10:52 +0200 (CEST)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5Mx-0002WV-Bj
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5KV-0000o5-C1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:08:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5KT-000715-JR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:08:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id np13so9020516pjb.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzVvPDSjO0tWUJf3zgSIG0T25/fXkT07nkJW6Y7xnPg=;
 b=dMmMIXK6AWSd+aHxQSSDFzH3Op6c7Hj/2fT1liTim+oGw9z/19CG0A6Ai/aJ9M645O
 HgvZtnnE8KPhY1P5rFVGllshjsAEO/R9whzqRVGiCQ36wXN9GJuxlwy+5ZLsb4wOcKN7
 UJHSkupYYd/JKTTkewbZoCWGCFrTOU+VGyY3DjMeiWjed9F/F3ve7Txn8ypYFbUgkXY8
 YXlfGid9uMPOJM9nBdOfXV5zOmyk8QPcaN6neoiUL4vAFzZPFGC+RIOLmCeSc0cSfn+V
 UXr+TYOjflZ50oqAFL1IcbX5IW3sXfQ4d5VnfBN1d2SlrkRyfA5sG4aAu4w2VMJ1yLYC
 i2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzVvPDSjO0tWUJf3zgSIG0T25/fXkT07nkJW6Y7xnPg=;
 b=T6S3vXacmOflDF2fuqcGTcCCVQZgAOI8oziq1qZyw3sMBgrrjaeS1FWZUGPoDCCRFp
 ELIq6jJtA8q5JY/3oGboGvfPqDz5rRvcoYYsoaxZjg2ns6Tnb1trDV6lYNjS+smAmaQU
 SAOdBhu/pc7jbJzFtWm0clYKCOWjPFkO/BofbN+YxDDDZkY4yqVElhvBq+8XgbZPeT3Q
 epH7F6QqOLWLdBFqz2pZlpt6ltcmusRC6AKvtffDWF1cwNcHQjmXzgwhu1t/3KcoTtrx
 tmX0bxeT1NvzHNZfRAHL88L8Kj4UUWgiIliqGSVgQz+VaGYikwc+WbdIfRwasjLBGqul
 X82w==
X-Gm-Message-State: AOAM531O4HC8pgv577lzVXqMnYN3qsv9ARclpyeWZ13Yq6Nt7g1rjM5I
 EYYT+b3lWPeavOU/Esau4M0v0Q==
X-Google-Smtp-Source: ABdhPJy52mErFRvbM2ZBLblSMVXEvbP9jmfC/9b+iAnQpymjpNRugWJ9WZbAWqgPBbFLuv55/7NpZw==
X-Received: by 2002:a17:902:f687:b0:140:4098:1e12 with SMTP id
 l7-20020a170902f68700b0014040981e12mr12031701plg.81.1635188895933; 
 Mon, 25 Oct 2021 12:08:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe7sm16478027pjb.1.2021.10.25.12.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:08:15 -0700 (PDT)
Subject: Re: [PATCH v4 04/17] target/riscv: separation of bitwise logic and
 aritmetic helpers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d037dd9f-8410-8e0f-7547-f00c5b0ac6e0@linaro.org>
Date: Mon, 25 Oct 2021 12:08:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> Introduction of a gen_logic function for bitwise logic to implement
> instructions in which not propagation of information occurs between bits and
> use of this function on the bitwise instructions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c                | 27 +++++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
>   target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
>   3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e10c8769b3..5c7971b189 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -376,6 +376,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>   /* Include the auto-generated decoder for 32 bit insn */
>   #include "decode-insn32.c.inc"
>   
> +static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
> +                             void (*func)(TCGv, TCGv, target_long))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    func(dest, src1, a->imm);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                      void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv src2 = get_gpr(ctx, a->rs2, ext);
> +
> +    func(dest, src1, src2);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

I had asked for you to remove the DisasExtend argument, and you only did one of the two 
functions.

r~

