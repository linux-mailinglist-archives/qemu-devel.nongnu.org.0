Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A54C5E6F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 20:39:08 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOPNq-00050i-Gl
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 14:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPL0-0003m1-Vz
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:36:11 -0500
Received: from [2607:f8b0:4864:20::52c] (port=43556
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPKx-0001Mp-AJ
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:36:10 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 27so9622695pgk.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 11:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EsD/IuSW4XKuYRH8oY0OuvmjS4XvDLzJx0BEIFPpsAA=;
 b=yTtQ1CTi/MahLMwx86o7BZcFzemH7EHNJ1OQZiDE9PYPADPiA4XOOJWsfvP5imM9O4
 IuUscxx8K3DfeDflOJ+jTpwe4moRW0bC2sDUgJ3leGGHksauD0qSvDDg1AB7nVMia2OZ
 h/kjRouKWODkwwH5Pgxjh8mm/lrQVCyFXDTNOw8EjpZE4YV7MIU9nLuV/zdE/lhsvCVq
 ZFafyn1C0CdgPB36Z5hoc1yJ+ya7PZdY8Vl6W5pmR2ZqQrfkobf2W/nkoLPNBnjWsuaP
 j2IaAWx04nnt4ipamf/ujpzDVd4YPjRCVhwwZIgjLHL1Gkxo7hmSiDYQccZ1xav3/Ou6
 /19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EsD/IuSW4XKuYRH8oY0OuvmjS4XvDLzJx0BEIFPpsAA=;
 b=DNpQOFWE0lzGgkvhFGzFrN5QTpTGq8VCS2dU/9gl6D9WT/tYOAENf1piwU1dbFpZRZ
 3Vw8d3B8VeEHlHDj4J9RnD0WY8FPwqr3W+ZgLZlDGDvuriwcBOcrXAl6ITHItMDy5Y4T
 gaHPMO2VMb9dcduAHOQiFJOJfWmBkS7u0b7Bk2ohNyFFKf2J4Dyq3VAGNC47m4jiiKH4
 xy1lJQrdsz8XfSXsImDX8Sv1M2+WdBZkM1CLr1T7EZDWPuLc3CCeaPOYhFUuyYS+B4b0
 /vm3Jk2RZbxEOqvsTwVtmkcY85EPIJsm7/8VMgXQssPIIm2gwzGOQJI0q5fQVFx2zb5T
 ri8g==
X-Gm-Message-State: AOAM533oBIboI5dygoK0tsQf47wPlteqKK+JyrXr4N/IJzOK/jhvbnGP
 MNPLd/6FfEIo69CdqycDJUXZjQ==
X-Google-Smtp-Source: ABdhPJwUTa84P9X1tEee7Ac9rl+GsiUqV1cLsT+a00ceuVDJpeSNmPwU+NVNp3v8b+UNsNzhOJ9ScA==
X-Received: by 2002:a65:5a06:0:b0:375:81c9:74b1 with SMTP id
 y6-20020a655a06000000b0037581c974b1mr14629599pgs.122.1645990565487; 
 Sun, 27 Feb 2022 11:36:05 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a656382000000b00370648d902csm8273361pgv.4.2022.02.27.11.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:36:05 -0800 (PST)
Message-ID: <4afce030-a071-c653-9ad4-78d2f2ec1eb5@linaro.org>
Date: Sun, 27 Feb 2022 09:36:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-10-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-10-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 04:25, Weiwei Li wrote:
>   - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions
> 
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 57 ++++++++++++++++
>   target/riscv/helper.h                   |  7 ++
>   target/riscv/insn32.decode              |  6 ++
>   target/riscv/insn_trans/trans_rvk.c.inc | 90 +++++++++++++++++++++++++
>   4 files changed, 160 insertions(+)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index f5ffc262f2..6cd2a92b86 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -303,4 +303,61 @@ target_ulong HELPER(sha256sum1)(target_ulong rs1)
>       return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
>   }
>   #undef ROR32
> +
> +#define zext32(x) ((uint64_t)(uint32_t)(x))
> +
> +target_ulong HELPER(sha512sum0r)(target_ulong rs1, target_ulong rs2)
> +{
> +    uint64_t result = (zext32(rs1) << 25) ^ (zext32(rs1) << 30) ^
> +                      (zext32(rs1) >> 28) ^ (zext32(rs2) >> 7) ^
> +                      (zext32(rs2) >> 2) ^ (zext32(rs2) << 4);
> +
> +    return sext_xlen(result);
> +}

I'm a little confused as to why you're extending back to uint64_t?  Especially since the 
top 32 are discarded.

Also, I think sext_xlen is a bad name -- sext32_xlen would be better.  It confused me here 
for a bit, and I went off on a bit of an irrelevant tangent.

These could also be implemented inline.  I count 12 instructions.  The overhead of a 
function call is about 7.

> +DEF_HELPER_2(sha512sum0r, tl, tl, tl)
> +DEF_HELPER_2(sha512sum1r, tl, tl, tl)
> +DEF_HELPER_2(sha512sig0l, tl, tl, tl)
> +DEF_HELPER_2(sha512sig0h, tl, tl, tl)
> +DEF_HELPER_2(sha512sig1l, tl, tl, tl)
> +DEF_HELPER_2(sha512sig1h, tl, tl, tl)

DEF_HELPER_FLAGS.

> +static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    gen_helper_sha512sum0r(dest, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

gen_arith.


r~

