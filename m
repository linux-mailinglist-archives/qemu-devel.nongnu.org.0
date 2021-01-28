Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0594307CBE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:39:32 +0100 (CET)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BGV-00040R-Ot
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BA7-0008IU-VI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:32:56 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5B9x-0004sb-56
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:32:54 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rv9so8940575ejb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KqTBMNBBEJ1sOhIslJwSqd9Q2bYRZH5ZzE5JPKV85NI=;
 b=Dx39f+XjCmmk79lsbVMqT4bJidCbg6iX/8HgTLxrgZy6SGaMuAH0s299HA7kGyKKFO
 Vad/vENRA2x1R45bM3OOspd62NXlLt3I2Wau3nVBQM/0RR5T8JWWHD584tEZ6vHtiTBd
 w+76Wn1AWP7nX0zome3BxZSUUA7H6avUkalQaWnUX1pKGLaR7TXT1D9JxM5bqwvmyKs5
 ibi5lsKIjwXdzRYkjQXEfwxtjH/vGWU+vY4hu2AERbrQzetFSOCRHQCNNh6gVHfFlugA
 Nlnf4g+NEUOptlLpCIYcoIYgN4cS0BY8HhFXSdJ9qG2oD9sgfNqKWYrxpXLsQuxjK8Iv
 b/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqTBMNBBEJ1sOhIslJwSqd9Q2bYRZH5ZzE5JPKV85NI=;
 b=fJAlLBmQuDLn2Slr5e4NxpGk2Oz9LVvYuf5kSxs2nGACb7doKSC7T0DL/Z0UxjDnoW
 ecxeLztoAJ8XDWolV2oaXiRPiOHfZNdanZrZ1uRjIbZfI7saNDJdsMKdm+FWi0rr0E/r
 hVnX03UGG7lxsjkksvhWEkPhLmoXsQ9Uq9uK0dB+KvKG4+zvjYmHiwmtIXk5AduOqFu+
 fTRsHRiosmCdCgbd9kqdrvM1kBjPsf34ygY80pqrPHoXWz3wcJAEYDT8swYwIqe7veNA
 BKCqxCgJiGWznHki0RuowQ2mzevIH3xFksnbJNg8PesXcxFOXdLRaek5PtjO4EfDxGSw
 kjiA==
X-Gm-Message-State: AOAM533Fths3dlvj5Y8Exvq7Q3QL4uG+pjFmcAkhlcG6/Oot301CIkpG
 /fwptbp7oNklabA9o2iNJy9+DNVoL3RKAMfqlhsfAA==
X-Google-Smtp-Source: ABdhPJzdNotn3nWcAO9ijxsBL/0dE+zhxY3PT6heTGmrGqX4TiFoGFTu6MLOf9djFpZ9aSAVdDM/0ayANqrbsymTvPk=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr522098ejt.56.1611855163813; 
 Thu, 28 Jan 2021 09:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-4-wuhaotsh@google.com>
In-Reply-To: <20210126193237.1534208-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 17:32:32 +0000
Message-ID: <CAFEAcA80eo9X1v180D6msDsgd7bEkLfuSNmxggKPF256jJqLBw@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/arm: Add I2C device tree for NPCM750 eval board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 19:32, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add an I2C device tree for NPCM750 evaluation board.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Slightly confusing commit message, because "device tree"
usually means the data structure describing hardware for Linux
(https://www.kernel.org/doc/html/latest/devicetree/usage-model.html).

Something like "Create the I2C tmp105 temperature sensor devices"
would be clearer, I think.

> ---
>  hw/arm/npcm7xx_boards.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 3fdd5cab01..2d82f48848 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -98,6 +98,20 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
>      return NPCM7XX(obj);
>  }
>
> +static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
> +{
> +    g_assert(num < ARRAY_SIZE(soc->smbus));
> +    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
> +}
> +
> +static void npcm750_evb_i2c_init(NPCM7xxState *soc)
> +{
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);

I assume these correspond to temperature sensors on the real board.
Might be worth having a comment saying what their function is
(I'm guessing they're measuring temperature of different bits of
the board somehow?)

> +}
> +
>  static void npcm750_evb_init(MachineState *machine)
>  {
>      NPCM7xxState *soc;
> @@ -108,6 +122,7 @@ static void npcm750_evb_init(MachineState *machine)
>
>      npcm7xx_load_bootrom(machine, soc);
>      npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
> +    npcm750_evb_i2c_init(soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> --
> 2.30.0.365.g02bc693789-goog

thanks
-- PMM

