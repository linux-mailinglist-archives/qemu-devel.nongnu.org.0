Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D715C42FEFA
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 01:43:17 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbWr7-0003Mp-0Q
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 19:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWp6-0002Ya-Dp
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:41:13 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWp3-0001Hm-EM
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 19:41:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m21so9898029pgu.13
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B9HQKiPkvg/5vYW0UB9zKND0nmkLwQlGPueIL0m9Egc=;
 b=RW5I/Fuy9mw8iGFvrhg7hqHLlpuf92aPVAKmuMtROrf//LQG8AzQf2EWlNppKC57kW
 9Ck3h+9T5KMNzZpAYpq6aC5Cp/EN37hUEgqBoJkB7f4sDHqRW7lCMVdnYrMHgnNeQi5V
 ES8Xa9cltbLK4VQkW0NqTpWXcWUmV7gzvBR8KjWMTqngUTD6yOwtlEqT0fyLi+kHdulQ
 nBpOF9BEmjfGaB3ZBHQqBjfWPim4BvOwCVpE3nhggNXRiW6eXfwSREzIbUNNtYieQpJ/
 t/yO8dh1IKh29Mq3Jc0AWWNjTy9CAJD2jdcT1ntQ69sOSiXmcKOx4bZ+lyWVjO6yqZ8V
 qusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B9HQKiPkvg/5vYW0UB9zKND0nmkLwQlGPueIL0m9Egc=;
 b=k+JYeh910/vM9QxY7uIUOSHVWEMM572zqJKKZ7T5TnogzM3Ab2Y1qcgGm/68yi3xRh
 /WQPAGGckUsAdmpoJQELXrv+88EkOzft9MOd+KQxuZr4RUoxg3dPWV2aGq3XyrvFOzAe
 b5xgRJ/4bCF9imonF49WVOLuYfS9p1fxkCtHV/eyEE6VMwVTylersoXyPsLBAD6yX4kO
 ZobhL3dLKm8g4vDHnCakuP+AsYoOtr/JRWWk8KwdIiFeN5iMT4ZZvaSeE3Io7xxrvTEs
 yXnu9aY2li9PjzSihtMzEuJYEo1h8ksqD75VpB5VMy2MAhnhsaafl+5fKGuiRwDxZ2UW
 17OQ==
X-Gm-Message-State: AOAM531MHFrUSkQSpw3IdQYey6MG1YtJBGtNeUyBMYoaUQ7QpWACbRXw
 xIKjd9RT5NiL3TcwTnpBSbqFkcx3pIw=
X-Google-Smtp-Source: ABdhPJxpctuKuU6N2cqa5vjLDZHtbJXcllFbgOziRvdIsq/ff2dsS7eqgEFV33sc+1xPkchMuKB05w==
X-Received: by 2002:a05:6a00:21c6:b0:44c:937:fbf3 with SMTP id
 t6-20020a056a0021c600b0044c0937fbf3mr14701964pfj.2.1634341267386; 
 Fri, 15 Oct 2021 16:41:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b23sm5479237pgn.83.2021.10.15.16.41.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:41:06 -0700 (PDT)
Subject: Re: [PATCH v2 00/48] tcg: optimize redundant sign extensions
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
Message-ID: <78300282-09f1-b101-16ae-8204c9262184@linaro.org>
Date: Fri, 15 Oct 2021 16:41:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 10/7/21 12:54 PM, Richard Henderson wrote:
> Currently, we have support for optimizing redundant zero extensions,
> which I think was done with x86 and aarch64 in mind, which zero-extend
> all 32-bit operations into the 64-bit register.
> 
> But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
> The last 5 patches address this.
> 
> But before that, split the quite massive tcg_optimize function.
> 
> Changes for v2:
>    * Rebase, adjusting MemOpIdx renaming.
>    * Apply r-b and some feedback (f4bug).
> 
> 
> r~
> 
> 
> Richard Henderson (48):
>    tcg/optimize: Rename "mask" to "z_mask"
>    tcg/optimize: Split out OptContext
>    tcg/optimize: Remove do_default label
>    tcg/optimize: Change tcg_opt_gen_{mov,movi} interface
>    tcg/optimize: Move prev_mb into OptContext
>    tcg/optimize: Split out init_arguments
>    tcg/optimize: Split out copy_propagate
>    tcg/optimize: Split out fold_call
>    tcg/optimize: Drop nb_oargs, nb_iargs locals
>    tcg/optimize: Change fail return for do_constant_folding_cond*
>    tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
>    tcg/optimize: Split out finish_folding
>    tcg/optimize: Use a boolean to avoid a mass of continues
>    tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
>    tcg/optimize: Split out fold_const{1,2}
>    tcg/optimize: Split out fold_setcond2
>    tcg/optimize: Split out fold_brcond2
>    tcg/optimize: Split out fold_brcond
>    tcg/optimize: Split out fold_setcond
>    tcg/optimize: Split out fold_mulu2_i32
>    tcg/optimize: Split out fold_addsub2_i32
>    tcg/optimize: Split out fold_movcond
>    tcg/optimize: Split out fold_extract2
>    tcg/optimize: Split out fold_extract, fold_sextract
>    tcg/optimize: Split out fold_deposit
>    tcg/optimize: Split out fold_count_zeros
>    tcg/optimize: Split out fold_bswap
>    tcg/optimize: Split out fold_dup, fold_dup2
>    tcg/optimize: Split out fold_mov
>    tcg/optimize: Split out fold_xx_to_i
>    tcg/optimize: Split out fold_xx_to_x
>    tcg/optimize: Split out fold_xi_to_i
>    tcg/optimize: Add type to OptContext
>    tcg/optimize: Split out fold_to_not
>    tcg/optimize: Split out fold_sub_to_neg
>    tcg/optimize: Split out fold_xi_to_x
>    tcg/optimize: Split out fold_ix_to_i
>    tcg/optimize: Split out fold_masks
>    tcg/optimize: Expand fold_mulu2_i32 to all 4-arg multiplies
>    tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
>    tcg/optimize: Sink commutative operand swapping into fold functions
>    tcg/optimize: Add more simplifications for orc
>    tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
>    tcg/optimize: Optimize sign extensions
>    tcg/optimize: Propagate sign info for logical operations
>    tcg/optimize: Propagate sign info for setcond
>    tcg/optimize: Propagate sign info for bit counting
>    tcg/optimize: Propagate sign info for shifting
> 
>   tcg/optimize.c | 2602 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 1585 insertions(+), 1017 deletions(-)
> 


