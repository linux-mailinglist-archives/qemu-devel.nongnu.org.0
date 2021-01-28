Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AA307597
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:10:47 +0100 (CET)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l568M-0007Xq-M5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l566W-0006HL-IE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:08:52 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l566T-0006K4-Jp
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:08:52 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so7339977ejf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3mMdRA9ock7OBY6gvnEu8TvMpsXskC8FRkRgfhZOZPY=;
 b=wsR2wHkRrP78dj8oRCXvXSdTa58XqLbqHULK+4iaPsBEEnaiACW7fPiwcUyZqSmngA
 JfVf2Ma2iQ30vILssJ37NZ7Mbwhn+HoqnPZ5PHlUg2dLJIWi9mceD9Eu3G3LbSta8/dJ
 4r2ltB0qo+PUsK5katd8PAfiIBvelRx9QB3EhDXd8DK+8Xj2ab/K6DX81sMI/E59KWUH
 JCDRr9xq92R/0+THa4ghCjigOH4fzy6BTEaUlrgNo2ldpPGMCiWNcSiH5zk31suDi6G+
 ZJsPoq4Vi+hI5SkfqTV4iyX4VoR4RNpAVjTKccVJd4FuqUkyjTIA3z/9YDD6N0aGn6b7
 1lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3mMdRA9ock7OBY6gvnEu8TvMpsXskC8FRkRgfhZOZPY=;
 b=tqYTsb9xQgP2AJflp38irTawOjZb3tdYt+zkOudRizoHGNzz68XV7nmt29O025oXQa
 upMrMtKnDH7xuEDCLG2r2bsUxlCD1t5HIcmFmHSf9bX+tybcIznBQ2X5mNEGwotKTDEw
 ww8VXOM33FdoSflvHNVe2xCFohU20zf3t480L5B0x1A1oDus2NV5PcrY7LimfoJrKewj
 cEW43qHaKEe+YOa+2B+5YepzWMPFFSJdOSXSCCsg/bgF/LJlYq+eQRsI9HkZxnCSiUsU
 5s4eXHae6kx97k7LelhJKP8JvMdGkVX+wZd6R3RCuyFMXgj2bmufB9Nj/wuemCa/lXYF
 fVEg==
X-Gm-Message-State: AOAM532wG0K+uuS0VFwcpmxlVrdNf3zAEDbkSdp2PbMCAWZ6MDy+U9bu
 XwkqYxWIeLdT4+ttyW29bKrZL191lnJGFdwHzbgeZQ==
X-Google-Smtp-Source: ABdhPJztk9clZjyKrsupEN40UR7/KGWa8A5jeAz5ffoVKix1QtFoopPbwG7XAQxgUhBmM6F/+kXIB+Gn2H3rHd4rGqM=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr10408152ejb.382.1611835727940; 
 Thu, 28 Jan 2021 04:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20210125210817.2564212-1-muellerd@fb.com>
In-Reply-To: <20210125210817.2564212-1-muellerd@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:08:36 +0000
Message-ID: <CAFEAcA-P1JZ731MNpJuPUvZEwg+CZrF3QCpnaV=mvt8GB8LqAg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correctly initialize MDCR_EL2.HPMN
To: =?UTF-8?Q?Daniel_M=C3=BCller?= <muellerd@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 25 Jan 2021 at 21:48, muellerd--- via <qemu-arm@nongnu.org> wrote:
>
> When working with performance monitoring counters, we look at
> MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
> check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
> counters are "enabled" for < EL2.
> That's in violation of the Arm specification, which states that
>
> > On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> > PMCR_EL0.N
>
> That's also what a comment in the code acknowledges, but the necessary
> adjustment seems to have been forgotten when support for more counters
> was added.
> This change fixes the issue by setting the reset value to PMCR.N, which
> is four.
>
> Signed-off-by: Daniel M=C3=BCller <muellerd@fb.com>
> ---
>  target/arm/helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d2ead3fcbd..195db4d378 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5705,13 +5705,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>        .writefn =3D gt_hyp_ctl_write, .raw_writefn =3D raw_write },
>  #endif
>      /* The only field of MDCR_EL2 that has a defined architectural reset=
 value
> -     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; b=
ut we
> -     * don't implement any PMU event counters, so using zero as a reset
> -     * value for MDCR_EL2 is okay
> +     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
>       */
>      { .name =3D "MDCR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 1,
> -      .access =3D PL2_RW, .resetvalue =3D 0,
> +      .access =3D PL2_RW, .resetvalue =3D 4,
>        .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2), },
>      { .name =3D "HPFAR", .state =3D ARM_CP_STATE_AA32,
>        .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 4,

Rather than having a hardcoded 4 here, could you add a
#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
and then use the constant name both in the resetvalue here
and also where we currently have 'pmcrn =3D 4' in define_pmu_regs()?

thanks
-- PMM

