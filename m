Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCF30055C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:28:02 +0100 (CET)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xPt-0004Il-8P
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2xOR-0003EI-LV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:26:31 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2xOP-0004fT-Pu
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:26:31 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g12so7908617ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rN3gOLQkc33v0tiE4Jc2QQ/mNgzRk5V//fC52OuuF4U=;
 b=ex+v6ejA3n/VJYPSoQ0vD7PDRsHvv9frQtB6zq+mEsyeBCURQs0Ff342zr6KX+rVhB
 Bxa74DiU/RCmMKJpq+Y4bnKw/py9uovbUHKNNWIcUJEA9Jq7l7bAmT1nC/D1doxET6RT
 wiqIIjEo+G1yIpBicO6VBu7KYVEfNW/G64Rb5V35JDU8INaGLnKir7DVXzsJuTxFBQUi
 6RcdHMYQd+0dbHfrQpjmaADnNgg+xlmSwiEjGuPPBtY+LsvTyTKGTqirEoM6NOM3xkht
 0vv88R94wbms3AhfdvH5LVotgSk3ysMqvow0yp3GjeenURhPhtM0WTOGSoBST1w8SUI5
 eacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rN3gOLQkc33v0tiE4Jc2QQ/mNgzRk5V//fC52OuuF4U=;
 b=UJBKEJYR5+LKE6Wi713IFkrorIIjezDaUiJxNbc8kcsO9cxh0V7MOoLwJY2ZsZJvrB
 ieU4mq3Z32IWARJQIuq5gbZVSeY4+2shtr7GnK03L7iWRQzKwFxS2ad4zzX4IMCBN1qD
 wYiCyIfl+r/odE/StP0bqYZfkrFPexhi7kYQAIs30R3UBXDrOrkMAfZhMf7IaMWSIOs2
 XHePlFmTBUPQ+U+f8C87+rInswDajEmDEB4X2BXPHOEIXVrboPKupolAt2WoMvEJQBsx
 eWaq6B4dbAHENImUJleaIOPnESR9gVqAutxpNTyg01U/UTPAyzzuUMjHM/xwUPpoq9oR
 bFpQ==
X-Gm-Message-State: AOAM531S/2eBW8Rw6uUaB7f6QbcuN86H1Xv2REofD+6QwGIOh8G1hJ/W
 PM4WW2JONr/HOqxTQUGOkKpk38uM+Wtdu+dJSoWSnA==
X-Google-Smtp-Source: ABdhPJw18HHWKLrQqILeyL2MMyklC/GPSLqNoLc3sdlVo3Mo+8/tVH+jtJOqazl3JMl/f3J4wEvTBKXIyW6HH1a8sss=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3260768ejd.250.1611325588429; 
 Fri, 22 Jan 2021 06:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20210122103629.5412-1-damien.hedde@greensocs.com>
In-Reply-To: <20210122103629.5412-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:26:17 +0000
Message-ID: <CAFEAcA_r7Qx74N_o-kOiFp6HhHC26XuXO0Gv68=GforThYiNdg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/core/resettable: make in-reset state false during
 exit phase call
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Michael Peter <michael.peter@hensoldt-cyber.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 10:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Move the reset count decrement from "just after" to "just before"
> calling the exit phase handler. The goal is to make
> resettable_is_in_reset() returning false during the handler execution.
>
> This simplifies reset handling in resettable devices.
>
> Typically, a function that updates the device state will just need
> to read the current reset state and not anymore treat the "in
> a reset-exit transition" special case.
>
> As a side note, this patch also fixes the fact that the reset count was
> not decremented in case of recursive reset.

This seems like a reasonable change and looking through the
sources it shouldn't break anything.

> diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
> index abea1102dc..021a7277a2 100644
> --- a/docs/devel/reset.rst
> +++ b/docs/devel/reset.rst
> @@ -210,9 +210,9 @@ Polling the reset state
>  Resettable interface provides the ``resettable_is_in_reset()`` function.
>  This function returns true if the object parameter is currently under reset.
>
> -An object is under reset from the beginning of the *init* phase to the end of
> -the *exit* phase. During all three phases, the function will return that the
> -object is in reset.
> +An object is under reset from the beginning of the *init* phase to the *exit*
> +phase. During *init* and *hold* phase only, the function will return that the
> +object is in reset. The state is changed just before calling the *exit* method.

There is no "init" phase -- the documentation and the data structures
name the phases "enter", "hold" and "exit". Agreed with Philippe
about saying "beginning of the *enter* phase to the beginning of the
*exit* phase" (but an ascii art diagram is probably overkill).

thanks
-- PMM

