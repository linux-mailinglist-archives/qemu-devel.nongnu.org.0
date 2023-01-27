Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8867ED58
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTLm-00087Y-Hh; Fri, 27 Jan 2023 13:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTLk-00087O-Hm
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:21:20 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTLi-0004Z4-Lb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:21:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c124so3852769pfb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bvxZz8l2YiRyg5YokluhMdfcgZC/yPsAE6KU1f2Ut0=;
 b=sIvcVpJ4NTlbiVutsWmwHjKQeWS0ccTf/FAvhZSJux6DiYUcppDjV5eTBPjIzgwj5i
 Ec+sWroDaMlbVf52peFcYW+NC4CYzrcKjS5F06dJ2D37plNr7sEm+tZDiv4ZBGBSqe/d
 QlBOzdSoNlj46HzqStG8ig3i55fCNvGorV61TuBuJDtyHJKNGmem+WCb5CcTC+QH7TW/
 ncXBGv4oH6wVvIarjKxZFtNip9IFePj/MupPLdXYmIaYqOGdjv5dggKoR77aYmGZ22UN
 F08nR/+2bDB1T2noemoQis7ikYAZ4XT0dEdu6TI/tEGbNJtK6aVVGF6xJ2vspqiF//G5
 HE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6bvxZz8l2YiRyg5YokluhMdfcgZC/yPsAE6KU1f2Ut0=;
 b=HnPBFsvw1PTa+VtwR5+cRNED1b5rbMXmBHAQin+WqbP2Qy43G4LfD46uYvRaXdBlnS
 2m3YwUam+3kgWJIPp9tSVRy34PVEYSPRWoIKCt9Xnmgfcopgrb8UhUVLvqbGmzQz2tBy
 DoyUN+KE4Suoyo/1EH4bnZCG0Y6oJF6k3/+FDeuA40K5cT+8ceoe1hY1wBq2V1amqH+U
 pmpzPsoXvRxmBmAYti5QBReUsBArDM6INwuCl0AKMg3KYpwck/I+7PTSCdeOTJ7ZMWoZ
 WnedbJxc4U3IFFi4UkJlwRppxAZQcGXT4gfdoLVMWiSLclaRmMhNT7lqsPEztu6B+xxi
 5p+g==
X-Gm-Message-State: AFqh2kpzV8TMizj3AOaJHUN/C1eTGOyJ0a64z1DpstgK2lGLcOgzejQF
 5oxPSrBZecWTqtFQEK80hvnkkw==
X-Google-Smtp-Source: AMrXdXuJpXN8LSomJtyyiVmLCcW6FwHAQOzgzGvKGq1Gh7s81Nml/lzLgCY9ZiV4KoedJ38PmH4LOw==
X-Received: by 2002:aa7:83c3:0:b0:58d:988b:da99 with SMTP id
 j3-20020aa783c3000000b0058d988bda99mr31893796pfn.19.1674843676885; 
 Fri, 27 Jan 2023 10:21:16 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 dc6-20020a056a0035c600b005897f5436c0sm2971483pfb.118.2023.01.27.10.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:21:16 -0800 (PST)
Message-ID: <ec567f3b-bc3e-ffc4-7d67-1231a4e9895b@linaro.org>
Date: Fri, 27 Jan 2023 08:21:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] target/tricore: Fix RRPW_DEXTR
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
 <20230127120328.2520624-4-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127120328.2520624-4-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/27/23 02:03, Bastian Koppelmann wrote:
> if we used const16 == 0 we would crash qemu with the error:
> 
> ../tcg/tcg-op.c:196: tcg_gen_shri_i32: Assertion `arg2 >= 0 && arg2 < 32' failed
> 
> This is a special case anyways as we can directly return cpu_gpr_d[r1]
> as this is the most significant word an nothing is shifted.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>   target/tricore/translate.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 6149d4f5c0..62128c6aae 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -8708,6 +8708,8 @@ static void decode_32Bit_opc(DisasContext *ctx)
>           const16 = MASK_OP_RRPW_POS(ctx->opcode);
>           if (r1 == r2) {
>               tcg_gen_rotli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], const16);
> +        } else if (const16 == 0) {
> +            tcg_gen_mov_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
>           } else {
>               temp = tcg_temp_new();
>               tcg_gen_shli_tl(temp, cpu_gpr_d[r1], const16);

While correct, this entire operation is

    tcg_gen_extract2_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], cpu_gpr_d[r1], 32 - const16);

which will take care of your two special cases as well.


r~

