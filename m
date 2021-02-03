Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95630D62B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:23:26 +0100 (CET)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ENh-0002cC-52
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7EMW-0001qf-8j
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7EMU-0003B4-6H
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612344129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Bq1sNsf+yyD6RVC+HoJdzD7JtSr2ZY8d4AGrUuKnaU=;
 b=CFZH3Kc77RdWd2PG7NgWV67u1ssQ7sRJkYz+sk/nNgW4VqLSzsMM8vkjfMMfknc5CDxlzw
 acBaTLPF3Mf9q9Vd4ExcUl3zKyQ3uEDow3ByRKfY276mmbbm6QZGMfEGhp6z7LAkNS7mj6
 EME0FGc3Aagrw9ZdMtqkGI4yEtEuHe0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292--cm191sXMkW26aM744IlVg-1; Wed, 03 Feb 2021 04:22:06 -0500
X-MC-Unique: -cm191sXMkW26aM744IlVg-1
Received: by mail-ej1-f72.google.com with SMTP id n25so11617074ejd.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 01:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Bq1sNsf+yyD6RVC+HoJdzD7JtSr2ZY8d4AGrUuKnaU=;
 b=COSSiw5finmhFzJvyPo7vHAAq4uFx6yCfHAuspev/1NUTJX9Lg+J8u+/xPgUKDYt+U
 f1AZyi+ArJq4S5QDuTDd57BxZ+iSZqGa0Q9Rk6TvbrWx6v1wPz9TbG3phpzycpvQRf+t
 d0i9bQYVu9NwO8crXGHcC9KW9AN2/b40x2MZLpHuks8gdwHF5OwNsUs6PqnK1kYVx5/U
 Ni/3mNBuijgc8Dq40cxdImc+PYCdt8aa+1PPWYTYjhiTJSa88uRLI14FYioQzjEKpIZA
 Ix+6DrRdTAZgn+ooZg7HUkjITf9ehkMKt/Ie3c+2wGAQMh4pk9CvlVajHV7FNtnu495M
 tO0Q==
X-Gm-Message-State: AOAM530qYNxeDDAvw0nSSfMOAlGKn1Jq27i85cnsdtkBzt6/6dmD0IIw
 LsEM88WIAoHNuTFw01P2YannzZ5QyccIBn6a9b/g7ZetiCzAxhIgQNfVGC+VI1doJeF9nXhkVoD
 kqLmE7pOYGW+r0fItrtm3oZlMxVru8cpZBa26iB271k7Pgw9+K09Zqmv7NQqeP26D
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr2367161ejb.178.1612344125253; 
 Wed, 03 Feb 2021 01:22:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLcVcHjlFNdEoZRn7WJJBGFRvKgY/X00epRUWjY7Wt+bCMapDbHUweR03o/YfkJeq//8DXew==
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr2367142ejb.178.1612344125076; 
 Wed, 03 Feb 2021 01:22:05 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id o10sm718525eju.89.2021.02.03.01.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 01:22:04 -0800 (PST)
Subject: Re: [PULL 00/21] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, Prasad J Pandit <pjp@redhat.com>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc90c90a-b9fd-d89c-629a-e588c47d9953@redhat.com>
Date: Wed, 3 Feb 2021 10:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/2/21 6:54 PM, Peter Maydell wrote:
> Mostly just bug fixes. The important one here is
>   hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
> which fixes a buffer overrun that's a security issue if you're running
> KVM on Arm with kernel-irqchip=off (which hopefully nobody is doing in
> a security context, because kernel-irqchip=on is the default and the
> sensible choice for performance).

FYI Prasad mentioned a CVE was requested:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg778659.html

As you said it is an odd configuration, I am not sure it is worth
to wait for the CVE number to add it to the commit (which helps
downstream distributions tracking these).

[updating]

Just got detail from Prasad on IRC, it usually takes ~1 day to get
the CVE number assigned, so maybe worth postponing this until tomorrow.

Prasad, can you reply to this message ASAP once you get the number?

Thanks,

Phil.

> -- PMM
> 
> The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:
> 
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210202-1
> 
> for you to fetch changes up to 14657850c9cc10948551fbb884c30eb5a3a7370a:
> 
>   hw/arm: Display CPU type in machine description (2021-02-02 17:53:44 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gic: Allow to use QTest without crashing
>  * hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
>  * hw/char/exynos4210_uart: Fix missing call to report ready for input
>  * hw/arm/smmuv3: Fix addr_mask for range-based invalidation
>  * hw/ssi/imx_spi: Fix various minor bugs
>  * hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
>  * hw/arm: Add missing Kconfig dependencies
>  * hw/arm: Display CPU type in machine description
> 
> ----------------------------------------------------------------
> Bin Meng (5):
>       hw/ssi: imx_spi: Use a macro for number of chip selects supported
>       hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()
>       hw/ssi: imx_spi: Round up the burst length to be multiple of 8
>       hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
>       hw/ssi: imx_spi: Correct tx and rx fifo endianness
> 
> Iris Johnson (2):
>       hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
>       hw/char/exynos4210_uart: Fix missing call to report ready for input
> 
> Philippe Mathieu-Daudé (12):
>       hw/intc/arm_gic: Allow to use QTest without crashing
>       hw/ssi: imx_spi: Remove pointless variable initialization
>       hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value
>       hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled
>       hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled
>       hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
>       hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
>       hw/arm/exynos4210: Add missing dependency on OR_IRQ
>       hw/arm/xlnx-versal: Versal SoC requires ZDMA
>       hw/arm/xlnx-versal: Versal SoC requires ZynqMP peripherals
>       hw/net/can: ZynqMP CAN device requires PTIMER
>       hw/arm: Display CPU type in machine description
> 
> Xuzhou Cheng (1):
>       hw/ssi: imx_spi: Disable chip selects when controller is disabled
> 
> Zenghui Yu (1):
>       hw/arm/smmuv3: Fix addr_mask for range-based invalidation
> 
>  include/hw/ssi/imx_spi.h  |   5 +-
>  hw/arm/digic_boards.c     |   2 +-
>  hw/arm/microbit.c         |   2 +-
>  hw/arm/netduino2.c        |   2 +-
>  hw/arm/netduinoplus2.c    |   2 +-
>  hw/arm/orangepi.c         |   2 +-
>  hw/arm/smmuv3.c           |   4 +-
>  hw/arm/stellaris.c        |   4 +-
>  hw/char/exynos4210_uart.c |   7 ++-
>  hw/intc/arm_gic.c         |   5 +-
>  hw/ssi/imx_spi.c          | 153 +++++++++++++++++++++++++++++-----------------
>  hw/Kconfig                |   1 +
>  hw/arm/Kconfig            |   5 ++
>  hw/dma/Kconfig            |   3 +
>  hw/dma/meson.build        |   2 +-
>  15 files changed, 130 insertions(+), 69 deletions(-)
> 


