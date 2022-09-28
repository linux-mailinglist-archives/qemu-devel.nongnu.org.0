Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903285EE9E6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 01:08:53 +0200 (CEST)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odgAe-00021o-G6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 19:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odg2h-0005Uu-UJ; Wed, 28 Sep 2022 19:00:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odg2d-00066s-9y; Wed, 28 Sep 2022 19:00:37 -0400
Received: by mail-wm1-x32e.google.com with SMTP id ay36so9411082wmb.0;
 Wed, 28 Sep 2022 16:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=O63/of1dIRyR2sJwQ9xYUqtbiwiD+FhYYmKF/r1ojHs=;
 b=JhFwszpoJZfF4qRvE2TpnrqJZvK+uyZcFE8QydsJNQeRcjtSuek8YAAElJKnkl3kVT
 Rajjv3MuwjskXb1zYMsQK+WPpjIM5dz9/dBH16hxydMoHI7vxuYOAxFQezkrH+yR6nZK
 gNJvcgRFF/kFQJO6PWOIyxPpfRNnMmEQRscso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O63/of1dIRyR2sJwQ9xYUqtbiwiD+FhYYmKF/r1ojHs=;
 b=As+reUQNghAPJUYzogu//rS3cQ7v6n2a1SXx302x+Zq1XEL8qaYuisWXl0f8JphfHL
 U+nUrz5Cp5pBgB0ydjzCC3IRn54nmwChDaEE+bCkFTXuEQJcRGjmVMJ1b7Eu+Iffoa0k
 qlf740r9QNUwdmFda0CSiwO3oIsOI2dj/HGPCxBT4IgH29vjIvwE7V+6XZL71FpvQ/ky
 j7HI9i44oU/doBvS9RjxJm+eFwipC6Og6jrOWFfqH9UCdzFQzRecGxNhjcIibWooq6dZ
 PvlaoeRPtJzDGfqtJf3uyDBNQ8Fn4hI5rAGxlNiVN1EDAy24yuNrkM0xkJzSeOa3o16d
 KJZA==
X-Gm-Message-State: ACrzQf1S5M3J1I90w63h0ebaubW07FmMDhgBoyblSl1YFbtfKhHq/IVz
 YokdDtoaedIYutfO2+RKcXRjDpUS7DDGy79u218=
X-Google-Smtp-Source: AMsMyM6a73qsP42ppS8GZY2FZOG9RogNSMCqZU0HX0U0PCXKHSMaLT6L5ep/24QbQv5M3DhPMnP3+29VmVV1LbD4Xa4=
X-Received: by 2002:a05:600c:a48:b0:3b3:3256:63c with SMTP id
 c8-20020a05600c0a4800b003b33256063cmr204224wmq.34.1664406033026; Wed, 28 Sep
 2022 16:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
In-Reply-To: <20220928164719.655586-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 23:00:21 +0000
Message-ID: <CACPK8XeiadO=ACQdpFmvy5cAGe0C_LzC3ZPjPVMs_22bUDTcFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 28 Sept 2022 at 16:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> As the Cortex A7 MPCore Technical reference says :
>
>   "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>   uses 16 double-precision registers. When the FPU is implemented with
>   NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>   This register bank is shared with NEON."
>
> Modify the mvfr0 register value of the cortex A7 to advertise only 16
> registers when NEON is not available, and not 32 registers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>



> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7ec3281da9aa..01dc74c32add 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          cpu->isar.id_isar6 =3D u;
>
>          if (!arm_feature(env, ARM_FEATURE_M)) {

Can you explain why the test is put behind the !ARM_FEATURE_M check?

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +            u =3D cpu->isar.mvfr0;
> +            u =3D FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +            cpu->isar.mvfr0 =3D u;
> +
>              u =3D cpu->isar.mvfr1;
>              u =3D FIELD_DP32(u, MVFR1, SIMDLS, 0);
>              u =3D FIELD_DP32(u, MVFR1, SIMDINT, 0);
> --
> 2.37.3
>

