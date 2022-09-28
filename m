Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBB5EE0E6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:53:06 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZMt-0003SK-L4
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYl2-0002G6-TB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:13:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYkz-0005Qf-7v
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:13:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a80so12803894pfa.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vG78sjMOUr7Kg8YJ7ALQQ21371VROAM8p5kU/cY0IQk=;
 b=SlH+9v+YV4C2kvrcg2wbO3Ewgjbcjc0DIXpbHUTynIiSprxRCXrvsqSL+09R52xCx1
 ZRvXIoZ0twwbgKRtL5HiT7O9YZW2dWmEGD7vGc3HvSN2V7M1RkRztREkGCA3Nhog4Hqd
 sPDIgx5j9pZZDSa2mgqdodNI8xhaL8K+ugaCwZdSUJ9lHty7fPvbsvcDpor5X4Vwacfl
 Vne1JTTzT5zFLsBzPXMB+S/K7mrNdi2ZoIfDrxWnoTmwvudr4Y6vzS/sepZ6qVy0enEX
 0FkjJ5dLkO4FRJeRUiE8sjsSwlRpcvqRksbZ6BlSeMOyu3S9ja6xVoWcpIQg8zcN7/SY
 xYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vG78sjMOUr7Kg8YJ7ALQQ21371VROAM8p5kU/cY0IQk=;
 b=h28Emx+ZtvDZ8Dv4mFDVktLpHOkRaL4OqQji1YTG3Ya2Nnm3KIxdAKBchV3gSHDTlB
 fdWEXo5cQ5pKPm1uUkAZgV8e64q9WP1YFDLxii2SLzwcRcEiYPihhfv29oxZH/MKXywp
 X4544ub7i/4Qq+9F0QSfebed4p1knQVCf0oJ29Kz3TZTmnpo4kNCsAZV8EqEObdeed3w
 Dlc3mRNkYc2T3lgbXTfcw6gz4v53syXoTTST3d7WLIrPV9DJ8ehhyLixcZmQj5KER9Y+
 0zQ1ha10P2LtRlDhK8vlRw73H7ARRSCqXXPa7rHMDKdWffMOhGuh5cAvOjFLLpM05qmh
 i1jQ==
X-Gm-Message-State: ACrzQf2Pq5m27KveX8wCNDcs9bDlnj/7l7UfMKCsFfb7OEnEK69z4aBY
 BjGPZJ8+J6WubX2oiYNvNZTm6w==
X-Google-Smtp-Source: AMsMyM48tfEBhs8we1e9aQoIfp7kOqSx0yZ3W8INHdphe6+8rLMQooyeG25siyXNq4DJ/ybxRFg9LA==
X-Received: by 2002:a63:c3:0:b0:439:72d7:7e1f with SMTP id
 186-20020a6300c3000000b0043972d77e1fmr29286128pga.524.1664378031717; 
 Wed, 28 Sep 2022 08:13:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a17090340d200b0017315b11bb8sm3799436pld.213.2022.09.28.08.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:13:51 -0700 (PDT)
Message-ID: <fa9bc59a-a617-a243-7bf4-bc1f07db1a46@linaro.org>
Date: Wed, 28 Sep 2022 08:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927064838.3570928-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:48, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_bit.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
> index 9337714ec4..33e94878fd 100644
> --- a/target/loongarch/insn_trans/trans_bit.c.inc
> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
> @@ -37,7 +37,7 @@ static bool gen_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
>                            DisasExtend src_ext, DisasExtend dst_ext,
>                            void (*func)(TCGv, TCGv, unsigned int, unsigned int))
>   {
> -    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>       TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>   
>       if (a->ls > a->ms) {
> @@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
>   TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
>   TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
>   TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
> -TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
> +TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)

These two hunks do opposite things: change dst_ext from NONE to SIGN, and then ignore the 
change.

I assume the first hunk is in fact in error.


r~


>   TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>   TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, tcg_gen_extract_tl)
>   TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, tcg_gen_extract_tl)


