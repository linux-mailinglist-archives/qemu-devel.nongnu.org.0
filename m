Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B12F8C4B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 09:41:42 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0h9R-0003jY-5s
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 03:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0h8U-0003Cm-0v
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 03:40:42 -0500
Received: from mail-ed1-f46.google.com ([209.85.208.46]:34042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0h8S-00043d-Ai
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 03:40:41 -0500
Received: by mail-ed1-f46.google.com with SMTP id d22so1125937edy.1
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 00:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J3bCUaUFpZ+92OfUyJLuLW1FQhPzQ6guJnTHgju4Iw0=;
 b=po2AbeQI6uu5IxaGnIN4RCC+NCQOUAvb7tfTJ2xxE7+uVP/qykt+/WN+4Wl82X53Av
 BC287xblDQWAFutOPh1pyqRJW1XOYYLrd5Hv4D3wFkHnTIy05ZQryjSSk7wp5TNUd4ed
 DQe2yZXG0gwTEEbft728m5Ul+ZP2pirLI1qmrc0EYxcyzp1ZgPT39fiFUTSfxZMAPVPA
 A0Z9Aj2u76Hgj8bUMTMe8iJKXikPZPApqUY+81qgrYIGEWlugs5ut4UKVcEBo4i8hj3s
 F2HzyONSoJsVZq/xvnr/CfexZgugi/Y3LlHUH8TTodreQOMbAMptjkAeW19fdes6gfnJ
 kMCQ==
X-Gm-Message-State: AOAM531wkL7ccAvw0UiPP7WVjcXTjHay2CUZtqqr+4l0mtZ+BhicyC41
 iSZrBEp99Dhy81MgQ/l/b7Q=
X-Google-Smtp-Source: ABdhPJx4MdKZ85cQzv0+3VN9hw+ZpZ3jabIl4kQxvGTHph/VpA3W5O/US4oLq53lMQ9csOoL0xqgDQ==
X-Received: by 2002:a50:b944:: with SMTP id m62mr12526924ede.182.1610786438938; 
 Sat, 16 Jan 2021 00:40:38 -0800 (PST)
Received: from localhost (pd9e834f0.dip0.t-ipconnect.de. [217.232.52.240])
 by smtp.gmail.com with ESMTPSA id i8sm6577604eds.72.2021.01.16.00.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 00:40:38 -0800 (PST)
Date: Sat, 16 Jan 2021 09:40:35 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/11] hw/m68k/next-cube: Move int_status and int_mask
 to NeXTPC struct
Message-ID: <20210116094035.2af2b927@tuxfamily.org>
In-Reply-To: <20210115201206.17347-7-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-7-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.46; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:01 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> All the code which accesses int_status and int_mask is now doing
> so via the NeXTPC->NeXTState indirection, so we can move these
> fields into the NeXTPC struct where they belong.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/m68k/next-cube.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index a9e57304e04..6b4bcfd4b9b 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -73,9 +73,6 @@ typedef struct NextRtc {
>  struct NeXTState {
>      MachineState parent;
>  
> -    uint32_t int_mask;
> -    uint32_t int_status;
> -
>      next_dma dma[10];
>      qemu_irq *scsi_irq;
>      qemu_irq scsi_dma;
> @@ -103,6 +100,8 @@ struct NeXTPC {
>      uint32_t scr2;
>      uint8_t scsi_csr_1;
>      uint8_t scsi_csr_2;
> +    uint32_t int_mask;
> +    uint32_t int_status;
>  };
>  
>  /* Thanks to NeXT forums for this */
> @@ -243,7 +242,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t
> val, int size) /* clear FTU */
>                      if (rtc->value & 0x04) {
>                          rtc->status = rtc->status & (~0x18);
> -                        s->ns->int_status = s->ns->int_status &
> (~0x04);
> +                        s->int_status = s->int_status & (~0x04);
>                      }
>                  }
>              }
> @@ -302,12 +301,12 @@ static uint32_t mmio_readl(NeXTPC *s, hwaddr
> addr) {
>      switch (addr) {
>      case 0x7000:
> -        /* DPRINTF("Read INT status: %x\n", s->ns->int_status); */
> -        return s->ns->int_status;
> +        /* DPRINTF("Read INT status: %x\n", s->int_status); */
> +        return s->int_status;
>  
>      case 0x7800:
> -        DPRINTF("MMIO Read INT mask: %x\n", s->ns->int_mask);
> -        return s->ns->int_mask;
> +        DPRINTF("MMIO Read INT mask: %x\n", s->int_mask);
> +        return s->int_mask;
>  
>      case 0xc000:
>          return s->scr1;
> @@ -342,12 +341,12 @@ static void mmio_writel(NeXTPC *s, hwaddr addr,
> uint32_t val) {
>      switch (addr) {
>      case 0x7000:
> -        DPRINTF("INT Status old: %x new: %x\n", s->ns->int_status,
> val);
> -        s->ns->int_status = val;
> +        DPRINTF("INT Status old: %x new: %x\n", s->int_status, val);
> +        s->int_status = val;
>          break;
>      case 0x7800:
> -        DPRINTF("INT Mask old: %x new: %x\n", s->ns->int_mask, val);
> -        s->ns->int_mask  = val;
> +        DPRINTF("INT Mask old: %x new: %x\n", s->int_mask, val);
> +        s->int_mask  = val;
>          break;
>      case 0xc000:
>          DPRINTF("SCR1 Write: %x\n", val);
> @@ -504,9 +503,9 @@ static void scr_writeb(NeXTPC *s, hwaddr addr,
> uint32_t value) DPRINTF("SCSICSR CPUDMA\n");
>              /* qemu_irq_raise(s->scsi_dma); */
>  
> -            s->ns->int_status |= 0x4000000;
> +            s->int_status |= 0x4000000;
>          } else {
> -            s->ns->int_status &= ~(0x4000000);
> +            s->int_status &= ~(0x4000000);
>          }
>          if (value & SCSICSR_INTMASK) {
>              DPRINTF("SCSICSR INTMASK\n");
> @@ -798,14 +797,14 @@ static void next_irq(void *opaque, int number,
> int level)
>       * this HAS to be wrong, the interrupt handlers in mach and
> together
>       * int_status and int_mask and return if there is a hit
>       */
> -    if (s->ns->int_mask & (1 << shift)) {
> +    if (s->int_mask & (1 << shift)) {
>          DPRINTF("%x interrupt masked @ %x\n", 1 << shift,
> cpu->env.pc); /* return; */
>      }
>  
>      /* second switch triggers the correct interrupt */
>      if (level) {
> -        s->ns->int_status |= 1 << shift;
> +        s->int_status |= 1 << shift;
>  
>          switch (number) {
>          /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi,
> clock */ @@ -834,7 +833,7 @@ static void next_irq(void *opaque, int
> number, int level) break;
>          }
>      } else {
> -        s->ns->int_status &= ~(1 << shift);
> +        s->int_status &= ~(1 << shift);
>          cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
>      }
>  }

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

