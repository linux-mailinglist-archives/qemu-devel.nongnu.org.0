Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCD2C7901
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 13:01:14 +0100 (CET)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjLOD-0000fn-UY
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 07:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLMR-0000Dj-Tq
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 06:59:23 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLMP-0008AP-Ef
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 06:59:23 -0500
Received: by mail-pf1-x442.google.com with SMTP id 131so8431546pfb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WY6cvZMELb0mTfjPIHMywFzcsPrOBXzOLmlABZGdTGM=;
 b=kNpuW1kwmG0ntK1JCGkit3tyAcOxGVJC7mWaBEb+XrvfmzK1WP0V7d4YBwkZHIlhMe
 6manZmApjIg/qPV0Z8AoTtzEbbeAKkREphLku4xludOSiXPffFURyKQAb0yhTZuPagih
 ouEhjH+hgCBr3Hrz+9/qEiSlRyBmMXGiHAIBt9LbDWqDdIRSfplMdHH4K1FgMAF7xTPK
 my3djFmRHCCjjlBJN0CZ5DzTPI7nvZGdGttlRU6pn5tvoWCJACQGNaLejAc3O0Ct6fE7
 68nmmFJnHK3ZW+ebo/EjJnuc7pt6v3ntRnt2A6AUeAx0jwOTTWPwYA8nt1a+0H35wXJ1
 V0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WY6cvZMELb0mTfjPIHMywFzcsPrOBXzOLmlABZGdTGM=;
 b=tUT5C7VV4F9nVQWHM4jefEBW629SF4yIeDuOtmwHYfXzSQT4Ud6v4IY3XwhPvfn5Ka
 OVL1ycAZaskZER8EQqoO0xq9BWn3rA6rx5q9y7pk3qrQ2yfBeLqOy/zULPwKX8oOvFKu
 SZsaJaORx+CwnPGvT6TlT41stKV1i14NN8aHqSt/c5BSf/Crztsym8weDNYoYWa3gD+w
 6kgQYF5vUAee5h3MVGASpq78CiDtPHOKd9Pf5UlfgcpsGNE8tVJUrg3y45z+PBS+/9Ql
 M7aDZSy4u0MOuFpxCZbPil8tgWyHeQI1tgpTy0+9KadsjjrdcD0yj5Cw/alJupzP7ftc
 ixzQ==
X-Gm-Message-State: AOAM531GSR/aaq2jadquefhu3hhPnVOfY+wxvr6i7PgtJ8YgEya/FN+p
 Y3gdrrRv3hJamYcdQk262Gk=
X-Google-Smtp-Source: ABdhPJzpyWScJfkLY6Tk9JiH47FvuSbW2Ad9+G6GH/oBLjNCNAk0a+Htn21Qkzbh58XZ8V+XOzT4tA==
X-Received: by 2002:a17:90b:1a90:: with SMTP id
 ng16mr20514500pjb.58.1606651158756; 
 Sun, 29 Nov 2020 03:59:18 -0800 (PST)
Received: from localhost (g115.222-224-149.ppp.wakwak.ne.jp. [222.224.149.115])
 by smtp.gmail.com with ESMTPSA id q6sm12490508pfu.23.2020.11.29.03.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:59:18 -0800 (PST)
Date: Sun, 29 Nov 2020 20:59:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting IRQ to multiple CPUs
Message-ID: <20201129115911.GD3168563@lianli.shorne-pla.net>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
 <20201127225127.14770-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127225127.14770-2-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 10:51:25PM +0000, Peter Maydell wrote:
> openrisc_sim_net_init() attempts to connect the IRQ line from the
> ethernet device to both CPUs in an SMP configuration by simply caling
> sysbus_connect_irq() for it twice.  This doesn't work, because the
> second connection simply overrides the first.
> 
> Fix this by creating a TYPE_SPLIT_IRQ to split the IRQ in the SMP
> case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/openrisc/openrisc_sim.c | 13 +++++++++++--
>  hw/openrisc/Kconfig        |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d752282e675..a8adf6b70d7 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -34,6 +34,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
> +#include "hw/core/split-irq.h"
>  
>  #define KERNEL_LOAD_ADDR 0x100
>  
> @@ -64,8 +65,16 @@ static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
>  
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
> -    for (i = 0; i < num_cpus; i++) {
> -        sysbus_connect_irq(s, 0, cpu_irqs[i][irq_pin]);
> +    if (num_cpus > 1) {
> +        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> +        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
> +        qdev_realize_and_unref(splitter, NULL, &error_fatal);
> +        for (i = 0; i < num_cpus; i++) {
> +            qdev_connect_gpio_out(splitter, i, cpu_irqs[i][irq_pin]);
> +        }
> +        sysbus_connect_irq(s, 0, qdev_get_gpio_in(splitter, 0));
> +    } else {
> +        sysbus_connect_irq(s, 0, cpu_irqs[0][irq_pin]);
>      }
>      sysbus_mmio_map(s, 0, base);
>      sysbus_mmio_map(s, 1, descriptors);
> diff --git a/hw/openrisc/Kconfig b/hw/openrisc/Kconfig
> index 6c1e86884e2..8f284f3ba04 100644
> --- a/hw/openrisc/Kconfig
> +++ b/hw/openrisc/Kconfig
> @@ -3,3 +3,4 @@ config OR1K_SIM
>      select SERIAL
>      select OPENCORES_ETH
>      select OMPIC
> +    select SPLIT_IRQ
> -- 
> 2.20.1


This looks good to me, I don't think I ever tested networking with SMP.  Thanks
for the fix!

Reviewed-by: Stafford Horne <shorne@gmail.com>

Can you help merge the patch? I am not working a queue right now.

