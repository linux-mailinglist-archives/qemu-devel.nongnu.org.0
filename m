Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D23B7052
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:51:59 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyAPO-0001HS-5P
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyAO8-0000I8-Ko
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:50:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyAO6-0001HX-0v
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:50:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id n20so30460638edv.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vorSwdVG0i0KPl2OP1yp5v2XNR2rdWWGV7ycT4N3POI=;
 b=nWScd7wiFRo7DpLq01agugJ87wKaX5y63JENEypeowwi6tu4PQ3MAWJJRHvr8KZQVT
 hVKgRglXmpgULjGQuawX2kKKH6Bk/bQj3Edu6jN0+ONH1CHxchSV1xVWVTl5lzibLdyn
 JDQh5MLqtAvU3jBKsoN3EMqjijMs0HCUHvUZCTkR7wQqv7qQSojKgigof8y8Q64kHxsu
 wRFlTKUsQHxzEF4FDrhUg6NovKxJj4DzFfz7sasy9/nxqCrbzh4UJJj5uKBUkv2yGC3i
 MfiVV8/KSFvDjvVbJY0cHaneTEU6RFpk8RwRnWFaN/hcHk6m3HZGQoDKBXWNefMHk/1S
 TFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vorSwdVG0i0KPl2OP1yp5v2XNR2rdWWGV7ycT4N3POI=;
 b=FoW/dFGWOehdRUZQMFj684w4oHzkTmcBgACSo+mwH0Soe1FYCHJ8RDFF2a5IdUOTmF
 cFEw/4fRu/S/gFOEe6D8GD/b/zGP+nterVcrW1v2XV3fN9Xk52ESKC5unfYGWntpDpLo
 0AoXHXjfyrBKx+jvziHVWxA15DhvPDhmMajsyNnGjW4T0IuF3tWA9Rs+mNKClUGzaccC
 wLoRbypffkV/KyWtvIoXM9gaZDjkak0cTLJvPXmyn1z2tMBnF6zkeYC0EczZhIUprsFv
 1F5iHovEFhcCvgkp8IQIo/wrE14A04JoIfb6R2igrAJikl73sQ7n6IsZjeP/ZVQj69Vh
 3wyQ==
X-Gm-Message-State: AOAM531Uk31yPFtktcURhNeko6lbo4q9iDtu48/ePbmSIZ6A5ZcRgjuL
 ivS3nbjWJdp88NTS2/gfZLzek3NVCAF/+9s03V1v2g==
X-Google-Smtp-Source: ABdhPJySsqvs8UdjpbMaBXwRTzeUaLXW/7Mx7Mj/SQyxn93BEqnbx1BJHekC01pPeakteyoV8Ka7lkK/TtLwzMIZiGk=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr38906671edd.52.1624960236444; 
 Tue, 29 Jun 2021 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210629082713.31396-1-hnick@vmware.com>
In-Reply-To: <20210629082713.31396-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:49:59 +0100
Message-ID: <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: hnick@vmware.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 09:27, <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..7267af7924 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       * We don't implement the configurable EL0 access.
>       */
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },

This fixes the encoding for AArch64, but breaks it for AArch32,
where it is cp=14 opc1=0 crn=0 crm=1 opc2=0. Because this is one of
those system registers where the AArch64 and AArch32 encodings
don't match up, to fix the AArch64 encoding we need to replace
this ARM_CP_STATE_BOTH reginfo with separate reginfo for
ARM_CP_STATE_AA32 and ARM_CP_STATE_AA64, something like this:

    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
      .type = ARM_CP_ALIAS,
      .access = PL1_R, .accessfn = access_tda,
      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
      .type = ARM_CP_ALIAS,
      .access = PL1_R, .accessfn = access_tda,
      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdscr_el1), },

thanks
-- PMM

