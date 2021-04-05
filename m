Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB8354367
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:25:56 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTR6x-0006ci-LB
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQsI-0001an-6G
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 11:10:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQsC-0006B8-JT
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 11:10:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so8450322pjb.1
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aoyuRnC3J6Loe7plIzdzcbzFllgKIVLP0JeaBRIPaGQ=;
 b=wOKhmhRof0aA2QWcjenn6EVDyoJxBZlhSHcrdZUMUlxUjjJhdkBX9msnZWK0bi+Hf6
 7BlWc0mH11sGVXaeQ0JlxJc/oIFcx8CVGi8nBnurm9mJ5ISjrmSC4P6pNlh1aLpSAMjt
 j6ZzalOKs9Z1TEQDT4VM8AdBDyRQE/Y7CxLgEfbgiAkYpM0tO+YwaOzio45n66wd2ZXx
 4Ehdlv+RSG6P5xSbSuksUQSOr2zPv2so/hrN7MR6Y3TPSm3WKRz81rWa7QhhlmcKMDZ7
 HsJ1Op+43MpphDztlwjqLcF11/IEImg20UiRl/MhYjzxzvbs05VsLPKdFE5c+1r2hVJW
 u55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aoyuRnC3J6Loe7plIzdzcbzFllgKIVLP0JeaBRIPaGQ=;
 b=ELe51u6ysXDgMs/Ri8sigS/nzScNHPPaBXPNvtl3YlZsOud4eeYRoWUIyJM/5koE87
 g1lZrBqEzrVUJtaE4YtDC2ouxdlJtTx4vKB+GTLPdQnES9Xwvs6KyoBcJL/OZ5qmcS38
 1qpIG+kGcltcGqjdrfqysC/82Tk3Fu360xzmGxvBPcMSKGUjK2R+Dp5jw+PiX9tuARpD
 ElTJTUFXVtr4wbr8wKLe15hjj4LCfptKKCcuI6uJm0OtmgsD9jVI37ugJPLs6NBY0fta
 XWZMRF83dxYLRI++k89IbFki42LDvPh8nfC1do6cqg/1FLV90GDvte1lUoU92mof2mdQ
 UpAQ==
X-Gm-Message-State: AOAM530fqwFb/I8EcizIHDoizPp0+DmvT7dj/3ludEmtnqPCFsUHHeN6
 Rd0nbgmsMwKvy+k/1+VdOj/fnA==
X-Google-Smtp-Source: ABdhPJzJXUAFDTNQcqFawvAbKVqtZMrfPTSehHaFqja7drImNk0yfvz8PMIGy1JB84SChibRterV6g==
X-Received: by 2002:a17:90b:1044:: with SMTP id
 gq4mr26732951pjb.232.1617635438959; 
 Mon, 05 Apr 2021 08:10:38 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id i14sm16556133pjh.17.2021.04.05.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 08:10:38 -0700 (PDT)
Subject: Re: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
Date: Mon, 5 Apr 2021 08:10:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:02 PM, Alistair Francis wrote:
> @@ -369,6 +369,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +
>       if (ctx->mstatus_fs == MSTATUS_FS) {
>           return;
>       }
> @@ -377,12 +380,24 @@ static void mark_fs_dirty(DisasContext *ctx)
>   
>       tmp = tcg_temp_new();
>       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
> +    if (riscv_cpu_is_32bit(env)) {

This is less than ideal, and will be incorrect long term.
You should check ctx->misa instead.

Eventually you'll need to change riscv_tr_init_disas_context to not just copy 
ctx->misa from env.  At present we flush all translation blocks when misa 
changes, which works.  But you won't want to do that when the hypervisor is 
64-bit and the guest is 32-bit.

Anyway, I think it would be a good idea to create a helper local to translate, 
akin to has_ext().

> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS32_SD);
> +    } else {
> +#if defined(TARGET_RISCV64)
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS64_SD);
> +#endif

The ifdefs are ugly.  I presume there's some sort of compiler warning here? 
Does it go away if you cast to target_ulong?

How about

     target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);


r~

