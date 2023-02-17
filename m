Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BE69B177
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:55:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT40K-0001MQ-08; Fri, 17 Feb 2023 11:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pT40H-0001Lt-AM; Fri, 17 Feb 2023 11:54:33 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pT40F-00057s-9h; Fri, 17 Feb 2023 11:54:33 -0500
Received: by mail-ed1-x529.google.com with SMTP id h14so6883172edz.10;
 Fri, 17 Feb 2023 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4E0MgVjIAzPFtOpsQwccg2Yzpv8ZfdaUUj0W3zSfxyk=;
 b=FnDZAOk7SvKnz2cJ8mp668an5VM7aM2LZjRl2TBdt0SYIU6OAXPz1zqDBdG2N9Yog/
 ZN88R3Fsq7NPtxUZ9P2713sFZfM1MM/B4e5yZLkvD63ZXRQl/Ax7RkBl7UCumBqogarQ
 QZrdddr4xqGbXnFfepcC2z/z9EeFGy1eOoMC3SsK2YZO6VQnGTKY/1a2VSgons1spe9E
 5k3cu7J6YOFl7PD+38qNNITZdmmAflevqoAh7MvOt2A6UZl9CSeeqr5g+gePpL286BCj
 M9yfCf7VVRcr5xWLfx/CqoJciP5GNfpz9wlfqzBGQHrTwPT5UP3Ktd6DUsQunlbB5DN0
 Pd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4E0MgVjIAzPFtOpsQwccg2Yzpv8ZfdaUUj0W3zSfxyk=;
 b=cZOFIuOIkNRdh3BfAjRBt8lpHvk3D+39ZsXpCY6BXRmZ/6djOrg3v1/vKVOuNkXZlV
 QHZpOwhH6N9uNptoMAxeYcV84A/xc+3duktaeOilsLPy1+DfiZ4KXQXbK3BtDb9TIWAC
 jogbv5TqCq3lu+mufAC95M7iX18IZUmwE3IilkuD+tbJIVbY5s4WgCQ37lKQl4RBUCL0
 2NB0/IA/IxbVGWMJ0jjZ0GLo1UXAkdeVL7RYVW67cpsvKp75CPaKmBbtpygx9uoTVZg3
 assouneG+gr/I6FS0ZeyQHAV0BNKbXh0/9uxHCvscXtEI9a9mPL6oBphJZYefCJSaLyj
 QSCw==
X-Gm-Message-State: AO0yUKXqo4cxLYKHfHIhNM0EMcD1VU3664IMZGpOawiV+oRAdFOUl5a9
 m4iDYztVJZ5tOdHBSE7+TPLrUtZFU6h6TnlvOK0=
X-Google-Smtp-Source: AK7set84I5mbx0cwrQ5OyA75EG2ZL6KxT42mXxrExkMSgZ8RgjU+xqkfyuy1zknOAmhRKd8xp2hdXKFQgO99tcBwTro=
X-Received: by 2002:a17:906:ce59:b0:8b1:7e1b:5ec1 with SMTP id
 se25-20020a170906ce5900b008b17e1b5ec1mr1813038ejb.6.1676652867896; Fri, 17
 Feb 2023 08:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20230217094207.16882-1-qianfanguijin@163.com>
 <20230217094207.16882-2-qianfanguijin@163.com>
In-Reply-To: <20230217094207.16882-2-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Fri, 17 Feb 2023 17:54:16 +0100
Message-ID: <CABtshVQ5SBxiFmLa-LaYqsivkUQwPPciVP+5DSuozy3P9dfgpA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi,

I tried running Avocado tests for cubieboard with following command:

ARMBIAN_ARTIFACTS_CACHED=yes  AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
--show=app,console run    -t machine:cubieboard
tests/avocado/boot_linux_console.py

Without this patch all tests pass:
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 53.15 s

However, if I apply this patch, all tests fail. This is part of the
log that captures the failure:

axp20x-i2c 1-0034: AXP20x variant AXP209 found
console: random: crng init done
console: irq 43: nobody cared (try booting with the "irqpoll" option)
console: CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.16-sunxi #21.02.2
console: Hardware name: Allwinner sun4i/sun5i Families
console: [<c010ca1d>] (unwind_backtrace) from [<c010951d>]
(show_stack+0x11/0x14)
console: [<c010951d>] (show_stack) from [<c096eb27>] (dump_stack+0x77/0x84)
console: [<c096eb27>] (dump_stack) from [<c0969147>]
(__report_bad_irq+0x37/0x94)
console: [<c0969147>] (__report_bad_irq) from [<c016618b>]
(note_interrupt+0xfb/0x1f4)
console: [<c016618b>] (note_interrupt) from [<c0163aeb>]
(handle_irq_event_percpu+0x4f/0x54)
console: [<c0163aeb>] (handle_irq_event_percpu) from [<c0163b29>]
(handle_irq_event+0x39/0x50)
console: [<c0163b29>] (handle_irq_event) from [<c0166d93>]
(handle_fasteoi_irq+0x67/0xbc)
console: [<c0166d93>] (handle_fasteoi_irq) from [<c0162eed>]
(generic_handle_irq+0x29/0x34)
console: [<c0162eed>] (generic_handle_irq) from [<c01633a7>]
(__handle_domain_irq+0x43/0x84)
console: [<c01633a7>] (__handle_domain_irq) from [<c05937d7>]
(sun4i_handle_irq+0x3b/0x4c)
console: [<c05937d7>] (sun4i_handle_irq) from [<c0100b65>] (__irq_svc+0x65/0x94)
console: Exception stack(0xc1517950 to 0xc1517998)
console: 7940:                                     c1701ca0 60000153
000000e4 00000001
console: 7960: c1701c40 00000002 60000153 c1517a1c c1701ca0 00000000
c0f03d00 fffede04
console: 7980: 00000000 c15179a0 c075ebb7 c09785d4 00000173 ffffffff
console: [<c0100b65>] (__irq_svc) from [<c09785d4>]
(_raw_spin_unlock_irqrestore+0x1c/0x20)
console: [<c09785d4>] (_raw_spin_unlock_irqrestore) from [<c075ebb7>]
(mv64xxx_i2c_xfer+0x5b/0x13c)
console: [<c075ebb7>] (mv64xxx_i2c_xfer) from [<c075951d>]
(__i2c_transfer+0x145/0x4c0)
console: [<c075951d>] (__i2c_transfer) from [<c07598f3>]
(i2c_transfer+0x5b/0xbc)
console: [<c07598f3>] (i2c_transfer) from [<c06674e9>]
(regmap_i2c_read+0x49/0x68)
console: [<c06674e9>] (regmap_i2c_read) from [<c0664241>]
(_regmap_raw_read+0x99/0x1d8)
console: [<c0664241>] (_regmap_raw_read) from [<c06643a9>]
(_regmap_bus_read+0x29/0x40)
console: [<c06643a9>] (_regmap_bus_read) from [<c066358d>]
(_regmap_read+0x3d/0xe8)
console: [<c066358d>] (_regmap_read) from [<c0663989>]
(_regmap_update_bits+0x75/0xb0)
console: [<c0663989>] (_regmap_update_bits) from [<c0664745>]
(regmap_update_bits_base+0x39/0x50)
console: [<c0664745>] (regmap_update_bits_base) from [<c06683ef>]
(regmap_irq_update_bits+0x2f/0x34)
console: [<c06683ef>] (regmap_irq_update_bits) from [<c0668df7>]
(regmap_add_irq_chip_fwnode+0x56f/0x72c)
console: [<c0668df7>] (regmap_add_irq_chip_fwnode) from [<c0668fe3>]
(regmap_add_irq_chip+0x2f/0x34)
console: [<c0668fe3>] (regmap_add_irq_chip) from [<c066e53b>]
(axp20x_device_probe+0x3f/0x368)
console: [<c066e53b>] (axp20x_device_probe) from [<c0758b93>]
(i2c_device_probe+0x1d3/0x1e4)
console: [<c0758b93>] (i2c_device_probe) from [<c064fe3b>]
(really_probe+0xb7/0x378)
console: [<c064fe3b>] (really_probe) from [<c06502c1>]
(driver_probe_device+0xa9/0x16c)
console: [<c06502c1>] (driver_probe_device) from [<c064e93d>]
(bus_for_each_drv+0x4d/0x78)
console: [<c064e93d>] (bus_for_each_drv) from [<c064fd17>]
(__device_attach+0x8f/0xf0)
console: [<c064fd17>] (__device_attach) from [<c064f29b>]
(bus_probe_device+0x5b/0x60)
console: [<c064f29b>] (bus_probe_device) from [<c064c6b7>]
(device_add+0x2e7/0x564)
console: [<c064c6b7>] (device_add) from [<c0759b1f>]
(i2c_new_client_device+0xdf/0x1bc)
console: [<c0759b1f>] (i2c_new_client_device) from [<c075c541>]
(of_i2c_register_device+0x71/0x90)
console: [<c075c541>] (of_i2c_register_device) from [<c075c771>]
(of_i2c_register_devices+0x59/0xc4)
console: [<c075c771>] (of_i2c_register_devices) from [<c075a2a9>]
(i2c_register_adapter+0x195/0x53c)
console: [<c075a2a9>] (i2c_register_adapter) from [<c075ee31>]
(mv64xxx_i2c_probe+0x199/0x440)
console: [<c075ee31>] (mv64xxx_i2c_probe) from [<c0651a7b>]
(platform_drv_probe+0x33/0x68)
console: [<c0651a7b>] (platform_drv_probe) from [<c064fe3b>]
(really_probe+0xb7/0x378)
console: [<c064fe3b>] (really_probe) from [<c06502c1>]
(driver_probe_device+0xa9/0x16c)
console: [<c06502c1>] (driver_probe_device) from [<c0650501>]
(device_driver_attach+0x3d/0x40)
console: [<c0650501>] (device_driver_attach) from [<c0650561>]
(__driver_attach+0x5d/0xe0)
console: [<c0650561>] (__driver_attach) from [<c064e8b1>]
(bus_for_each_dev+0x41/0x68)
console: [<c064e8b1>] (bus_for_each_dev) from [<c064f453>]
(bus_add_driver+0xe7/0x154)
console: [<c064f453>] (bus_add_driver) from [<c0650c8d>]
(driver_register+0x39/0xa0)
console: [<c0650c8d>] (driver_register) from [<c0101c99>]
(do_one_initcall+0x39/0x1b0)
console: [<c0101c99>] (do_one_initcall) from [<c0e00ee9>]
(kernel_init_freeable+0x1c1/0x20c)
console: [<c0e00ee9>] (kernel_init_freeable) from [<c0973ba9>]
(kernel_init+0xd/0xe0)
console: [<c0973ba9>] (kernel_init) from [<c0100159>] (ret_from_fork+0x11/0x38)
console: Exception stack(0xc1517fb0 to 0xc1517ff8)
console: 7fa0:                                     00000000 00000000
00000000 00000000
console: 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
console: 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
console: handlers:
console: [<(ptrval)>] mv64xxx_i2c_intr
console: Disabling IRQ #43

RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 3
| CANCEL 0
JOB TIME   : 94.23 s


I also tried looking into the A10/A20/H3 specification, and I could
not find information about this register being W1C when TWI is used in
master mode. Can you share where that information is stated?

I can see in Linux kernel that "allwinner,sun6i-a31-i2c" compatible
devices have the "irq_clear_inverted" boolean set to true, but I also
looked at A31 spec and I could not find the W1C information for master
mode.

Also, can you share how you ran QEMU so I can try to reproduce the
hang that you encountered?

Best regards,
Strahinja


On Fri, Feb 17, 2023 at 10:42 AM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
> register, we should lower interrupt when the guest write this bit.
>
> The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
> device connected on the i2c bus, next is the trace log:
>
> [    7.004130] axp20x-i2c 0-0034: AXP20x variant AXP221 found
> allwinner_i2c_rw write   CNTR[0x0c]: e4 { A_ACK M_STA BUS_EN INT_EN  }
> allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
> allwinner_i2c_rw  read   STAT[0x10]: 08 { STAT_M_STA_TX }
> allwinner_i2c_rw write   DATA[0x08]: 68
> allwinner_i2c_rw write   CNTR[0x0c]: c4 { A_ACK BUS_EN INT_EN  }
> allwinner_i2c_rw write   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
> allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
> allwinner_i2c_rw  read   STAT[0x10]: 20 { STAT_M_ADDR_WR_NACK }
> allwinner_i2c_rw write   CNTR[0x0c]: 54 { A_ACK M_STP BUS_EN  }
> allwinner_i2c_rw write   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
> allwinner_i2c_rw  read   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
> allwinner_i2c_rw  read   STAT[0x10]: f8 { STAT_IDLE }
> allwinner_i2c_rw write   CNTR[0x0c]: 54 { A_ACK M_STP BUS_EN  }
> allwinner_i2c_rw write   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
> allwinner_i2c_rw  read   CNTR[0x0c]: 4c { A_ACK INT_FLAG BUS_EN  }
> allwinner_i2c_rw  read   STAT[0x10]: f8 { STAT_IDLE }
>
> Fix it.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/i2c/allwinner-i2c.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> index 36b387520f..86a77d4a59 100644
> --- a/hw/i2c/allwinner-i2c.c
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -443,8 +443,9 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
>                  s->stat = STAT_FROM_STA(STAT_IDLE);
>                  s->cntr &= ~TWI_CNTR_M_STP;
>              }
> -            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
> -                /* Interrupt flag cleared */
> +            if (s->cntr & TWI_CNTR_INT_FLAG) {
> +                /* Write 1 to clear this flag */
> +                s->cntr &= ~TWI_CNTR_INT_FLAG;
>                  qemu_irq_lower(s->irq);
>              }
>              if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
> --
> 2.25.1
>

