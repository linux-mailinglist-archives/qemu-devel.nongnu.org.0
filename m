Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9683007BE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:49:52 +0100 (CET)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yh5-0004T4-QE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yfa-0003ao-2r
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:48:18 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yfX-0000So-Vc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:48:17 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ke15so8259485ejc.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+lz8JO+Ur8AgDwxtMFIGokAEwyuOa+bOuNenLzyYco=;
 b=Aep3mZRsiMe9ttRwraKqqP72qmMxfNNGabRyJFuBlUzRxtFcOl3Jbxe59YzDV6oRgp
 +MeJmMPX4ju/tgkbV4/NT5NRNIr7kOXk/QiKHwnDIKZVl9p13zHwIDXEcjEfIHpyl7el
 9DhsFoaFL2bYxTulOZQhrOAQx5p0fQEBBw0sjD3Fti8gMG8klvLMfeK6xW8dJxoOwx/2
 2oUBrqy7Jfg5s3Jz2XKgg11shvSn/Wkm17WlzygORVorw0aJB1VrwijCRQxn/gWkpCq4
 uuigEwwZHfqH1rI/2hy1JjFdvzNZuiVpmSuMzpGBwvQwzTBH7KaC0XtOdUh7wszkb85J
 cKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+lz8JO+Ur8AgDwxtMFIGokAEwyuOa+bOuNenLzyYco=;
 b=H9PogfsgjPG2wVxA0Soz41UDSDlE/wBbqI+ayhSHRLJZKH1WoN86Gbv7ExN9pNEPUM
 458dfyweQ7et/Cn4eQmK8iGrWx3c/lSVAWrtQ4TviblzYeoHa1ceKhM7ggATl9uP6ihs
 rEAeHs+3lfymaRw/0YdX+O6ALZ15z97JeNaIJ2NbK0x+CnH/nzf09/Xv+9KzhSHk92WZ
 43buOzL+wptzJ+l1aNvJgCnoW7pGdoUbNXaXMfUhafcdFsQ7Iq2c/i2/2b5K/CPWxtJA
 3b039UHuFdNPyK9WHIpYNyGz8/JCND/aQd89qU+lU1AwPwsLtrk/x4N6I5ssEb37uwVp
 9Arg==
X-Gm-Message-State: AOAM533M3FvP2wmfuBzyFaBgo+kjgBZMUSZfWdjxwhfo7vCe3KCPHAwJ
 WIjqOTfE7FgL1zXsTUAkLn+vBySaGpZOi98bR02rNQ==
X-Google-Smtp-Source: ABdhPJyNUD+5fUu7DEyETI62VUqIgflgAMvr1xzPfl9mHoimnNbH37rGTi+W3nlrZmqpjRSzQWOXyKu9JpBwcUi+OiI=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3516829ejd.250.1611330494472; 
 Fri, 22 Jan 2021 07:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210120092748.14789-2-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:48:03 +0000
Message-ID: <CAFEAcA9K3tfSw22bHgBR+sLgs+Hv=8WN7SnUPs2u0X0b2t2eRA@mail.gmail.com>
Subject: Re: [PATCHv8 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 20 Jan 2021 at 09:27, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

