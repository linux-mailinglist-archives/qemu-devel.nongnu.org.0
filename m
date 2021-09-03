Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B584000BB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:47:16 +0200 (CEST)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9XH-0001s1-Sb
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9VO-00089k-A9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:45:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9VK-0005Bv-NX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:45:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3606836wms.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2qzR5wOI35QIUMcofMXwl90vJir+rkawgpErksBD3Yg=;
 b=r6hNfvCkWWuAEw4OsndebHb0i3+K/Gl1oeL5vNm5KLZtODJKnfP1Ex3nqRlcEzI2w1
 agfFkxsMuT3dWZPI8zjU18fY5CrltQn30gaaLzabccDRsnDjr5dV0xyxLbDXmZv+U76D
 ne43wbsGqWeclsIjGAS+ZSwcJo5jJNjwxO6i1+TRjhLdBGKC4e1QF/V2FVaO4HU/657j
 t8y0Z7WuuX1nGACtmnqdeC7Yp1Zdyt50qbC931lXEVlTgQD11xvRTbZzxtAwiE+HSfxO
 fxD4ERzrqJ+j51QTwGYUKIf5aQFepTMAHoP2JKDbtQJBqsMdqejGkW9XDYw7P3ILrGru
 V49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qzR5wOI35QIUMcofMXwl90vJir+rkawgpErksBD3Yg=;
 b=nvk/BxqOgKTvvSJqpAJAgKewztdNNIX/T9zkjGx6uzi0T2ddJNQBSUfsEHkmBi8ukR
 kLwQ0TYtDphUlVclVk8JDFQwn0guescIjg1vP3TrpO/73lTXMj3qZRxOMESZbzYiiego
 JVfhap53evL9TtS3XJg+kPhQkttmKNKu8M81lf8SKYN/g8irkDUPyiJL25hfEeAkK3uy
 7cE+sfQQK9J06OKs4x23cakF4BsZ86E6KgMh7Ln9ntR4VYmfMIf65Ff51mxNGfs/TYE9
 3lSIkaXw0bNnZ9RD91V4p71M4CZqNbfQpQd2Op7hXquTPxiAt2q8yhIvsaOhf4nU3LhL
 pszw==
X-Gm-Message-State: AOAM531rv8IzT2P83F0k6UkM+mjez0yFindHGfNGg4zdVzTeJqhuYaFr
 B5pRbSgYRKchx48feqjhZi1xFQ==
X-Google-Smtp-Source: ABdhPJxUHYpIK35NesyHCePiHmFXwu84E5eH5MTzcbxLRZKWHmYR7kZr5qPonbR7coSSpL8lNtfqRw==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr500456wmj.48.1630676713180;
 Fri, 03 Sep 2021 06:45:13 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id m4sm4464136wml.28.2021.09.03.06.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:45:12 -0700 (PDT)
Subject: Re: [PATCH v8 03/14] target/riscv: slli.uw is only a valid encoding
 if shamt first in 64 bits
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
 <20210903131417.2248471-4-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa8769a3-fea7-6ff9-a0ad-5f9d656bece0@linaro.org>
Date: Fri, 3 Sep 2021 15:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903131417.2248471-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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

On 9/3/21 3:14 PM, Philipp Tomsich wrote:
> For RV64, the shamt field in slli.uw is 6 bits wide. While the encoding
> space currently reserves a wider shamt-field (for use is a future RV128
> ISA), setting the additional bit to 1 will not map to slli.uw for RV64
> and needs to be treated as an illegal instruction.
> 
> Note that this encoding being reserved for a future RV128 does not imply
> that no other instructions for RV64-only could be added in this encoding
> space in the future.
> 
> As the implementation is separate from the gen_shifti helpers, we keep
> it that way and add the check for the shamt-width here.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Instead of defining a new decoding format, we treat slli.uw as if it
>    had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
>    and check for validity of the encoding in C code.
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 3cdd70a2b9..dcc7b6893d 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -430,6 +430,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>       REQUIRE_64BIT(ctx);
>       REQUIRE_ZBA(ctx);
>   
> +    /*
> +     * The shamt field is only 6 bits for RV64 (with the 7th bit
> +     * remaining reserved for RV128).  If the reserved bit is set
> +     * on RV64, the encoding is illegal.
> +     */
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }

So, now you need to rebase on qemu master, where the code you are patching does not exist, 
and has been properly fixed by using gen_shift_imm_fn.


r~

