Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9E617DBF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqa9h-0007T6-OZ; Thu, 03 Nov 2022 09:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa8Q-00077I-9O
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:20:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa8L-0006zz-7F
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:19:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so5146762pjc.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ezwB6d/NfOuXPPN2TYdCBqEADrtBcpsZHstC0C/etBM=;
 b=vSGwG1nnivneckyOD9e+3CaijpCxbubs4RKwNtqAcgGyO9TN22VpUV9PH2HEa3H4D8
 o4q2xGAP1PGafP7noBN/AhlZDUzFzoFuEL7neoVU4RkDeQuXQmxbY+Hp4Le2NpECUs2x
 EjMW66u5jgRtwzIcIqmfwnPBMvW/Bus5OTNzEKj9bOyFseLjKoA/YGg87h8ecXgS7UYP
 vpvSG4bYdK+fFnpzGgduhv8KlorupMcdkt4bsmaetD6vdRGQ+13iRQBCv+aTX/bHhGam
 ePutM9yzF52nJlQu5E7fKdOuXnmqMvKvLxciWfZSGOfLfB+B1ii+PdgXO8J++7gz2Jeu
 DPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ezwB6d/NfOuXPPN2TYdCBqEADrtBcpsZHstC0C/etBM=;
 b=mubELwgPhS59G+R65KyKbuJIhxJ45JG2MMHROtPcqUGtjoXGjFBUNOrU8IIiVYLcT4
 kszJVkPWtNdEtKAj9wsxTFmb0/FtmShpIAezCp3Aqxkjo6srAFobEeX1eR2Cal7aLQMv
 e6Xl7RNIi8T/alKpUJNA2gpebXTEMae9WaqASV5QyPZSj9ZhI75tlpwDyCHuf76N2GtH
 3f9zZm8t4IrJQY7nruIKb85kn22zcTC4S/DfQVI/e1hHKIKNZ9jlRR3b55IqMcWdaDnj
 t39+06e8MuGS2x6CkLLqrr2xQwmZtlHnH1gBxT7GCCCRxZwTd8KGuehrLR07P89/QIpU
 mcbw==
X-Gm-Message-State: ACrzQf2ocGlLKSdT5CCkOj/JIXWUzvTo5yjTbq+8tNeVDsPbpzahL6i3
 jS9KjyeniNU/zmA10vD2s0BlKIrAgkeXw6yyVFPK7A==
X-Google-Smtp-Source: AMsMyM4MR/nlu75/bK3XXdsPYG9BnPeonO7s8tv5Lc/TagWmiUkxo4mrc7DlAhBsG++mKun2g9RZ1t43dqGlahwG1LA=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr30189892plb.60.1667481587866; Thu, 03
 Nov 2022 06:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
In-Reply-To: <20221102054706.1015830-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 13:19:36 +0000
Message-ID: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2 Nov 2022 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reversed the sense of non-secure in get_phys_addr_lpae,
> and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.
>
> Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 58a7bbda50..df3573f150 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr |= (address >> (stride * (4 - level))) & indexmask;
>      descaddr &= ~7ULL;
>      nstable = extract32(tableattrs, 4, 1);
> -    if (!nstable) {
> +    if (nstable) {
>          /*
>           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>           * Assert that the non-secure idx are even, and relative order.
> @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>      bool is_secure = ptw->in_secure;
>      ARMMMUIdx s1_mmu_idx;
>
> +    /*
> +     * The page table entries may downgrade secure to non-secure, but
> +     * cannot upgrade an non-secure translation regime's attributes
> +     * to secure.
> +     */
> +    result->f.attrs.secure = is_secure;
> +
>      switch (mmu_idx) {
>      case ARMMMUIdx_Phys_S:
>      case ARMMMUIdx_Phys_NS:
> @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>          break;
>      }
>
> -    /*
> -     * The page table entries may downgrade secure to non-secure, but
> -     * cannot upgrade an non-secure translation regime's attributes
> -     * to secure.
> -     */
> -    result->f.attrs.secure = is_secure;
>      result->f.attrs.user = regime_is_user(env, mmu_idx);

Do we also need to move this setting of attrs.user ?
get_phys_addr_disabled() doesn't set that either.

thanks
-- PMM

