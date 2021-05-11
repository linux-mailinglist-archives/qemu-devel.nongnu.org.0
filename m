Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8290F37A141
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:58:14 +0200 (CEST)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNHR-0006YM-5N
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNGI-0005Re-E1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:57:02 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNGG-0007US-SQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:57:02 -0400
Received: by mail-ej1-x632.google.com with SMTP id zg3so28409025ejb.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ge/fn6ENP3lkgJf7/pA69NPxOFc116GmVD/27DZQVn0=;
 b=kckJc+3Oh9mv65hrTrOFNvNAeGUe1apCMa9AwBJFa6Eyaanrl7AP6C41iBsjJhvgbF
 50MsZnNiE6S+JcUuLiQ4fJXIG3KtNni8Cgj0U+bfxi2LpPMlP5EYaaRppJionHPcoGI3
 gcjQo+JflhcZfrQ9JdT2ALXgJIZ5Rkae0BTYgh/wuzFyKAYDalSLXLnNjWcE0S5ieXCl
 hfBOyqUsZtxIvA57d0j6jcu/qMUoaOrvYTTe8zaYQa3ErzySuuuxi4tVefRArJSV3naq
 k0MCZy5mu/U4i9OEPY/G6DEO8e4iNQj9k2LweqnZN26azm33oqM9imisaELz8LxJR5Ji
 sUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ge/fn6ENP3lkgJf7/pA69NPxOFc116GmVD/27DZQVn0=;
 b=q2vMRdmiW4iikd4Dk8Jr9R3bpye+1dOz5Ddmf7EuLGGTTDr03vNvEDr9D9p1hPA4aj
 KICV00HqjKx5C14KbSUXmWvsz8HJN3EbgPzYAebCQSzoZcq7yW5Ik7IR1RD+vZsRiJxL
 2y5Ohdsr1wdKlH/FM/+OauIHkAvxFWpwxbpctaV1ojYggmWon4bi5IB54Ylqg1qdSIby
 k40pfYE3foeOvly2bM77d1CwFgclmPQTg3p77YI/ARsMU+nZ6akvdPDLSnsPmWZBViKO
 SGlgmGGbbtWliu2c2RRubj0mgHDwDYYc6tOiqQQ7Bti6Pt8kUHtbahaynmp1l6hQtPPt
 6p6Q==
X-Gm-Message-State: AOAM532crl1ufnNQ0juGUnfbwcgFveq2F2nYynsvB7zKcxBdKC4AF2JT
 sVMzd2VK3/0if/gG7w7or+TVwtBIaQfmd8eO2hJXtw==
X-Google-Smtp-Source: ABdhPJxmc4LXMWl+F6/eugpe6HqfsBy752uwJ4Y5PoJqXX/zQle8bffYNUUcslzAoRqnPIJGeD2iOTeX/zkWUQwiV80=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr808318ejb.482.1620719819133; 
 Tue, 11 May 2021 00:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-2-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 08:55:46 +0100
Message-ID: <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/82] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Will be used for SVE2 isa subset enablement.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Do not read zfr0 from kvm unless sve is available.
> ---


> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..e8729b53fd 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -567,6 +567,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf)
>          err |=3D read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                ARM64_SYS_REG(3, 0, 0, 7, 2));
>
> +        /*
> +         * Before v5.1, KVM did not support SVE and did not expose
> +         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
> +         * not expose the register to "user" requests like this
> +         * unless the host supports SVE.
> +         */
> +        if (isar_feature_aa64_sve(&ahcf->isar)) {
> +            err |=3D read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
> +                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
> +        }
> +

This code is earlier in the function than the place where we
update ahcf->isar to set the "SVE supported bits":

    /* Add feature bits that can't appear until after VCPU init. */
    if (sve_supported) {
        t =3D ahcf->isar.id_aa64pfr0;
        t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
        ahcf->isar.id_aa64pfr0 =3D t;
    }

so won't the condition here be always false ?

thanks
-- PMM

