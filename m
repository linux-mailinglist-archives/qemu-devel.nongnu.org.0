Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4592FB5BD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:42:07 +0100 (CET)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pOb-00024n-KC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pME-0000U2-PN
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:39:34 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1pMD-0000hA-6j
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:39:34 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so13818001edd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rU4pgfuM1Krq+DVaJerzEogm45of/z5p4kmvRCy4cs=;
 b=v0VprRlf5rL21iDun2z2aptcr9xMlw8xlediz7aSoCwC7XknO02fZ/erqrHuTw8i6Y
 9zKQKhzbSXDBtzt8TBM/wN/Exrdh75DIb+UawOt8Z31eBU5kgh9MLadA4+kzd0exsz2I
 dJw3BjBkikuvaMRDZK2PLpB/qb64STc8IlTIimc48nBwEd2Z7upU5NUXLEaYxVCnFubB
 ckk7wcdSPXcvOn/GmLznawMW10vW0KmwkPZlZ0oG2DfdURz8Fh31q8jeZNBgCnwWFOtJ
 8rjg//UIcsmRmBmmDXYptYqqYzULgMecVVomSXh+jTFNgRBDTrmuAKKq8W98S99Id3uR
 56hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rU4pgfuM1Krq+DVaJerzEogm45of/z5p4kmvRCy4cs=;
 b=X00Aow9raheloWt3inqEQsZEoKRZ0uKvEYwvXI1RjqLUyZeqmme6d7Y9dXYV6kXlfx
 OsnRUm7mO9SVKCa3TEewyOdK3Z4oKfBmvDfQbUnxiz0kJ6ibxGyZrH+JK4Min7yYr3bB
 IPGW9gDpu8uSnwBlfWEb+pLHDYGW5YAazpOFjb8AJ9k5liymHFKon3AQFlyTM2VwX+CB
 6Cg/eExDpIcOO5lFBolJyhGubhUijrkjnOGP3lm2X0DGFXoZqba1BVZtBdObh+CGQRUs
 pAkcAZFzPl9z5spHsLnlc96DOWdQMgpAsxVOVzPDYpobEI1oq5UHln9s0FPnETcSj03U
 0hQg==
X-Gm-Message-State: AOAM532/ZMAoiE5a7l9Od27qk7bpHsIwkDVdVxuatp8lyhkL/RQw/rIn
 49HqW6rquc67KBcLCJp8Qwx5FhDH1iQM/qHF26bExA==
X-Google-Smtp-Source: ABdhPJxbbffUj92dQjMWQVzcplRIy5uNNHaYtMZ4vNpR5b8tKFMqS5VQOvbo7ZEe97z4gBbNc0s9Ggw5dbPyCPdmNjE=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr3020986eds.204.1611056371462; 
 Tue, 19 Jan 2021 03:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-3-maxim.uvarov@linaro.org>
In-Reply-To: <20210115101126.4259-3-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:39:19 +0000
Message-ID: <CAFEAcA-dcw_Qrej5r68oMeQgnskWJS0tmCCdyTAaapJtTtffVw@mail.gmail.com>
Subject: Re: [PATCHv7 2/3] arm-virt: refactor gpios creation
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
> No functional change. Just refactor code to better
> support secure and normal world gpios.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---

> @@ -847,21 +873,22 @@ static void create_gpio(const VirtMachineState *vms)
>      qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
>      qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
>
> -    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> -                                        qdev_get_gpio_in(pl061_dev, 3));
> -    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
> -    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
> +    if (gpio == VIRT_GPIO) {
> +        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);

You don't want to set /chosen/stdout-path (that is specific to the
uart, it's telling the kernel where it should send its bootup
output by default).

> +    } else {
> +        /* Mark as not usable by the normal world */
> +        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
> +        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
>
> -    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
> -    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
> -                            "label", "GPIO Key Poweroff");
> -    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
> -                          KEY_POWER);
> -    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
> -                           "gpios", phandle, 3, 0);
> +        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
> +                                nodename);
> +    }

Similarly here you don't want to set /secure-chosen/stdout-path.

Patch looks OK otherwise.

thanks
-- PMM

