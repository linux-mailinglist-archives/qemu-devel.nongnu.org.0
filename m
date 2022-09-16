Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF55BA694
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 08:05:17 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ4TU-0000Zv-Av
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 02:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ4Oz-0006JP-69
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 02:00:37 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ4Ow-0003ut-9g
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 02:00:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id sb3so17389224ejb.9
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ipigDF4ZX7q+DVe4VsKfIRUptuyU4IsasVJvegpeU8A=;
 b=gRHLq7l7h2C3h7mh58eocYacVmVB5UkIjmfOPZUMUO0YThc3u5DUBLE6V/pDuEdkOH
 WUhf4dQiIF+lT5366idZkjmL6EiFUhiwrUxr3af/Jf8LuKJrCS/MfUv/sBixPcgB2yhe
 Yg/htpLYKblT5QFFk39QfnfJxaPWNmRhAbpXyPKErIcIGgZVvmdapK75/nfFodRmFkQa
 mjlZpCe26b9XVMy3tP63nA7qYZkc3b8QEjgkfSVD/5aB7CrpmK4Ym8zLOUQMrS+j9paj
 JXIufZHPY00K6u/MV2+3jtfYCLI52Q4zZEZsQ3CMBDWxU1eJcUqKQ1KIZ3Nnnv3n11QS
 8cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ipigDF4ZX7q+DVe4VsKfIRUptuyU4IsasVJvegpeU8A=;
 b=Onv5WwNpxsV6sTA4u8iE0rwnlhDvW9dANrOyyzW8SuDAwZw/b71gLCejj+8PO/cXzf
 0xqlcM4arCM/giskNcZiCARRxTFMwld4cBVcePqLl2CW7H+XQRA615WQh93k9EsZKN0y
 PbBRgtaAVpvogrfvBO60CSqVuwEMugMVYunMf+A/VBOR8eEZzZPf3+UfjLQ0FTMDxyF8
 7n/56lxl5bdQBxMtcrmIeCL3OsP1mR13rhguOs5Ss8jy4Lv++Mu8+OKIctLahqaCxWUI
 0r40bAJGbv0S8w8yAlUFTzVPXIuLvvE8wRjzKB1/cGQtwR8L0DJ68ku07jYmgDIcyCyT
 d/1w==
X-Gm-Message-State: ACrzQf2kqXAKa8PVxSFA7KjBXHD9YDagHgiKs38HHyMRlp+ctjUnNz8b
 amFQvWl2GSZgeqGxUirkr+7qHg==
X-Google-Smtp-Source: AMsMyM4UFanix0d6yQwP76mko62MmmUsxGvk2CTqR8W5d3rbNSy1rJiR9BZqVWPOz4TPVQB65BcrIA==
X-Received: by 2002:a17:907:2c75:b0:77c:2b6a:6b63 with SMTP id
 ib21-20020a1709072c7500b0077c2b6a6b63mr2521446ejc.702.1663308025463; 
 Thu, 15 Sep 2022 23:00:25 -0700 (PDT)
Received: from [192.168.1.39] ([81.0.216.218])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709061ba100b0076f53f66e33sm10005784ejg.194.2022.09.15.23.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 23:00:24 -0700 (PDT)
Message-ID: <bfff6a65-f0f7-8659-2b58-582345018868@linaro.org>
Date: Fri, 16 Sep 2022 08:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/11] riscv: Add privilege level to DisasContext
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-2-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-2-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/22 14:22, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> This allows privileged instructions to check the required
> privilege level in the translation without calling a helper.
> 
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..fd241ff667 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -59,6 +59,9 @@ typedef struct DisasContext {
>       /* pc_succ_insn points to the instruction following base.pc_next */
>       target_ulong pc_succ_insn;
>       target_ulong priv_ver;
> +#ifndef CONFIG_USER_ONLY
> +    target_ulong priv;
> +#endif
>       RISCVMXL misa_mxl_max;
>       RISCVMXL xl;
>       uint32_t misa_ext;
> @@ -1079,6 +1082,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
>       ctx->priv_ver = env->priv_ver;
>   #if !defined(CONFIG_USER_ONLY)
> +    ctx->priv = env->priv;

Reading directly from env here is, in general, wrong.  Items that are constant, like 
priv_ver, are ok.  But otherwise these values must be recorded by cpu_get_tb_cpu_state().

This instance will happen to work, because the execution context is already constrained. 
In this case because env->priv == ctx->mem_idx (see cpu_mmu_index) so, really, you don't 
need this new field at all.  Or, keep the field, because it's usage will be more 
self-documentary, but copy the value from ctx->mmu_idx and add a comment.


>       if (riscv_has_ext(env, RVH)) {
>           ctx->virt_enabled = riscv_cpu_virt_enabled(env);
>       } else {

Incidentally, this (existing) usage appears to be a bug.  I can see nothing in 
cpu_get_tb_cpu_state that corresponds directly to this value.


r~

