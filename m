Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A6434D4F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:18:01 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCPo-0006pP-KN
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCM8-0003VX-N8
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:14:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCM6-0005l4-Ud
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:14:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so3881740pjd.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lgFI911CtAA9atZ/7vcjBz4OY+cJmyTOdX+QsOEk6x0=;
 b=naMeXS0gPh/NnTz5VAHiIMbLsE9/H2hWP4RRbDQL526uEZLni2Tx3kByzgLBjrS6Zd
 icfCfwVWbJzsGcd1bmSwH7XWDHI8W4sYhP+Wz7W6IfdFFRMtQck0evG+fdU65JmbM+/N
 2GQYzjDS9zoEIbaCe+7FR8cCtBOhXrFlwsND1X6R7QaTkvXV6JlI/6Zw1I73CyMR8ejN
 S3w17WR1EdQ837aVdjDmDCUxV3p4ZtWq15uWX4AZK8VRBJku8NzKdLfkuF+VrMOuTlei
 7qOAOFTwjE+GqjIAsltn3v15O8wF8nJ8r75yukpYbx20ToOuXGmWD7FPY1B3IPOJ9hTQ
 4yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lgFI911CtAA9atZ/7vcjBz4OY+cJmyTOdX+QsOEk6x0=;
 b=dx6DMfeIUMGltkqrZDHsHW6Pcs/wYM/8gk9MRkBqRbBQ7qbJiIbZLE6qWO+3rK4rvz
 +uIo3p39qe1g7UoeXY/KnUbNK9FyTppG7ttpzVaxFxjFN3nMXSuhU06p2DL/pTh9mykX
 9mZ+cT6NlNmMkNYpW1jYqpUvpg8OMzuZrWFEZevGkzxeSl6gd7Aa9KFA5bvS0jcSU5TA
 CxEBvU+smRdryVMo53B+kbenS38/LUcvBUOKvm9THf0fKPQZpuAmelcQtL51QvYSALoH
 l79a0l0nCb+vWB+cLMDEUe9bimXnpMF0YL3fYLEp7sYLCpq6e+7D7nNfeyvwsYSdIoiZ
 SN5w==
X-Gm-Message-State: AOAM531G1gUSyTGImVC4H/q15vb54vrAoOaZzqJWJO9Zlqw8W0jPwFTs
 c6oGvSaRrfaa0WpWOwizTJ4maQ==
X-Google-Smtp-Source: ABdhPJwVdCV5AD4Z+u7gBpaWqE7IWOXSWL9g6blL+q7gbv361u06EloVya4kBLtsdU2l2MWf1Ms9nw==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr7754814pjk.182.1634739249296; 
 Wed, 20 Oct 2021 07:14:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m22sm2658645pfo.71.2021.10.20.07.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:14:08 -0700 (PDT)
Subject: Re: [PATCH v3 05/21] target/riscv: separation of bitwise logic and
 aritmetic helpers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-6-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <436bec93-eea7-8ce7-e7d2-8a225a49a8c3@linaro.org>
Date: Wed, 20 Oct 2021 07:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-6-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> Introduction of a gen_logic function for bitwise logic to implement
> instructions in which not propagation of information occurs between bits and
> use of this function on the bitwise instructions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c                | 27 +++++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
>   target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
>   3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 121fcd71fe..3c2e9fb790 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -382,6 +382,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>   /* Include the auto-generated decoder for 32 bit insn */
>   #include "decode-insn32.c.inc"
>   
> +static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
> +                             void (*func)(TCGv, TCGv, target_long))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
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

I think you should drop the ext argument, which is (by nature of the operations) 
universally EXT_NONE for all callers.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

