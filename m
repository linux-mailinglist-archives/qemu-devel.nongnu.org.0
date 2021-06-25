Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B93B42CE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 14:01:46 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkWn-0006Ld-Uf
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 08:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkUA-0003uB-8G
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:59:02 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkU4-0007XM-AC
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:59:01 -0400
Received: by mail-ej1-x635.google.com with SMTP id d16so11238071ejm.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDLNWQpvFdLZlLS1A+C+hm97XGNq9lsltKtbdrTL57E=;
 b=K7JiF7D9AMjQD/Hwo03KlGcIMqEcObeAprmeF6uPK6eW/Rk8nwxAt2MTg2EpcvIjr/
 xi9zkkTHB+O3BwFzvxqAwhlaudDsUsBU6ZtcBZy9kWyVKmscxlbx7Imq1jCU6H0j3a0n
 9bTimYY5stRfAt0hi5CV2nxq7Tll2D/6N2Ge/BI+MmVRHIo6AyEvCrh0oUP4IJROKPRC
 jrIakZH9heajuIGgTfX2eFJKP/Kjc0UVBFwKwy/RAmVs5a840sqEfeMPbaBGrnxdrE75
 XprP98WXnrbngRrSaO8DdBIlQlWKrgw65HzQ9e3vvKQgBr/DZVmkO1u86V6OjpkDudPs
 4APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDLNWQpvFdLZlLS1A+C+hm97XGNq9lsltKtbdrTL57E=;
 b=TV7dPDk0FypsiIw9/cb8WtMsswwkc0jIXyS4z0HryucNrVRwyXZAHWPUV46hnq2lVL
 fJeiMT9k7C3okIDX6BT1VJPT5aQwAPyYWAK10T0NJoEOoo91jKYk4/ojwVqVuDrJsmPz
 Tkf3w3HsPjP2eZpbqZNb+wDN/Y3SyfSVUtWdqCWgL/KUzonr8cEpGsv2r/Qz3L7VujCl
 11UJyXV2AZt6M5L2hMusVczg6+Pii0JnOr1nI5rHR4FAX0+wL8C+oH9mfiAlCEWXBVyW
 nhUn7XJNj0ueB1Cx6G7l5l5Mq0QxUKMUJL9IykKmzCE/IoAEdSeNdDEiqrHZ5Vr0Xpdj
 7yUQ==
X-Gm-Message-State: AOAM531ec4XzK4S9L7V180MzSx/CsOtz8IU/4VZrwk0DPCKGeLuhT0P+
 e6ILXZJbwWxMU1kjyiKFc0fxDBN7ypTzJ/Nj880FPQ==
X-Google-Smtp-Source: ABdhPJzj19tqG2PkIsWNDO5wh4TnKgntOT6nOSuFJviEGNa2juY9tR4MQizSUb6heuxOOYdBmzNjXP3heVa8FMOjarw=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr10636211ejc.85.1624622331048; 
 Fri, 25 Jun 2021 04:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210625111842.3790-2-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 12:58:14 +0100
Message-ID: <CAFEAcA9Q9kc2-8h5xprg1FsKf3F7Uo7DaxMftecWgZFFoWYWXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm/virt: fix irq mapping for gpio_pwr
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Fix irq mapping for virt machine reboot and shutdown
> interrupts triggered from ATF code.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4b96f06014..d83f4ebdd3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -846,8 +846,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                             "gpios", phandle, 3, 0);
>  }
>
> -#define SECURE_GPIO_POWEROFF 0
> -#define SECURE_GPIO_RESET    1
> +#define SECURE_GPIO_POWEROFF 1
> +#define SECURE_GPIO_RESET    2

I don't understand why this is needed. QEMU counts its GPIO
lines from 0 for the PL061, so wiring up lines 1 and 2
should be no different from using lines 0 and 1 (either way,
we tell the guest what lines to use in the device tree).

-- PMM

