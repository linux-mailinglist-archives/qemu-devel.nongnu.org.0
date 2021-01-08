Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF30A2EF230
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:17:00 +0100 (CET)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqhP-0004KX-9m
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqfh-0003nS-55
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:15:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqfd-0005mx-4A
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:15:12 -0500
Received: by mail-ed1-x534.google.com with SMTP id g24so10938232edw.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x5RPNbyizJpBVpZ4S0PIEenqDOsZrfTSNL4+xNlu3OE=;
 b=tnl2j0/rjC3/p42FNjxTN4/XK1DKQebIwOTCxbSO3u6KGkn57DxFiR9el7mGMinafz
 hnSpCJNg4A5AH1TeWSSFaJ/+Imf8hYLtb/V2LT7FVu9+fk3QimGAx1ScnS6TzJOgnReD
 XsVgORa+FOCRUswmb+pbUJ37GPrcr/LniWWOJ3f024QOvslS7gXXh/+SyvnBnz8nan7u
 gjlTZQ+IOKRTaPw8kWPwD29NNa0o12RNzao0qP5sDG1+a8X5u+6J+gM4BEujTiRwgTey
 WOyA5mUZHCLPiNzCRp21LJNWXLrGviIkayNqaYADIKJcxpZ63CDSe6JkY1S+aDktfvOu
 mVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5RPNbyizJpBVpZ4S0PIEenqDOsZrfTSNL4+xNlu3OE=;
 b=YFr9qR9ZyWHe/18UgZ/IheWbLbEbulUweD3KEn+d6lOe9xJXR9FhnP4waC7ahe8Mng
 LJVLG5jNQcT7o8H9QR9lsoGoL/rTTG88TjKDk+9sVnZfPR6hcDLq+TSifgD2va5tslx5
 9DRRety3pSANlnKmEaARxiznKNSdLG8F+tsNE6BnoRNquwbQb6euJRP+lZWDDkh0fJUt
 RrmbZK+dcoxiQWwr43tJ8WRWM0eAeIu2j0fjEhL7OOjRuRFhkbrdaLRr4HlsNe3bOCdv
 vowjuZLsXDKvLRSaSjD0pS/aAcgxw6sbHOjqvjzsGP+3DLTVsz50lUmy8ngfORv/8Y2n
 SJKA==
X-Gm-Message-State: AOAM533CcJinhIia6ZTOEsa8cakAr/b0GQRJSVzLQIdyVlQqGVu4qK2a
 MHc58du9V9D8GnBT8V761qdr0qooIG8ttvr1LNHibg==
X-Google-Smtp-Source: ABdhPJwoyiRrDKUYazdhAbcqhMqR2uyzp94MSfDHfBfyuYOtYB8TE/E0q/U5XWNd9PCCWiCwLxg54zBLS22+t9An4CQ=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr4953164edw.44.1610108107413; 
 Fri, 08 Jan 2021 04:15:07 -0800 (PST)
MIME-Version: 1.0
References: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
 <1608295996-8464-2-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1608295996-8464-2-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 12:14:56 +0000
Message-ID: <CAFEAcA8aO92UoO2xuN4bQoer3opeYAjCHD=DDArUrYivwaT1Og@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc/pvpanic: split-out generic and bus dependent
 code
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 13:36, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> To ease the PCI device addition in next patches, split the code as follows:
> - generic code (read/write/setup) is being kept in pvpanic.c
> - ISA dependent code moved to pvpanic-isa.c
>
> Also, rename:
> - ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
> - TYPE_PVPANIC -> TYPE_PVPANIC_ISA.
> - MemoryRegion io -> mr.
> - pvpanic_ioport_* in pvpanic_*.
>
> Update the build system with the new files and config structure.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  hw/i386/Kconfig           |  1 -
>  hw/misc/Kconfig           |  7 +++-
>  hw/misc/meson.build       |  3 +-
>  hw/misc/pvpanic-isa.c     | 95 +++++++++++++++++++++++++++++++++++++++++++++++
>  hw/misc/pvpanic.c         | 85 +++---------------------------------------
>  include/hw/misc/pvpanic.h | 23 +++++++++++-
>  tests/qtest/meson.build   |  2 +-
>  7 files changed, 131 insertions(+), 85 deletions(-)
>  create mode 100644 hw/misc/pvpanic-isa.c

Hi; couple of minor review issues below but mostly this looks good.

> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index eea059f..994fcaa 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -14,7 +14,6 @@ config PC
>      imply ISA_DEBUG
>      imply PARALLEL
>      imply PCI_DEVICES
> -    imply PVPANIC
>      imply QXL
>      imply SEV
>      imply SGA

Why is it ok for this imply line to just go away rather
than changing to "imply PVPANIC_ISA" ? I think the answer is
the "default y" in the Kconfig file below, but really that
is changing behaviour (making PVPANIC available on all
guests with ISA, not just PC) -- so it ought to be done
in a separate patch, so this one can be purely refactoring
with no user-visible changes.

> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index cf18ac0..b58e6fd 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -121,9 +121,14 @@ config IOTKIT_SYSCTL
>  config IOTKIT_SYSINFO
>      bool
>
> -config PVPANIC
> +config PVPANIC_COMMON
>      bool
> +
> +config PVPANIC_ISA
> +    bool
> +    default y
>      depends on ISA_BUS
> +    select PVPANIC_COMMON
>
>  config AUX
>      bool



> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 6a67c53..d7b5a9e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -33,7 +33,7 @@ qtests_i386 = \
>    (config_host.has_key('CONFIG_LINUX') and                                                  \
>     config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
> -  (config_all_devices.has_key('CONFIG_PVPANIC') ? ['pvpanic-test'] : []) +                  \
> +  (config_all_devices.has_key('CONFIG_PVPANIC_COMMON') ? ['pvpanic-test'] : []) +           \
>    (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
>    (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
>    (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \

The pvpanic-test test only tests the ISA device, so I think it
either needs to be only built for CONFIG_PVPANIC_ISA, or
the tests themselves within the pvpanic-test.c file would need to
be updated to somehow skip if the QEMU under test didn't have
the ISA pvpanic device. The former seems easier.

While I'm talking about tests, it would be nice to have a
basic test of the new pvpanic-pci device too. If you put that
in its own pvpanic-pci-test.c file then you can make that one
be dependent on CONFIG_PVPANIC_PCI.

thanks
-- PMM

