Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17D47A382
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 03:16:29 +0100 (CET)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz8E0-0000iu-5R
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 21:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz8Cc-0007up-1V; Sun, 19 Dec 2021 21:15:07 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz8CZ-0005pj-8n; Sun, 19 Dec 2021 21:15:01 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JHNPd1z2Cz1DK29;
 Mon, 20 Dec 2021 10:11:49 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 10:14:54 +0800
Subject: Re: [PATCH v2 5/5] hw/input/pckbd: Open-code i8042_setup_a20_line()
 wrapper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, <qemu-trivial@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
 <20211218130437.1516929-6-f4bug@amsat.org>
Message-ID: <b2e7e228-ec2c-f0be-5777-e7077b0d7203@huawei.com>
Date: Mon, 20 Dec 2021 10:14:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211218130437.1516929-6-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2021/12/18 21:04, Philippe Mathieu-Daudé wrote:
> Since the named GPIO lines are a "public" interface to the device,
> we can directly call qdev_connect_gpio_out_named(), making it
> consistent with how the other A20 input source (port92) is wired.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/input/i8042.h | 1 -
>   hw/i386/pc.c             | 3 ++-
>   hw/input/pckbd.c         | 5 -----
>   3 files changed, 2 insertions(+), 7 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> index 1d90432daef..1cd53b8d221 100644
> --- a/include/hw/input/i8042.h
> +++ b/include/hw/input/i8042.h
> @@ -21,6 +21,5 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>                      MemoryRegion *region, ram_addr_t size,
>                      hwaddr mask);
>   void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
>   
>   #endif /* HW_INPUT_I8042_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc2..e2f7cd4aec6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1045,7 +1045,8 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
>       port92 = isa_create_simple(isa_bus, TYPE_PORT92);
>   
>       a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
> -    i8042_setup_a20_line(i8042, a20_line[0]);
> +    qdev_connect_gpio_out_named(DEVICE(i8042),
> +                                I8042_A20_LINE, 0, a20_line[0]);
>       qdev_connect_gpio_out_named(DEVICE(port92),
>                                   PORT92_A20_LINE, 0, a20_line[1]);
>       g_free(a20_line);
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index baba62f357a..7fd4477d742 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -680,11 +680,6 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
>       ps2_mouse_fake_event(s->mouse);
>   }
>   
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
> -{
> -    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
> -}
> -
>   static const VMStateDescription vmstate_kbd_isa = {
>       .name = "pckbd",
>       .version_id = 3,


