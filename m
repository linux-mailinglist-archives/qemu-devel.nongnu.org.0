Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84C6E5BCE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:14:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogTK-0005MH-Bb; Tue, 18 Apr 2023 04:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogTI-0005Ly-D1
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:13:52 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogTB-0004Uw-2L
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:13:52 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-552fb3c2bb7so39092987b3.10
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805624; x=1684397624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3JKwN/qUxYek6HEe26fUF9qyZjpVnYj6OMo0d05nX2Y=;
 b=oMfD3EQjqcMdTkSZQ6oDh7Usj+ieVjqF8Acqg14HdzrkyYkYfPwtilewmPmvBYTy5N
 loB2BAxUl8NlPytGmv9hNTs6v0Z6w/i1qPavfJZ2hrFdiTbUQb/DNepvGx1MS/MvEGTp
 Vav0oFkqXhd/BfjrbDAsIgZxHs6iKaE7Ve/7b2IxURncD4LWV4/FZO9G6b25Ned833SO
 gczcOR24bliuOgpCA4RIlFqw8mF5VkDHsF+Ctj39POWrl97kgz2wu2QHqebVIjjcL76A
 G5GqHn4kTezJwrpayrkFJxCkI/5W1KNBUz9F6cibHgLAYzkP4i5m/X2fW4LuwEoZyive
 Wyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805624; x=1684397624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3JKwN/qUxYek6HEe26fUF9qyZjpVnYj6OMo0d05nX2Y=;
 b=YW+Da8t4i3Ek07ofmcjtxLxRpwQAzw1eJKdxWY2E5EaDzm6JlBTxuqQgu+YX+PCEq3
 gWt7Ih6WNNb9O4OaX7oGUrPAxicKvD55ksKbJ4PeqOvZZ7HlIKeS0Riszn54jQJb8zsC
 W55DBtKnw1b04l6+WlGBiaP0w+3iirzGi7r7rd8Lg4K2YXwnkI2pxF1NsBpKx1uBvQyo
 mwwSuN8384h01fJr8uDQfl159RDAL7hqj3CzJvYyfC0nE1lt89mt7leC5pqGEY1r8bqW
 7DCkIfdVv6KQVDMaCYqGQ12rD4Ox2s0SeH5GTC4TST6DdxF7y8Ker3AcQ4ZYKsjgx08N
 zCRA==
X-Gm-Message-State: AAQBX9e78L4UMyLMyBISvazKp7pycdJgv+7gd5hTSz3r8dgZjj3JW/hd
 zxOJVUhQkgZ2vTuU/shhE9Lnmg==
X-Google-Smtp-Source: AKy350Z0ihD3eT6sNZ25pFrOgX+fuzUmkO5tAZbn8BgzFlqKqOxzw6cGJx/irxka6r6+/PfKira2Cg==
X-Received: by 2002:a0d:cb0a:0:b0:54f:b244:fef9 with SMTP id
 n10-20020a0dcb0a000000b0054fb244fef9mr19164921ywd.0.1681805623974; 
 Tue, 18 Apr 2023 01:13:43 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a81760d000000b0054f9e622741sm3612302ywc.143.2023.04.18.01.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:13:43 -0700 (PDT)
Message-ID: <b9798442-3032-d0db-08d1-f2e24f2ecd6f@linaro.org>
Date: Tue, 18 Apr 2023 10:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/17] target/riscv: Refactor vector-vector translation
 macro
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-3-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-3-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> 
> Factor the non SEW-specific stuff out of `GEN_OPIVV_TRANS` into
> function `opivv_trans` (similar to `opivi_trans`). `opivv_trans` will be
> used in proceeding vector-crypto commits.
> 
> Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 62 +++++++++++++------------
>   1 file changed, 32 insertions(+), 30 deletions(-)

Nice code movement, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f2e3d385152..4106bd69949 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1643,38 +1643,40 @@ GEN_OPIWX_WIDEN_TRANS(vwadd_wx)
>   GEN_OPIWX_WIDEN_TRANS(vwsubu_wx)
>   GEN_OPIWX_WIDEN_TRANS(vwsub_wx)
>   
> +static bool opivv_trans(uint32_t vd, uint32_t vs1, uint32_t vs2, uint32_t vm,
> +                        gen_helper_gvec_4_ptr *fn, DisasContext *s)
> +{
> +    uint32_t data = 0;
> +    TCGLabel *over = gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);

Existing nit: the first brcondi is redundant with the second, since (unsigned)x >= 0 is 
always true.


r~

