Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B804944F9C1
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 18:22:00 +0100 (CET)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmJCY-0004vN-PM
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 12:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmJBW-0003kN-8W
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 12:20:54 -0500
Received: from [2a00:1450:4864:20::42f] (port=38641
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmJBU-0007dg-4e
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 12:20:53 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u18so25839466wrg.5
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0GaARxGD+SE60SqGCTY0bjpSpup/KzOCXsExYeIS1wM=;
 b=K+a7e+TCnq6G1t7sQaKI/VPaqpM4TejRBAsgfhMrn8vW+UxB0a+V3jK8iGJqNJBder
 MIAAYxfDrcpJL0FYkiyO0M/zbG9LpbfK3VGDZsRCXADDYrzJheOs5ljue/fTiRRbCFuG
 SV3BaXadX4VFXa4KWtI0cq/aXdO0RM1r1eb/49dg/L1o+JvcCKTsA8EY0FQW00VGIEbI
 Y2r1iiBW8gle7AT4sPaUi2m4OzKpIjNKJIBOpVxzldtlAg93mp7333ZnqMos49brSNm0
 p7kVAnSg30Kzu6o+PpUWad3C3MiLv3AsS9pnTXKKsCctd2BDIsdnycuqR0zmlmjmW/6Q
 kdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0GaARxGD+SE60SqGCTY0bjpSpup/KzOCXsExYeIS1wM=;
 b=TPh9mkEf/hUggRukZeWn1nSvF3k8z3L9NLG4GnPLHLPB6BrmHsDLxP4AwkK6Sh6iAW
 anrnZfhRzROu0Stg1/xl/BFx/0uCt4cEIGal38kgQf1gxnPVnh0mqW9Z26zJM+v4MggC
 FHvbZvtaMZHfs/4IDXkcNVAV1n0IWixrUqp2IIWo6WXa4I29xXhIcISS0Q8V5ZXayJ6Z
 y74/KwOcj+dGPuIN3HS5XJtJiEWoaeqg//yBCylE1Z8AUVuaieuCWx49gP0WScrr3W5E
 D9qzgGfLpb+fgslZKUnSEitB7hoXcArb9oViu52afdqEYWzBKkA2h2jU7qmoHBbWjNP1
 qYxA==
X-Gm-Message-State: AOAM532c2f+tjLfvS10Zj10rtlcvUT0CW/tq+sLaFiNwZl9xTRtOjDfn
 3broAgpvkUqSlkjhaJQTFPQDpcoxBUhKDJF9S5GI3A==
X-Google-Smtp-Source: ABdhPJyQOfg/11FRLk685grtJU8JpllJnyxBPJfApAHS83iHsB3U6xcRlUz9/O8nDibtVv1+6bNIxAm9GR8geWySzZk=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr38637898wri.376.1636910450610; 
 Sun, 14 Nov 2021 09:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20211114105645.16841-1-agraf@csgraf.de>
In-Reply-To: <20211114105645.16841-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Nov 2021 17:20:39 +0000
Message-ID: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wrote:
>
> When we expose an SMC conduit, we're implicitly telling the guest that
> there is EL3 available because it needs to call it. While that EL3 then
> is not backed by the emulated CPU, from the guest's EL2 point of view,
> it still means there is an EL3 to call into.
>
> This is a problem for VMware ESXi, which validates EL3 availability before
> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>
> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/cpu.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a211804fd3..21092c5242 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           */
>          unset_feature(env, ARM_FEATURE_EL3);
>
> -        /* Disable the security extension feature bits in the processor feature
> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
> -         */
> -        cpu->isar.id_pfr1 &= ~0xf0;
> -        cpu->isar.id_aa64pfr0 &= ~0xf000;
> +        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
> +            /*
> +             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
> +             * there has to be EL3 available. We merely execute it on the host
> +             * in QEMU rather than in actual EL3 inside the guest.
> +             */
> +        } else {
> +            /*
> +             * Disable the security extension feature bits in the processor
> +             * feature registers as well. These are id_pfr1[7:4] and
> +             * id_aa64pfr0[15:12].
> +             */
> +            cpu->isar.id_pfr1 &= ~0xf0;
> +            cpu->isar.id_aa64pfr0 &= ~0xf000;
> +        }

This is tricky, because we use the cpu->isar values to determine whether
we should be emulating things. So this change means we now create an
inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
unset), and depending on which of the two "do we have EL3?" methods
any bit of the TCG code is using will give different results...

-- PMM

