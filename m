Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DD2FB5BB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:40:57 +0100 (CET)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pNZ-0000So-0e
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pJq-0007Yr-3U
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:37:06 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pJo-0000MP-6Z
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:37:05 -0500
Received: by mail-ej1-x62d.google.com with SMTP id 6so28023668ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R89qZj5UKCLtQgoFay4PetKhi2tpRwPy4aJiyPuN8UI=;
 b=rODQBQfyU92g4nEXx3/FeQe5C6h3SivE6wpovOZW3pfYjDdXVXNYCVXZUnLC1MgXho
 sNyMWC+RGmw34xp4RvYLQx2VYXdK8M6GTPzah2FbJlQbrllduP0VGxoFGkwXcLpKR2/s
 GVqnMQZ1wZV8aMlF5KCKMleNS7e4rl13hpb9xDTzlKjPLlPgkJ7cODIfDh7O/hBzkuQM
 R8RTxcBmYQiXEDvkBIi5o2gpFWZfo3TeW8dw/4WUqkeNreg5aUOBqjDV1gWLu2cddmee
 nsrcYtqWAJAjLIz9FZOUtg7WrLYLwe5Ac6xRzqybJ5WO6r/jjmGzx60oPvvkTmCY5Irf
 VO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R89qZj5UKCLtQgoFay4PetKhi2tpRwPy4aJiyPuN8UI=;
 b=P+ZtLHM0y/zuXfvNPBXl1EkF5unXi5Sa807X8qAvw/34Lve9S53/6PqPHlKqNmKVQR
 w0tnLkbOzC9mmSqXlWmQd8oajR2srDcYDoEXVSAKfUbK2lSQ5aDWNT4ainHwPmTE017S
 PpcQWsQ/wEFhfIGderZdEb9Ce9gaPpWzm71Th7pentrguudVdSAd65vYnSx782sdf+jf
 7gnrAOgM3/71TrdAxDJaK/VyQLzocLLSJUHU97ldqCjQqh2rsrTnCbxc8mOMs6uIhNcX
 /vwlKGal97NGRa44kWZ+joZ/L2rY4cRyUylKE6LOXM8/ID92sipPd9z9Q3GwCHeiOWBx
 Ai3A==
X-Gm-Message-State: AOAM531+XSK21NRJwM8Gn96Zm10W+JzA8I85HuP3rEY7M/o+q2NKBcXq
 Wtx2sVfI56lJJ2EwVejcHG6pKC8Fle1d8FG+RChS6w==
X-Google-Smtp-Source: ABdhPJxXzkwNOKDCq1D8fzByB97q6/yqPjVxN7SdOqnc6ep6iGE8N28jNPD8HOZZWem4nnj8AfwosdX61vRlYnFswJM=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr2611168ejb.382.1611056222378; 
 Tue, 19 Jan 2021 03:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210115101126.4259-2-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:36:51 +0000
Message-ID: <CAFEAcA_OuwCT6w8LrxfiY1856UAOG4smL0jr2CrhrVETLhHz9Q@mail.gmail.com>
Subject: Re: [PATCHv7 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Implement gpio-pwr driver to allow reboot and poweroff machine.
> This is simple driver with just 2 gpios lines. Current use case
> is to reboot and poweroff virt machine in secure mode. Secure
> pl066 gpio chip is needed for that.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/gpio/Kconfig     |  3 ++
>  hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build |  1 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c

> +/*
> + * QEMU interface:
> + * two named input GPIO lines:
> + *   'reset' : when asserted, trigger system reset
> + *   'shutdown' : when asserted, trigger system shutdown
> + */

The comment says we perform the actions when the lines are
asserted...

> +static void gpio_pwr_reset(void *opaque, int n, int level)
> +{
> +    if (!level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    }
> +}
> +
> +static void gpio_pwr_shutdown(void *opaque, int n, int level)
> +{
> +    if (!level) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }
> +}

...but the code performs the actions when the lines
are de-asserted, ie when they go to 0. I think the code
should be "if (level)".

thanks
-- PMM

