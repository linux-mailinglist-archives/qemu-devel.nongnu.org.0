Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E291944C022
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:28:59 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklmk-0000oR-Pq
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkllZ-00083v-So
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:27:45 -0500
Received: from [2a00:1450:4864:20::435] (port=42691
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkllX-0006lq-VR
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:27:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so3395129wrd.9
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uOHWk3y22J427Wd6xX012czM+kg5lSjLvu5ZH+phYpY=;
 b=lFXY6f/09udhX6rpwzRBdV090fNcrS11OWPx+o+LvnDYucqotQZcmJnSVDq+GiuJfj
 cuN9bHCqkgiXQOZjW3kOnlpyViFPUWMwfD5WE1udnFMGfE/N8zn0o+wdbzZ8nnkdB1RV
 Ne6eeCYjK/SX2sJJj2McBvjkeq6bJfc2Zx4ep0GYQDAqtFacxuSBNpJXCjTRarBbNWFE
 sNIYreXneMK+1YzLNvbvMi90gj9ZRh6qpYZM/+WG/TzzefPqxHC2mxNTuUkuA2QMCaJN
 A1IzlNxad1lLDfT6Xz6ZnPSpnxrkse2ylS0PTKg7P0vhJZ691lXKGgnGTySAHn3av4HA
 /XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uOHWk3y22J427Wd6xX012czM+kg5lSjLvu5ZH+phYpY=;
 b=GwoNd0cTO8CsyCJ4CMivOUqY7nj8YoRVLVw+9ILm0TYYRx2mxu/eKrtNq5f8m7IoSn
 1APiptGs6Du3BFrukD76SE6SHDzC4m0uJj2i4nGEtyZUYE45xpa3G4vJkVA29Lqyx+w8
 aFHICj6Wkn4lYyTXhOrknC+53Blv8ZNnVzTdf/kXcxuycKoNwAmxDZvsen9unBzrW5FQ
 uGnSxQ7alrxXT4mbIodqetuJglWXQ7ujc0WQURBHJnJ8q6ror3imiNb95I/Lq7tO5jXi
 gxqcD6zCgdtH/r48hIzIW+TNwIki+QjI5APLB9eIPS6SQvoQhgiIvejMQly12gdescnE
 nz4A==
X-Gm-Message-State: AOAM531lGRDJtdHzJZsQFq37wm1bltviU3HRycmavIO8yeW3Rk/NTMJ6
 kWLaZKJRynmubWkgzSRUy1n0XQ==
X-Google-Smtp-Source: ABdhPJwfVK1xTKBFqlkFg9SGku2UxUW1RcDFnAWEVO04nFqAFYDGUz50g4DT11iPv5RXNKNBUi6AYQ==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr17833223wrf.410.1636543662503; 
 Wed, 10 Nov 2021 03:27:42 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id o5sm8349428wrx.83.2021.11.10.03.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:27:42 -0800 (PST)
Subject: Re: [PATCH v2 14/14] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-15-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59e04faf-3832-bec9-52f3-d5a91d20b893@linaro.org>
Date: Wed, 10 Nov 2021 12:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-15-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/csr.c                      | 5 ++---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/op_helper.c                | 3 ++-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 33e342f529..e07cd522ef 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -555,15 +555,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>            * RV32: MPV and GVA are not in mstatus. The current plan is to
>            * add them to mstatush. For now, we just don't support it.
>            */
> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>       }
>   
>       mstatus = (mstatus & ~mask) | (val & mask);
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        /* SXL and UXL fields are for now read only */
> +        /* SXL fields are for now read only */
>           mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;

Why do you not allow writes to SXL?

You're missing a change to write_sstatus to allow S-mode to write to UXL.

> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 7a0b037594..cb73a2f1ee 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -472,7 +472,7 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>           return do_csrw(ctx, a->csr, src);
>       }
>   
> -    TCGv mask = tcg_constant_tl(-1);
> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
>       return do_csrrw(ctx, a->rd, a->csr, src, mask);
>   }
>   
> @@ -523,7 +523,7 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
>           return do_csrw(ctx, a->csr, src);
>       }
>   
> -    TCGv mask = tcg_constant_tl(-1);
> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
>       return do_csrrw(ctx, a->rd, a->csr, src, mask);
>   }
>   
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 095d39671b..561e156bec 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
>   
>   void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
>   {
> -    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
> +    target_ulong mask = cpu_get_xl(env) == MXL_RV32 ? UINT32_MAX : -1;
> +    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
>   
>       if (ret != RISCV_EXCP_NONE) {
>           riscv_raise_exception(env, ret, GETPC());
> 

The rest of this should be a separate patch.


r~

