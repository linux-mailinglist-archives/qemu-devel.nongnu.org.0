Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636073F4F99
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:37:42 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDtF-0005eH-HH
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDsJ-0004t3-HM
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:36:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDsF-0000jM-6L
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:36:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so6284297pjw.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Bcm+L1Y5cJ9k0fLK7Gy7n7xu2KeH5I5vcDl7CeHO3o=;
 b=VepukPFfm8eDBF+8OYA89LSuNqxXvDPDtSqd1UkV1lgKQBmzJl62zeNWlEiPp6QcrG
 /2H/9FXSLX8OfWbHfjZvxEYU8F2Pf7g3R+Nb8V1RdGbQjVJsuK4CsHhwEHH4KGXBUBr1
 FILk7A/lJwwF34FReLWrExceEYFqF526SJgENlKt8kVcQWWb+iGWOzHEkga+zo1rBnxR
 NvfsS9ddvzs2pJqfKoCFo4bG/QYvwm9jTg3B/vNYy3Hgd8Hm5WEBDd2m0y9xP0WAB4u3
 AIUtfEBjjekVl3qH09+0XIkjUejiiYnpZAEziphaRNu6VW7bS+FcoZ7x3FKcRt2fke8p
 wIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Bcm+L1Y5cJ9k0fLK7Gy7n7xu2KeH5I5vcDl7CeHO3o=;
 b=KwIHg+wd0ixMydV9qRzfddqgCDK/9WHZ2YbIErJAF/uaAhyokT5CnaaL7nuYWNtk6o
 cQTYjMT4Rv74KLGHA+pPVL2rHo7OELUpfCZ9sYRG3KsxnjpY+BNs9d4mP7GOFO+iRJKJ
 8SHDdTqhvZOAiFsUHh0p8yxSKJxZoqd4mXdeB1FspvTsjf2mU4DNQ72oqYm9OH/jLXU6
 tkerEGWX7P6dKUYgYw/6KeJgA3Tucp6t9TsUlm/voe/vEpuFybmt80NiucQxUA/fWKjG
 DjWSMpEixLF+SD4Awg+g+egKzwyw0rMT5JsNe7DcNb3COhkZBfIeX3GG7QhhrLOqq4zD
 JlKA==
X-Gm-Message-State: AOAM531KRvFeYGX43EDXK2rgyl3ohW5j6eI21xXVrYj9iR7AIFQkIJ+X
 RwoaiMcpmaEnud1jJidmG0NArA==
X-Google-Smtp-Source: ABdhPJyC+J3JrSG0qucJQ78sBO9beMR3E9iWUZkXc8MYT/QV5KVM490O0mZanGefcNZQNVMYHyukzg==
X-Received: by 2002:a17:902:ced0:b029:12d:4ce1:ce3a with SMTP id
 d16-20020a170902ced0b029012d4ce1ce3amr29442296plg.0.1629740197394; 
 Mon, 23 Aug 2021 10:36:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o10sm18256333pgp.68.2021.08.23.10.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:36:37 -0700 (PDT)
Subject: Re: [PATCH v3 14/15] target/riscv: rewrite slli.uw implementation to
 mirror formal spec
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-15-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8aba9c79-8af4-c755-f982-52edb36f4397@linaro.org>
Date: Mon, 23 Aug 2021 10:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-15-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The slli.uw instruction is defined as
>      X(rd) = (EXTZ(X(rs)[31..0]) << shamt);
> 
> This rewrites its implementation to directly match this, allowing
> for the small optimisation of not emitting the zero-extension if
> the immediate shift is greater than 32.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
> (no changes since v1)
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index b134abd263..3419dcf1bb 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -308,17 +308,14 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>           return false;
>       }
>   
> -    TCGv source1 = tcg_temp_new();
> -    gen_get_gpr(source1, a->rs1);
> -
> +    TCGv source = tcg_temp_new();
> +    gen_get_gpr(source, a->rs1);
>       if (a->shamt < 32) {
> -        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
> -    } else {
> -        tcg_gen_shli_tl(source1, source1, a->shamt);
> +        tcg_gen_ext32u_tl(source, source);
>       }

Why?  You're replacing one operation with two, when the host supports this deposit operation.


r~


> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> +    tcg_gen_shli_tl(source, source, a->shamt);
> +    gen_set_gpr(a->rd, source);
> +    tcg_temp_free(source);
>       return true;
>   }
>   
> 


