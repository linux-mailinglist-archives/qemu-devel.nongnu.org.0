Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611003DF19D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:35:50 +0200 (CEST)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwSK-0007eE-Tt
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwQr-00064Q-Pk
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:34:17 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwQp-0007id-0U
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:34:17 -0400
Received: by mail-ej1-x62e.google.com with SMTP id x11so36075980ejj.8
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lk01qkJWsoAOcI68Wyk5wrcqsTLwGjKQSvWH5LgTiGY=;
 b=R96WzYhf73Zl8huHbCd0eNua5klVn9Ami0y4p3Up2PCV+Ze6Bz6OxIcyLX5rJbDZqm
 k3mVGuzEuwlNz4KyxvpHlUEF7RdN1MqYc4TKa8rxX5PNoOPEvvofMTotZKPCcqjtTw3Z
 +WQSIiHIFWc4+H3SSkz9xNmZ8GsNrm1SVOAiHKcC13Ayzr/Mfysg8vhrS/6p7P6XlRbd
 +YJte06uMvQI+UWLiIat2FDPdraNt51SSHyOwOoMEvWs7484so7D+756z1U9N20ck2ul
 XiU/pKpxlIc/bQ5G7bNDoBVNxBI8h97b8WdkcucaPdejS/DrbtZcfWcehG8INxyUFNvu
 cd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lk01qkJWsoAOcI68Wyk5wrcqsTLwGjKQSvWH5LgTiGY=;
 b=hKFKWOt1s2vich4c1RsN7oKTgcYpZb2E8Uf95Y3QsRzuKXMGHCun3/tq7O8+FrICxr
 PQ1zA8zDydfAViCn+dQ0zL3YyqtQGRQvkZpYYFTs2qVOQBbsafXQmuDo2KEwzwDtEVZs
 D0b57oyLqxq94OKfOWRWccygVbmRPXYx2odDFWtLBIM1hhDE94XDmQRgaCpJ59KOaP9l
 4UeKNbHtbGWM73dnRzHJhMGlJksepkfxl6vEdzNjJ3maibWFYlHzXzuXhZLNzG8QHYEc
 /o7YKHEp2DyK7SEvSviSV561rOcGJCqwbc7mWON2UIns3mkLANoAQQVz7B0miTXN3orO
 d82A==
X-Gm-Message-State: AOAM530kakRRu2SA48O0l05AyMi8M2zIrR1eJpz+pQ4gDUkNKrl8mHEa
 asgsb7J64L5jFF4OTeeM/ZWhyETrWPW1Q5PpaOy6pg==
X-Google-Smtp-Source: ABdhPJx+3qVwGwtUddJ7SJQ94A59Qkvg2DVs5DZrIzMzrF4O2gMzwv9pzaFCAAQ0Xkk/zcr235h3ihpEmPFGrwUxofI=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20905112ejy.407.1628004853277; 
 Tue, 03 Aug 2021 08:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210726163351.32086-1-peter.maydell@linaro.org>
 <20210803142947.etblpkgynnna3mvf@leviathan>
In-Reply-To: <20210803142947.etblpkgynnna3mvf@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 16:33:29 +0100
Message-ID: <CAFEAcA-aP=24wEsRN9QJCxELv5qgULjfWVupcfCXaEsHiMUMvw@mail.gmail.com>
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 15:29, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Mon, Jul 26, 2021 at 17:33:51 +0100, Peter Maydell wrote:
> > If the user provides both a BIOS/firmware image and also a guest
> > kernel filename, arm_setup_firmware_boot() will pass the
> > kernel image to the firmware via the fw_cfg device. However we
> > weren't checking whether there really was a fw_cfg device present,
> > and if there wasn't we would crash.
> >
> > This crash can be provoked with a command line such as
> >  qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> >
> > It is currently only possible on the raspi3 machine, because unless
> > the machine sets info->firmware_loaded we won't call
> > arm_setup_firmware_boot(), and the only machines which set that are:
> >  * virt (has a fw-cfg device)
> >  * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
> >  * raspi3 (crashes)
> >
> > But this is an unfortunate beartrap to leave for future machine
> > model implementors, so we should handle this situation in boot.c.
> >
> > Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> > before trying to load files into it, and if it doesn't exist then
> > exit with a hopefully helpful error message.
> >
> > Because we now handle this check in a machine-agnostic way, we
> > can remove the check from sbsa-ref.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Leif Lindholm <leif@nuviainc.com>
>
> However, the subject line threw me slightly. How about:?
> "Report error if trying to load kernel with no fw_cfg"

Yeah, in retrospect that would have been a better subject.
However, the commit is in master already (dae257394ae5) so
it is what it is :-/

thanks
-- PMM

