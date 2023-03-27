Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9046CA576
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:20:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmlw-0007cu-U2; Mon, 27 Mar 2023 09:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmlc-0007U0-HJ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:20:11 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmla-0007Af-Eq
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:20:07 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-177b78067ffso9206644fac.7
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679923205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q0pDKGjdBGRtTCUrOmH9VQRk3mlQOdIhN1gsJT52R0E=;
 b=QB+qvTWThaUYdl4aJJZV4ClNnj1ZPPewOA7nh8q2qPV3d0wynr0mU599P9UyyPJgx5
 FnQllnRa7zyyau4rMu8G9VgZOhpg9ez0Ap4UvdpMg9OO3QLsyVe5/+zl1mPx0/MmyK02
 07wEnTYuu3KvEqXIcPN1ZDsxLNoPGmLnmZqoRPA3auZw9FaDuC9WHpLOvuPcQq75xBEo
 ME5ESJSbAEiCOnENSP/xK4OuXBbCc2X9ybQ8PfV+5HxPJphYvUSepJuxibJAsQ9bDdln
 0zLEjD0mXcWwn42ytiEMEi1/L9dC+snk9eyFd8J5KW5txO8cF+RXDGiSLAxLAEScl6cp
 Ox1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0pDKGjdBGRtTCUrOmH9VQRk3mlQOdIhN1gsJT52R0E=;
 b=PPhDxe4QxYg/cj5JOsNiuvIifndRSqkzraK71nLLbZdMx57lJlMTt+71WKRfaB7YGs
 dDFLn7THD3y+25DyHhi29gEEXX/pPf+HrubD4FT1bIdfNI5dMtNJHTy7jKLJq9kJoiF/
 F+oglBT/uZ1ghsJEPKtiXYZGZ9qFVAgS7oEgefnu6T7DPPaDllP0kQfULNAtpdvifn3n
 m1aKIunoexzUQwHF6Ok205o8SW3vPDyZHb0UlOsKATD/HSFWJ9wBA9fhF6gzQm5oDo7k
 X7jZY00OHS1SYfysIalhhvTqH6Bmzm2ZEDxJs3Ig9onObYktRPisVssssA1t1112dCiI
 PB4A==
X-Gm-Message-State: AAQBX9cmEPassOjNO5aVYwcoOcLIX3O5qQ85jI6MxQ76U7p4S3pQtCEp
 qelepFLC22KDbx8Em3eg15/Z1g==
X-Google-Smtp-Source: AKy350a7W6ydBr8BVCrSWDYga0fKNG3kK798wXrP5EsvU8KWyhKpOhDp8OFrCHFWG3A0O7hBculzXg==
X-Received: by 2002:a05:6870:d628:b0:177:a97c:ecde with SMTP id
 a40-20020a056870d62800b00177a97cecdemr8186077oaq.22.1679923205149; 
 Mon, 27 Mar 2023 06:20:05 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a9d67d0000000b006884c42a38asm1846478otn.41.2023.03.27.06.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:20:04 -0700 (PDT)
Message-ID: <06d2571e-6a21-7a7d-d836-9bc1b975e4dc@ventanamicro.com>
Date: Mon, 27 Mar 2023 10:20:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] target/riscv: Use sign-extended data address when xl
 = 32
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 3/27/23 07:00, Weiwei Li wrote:
> Currently, the pc use signed-extend(in gen_set_pc*) when xl = 32. And
> data address should use the same memory address space with it when
> xl = 32. So we should change their address calculation to use sign-extended
> address when xl = 32.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index bf0e2d318e..c48cb19389 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -570,7 +570,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>       tcg_gen_addi_tl(addr, src1, imm);
>   
>       if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +        tcg_gen_ext32s_tl(addr, addr);
>       }
>   
>       if (ctx->pm_mask_enabled) {
> @@ -592,7 +592,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>       tcg_gen_add_tl(addr, src1, offs);
>   
>       if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +        tcg_gen_ext32s_tl(addr, addr);
>       }
>   
>       if (ctx->pm_mask_enabled) {

