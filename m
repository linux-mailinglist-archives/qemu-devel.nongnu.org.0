Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2A482296
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 08:40:59 +0100 (CET)
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3CX4-0000oA-Il
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 02:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n3CQq-0007jd-Om
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 02:34:32 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n3CQo-00037M-7I
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 02:34:32 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JQH2F0y8ZzccDp;
 Fri, 31 Dec 2021 15:33:57 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Fri, 31 Dec 2021 15:34:26 +0800
Subject: Re: [PATCH 2/3] hw/sysbus: Restrict sysbus_get_connected_irq() to
 sysbus-internal.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
References: <20211229225206.171882-1-philmd@redhat.com>
 <20211229225206.171882-3-philmd@redhat.com>
Message-ID: <14f32db5-dc0d-df29-a0aa-1247eef23ba9@huawei.com>
Date: Fri, 31 Dec 2021 15:34:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211229225206.171882-3-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>


On 2021/12/30 6:52, Philippe Mathieu-Daudé wrote:
> sysbus_get_connected_irq() and sysbus_is_irq_connected() are only
> used by platform-bus.c; restrict them to hw/core/ by adding a local
> "sysbus-internal.h" header.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/core/sysbus-internal.h | 16 ++++++++++++++++
>   include/hw/sysbus.h       |  2 --
>   hw/core/platform-bus.c    |  2 +-
>   hw/core/sysbus.c          |  1 +
>   4 files changed, 18 insertions(+), 3 deletions(-)
>   create mode 100644 hw/core/sysbus-internal.h
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/hw/core/sysbus-internal.h b/hw/core/sysbus-internal.h
> new file mode 100644
> index 00000000000..991b3e3159c
> --- /dev/null
> +++ b/hw/core/sysbus-internal.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * SysBus internal helpers
> + *
> + * Copyright (c) 2021 QEMU contributors
> + */
> +#ifndef HW_CORE_SYSBUS_INTERNAL_H
> +#define HW_CORE_SYSBUS_INTERNAL_H
> +
> +#include "hw/sysbus.h"
> +
> +/* Following functions are only used by the platform-bus subsystem */
> +qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
> +bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
> +
> +#endif /* HW_CORE_SYSBUS_INTERNAL_H */
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 3564b7b6a22..24645ee7996 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -77,8 +77,6 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
>   bool sysbus_has_irq(SysBusDevice *dev, int n);
>   bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n);
>   void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
> -bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
> -qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
>   void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
>   void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                                int priority);
> diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
> index b8487b26b67..016fb71eba1 100644
> --- a/hw/core/platform-bus.c
> +++ b/hw/core/platform-bus.c
> @@ -25,7 +25,7 @@
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
> -
> +#include "sysbus-internal.h"
>   
>   /*
>    * Returns the PlatformBus IRQ number for a SysBusDevice irq number or -1 if
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 0e6773c8df7..dcd7beda184 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -24,6 +24,7 @@
>   #include "monitor/monitor.h"
>   #include "exec/address-spaces.h"
>   #include "qdev-internal.h"
> +#include "sysbus-internal.h"
>   
>   static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>   static char *sysbus_get_fw_dev_path(DeviceState *dev);


