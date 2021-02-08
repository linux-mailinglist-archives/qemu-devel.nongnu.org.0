Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250EC314267
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:57:29 +0100 (CET)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EXA-0003hQ-5m
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99l6-0002nA-SM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:51:32 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99l4-0007nU-7T
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:51:32 -0500
Received: by mail-ej1-x62f.google.com with SMTP id f14so25929926ejc.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aYJ8lgQqYZE2jCinuZNaFz28hLtPE8lqU4MDMluz9+U=;
 b=K6rNmRDeoQTt8khmec/otP4/vvG/ktfYPifViSB1UvCy2AmU/i7Njo6ijMbQXMkCHS
 cJ2tKXJK0SudaMAV5S3of4p/lBDMDB4IFhIgnFiPaKjNeDoaFXfaHkUkHnPEvmfxJHIT
 MoEq+v6HIFMMOfFTBSm/K5rRU+o6xmJEHRoqwpdMQyTbH/tnAgZ9sxq4HuBhSlcigwVw
 /t2smOfiStOxGsuT8T8aGCUzBxxt2AiYxFPS+zCm3Xtk7wQ2OSQHLHQ5wsoVO63KLApp
 E7/lqUrld0wKpK0ez22XODnO3FqOlpYvCWQ3PvBgs76fAPNXZHLgy0vDuXdJGAKnyqTN
 Vqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYJ8lgQqYZE2jCinuZNaFz28hLtPE8lqU4MDMluz9+U=;
 b=hudS9k+MhBW5uOBGAtKPk40AKmE3Rh5mcekUW3MwBnCQXLxF/SDe5HbFceaZcPqSup
 PDL+WJnpRHtaiWbkC5+v4coFk0P5d1dXMimNCsj2UJHII5iGWBXcMV3r+QiHwaSMl/gP
 sIpuqJpyPXlz9ZUdbDKxobqK5jzWDIH8Tckib9XxkyJmV0JijOevXF4WPlHy12iEVZun
 GRIcOhd69aZCsmsZBwQNahQ/16IcfLBDya53b1nTalM2oYLhZPu523xq9YcHguymgkGe
 j3OwLDwUdbyoVM3lJ8n18E2yUpDKun1Krivi742M9XqiuH8AjMm1bA2zrHjTBnXXAM+s
 YQ1Q==
X-Gm-Message-State: AOAM531bGw4eN25FYOb+h0bHUtvl63LledQ3sr43/uG0wcezsTmzHw8Q
 rW4MZeUgjEAk6+WbzLi+wU8VWfWtVpDA7azPPqDkRQ==
X-Google-Smtp-Source: ABdhPJwIeWx2C74GCPtrz6uiKeG9mot9HiHYlgFyowGm2qxuNjaQSCEvkgoH5Y2a7cHd4XKVK8LZzcs95JscFXZ2hA4=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr17865811eji.407.1612803086731; 
 Mon, 08 Feb 2021 08:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-5-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:51:15 +0000
Message-ID: <CAFEAcA8vOsGq4ef2ZwqiqZt7XLTJ0Zky8+-5NP6TjAKwbcByJA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] hw/arm: Add I2C sensors and EEPROM for GSJ machine
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add AT24 EEPROM and temperature sensors for GSJ machine.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  default-configs/devices/arm-softmmu.mak |  1 +
>  hw/arm/npcm7xx_boards.c                 | 27 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..d9805dd539 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -7,6 +7,7 @@ CONFIG_ARM_V7M=y
>  # CONFIG_TEST_DEVICES=n
>
>  CONFIG_ARM_VIRT=y
> +CONFIG_AT24C=y
>  CONFIG_CUBIEBOARD=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y

Rather than adding this here, you should "select AT24C" in
the "config NPCM7XX' section of hw/arm/Kconfig.

> +    /* TODO: Add addtional i2c devices. */

"additional"

> +}

thanks
-- PMM

