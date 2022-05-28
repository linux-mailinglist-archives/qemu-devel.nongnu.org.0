Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC8536D47
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 16:26:03 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuxOE-0006mL-63
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuxMq-000649-IL
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:24:36 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuxMo-0002TV-MY
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:24:36 -0400
Received: by mail-yb1-xb30.google.com with SMTP id r82so2377880ybc.13
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEHbioAjJRypYwd3MvAMU4TnAnK0G8nrF1ZYt8p8Erk=;
 b=DDuMFoIW9WTHalAgox9lVn8B+OptF6/hpYogvWwYx4TSnHG15HMYaANo8ymyIbSQ4k
 zWw4e5qczUfiBy/e6SE+vuLGXcPY2Ykol3likuDqOpBbDhVROsZm3M3cMek4x8FocQWB
 ASCTXof6lz/Na50UM1WFZxvlgj9pwvidcDPZ9gCWc8nhwPHQGqfWTINuMbAVdFqsKCPL
 xW1eqvhZr/SuwjovIA+rQDNq2M628xCiGuwIT0zulE1kVE75dEO80wQrUwvPk+V/aEoo
 e6Op0dncKb+NAehbN4DpaDH/3rmV7k2ywgLTF1VpydZOMS7duxbgRUI23nBu4Gl9Ta4w
 GbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEHbioAjJRypYwd3MvAMU4TnAnK0G8nrF1ZYt8p8Erk=;
 b=nDVJJPgj5H4Y8Il6cg6Xkg5OzJDzsHKDMAIFXPo+LNCRGP+9zQ9RIQA+M6xp7MkYK6
 rPFqflnftvAv6NdwyqZiF0TCdqpTgFD1ysIQQZDF+J7/3bUpW9IwneW0vqKG0wtCslBY
 rIwciYQ5Qa5/cOCuhLwfr5Ee0tqijL8WnNYj7w645TbGPd36hmlQSi1eV46rHQpEHRyW
 cGVEsnGpPDBppSmgobqVWu0+JLAlq81mvKEwy2/gr/UsZhr1KzgHU7fICzoypbw3f23S
 Gvxie3RvgLTgwFcn8mRHrO6ozk+Ge2p6R18sBxJ3Lb9sdqUtdhpXmELCl3K43QI7we4R
 zCtQ==
X-Gm-Message-State: AOAM531TgnVu3atTy9G2kn/ykBoCKGHsBSx51BXjdYd7i0yheoBepNgk
 +sxGI7NboV6dPZIFnkJaOKzjbSaPrrGku6A3J4e9eA==
X-Google-Smtp-Source: ABdhPJzHT99axY+Nylw6McVV+9x+/ommL7hK0QGfpjVzP6LpY7MX/jFK6j/sl/qH2MdjDesVMAw6RlPK8KljpQGKK7w=
X-Received: by 2002:a05:6902:1021:b0:64f:51d0:f421 with SMTP id
 x1-20020a056902102100b0064f51d0f421mr41307949ybt.39.1653747871270; Sat, 28
 May 2022 07:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220526111926.19603-1-deller@gmx.de>
 <20220526111926.19603-3-deller@gmx.de>
In-Reply-To: <20220526111926.19603-3-deller@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 May 2022 15:24:20 +0100
Message-ID: <CAFEAcA-Lzg_OcEU4gytwCzm-QwVWAqio=xcUC8Lf_zofS1Pi+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hppa: Fix serial port pass-through
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 26 May 2022 at 12:52, Helge Deller <deller@gmx.de> wrote:
>
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
>     -serial mon:stdio -serial /dev/ttyS4
> to use emulated ttyS0 in the guest for console output, and pass ttyS4
> from the host to ttyS1 in the guest.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> @@ -236,18 +236,15 @@ static void machine_hppa_init(MachineState *machine)
>      /* Realtime clock, used by firmware for PDC_TOD call. */
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>
> -    /* Serial code setup.  */
> +    /* Serial ports - Lasi and Dino use a 7.272727 MHz clock. */
>      if (serial_hd(0)) {
> -        uint32_t addr = DINO_UART_HPA + 0x800;
> -        serial_mm_init(addr_space, addr, 0,
> -                       qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT),
> -                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
> +        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> +                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 7272727 / 16,
> +                serial_hd(0), DEVICE_BIG_ENDIAN);
>      }
> -
>      if (serial_hd(1)) {
> -        /* Serial port */
> -        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> -                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / 16,
> +        serial_mm_init(addr_space, DINO_UART_HPA + 0x800, 0,
> +                qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT), 7272727 / 16,
>                  serial_hd(1), DEVICE_BIG_ENDIAN);
>      }

Not related to this change, but you should consider removing these
"if (serial_hd(n))" conditionals. They used to be necessary because
the chardev backend infrastructure couldn't cope with being handed
a NULL pointer, but these days that is guaranteed to work (with
a NULL pointer being equivalent to the 'throw everything away'
null chardev), so the if()s are no longer necessary. They also
mean that the guest sees the hardware it expects, ie the UARTs
are always there and programmable whether there's an RS232 cable
plugged in the back of the machine or not.

thanks
-- PMM

