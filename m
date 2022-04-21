Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584C250A67D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:00:44 +0200 (CEST)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaAd-0001eK-Fj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZSj-0007DZ-R7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZSi-000767-3n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:21 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f17so9601686ybj.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=znBKvg3giJox/+l1U0D+DU7ji91IfgGnbpk8ZV1xZAE=;
 b=KjD1fKD/FErKl1TySts9oDW3+GSy6KVZVxq9SI2Q5bui9xigZheHqwDHg5BjauOEPz
 JcJzdmm7JYSk4JdQIL0eHTSSs58UbLvUErdSs9HiZh7nC6rpllAMDETv5XndOokHpbWa
 k4Lwsv/jRbRyEdrIF/2LNuV21Mh3f39MpDbaRrzzaorFITVuMB4Lfu5ZbL66GgLYJi+u
 uqvsg3CubIsPDj7CSBqgdV73HOgt4THkwLalNp43zso1MA+6CkeFLDB1of9f1SQYk2br
 QKee7nj9ESmiBzENyid+R1+un2mtH+UnB5hUSB6/J0rCamr+YnLN3OxwbPFoIesfXr7x
 Nxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=znBKvg3giJox/+l1U0D+DU7ji91IfgGnbpk8ZV1xZAE=;
 b=spvJR/GfY+Og3gOmuUKU00zX+0ERsNy7bFifFFI2MVRy+xMtolI2669UsFHiN2CKFs
 +qzLCZ/vS/cEnpH65/fs1+/3936oGeZhc3iQ7ua9f9GfxaAD8j2Tpkb843mb25JwtpCB
 LacyRjnludoOOx3k7M71wgu51N//iXLiVFxckZPZ6sahvlLVc+P8PtTYUDN6B6OC/APw
 8ABsFKxH+Cx4PiFU7FUer3KjiVpkFasqgCPfbsXLcZK67Qi5QbNM5TjbgFbVxoaUlCLh
 L+RRX1zfq2NPWNBexJW79Pzpd1JeDygtIR0wvI3iePEZFCOG2QOGWJQSzzJElcqz8Mfk
 Kd0w==
X-Gm-Message-State: AOAM532OFr8ApOU6+hJJFVrDLDxnAHcTLO6F9vd49K7X44wd4mABgJX/
 IXF5coNHtJVd8T5M9CGn4LmC8KnJ93SdyM6GTHc+ZQ==
X-Google-Smtp-Source: ABdhPJzGz3EmdQBO6LbXCALydsuMdA6buUSdnfvloeGVxVI0YqCpJQT86JT2++q12mWYWtn4FmEdI7Rk7hruFcHsago=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr423765ybs.85.1650557719017; Thu, 21 Apr
 2022 09:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-8-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:15:08 +0100
Message-ID: <CAFEAcA_vFKkznV-heaWimT-R6QNzH39+=tcS4ZXQ4Y7zMMu0gg@mail.gmail.com>
Subject: Re: [PATCH v3 07/60] target/arm: Extend store_cpu_offset to take
 field size
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Currently we assume all fields are 32-bit.
> Prepare for fields of a single byte, using sizeof.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a32.h | 13 +++++--------
>  target/arm/translate.c     | 21 ++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
> index 5be4b9b834..f593740a88 100644
> --- a/target/arm/translate-a32.h
> +++ b/target/arm/translate-a32.h
> @@ -61,17 +61,14 @@ static inline TCGv_i32 load_cpu_offset(int offset)
>
>  #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
>
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> -{
> -    tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> -}
> +void store_cpu_offset(TCGv_i32 var, int offset, int size);
>
> -#define store_cpu_field(var, name) \
> -    store_cpu_offset(var, offsetof(CPUARMState, name))
> +#define store_cpu_field(var, name)                              \
> +    store_cpu_offset(var, offsetof(CPUARMState, name),          \
> +                     sizeof(((CPUARMState *)NULL)->name))

compiler.h defines sizeof_field, so you can write
  sizeof_field(CPUARMState, name)
here.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

