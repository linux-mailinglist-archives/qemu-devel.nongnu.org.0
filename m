Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04C6CED03
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:34:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXnn-0003DF-GP; Wed, 29 Mar 2023 11:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXnc-0003Bq-Az
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:33:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXna-0000XU-Ir
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:33:20 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so18919689pjb.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680103997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMpJPGAxLH7XLs+6DxbdFZiyQjIWCrh8BvF/TV6ez4o=;
 b=XAW3BJYytNI7yYcLuzch2eSKapW38GqUyF7oMvT7cMXBfBa5paoqFodQyJpgk2LndY
 K3xukT1MIc3K5NhFdYnuS04VX7fT1fmdb740Fo+RE2yiQCkq2+7gUWKjacxK37+Dh01u
 hv6I1Bco3ci0vTpGpT7VVNVNC6/TG4D7rYiOoQjYuOz86btZy1G0L3k370EuvT1S6w1W
 c6t3rfIZcYb8F1s85DJaYO1Oz+pIPqvL7ctoDlekE2USw65CkliL3GC0OGqfjijRTwx1
 HXpfa6eqZEtTnvWDu6s9LAk33aqKyqACBOE9OUWqN48iayWYfq9E0FP99PVARv3RBF63
 BeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMpJPGAxLH7XLs+6DxbdFZiyQjIWCrh8BvF/TV6ez4o=;
 b=t+bxob4+17MOtuX1/ORpDUXlrq3AS/jCEZeheNlKnrE5N6vR2m4B5oH8rer7/1p4/x
 I45ZA6piO3zp1PexRqeEyIfHWkj1+jnAotKqln34B46a+KbNY/iAG83tvyrhnSoPKmGd
 vwJeH6LuFvpUudG7NHDYZ04z4/odRX2GKdwIX2rrCm2y5amekhWqp9l7pXqHUNR5Cbkg
 l2UM9mXwneys6qspx/Al6Wycy8+dngaGxbZpZgZzOxteM8DNIYtr1PKdw0ob7uRthwC6
 F/AVBmIj/H/kMGzinhKUry9EaGefQj46AjzvFlbCazCYAunypTnENOypziPPPd+5dkb8
 KoQQ==
X-Gm-Message-State: AO0yUKWxHZAp8IkWm9uwEVODyCenSNen4t21cGGCvUVrPpJJocAvlXMe
 5hIWa+0JRO16Eo8FhsKdfPvPjA==
X-Google-Smtp-Source: AK7set9kUJOxYxtIPTO0PaHr5HGNTpLtxwzui3FPMuc6kpPM3+4xUyi9RIcYvnIUL41NTvT08QqHuA==
X-Received: by 2002:a05:6a20:1a9c:b0:d8:a2ee:6b60 with SMTP id
 ci28-20020a056a201a9c00b000d8a2ee6b60mr17214158pzb.42.1680103997022; 
 Wed, 29 Mar 2023 08:33:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a65640c000000b0050aeaf9f25csm21896676pgv.27.2023.03.29.08.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:33:16 -0700 (PDT)
Message-ID: <092397fd-3b97-b866-6c72-aab132422f2f@linaro.org>
Date: Wed, 29 Mar 2023 08:33:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/5] target/riscv: Sync cpu_pc before update badaddr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329032346.55185-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/28/23 20:23, Weiwei Li wrote:
> We should sync cpu_pc before storing it into badaddr when mis-aligned
> exception is triggered.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 1 +
>   target/riscv/translate.c                | 1 +
>   2 files changed, 2 insertions(+)

Yes, badaddr should get the invalid pc, but surely epc should contain the pc of the branch 
instruction causing the fault.  I thought that was the primary reason to handle this 
exception here, rather than at the start of the translation loop.


r~

> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 4ad54e8a49..05d8b5d57f 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -171,6 +171,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   
>       if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>           /* misaligned */
> +        gen_set_pc_imm(ctx, ctx->base.pc_next + a->imm);
>           gen_exception_inst_addr_mis(ctx);
>       } else {
>           gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..f7ddf4c50d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -551,6 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>       next_pc = ctx->base.pc_next + imm;
>       if (!has_ext(ctx, RVC)) {
>           if ((next_pc & 0x3) != 0) {
> +            gen_set_pc_imm(ctx, next_pc);
>               gen_exception_inst_addr_mis(ctx);
>               return;
>           }


