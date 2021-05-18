Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8538771A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:07:22 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixZJ-0002Kt-Hc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lixAx-0006XP-IT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:42:11 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lixAt-0002d7-9E
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:42:11 -0400
Received: by mail-vk1-xa29.google.com with SMTP id f10so1020644vkm.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sgcsjHjPIU/FHjFOLnJPjUmRtsnAPRHzb7wxXFwGv+s=;
 b=Kgz2LgEEDxptBGVCibEC7q8d5OBQWjYiBQSPrMgS0JvK9ysFlp1UzCo44bKQrnUz6E
 1BcUcrBfqAALdVV+b2ITjvJlA+voLBFZKmkdda4M66WXz5xmbHfJLVmBHBa0Y4ijJsGi
 4QH5eLnUhVfVNBskMmSv17zmjZ21GqgP1Lgu1TPuP23zabynbJAF68kvqi1g5fT4WvBN
 8IfzAVmfDUQgOjFGQ/k+uIMq/HtVBWJmBW4K+7mGfOEs8H6It4JjcZ8cVKaeIYpbunhp
 ft/QQjIl9wKh1XWhP4if+rwoZN5XswLueKRM0KCkDJ8wb+6s7tLDMrMxMtkjlPEhcsgr
 4A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sgcsjHjPIU/FHjFOLnJPjUmRtsnAPRHzb7wxXFwGv+s=;
 b=KPGT1fkYeH/wVKbHQdSAcCz2xMpgZma02njeTozFFI+KJOGRyjXV0COOn09E4ZZ8aE
 +rfRXniLFMhVKS1iH1k7nZu/uXZA1TeQJEfAq+zzPEs6iDmccnXkqkVVQrfJpKIO8hug
 fY5YxdUXzN2J8Av4L143JdSHzUfJQuacPwWv1b/zL5SSvm2Setm+Bz299TNy0j5REBXL
 JmRkHb18iD3l4LZz+fNZsGJxHZbzfj1KppQfQP5O40U1lYObIeVp6biG86BIF5pqgarB
 MvZ1jsEnlFnZ4K0XqxOFF03sVRZGShEwpiC9EXy4yRmG+vrR54vcDoUbgvw9Q8r/aufE
 ANWQ==
X-Gm-Message-State: AOAM53165yKwSG7STeHZ1OsKBhjeQ2iL0k11ZR619Plz6ulIWE1PUQaG
 G/0OXAMTyK3rzw0U/cWtxzE02Q==
X-Google-Smtp-Source: ABdhPJyeyfNg7DczvqAwsQBVNnxpKIBy0XFmtcNxzhcjQGRWGGQFrBSwtaLaGejVC2MRePGKtjtHiA==
X-Received: by 2002:a1f:dbc7:: with SMTP id s190mr4920672vkg.12.1621334525914; 
 Tue, 18 May 2021 03:42:05 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id s136sm2708853vke.49.2021.05.18.03.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:42:05 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Fix load endianness for lxvwsx/lxvdsx
To: Giuseppe Musacchio <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20210518092352.43610-1-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <422fa6b4-8d59-5028-4fd0-4484ed7bb3b8@linaro.org>
Date: Tue, 18 May 2021 05:42:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518092352.43610-1-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa29.google.com
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
Cc: qemu-ppc@nongnu.org, pc@us.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 4:23 AM, Giuseppe Musacchio wrote:
> TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
> runtime-configurable parameter.
> 
> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>   target/ppc/translate/vsx-impl.c.inc | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index b817d31260..3e840e756f 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -139,7 +139,11 @@ static void gen_lxvwsx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>   
>       data = tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
> +    if (ctx->le_mode) {
> +        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_LEUL);
> +    } else {
> +        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_BEUL);
> +    }

Reducing this replication is why we have default_tcg_memop_mask.

This should be ctx->default_tcg_memop_mask | MO_UL.

>       tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
>   
>       tcg_temp_free(EA);
> @@ -162,7 +166,11 @@ static void gen_lxvdsx(DisasContext *ctx)
>       gen_addr_reg_index(ctx, EA);
>   
>       data = tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> +    if (ctx->le_mode) {
> +        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
> +    } else {
> +        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_BEQ);
> +    }

Similarly ... | MO_Q.


r~

