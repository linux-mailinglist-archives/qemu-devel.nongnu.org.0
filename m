Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063242FF06
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 01:51:01 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbWyZ-0006q1-T3
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 19:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWwv-0005yz-DG
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:49:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWwt-0002W5-MW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:49:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so8403307pjb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UJS91PycOFtH3sAodWkd2qZDaPDohi702vSuFUGeV98=;
 b=aTmg6s0ShYaij+GA7/U1HgXTu0ZGwsBaA7COY7kLLQqYKZ31PC1nblA0CeBHPnUhhC
 r6MfLmddGIyzEHUp7uWkWCK1DPYJdCmfel80xJlqRDIzUSnPEBFdiMk+3MegeVUkETAr
 4FBHijoH1yDudY2NBCqbjsybJlolgZGQI8BzqAYAuiOfactDaaRgQBiI9asmJ112QeXl
 XJ2knfv5FYUnKQS2hsrmbhabLDVN6swozCL1uVkMIc8h9AiU6Te+9jfBQl/zfOiGRta6
 ksZjTR7oy6FSXcTiFIWlhBn2oOs6B/xpSuJmGqRx2S63QRogBK6eCI1qtgaMPfKoKnZc
 yHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UJS91PycOFtH3sAodWkd2qZDaPDohi702vSuFUGeV98=;
 b=Nut2TrADZpWoUfSG14/ap9vZo650J1+fegqmyiNuKPud1Fsm2V4KBjJypY6D+hPVbi
 QRK6WQHsVEZido5+dx0F+IvfmlxGoBCmx9lrMUhBYjECg/FsoATnwTLr2R8CQA/kp3OG
 5bzo7hKi0g2a2L1k/O4d9GvOItkQ95L43kN7zJfeKS10XOa7mSeNnifWhBB3SnYQvant
 iSEQ07RDG7q5cxW+4u49MWQCG0xtSeZTnzQ7lJ3VEzfvroykHqqdSX9ppLQc0bURa5wn
 jFh0jRL+KMGLM2u9KCj0KYAEGjEOtvzQXwilNHQRl+YN7nK9kg4x54YnIuZ8aHoeVgpk
 S+1Q==
X-Gm-Message-State: AOAM53085orPhCaod5Lt1WJMs269dVVnvhZFZ4ZgzBNL3T/Af0kOkfrX
 YGDY+n0R09Wst/z9Xxaa3VzfQA==
X-Google-Smtp-Source: ABdhPJzoj67xhyPQYbwEcnOo548XmgvsqEsej6Ws/N3IUiVfQlgTJKLMX/f3Rp9RR/CuCf2wXPOHug==
X-Received: by 2002:a17:90b:38c6:: with SMTP id
 nn6mr7538686pjb.246.1634341754030; 
 Fri, 15 Oct 2021 16:49:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v12sm5991952pjs.0.2021.10.15.16.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:49:13 -0700 (PDT)
Subject: Re: [PATCH v13 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-6-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <046b0cc0-2911-87b7-ccae-0819250dc909@linaro.org>
Date: Fri, 15 Oct 2021 16:49:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-6-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:29 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>   target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>   target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>   target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>   target/riscv/translate.c                | 10 ++++++++++
>   5 files changed, 19 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 6ea07d89b0..5bdc412191 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       if (a->rl) {
>           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>       }
> +    gen_pm_adjust_address(ctx, &src1, src1);
...
> +/*
> + * Temp stub: generates address adjustment for PointerMasking
> + */
> +static void gen_pm_adjust_address(DisasContext *s,
> +                                  TCGv         *dst,
> +                                  TCGv          src)
> +{
> +    tcg_gen_mov_tl(*dst, src);
> +}

I mentioned before that you would not be able to do this.
You are writing to the live cpu register, even if in this case it's a nop.

You could, for example, make the stub be

     *dst = src;

but that begs the question of why not use the return value, and have the stub be

     return src;


r~

