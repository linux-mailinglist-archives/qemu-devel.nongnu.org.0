Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BC3B4FC3
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 19:34:04 +0200 (CEST)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxCBv-00006L-VI
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 13:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxCB6-0007ta-7X
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 13:33:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxCB4-0008Qp-Jn
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 13:33:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso7959195wmj.0
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0jwvjw8YBM2cQBlFAoOU9mhnKuMuwLWZIh9NnEpT2Y0=;
 b=AO9nUXNMFSNCG7sF+J4hwSFQtOigv6UFyDTtd/nYvNbMUvyUxmQqmQIvPIHaViWm1l
 yABjsXX1D9F1DbLItiNaDe2ikCvGCBRD97jcv7YR9bSVj1aXVt8Cn2G5EoKZbwUNLzYA
 uxukQxeEIgrqwj1iwtNaHKyFAKXOiaDkDxRJs+xgu0MEIBLiPjeHEUINyiCTktY/Im9J
 P6Dvte2FqARH1E9JFeDlNYRvEt2J1K8OSGH+9rnqavbEUa/VOGSe5mSqtdMTMzoDY/zC
 lDOQ+k7Cu0IWBVcwg9RUGh6j+4WyWWN/bxWyPGLx8ZJvWHyE+OjPTtApDBhes9fFIo53
 2cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0jwvjw8YBM2cQBlFAoOU9mhnKuMuwLWZIh9NnEpT2Y0=;
 b=tgNdjYmXZbfz8sjRP9jYI2KYHwC5pDsTtcuaB6dM3NMI+ciaxwTZ0sCrYD/GVwdfD3
 iTPG7T5Tk8Efxmex79Sl78BuoHIKpPnseu7Lr7hsS1UU2QK0LxLP83rS8h21W0O70tsU
 K+QJ+MxZbB0vax73pWKeTCSS535uQfuuFQMN+38zXLa92bHvImNlAXKV5FNRRt23EsEa
 cHiEwOF1/tP0r1KBPPbRxp6dnO3vSa0yZRVFrZ8SEocsC3xh2ZLMy6CwCtTzHtIz2vcn
 4bXUCZq9HVK6Wsx4XpWd3FoAVLy6RCzxeZH8Myz0G5A9FlAAMgwYa1nTwT7Ry8I2A2UG
 QA0w==
X-Gm-Message-State: AOAM530diZ399UTI1mqj5Oe2MRaJ1C9ZOWKVUILSWVwOUQj3BpTZi7Of
 8jzZxVN2QKkLZ5Jvr+OlHbc=
X-Google-Smtp-Source: ABdhPJwbtNChoc7W7wQ1QLlqnqHaAJ9yT6NO3/CwUDuNCKpBNberXv6yi5B/TdGDwhZH8OP0k+PySg==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr17383412wmj.60.1624728788790; 
 Sat, 26 Jun 2021 10:33:08 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m11sm3629591wrx.80.2021.06.26.10.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 10:33:07 -0700 (PDT)
Subject: Re: [PATCH v3] Add basic power management to raspi.
To: Nolan Leake <nolan@sigbus.net>, qemu-devel@nongnu.org
References: <20210625210209.1870217-1-nolan@sigbus.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <998200ac-3fff-7a28-2c33-648d63679658@amsat.org>
Date: Sat, 26 Jun 2021 19:33:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625210209.1870217-1-nolan@sigbus.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 11:02 PM, Nolan Leake wrote:
> This is just enough to make reboot and poweroff work. Works for
> linux, u-boot, and the arm trusted firmware. Not tested, but should
> work for plan9, and bare-metal/hobby OSes, since they seem to generally
> do what linux does for reset.
> 
> The watchdog timer functionality is not yet implemented.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64
> Signed-off-by: Nolan Leake <nolan@sigbus.net>
> ---
>  hw/arm/bcm2835_peripherals.c         |  13 ++-
>  hw/misc/bcm2835_powermgt.c           | 160 +++++++++++++++++++++++++++
>  hw/misc/meson.build                  |   1 +
>  include/hw/arm/bcm2835_peripherals.h |   3 +-
>  include/hw/misc/bcm2835_powermgt.h   |  29 +++++
>  5 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/bcm2835_powermgt.c
>  create mode 100644 include/hw/misc/bcm2835_powermgt.h

>      create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
>      create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
> -    create_unimp(s, &s->powermgt, "bcm2835-powermgt", PM_OFFSET, 0x114);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>      create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
>      create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
...

> +static void bcm2835_powermgt_init(Object *obj)
> +{
> +    BCM2835PowerMgtState *s = BCM2835_POWERMGT(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
> +                          TYPE_BCM2835_POWERMGT, 0x114);

In case Peter asks you to resend your patch because can't apply it,
please use a region size of 0x200 here.

Alternatively you can increase the odds to get your patch merged by
resending it properly (I'm still not sure what broke it) before Peter
review the ARM patches next week.

