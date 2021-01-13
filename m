Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D92F4F80
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:06:44 +0100 (CET)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzifT-0008Qj-Sf
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzic3-0005ro-Sx
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:03:13 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzibu-0005DC-A8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:03:11 -0500
Received: by mail-ed1-x52e.google.com with SMTP id b6so2016531edx.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YxAJpdTI+/Qbw4n1V8bDeR4ZYLLTmdtO+vBg2Xrg58g=;
 b=Jvsh96uZPDSAbP5zhCGcAunvftjfNNe5VBPQAilD5iyIanJ+ufd+enHSc9B22hhkn7
 k0PwHi87ouWB6+bg0nBbRO22IL7+xJB1jYAG5cq0jI+LHRDf4f9Fbf4OHOI9bJeXY8L5
 NHbhbfnqQbzmMaXPeu1jfSne4DP9HT78Pc++tbSmqLt4+B/d22wB57XnSSUXXwDZye9g
 5Vi+HXM3lULu/rcnTIx17yarUDM/s0voqOiLybRCE8eFd+UxBjHQzJ5Eniltkqm3y4b3
 BY4Eiq+Ik1GnmUFVtdWo4ni/KO1wUy/hWpBnrRvKnG+ZcneG3zybMnjT53dFdPX67jf+
 ZX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YxAJpdTI+/Qbw4n1V8bDeR4ZYLLTmdtO+vBg2Xrg58g=;
 b=HxGjKaAj3UWeKhAPIl3Wek7X2IxIeqWe2bbHz4EjgYiqvblwg05U8W7+/mFz3issBN
 PuPOR33tPv4Gtsp5JpBtCLGpwwsyx6m6zkJIEYocgAvvsnwfctxbZN+CVwyhAZe89FZu
 7bnj+WBfTi0kxYS8uREphv1Dsmr/Ip+i20ksdy8k5TZGVMtBsgfrmpJWSfpFz75hDy+q
 iQHJ59ZusOAaVJ8iocXSYoNptUDOA1UF65AU0e5jlUsu0IN6sGL8flbr0jPQ1+93xHov
 IhFwh40/g8Tyat621fpJJD897QOdbKOsxRa1c//PRVcnDyo9cnN1n5BPA5RvvDvULhN0
 wUTg==
X-Gm-Message-State: AOAM530O1eUEs551AVQFAlb2Uq3Zhzkwk/lqE+zfjwkAWA7rXGmgWMFi
 61hBwPbRmGENlWn8nq2JZpC6A3iS324HaSqDk80ddqVJx+A04w==
X-Google-Smtp-Source: ABdhPJziYghPjt15ooVvD8xpVg94DcTM+FaZv6JfO5VF4Z5cbRp266juuaHnI0Muzd/hWZpzATMFmXfk+YBpDQ7ReZQ=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr2292983edw.44.1610553780090; 
 Wed, 13 Jan 2021 08:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-19-peter.maydell@linaro.org>
In-Reply-To: <20210112165750.30475-19-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 16:02:48 +0000
Message-ID: <CAFEAcA-yMwWc6vtA=E1ysZtxuT3w_h4Kquuj5pqxZB0sRD9HJg@mail.gmail.com>
Subject: Re: [PULL 18/21] hw/misc: Add a PWM module for NPCM7XX
To: QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 16:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> two outputs: frequency and duty_cycle. Both are computed using inputs
> from software side.

Hi; Coverity reports a possibly-overflowing arithmetic operation here
(CID 1442342):

> +static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
> +{
> +    uint64_t duty;
> +
> +    if (p->running) {
> +        if (p->cnr == 0) {
> +            duty = 0;
> +        } else if (p->cmr >= p->cnr) {
> +            duty = NPCM7XX_PWM_MAX_DUTY;
> +        } else {
> +            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);

Here all of p->cmr, p->cnr and NPCM7XX_PWM_MAX_DUTY are 32-bits,
so we calculate the whole expression using 32-bit arithmetic
before assigning it to a 64-bit variable. This could be
fixed using eg a cast of NPCM7XX_PWM_MAX_DUTY to uint64_t.

Incidentally, we don't actually do any 64-bit
arithmetic calculations on 'duty' and we return
a uint32_t from this function, so 'duty' itself could
be a uint32_t, I think...

> +        }
> +    } else {
> +        duty = 0;
> +    }
> +
> +    if (p->inverted) {
> +        duty = NPCM7XX_PWM_MAX_DUTY - duty;
> +    }
> +
> +    return duty;
> +}

thanks
-- PMM

