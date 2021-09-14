Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85840A31B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 04:11:57 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPxvP-0002Lg-Rk
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 22:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPxtu-0001Y7-Ca
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 22:10:22 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPxts-00088B-Op
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 22:10:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so11214209pgm.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 19:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYnZSzjGFGyK8SOrift+Pf/czImA6O4Wa2+UpG9XAkY=;
 b=jo+LXLa6GJQmBU+QMj9uj5rJO5dA7NyKAtW0sr/u8nUKE1YKnJZUVwwJUBLijAoKmE
 o+s3mRuXuFtRTaAN8JwaxS+3NPdAwR3T4cQtsqobQL30Ux6Z62+cdNKuCJ9DJbHdXsqy
 ehqgj0jRKnK+vvoosli+ZNCcTxrzG2IjDTENTvZREfA6P4qAmZKjp4+DF7AKpsZKgy2T
 /QluWDd75BRhD9JmqL0JJ/pZLY0o3kIhWGMsgA1e+xSVQ+OeH/XzLEv7UMoUH+3qeeQk
 O1fDa1u6uHIzl1qjBq2QqtmTZ0Qkh09QUwGpKSbxSKSksU0oDkml306/SK+tg+7fr8NJ
 Algg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYnZSzjGFGyK8SOrift+Pf/czImA6O4Wa2+UpG9XAkY=;
 b=q8MphxSv2TAg4m3f6IL8GpqoCHblLla6jP4Pod4VeRlK3THBbaS/J20CqPE4oCDGkj
 CU1iUWyfGF3jGdERuqZa+ZGEOnjmToleaNF4/vVgP0HuR7zAhFzJiR/fqLNsrcK8iHrF
 bYH9bqw9e6JogOBWqz+JNsJeiKwOYJH1wyhbeY2bz4UZzYDsnioSAPdVgY6LwOuwbqRC
 /KQU37Fv9exKwbGqR/EPcVs34jg2GdqgBWRjsizgL0mlPp9kuBhwv17areXPFyyQj0KG
 nC6oUrFzf6tIvGr+BT/KJRPnuxRNNjZd5UOg65nOsTOOXvq0OTyQzL+fBAv/wPMtDlCl
 vclA==
X-Gm-Message-State: AOAM532F5V33AcENSHi9OfDq4XVibawYaDXUmJaGSNe4BLF7QSHsRw+s
 +3h53OlZxv4xZccv9Pl5x9F1dw==
X-Google-Smtp-Source: ABdhPJwExXrUDsl/0RTXtsUK3Cw208jxidv+wQ47aSpEbIX6TjHLe02Fccpr+pnILVuQfxZfG2mGtg==
X-Received: by 2002:a63:3305:: with SMTP id z5mr13512464pgz.290.1631585418955; 
 Mon, 13 Sep 2021 19:10:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e11sm2318545pfv.201.2021.09.13.19.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 19:10:18 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Force to set mstatus_hs.[SD|FS] bits in
 mark_fs_dirty()
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210914013732.881754-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7b4ea83-ddef-d70c-99e3-3c9afff2afb2@linaro.org>
Date: Mon, 13 Sep 2021 19:10:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914013732.881754-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: Vincent Chen <vincent.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 6:37 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> Modifying the floating-point state when V=1 causes both fields to
> be set to 3 (Dirty).
> 
> However, it's possible that HS-level sstatus.FS is Clean and VS-level
> vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> We can't early return for this case because we still need to set
> sstatus.FS to Dirty according to spec.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> Tested-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>   target/riscv/translate.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e356fc6c46c..0096b098738 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -280,26 +280,27 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
> -    target_ulong sd;
> +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +
> +    if (ctx->virt_enabled) {
> +        tmp = tcg_temp_new();
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_temp_free(tmp);
> +    }
>   
>       if (ctx->mstatus_fs == MSTATUS_FS) {
>           return;
>       }

You should introduce a ctx->mstatus_hs field to track the code that you moved.  Otherwise 
you'll be setting this dirty bit for every fp insn.


r~

