Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CA4A67D8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:23:03 +0100 (CET)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1YE-00063E-1Z
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz4G-0000NN-Qv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:44:00 -0500
Received: from [2a00:1450:4864:20::429] (port=39926
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz48-00049v-Sj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:43:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id s9so34022358wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WUEeYNPOa6KPrLQCOTlEC8GWAy7O/61/UC48ILxp/o=;
 b=bFzeMW9L8Es/3K5/XhGt0T/2xDszvFu5lhe12rcnxr3aw/pGnHIwOQfqljy2mBnfiq
 l4Dm31tF9/RqY87yb4LeCOene8+dQ0tMwysuMv9ydXzgRnw/G5vb/XMqqTKe+Up7/ji9
 iiug+yNk2GTGgm66kMY/+GzIsvWjUlriBc1LmH4b/+SkGkePJyi+2tkH0er0zwUmUpml
 2/4VoKvqpnvw9Hi888g24cSAlrmte09FlNAdxxJL/vc1/XAw/bB+vcw++OItKbkehurr
 adx1+MqaqCv8NHcuvUxdnRQl1l9CQpQ1tGiSMJMPtcuaCtlIao+zP6/kRxiWgshhXrBK
 BE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WUEeYNPOa6KPrLQCOTlEC8GWAy7O/61/UC48ILxp/o=;
 b=42CAtz8+Y3bo4rQeKeOtU3QlZ8zJBxykOqUxjDhlKD4v3hGi4146n7jkKjGKBU4hme
 UUGLdEG0WAflOqCWkzFLoPycs7g5+0GQSPGbsj8BYhgA2Nm0/wwHSQfDxqrctcNsiuqo
 1eHeEK5vjgLlkojVA0mcYFZvOpKY6xBJKvDCjeB7f/VP/Rr5e2qxFM1pGGit5tOe6Ole
 Qw2I/nxxHJ8BLp5XsEiJZT0ceph48tCAA6KyRVoS4O40uzHx7jR6tu/rWT9/zGAdRzAj
 LcCe3e6tmNgxbHxRxTjzM7YdciulynBsiplef/uCjsNRjsxizabLE7NTn0RFJqu4kVaX
 XJZw==
X-Gm-Message-State: AOAM533veI0Wwi49n2e0L2PhBhGmy9OpLxzpk0tXJJyNI74RXmskjWjZ
 Eq9DimjNEsYvj4VCek2TVAaFj5GR45OtjDQOdM17yQ==
X-Google-Smtp-Source: ABdhPJx4z5LeQk5UzeztM1DWg16n1ba4pJKTHDrgAC8pGnrEH5m+CxvXpTk/wJtBAg1hAaFxIEqQN7XsCa1fSVXG5eE=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr22101663wrq.295.1643744622619; 
 Tue, 01 Feb 2022 11:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20220201192650.289584-1-git@rpls.de>
In-Reply-To: <20220201192650.289584-1-git@rpls.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 19:43:31 +0000
Message-ID: <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
To: Richard Petri <git@rpls.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 19:28, Richard Petri <git@rpls.de> wrote:
>
> Starting the SysTick timer and changing the clock source a the same time
> will result in an error, if the previous clock period was zero. For exmaple,
> on the mps2-tz platforms, no refclk is present. Right after reset, the
> configured ptimer period is zero, and trying to enabling it will turn it off
> right away. E.g., code running on the platform setting
>
>     SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;
>
> should change the clock source and enable the timer on real hardware, but
> resulted in an error in qemu.
>
> Signed-off-by: Richard Petri <git@rpls.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, you've saved me a debugging session! I had a bug report about
a problem with the systick timer a couple of days back, but I hadn't yet
got round to investigating it, and now I don't have to, because this
patch fixes the reported failure :-)

-- PMM

