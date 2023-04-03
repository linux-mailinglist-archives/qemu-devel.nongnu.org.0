Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B06D3D98
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:52:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjE2H-0006XW-MN; Mon, 03 Apr 2023 02:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjE2B-0006XD-5s
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:51:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjE27-0006Ip-Ga
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:51:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so17399968wmq.3
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680504673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Njw70mZuQfZ/2Tk3uBhLh0bQ0tx+H2jSeC5EOuCdugY=;
 b=RM5eJbDnd6AtzGVVVZ7vZOfPf8JyHqqLd9VCeplVdrcm3TkjTzVMigfWtSVgoTCeeK
 x4qkzLaR38cFjD8WRlD1wKTQqjMOYug0Qh+Zh5nyyJSssly6wUdmrPVQJg7JiqpATn+T
 IvGm2CedBvebHmEmTg1b4BnqW0BArLfTzO2wQF8vhQ+xjLEK9PiktLzH/Klgm8riAYoT
 yiNKVqiJnhqRUGUsvU1ekQSqZxa66eVPKKIveYRT2Doi42gikYy+I7ms3KHVYT/SKcrX
 zQU8WdkFikaMPVWE3JH4SQDDejkdgJxhkBotutG54tB3kZNKWGlCZp+QhgTokWp1Vaps
 wIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680504673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Njw70mZuQfZ/2Tk3uBhLh0bQ0tx+H2jSeC5EOuCdugY=;
 b=hH6RdhQEuO0q2Uyf/sWIk609TxBuXx72hIUX00R12xMkVGRVmROI3cXzzQUaA6vBbO
 jU6uQHaXsjFcZbWcPhfK0uwqpJtsh3HJZhUcnvopcyRnFAXgY4nV1DNmyR+5U6ZzZpxp
 SY4EiF7zDq2GD8QB4fXnGLdxVqiXpzAQ7RfjEFRqvP7DNH+uEwhpSg+ZRJZ8/nrk1y2H
 h2JH2oLE2SIctI/bw30UuEjWO8+IStyInIuejOwI365Ny+fXyk9TdUIw+Kcr/xU0VkwK
 KxZ4yCKGwEico5BYbNjxjBNewpYCsqZgyk5pFP1PP5VCZL6sqAyhlpuZFQQt5zPye14J
 YL5A==
X-Gm-Message-State: AO0yUKWfLf+3aR/wuZw2zdMJAMr8LN1WGzj2DbpiNnLOgzUIN0mumr29
 uo6qkPj816xw+CnUUDtSrgzKUw==
X-Google-Smtp-Source: AK7set8+YaiE5dSn1u4RJ/0FahupmU/PM1UidV1uIFXnprWBUa/aEqcUATHtejqx+o9EFq26JlBzPQ==
X-Received: by 2002:a1c:f005:0:b0:3ee:4dc0:d4f2 with SMTP id
 a5-20020a1cf005000000b003ee4dc0d4f2mr23855631wmb.41.1680504673302; 
 Sun, 02 Apr 2023 23:51:13 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 b13-20020adff24d000000b002c573778432sm8804991wrp.102.2023.04.02.23.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 23:51:13 -0700 (PDT)
Message-ID: <a83dd975-2270-1be6-0264-516badbacc38@linaro.org>
Date: Mon, 3 Apr 2023 08:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] Make bootable RPi4B model
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-devel@nongnu.org
Cc: Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20230402165306.137092-1-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230402165306.137092-1-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Sergey,

On 2/4/23 18:53, Sergey Kambalin wrote:
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   configs/devices/aarch64-softmmu/default.mak |   1 +
>   hw/arm/Kconfig                              |   7 +
>   hw/arm/bcm2835_peripherals.c                | 218 ++++++----
>   hw/arm/bcm2836.c                            | 129 +++---
>   hw/arm/bcm2838.c                            | 294 ++++++++++++++
>   hw/arm/bcm2838_pcie.c                       | 300 ++++++++++++++
>   hw/arm/bcm2838_peripherals.c                | 262 ++++++++++++
>   hw/arm/meson.build                          |   6 +
>   hw/arm/raspi.c                              | 128 +++---
>   hw/arm/raspi4b.c                            | 232 +++++++++++
>   hw/arm/trace-events                         |   6 +
>   hw/gpio/bcm2838_gpio.c                      | 395 ++++++++++++++++++
>   hw/gpio/meson.build                         |   1 +
>   hw/misc/bcm2835_property.c                  | 318 ++++++++++++---
>   hw/misc/bcm2838_rng200.c                    | 421 ++++++++++++++++++++
>   hw/misc/bcm2838_thermal.c                   |  97 +++++
>   hw/misc/meson.build                         |   4 +
>   hw/misc/trace-events                        |  10 +
>   include/hw/arm/bcm2835_peripherals.h        |  29 +-
>   include/hw/arm/bcm2836.h                    |  30 +-
>   include/hw/arm/bcm2838.h                    |  26 ++
>   include/hw/arm/bcm2838_pcie.h               |  67 ++++
>   include/hw/arm/bcm2838_peripherals.h        |  56 +++
>   include/hw/arm/raspi4b_platform.h           |  54 +++
>   include/hw/arm/raspi_platform.h             |  34 ++
>   include/hw/display/bcm2835_fb.h             |   2 +
>   include/hw/gpio/bcm2838_gpio.h              |  45 +++
>   include/hw/misc/bcm2838_rng200.h            |  77 ++++
>   include/hw/misc/bcm2838_thermal.h           |  24 ++
>   include/hw/misc/raspberrypi-fw-defs.h       | 169 ++++++++
>   30 files changed, 3175 insertions(+), 267 deletions(-)

The patch subject sounds promising! However 3175 lines of
code to review is a bit hardcore... Could you split your
patch per device (at least)?

Ideally one patch should contain a single logical change.

Also, can you provide how you tested your patch?

Thanks,

Phil.

