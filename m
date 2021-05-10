Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54AF3785FD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:30:13 +0200 (CEST)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg472-0004Vd-GV
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg456-0002PG-Rh
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:28:13 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg453-0003PH-Qw
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:28:12 -0400
Received: by mail-ed1-x531.google.com with SMTP id r11so3429158edt.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VmX3Sy/J15+xG8+KHEQPLUJrduTufuVYZC9fYZEzTeQ=;
 b=eaoNvTkr1AJZl6hfC1y+E7zDUXV4SsSU9RGaMvpVh/YmWgZ2DQ3STomhgB0oAQq79O
 nw2crWeNpjrOjKAC3l/8F+27ZKyBmbDQ9pQoMfKdw8mSBkNkKJOjWkt19liaADtpsN6a
 DFtc8+gm5jc4HuCk3t+qWo/BXE+vzmU517zO85WomqSDv5hLnSxn7o1HxcGZMbQ9PqaE
 gJkWsqTZwnjSsBLGx4v767f/XLTEIBZtVWgEfaIdPU4lX4K9EF2+i2Nt3FroAivLNsUQ
 WobKLg9KVkyBn59Fg+qjpjWblXKMSx+nWTagthKUQ2ZUinNEZ5RKjGUlmIHZg4v+yk2j
 uw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmX3Sy/J15+xG8+KHEQPLUJrduTufuVYZC9fYZEzTeQ=;
 b=VpMaouaxngRQk0v6wcI5WtPNftHYCgZcXHxansrwA1sp4x6dinje+XK6acYy20HijX
 Gxl7xN86kImVGIcOFe7ej+K48saj7Gg8cl4Vfl+6d9KbwaTAr0UUnBJe7bz0dFFkV0en
 /HTZWLiJQWQZEe2Ea5gIIDOkSOtHh13EF71KTt265HhDBMtWDE8IJOr9Akfy+Yi9qQcu
 zohxKr7ExPPQX7PLTpMmNVNzi823ZIBCRIpUcF+s8PzdIkLT9ntk5HG2V60Y5u2RaBvz
 42YcGQSsx+SO8b8gj0xdncWMkbY1zG9jt8NhqQOfW2P4fQnlK1yrxLZTw3pYQ6v4rxTK
 77CA==
X-Gm-Message-State: AOAM532IkrA4A2vzuCACgMeWJZNOwsnK59UPHaP+FOxaX+NUsvUGTJQG
 Wk5dgzbP6D8fgYJM9AAl6V8S4iYtmadNLPQsr3n0ig==
X-Google-Smtp-Source: ABdhPJxQT/EIvlLH8lGfXGLEdkD5O93ukKJ/WoaTBGKAAb2jl81EAt/tL2C9BIC/+Vdyz/RFNeofCp3n+VZ17NNLoLc=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr28541016edd.251.1620646087790; 
 Mon, 10 May 2021 04:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124140.1100346-1-linux@roeck-us.net>
In-Reply-To: <20210504124140.1100346-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 12:26:56 +0100
Message-ID: <CAFEAcA-AVo4YNx1kj5YZct0M2kz4_P+fcdCMTbncV+DFwYYxsA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 13:41, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
> property value to 23") configured the PHY address for xilinx-zynq-a9
> to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
> zynq-zc706.dtb, this results in the following error message when
> trying to use the Ethernet interface.
>
> macb e000b000.ethernet eth0: Could not attach PHY (-19)
>
> The devicetree files for ZC702 and ZC706 configure PHY address 7. The
> documentation for the ZC702 and ZC706 evaluation boards suggest that the
> PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
> I was unable to find a documentation or a devicetree file suggesting
> or using PHY address 23. The Ethernet interface starts working with
> zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
> so let's use it.
>
> Cc: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f..5ac0294f9e 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(dev, nd);
>      }
> -    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
> +    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, base);
> --
> 2.25.1



Applied to target-arm.next, thanks.

-- PMM

