Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA8536B4C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 08:41:51 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuq90-0000Fx-Hh
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 02:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuq3n-0007Eu-GF
 for qemu-devel@nongnu.org; Sat, 28 May 2022 02:36:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuq3i-0003kj-Fp
 for qemu-devel@nongnu.org; Sat, 28 May 2022 02:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h4oQ8NwpTOgm2dYqvjXQZk0/+24eWHKI+J+72122oMI=; b=UvO42QYn9yYQ2TPIm7H4o9l9Yz
 uA2gXJBUh9nAWdB9mTcWSMgGcZ4brmXATFholvzdQbldnNk4Fu1HLygD8xx5tqTc5MvDiIQB07uZ0
 3MjpRsVPiIvTfNTwvUIvGQK9WSR55WeMdMmEci29wY2TNKq8+b4z6HUwdqomDO24B4eugLbFhfN1h
 baW+OIGAfoQ5/Xl+V4KL5Zsctqtx+ENYly5WQhN40LCDJMR/Ffx0yOiBBijQqEg9P7iguSi1AZ/LJ
 pIBL0SsdHjpXNoPP4HRuVWyJ7jKjV0TrsLS+MGRQyQ/jQ1unx7rLto09JK0rmvkmlyWHWY8n++AlC
 ArOnt+ugyVnNn8BUk+lv0Fx6T/HIaZyQiekgwIWXQ/aY6bSgDTL6SkKI/q4Z6wfkMHdgKTrKna69/
 j3NETytpdXQ//u+GzD6Cl7BYFqveW9ZzkX08YDrFVb2tuv0gsnR6P9Gu9zo5IkOOpRvO+S1bJREgQ
 g53W1wn1gPKYy7TmD/3/oAHBZFPTufH4XLOBVYDLmUkeZ/wqcEf6dMbekziApozAZNzewDEviuDIG
 GKu/3gZRhoS0FJTSB0o8w8WvD9d6C55yAEH+wGRN1W3IEyliKr9NMy1THXf8KRvQou0w1Fv0EosMS
 kaJIWjM+QapiLxX0Gi5ELp+xuxn+06K2MqrXCcWY8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuq2c-0002nX-Ko; Sat, 28 May 2022 07:35:18 +0100
Message-ID: <3ebdf638-45cf-09d1-3538-febfa29eda83@ilande.co.uk>
Date: Sat, 28 May 2022 07:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220526111926.19603-1-deller@gmx.de>
 <20220526111926.19603-3-deller@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220526111926.19603-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] hppa: Fix serial port pass-through
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/05/2022 12:19, Helge Deller wrote:

> This fixes the serial ports in the emulation to behave as on original
> hardware.
> 
> On the real hardware, the LASI UART is serial port #0 and the DINO UART
> is serial port #1. This is fixed in SEABIOS_HPPA_VERSION >= 6, which is
> why the latest firmware is required.
> 
> The serial port addresses in hppa/hppa_hardware.h are swapped and the
> file is synced with the version in SeaBIOS-hppa. Please note that this
> file is shared between qemu and SeaBIOS-hppa, which is why a comment was
> added at the top of the file.
> 
> When creating the virtual serial ports the correct port addresses are
> now used.
> 
> Finally, this patch now allows the user to give:
>      -serial mon:stdio -serial /dev/ttyS4
> to use emulated ttyS0 in the guest for console output, and pass ttyS4
> from the host to ttyS1 in the guest.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/hppa_hardware.h | 10 ++++++++--
>   hw/hppa/machine.c       | 17 +++++++----------
>   2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
> index 8b6b9222cb..c036d467f3 100644
> --- a/hw/hppa/hppa_hardware.h
> +++ b/hw/hppa/hppa_hardware.h
> @@ -1,4 +1,5 @@
>   /* HPPA cores and system support chips.  */
> +/* Be aware: This file is shared as-is with seabios-hppa. */

Ah thanks for the comment - I didn't realise that when I did the last set of changes, 
but presumably everything is in sync now? It would be nice for this to be done as a 
separate commit, since even with the PORT_SERIAL1 and PORT_SERIAL2 changes, there 
would be no regression if the serial ports are currently broken.

>   #ifndef HW_HPPA_HPPA_HARDWARE_H
>   #define HW_HPPA_HPPA_HARDWARE_H
> @@ -30,13 +31,18 @@
>   #define PCI_HPA         DINO_HPA        /* PCI bus */
>   #define IDE_HPA         0xf9000000      /* Boot disc controller */
> 
> +/* offsets to DINO HPA: */
> +#define DINO_PCI_ADDR           0x064
> +#define DINO_CONFIG_DATA        0x068
> +#define DINO_IO_DATA            0x06c
> +
>   #define PORT_PCI_CMD    (PCI_HPA + DINO_PCI_ADDR)
>   #define PORT_PCI_DATA   (PCI_HPA + DINO_CONFIG_DATA)
> 
>   #define FW_CFG_IO_BASE  0xfffa0000
> 
> -#define PORT_SERIAL1    (DINO_UART_HPA + 0x800)
> -#define PORT_SERIAL2    (LASI_UART_HPA + 0x800)
> +#define PORT_SERIAL1    (LASI_UART_HPA + 0x800)
> +#define PORT_SERIAL2    (DINO_UART_HPA + 0x800)
> 
>   #define HPPA_MAX_CPUS   16      /* max. number of SMP CPUs */
>   #define CPU_CLOCK_MHZ   250     /* emulate a 250 MHz CPU */
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index d1e174b1f4..5d23b9e528 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -32,7 +32,7 @@
> 
>   #define MAX_IDE_BUS 2
> 
> -#define MIN_SEABIOS_HPPA_VERSION 1 /* require at least this fw version */
> +#define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */
> 
>   #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)
> 
> @@ -236,18 +236,15 @@ static void machine_hppa_init(MachineState *machine)
>       /* Realtime clock, used by firmware for PDC_TOD call. */
>       mc146818_rtc_init(isa_bus, 2000, NULL);
> 
> -    /* Serial code setup.  */
> +    /* Serial ports - Lasi and Dino use a 7.272727 MHz clock. */
>       if (serial_hd(0)) {
> -        uint32_t addr = DINO_UART_HPA + 0x800;
> -        serial_mm_init(addr_space, addr, 0,
> -                       qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT),
> -                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
> +        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> +                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 7272727 / 16,
> +                serial_hd(0), DEVICE_BIG_ENDIAN);
>       }
> -
>       if (serial_hd(1)) {
> -        /* Serial port */
> -        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> -                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / 16,
> +        serial_mm_init(addr_space, DINO_UART_HPA + 0x800, 0,
> +                qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT), 7272727 / 16,
>                   serial_hd(1), DEVICE_BIG_ENDIAN);
>       }

You can remove both of the "if (serial_hd(x)) { ... }" wrappers here: for some time 
now the chardev code assumes that NULL == not connected. This is also better since it 
means that even if you haven't connected anything to the guest serial port, the port 
is still mapped in the guest's address space which can be useful if the firmware 
unconditionally outputs debugging information on the serial port.


ATB,

Mark.

