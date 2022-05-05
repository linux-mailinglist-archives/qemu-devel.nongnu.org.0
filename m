Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BA51BB4D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:59:00 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXK6-0006Ub-Ud
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWjU-0005Wi-2k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:21:15 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWjP-0000Wf-QW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:21:07 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f38so6414204ybi.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zwuuukT+RmTzydmDgh6k9SFKgBnVOCLXQI0NcuFrbQ=;
 b=NKqXrwreH4dX4x/Ld3GLp2xrY4Qq8r4q+ku/32f6Tk7yrz1+RTU4Clzx/NRLJYiQFz
 guuIPc9aIlW8yWDaV1EvVIgdph0dqqv/gQfEJb/rUNGP1pD+9m0TRjVmQkPGM+oFXA0V
 crPj07SJjmes6Q4zxvNrIfgI+bAkM17ysKVVj3nOBzdxTV6y909O+fSsTk7sD7gk0NMu
 wnrjiBGGU9KA7TkKv5HaLNHidRzbjiz+BjA4ACvzENxapRDA6nlQxHERY8o209Bk5fXV
 PzjRzUR8zdCjvY4XNnHiE/D57firjINjvutnBT2Wr5/22oNGcPS0U+6ECwZzE3y60eOn
 Z3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zwuuukT+RmTzydmDgh6k9SFKgBnVOCLXQI0NcuFrbQ=;
 b=O1iaOZBDGmsR1oHjM0stF7UDuaO1gXZN2n97isPvHPTueNVoReCd8o8WJC/fBUd8No
 NhgjvJ1RD18Sp9iqft5+V1vHtEifjwxoel9f28pHM1EzNTF5m+9KdxRwyNUmQsah5d7f
 ErZXJxYFkkbhNrAm0kItEZrWt6XkxyWaSMHF2cwNd/TqKTyTy19LT6WHVB8yV9GAmEMg
 7htBU6tRBJnFu+OifbGlRE2/0BWWYpQkK6QhPJTrALOiWPngPIwlEG9mnPEo5CURikHl
 wD0/U0nVB8M5/Zq0K47pnv7nvENbb6nHHU9qfUijyToy5BGr9BYmba5/trGcmHHzuKky
 j4Kg==
X-Gm-Message-State: AOAM531wh5HcVjleZko/kXvjjQNcDQxH1TKjaZ26TN1mCED0iEM3aFtP
 plvCtbld6xcDL1agZXJJ3G9S75Enl8gwJKbKOTYwJw==
X-Google-Smtp-Source: ABdhPJw0NyzcoLsPgQHNTYrKeYIhR4hBbqflKs1ns1DyXqvmjgnauERK8zY725WHA85B2GBG2rdKefMLComdiZLOyYM=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr21105397ybu.39.1651738862623; Thu, 05
 May 2022 01:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220505004046.6711-1-mkei@sfc.wide.ad.jp>
In-Reply-To: <20220505004046.6711-1-mkei@sfc.wide.ad.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:20:51 +0100
Message-ID: <CAFEAcA_XA_-Gfq+UQRV63Uxp7Pz4DksZGb8dR0NuZ1KkQ+iozA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix s2mmu input size check
To: mkei@sfc.wide.ad.jp
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 01:40, <mkei@sfc.wide.ad.jp> wrote:
>
> From: Keisuke Iida <mkei@sfc.wide.ad.jp>
>
> The maximum IPA size('inputsize') is constrained by the implemented PA size that is
> specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
> Manual for A-profile architecture "Supported IPA size" on page D5-4788.
>
> Signed-off-by: Keisuke Iida <mkei@sfc.wide.ad.jp>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5a244c3ed9..868e7a2c0b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>          }
>
>          /* Inputsize checks.  */
> -        if (inputsize > outputsize &&
> +        if (inputsize > arm_pamax(cpu) &&
>              (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
>              /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
>              return false;

Can you give an example, eg a test case, where you see wrong
behaviour? The 'outputsize' variable in this function is
passed in from the caller get_phys_addr_lpae(), where (for
an AArch64 guest) it is indeed constrained to the value
of ID_AA64MMFR0.PARange:

        /*
         * Bound PS by PARANGE to find the effective output address size.
         * ID_AA64MMFR0 is a read-only register so values outside of the
         * supported mappings can be considered an implementation error.
         */
        ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
        ps = MIN(ps, param.ps);
        assert(ps < ARRAY_SIZE(pamax_map));
        outputsize = pamax_map[ps];


thanks
-- PMM

