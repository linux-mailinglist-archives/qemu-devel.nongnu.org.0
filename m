Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFF3F446B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 06:43:47 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI1oI-0001g9-6l
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 00:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1n6-0000ig-Nz; Mon, 23 Aug 2021 00:42:32 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI1n5-0001tb-5z; Mon, 23 Aug 2021 00:42:32 -0400
Received: by mail-io1-xd2c.google.com with SMTP id a15so20241148iot.2;
 Sun, 22 Aug 2021 21:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=noZudTuffjhJMDakBtGQYFNuEz5wGpF5Wmt03Wj6COA=;
 b=C0/i+bhSIidMSvSGxUBCAXQw0r053lsqEUw3aum+ob5dzkE1XDPuJsKhQkJ//eCvfW
 A3ev4WME9YJg+nxGyN++qOAUjRrOSO4H+lbhpMK4T3ih0WW0r5rCjNgVwWD4dKtZgunv
 XOAOFYGMkVfbeSkrIEoEmJlqtrUt9NvaqAn9SQf7ZnQAxL+cj0g1tD+PfivNQzeL4IrZ
 3FyQ4bYxyysanZKp8Q270rK5u98pFClNmXYUEt2YtQVB6mlijy0ZwzL0f66bt8zKW9f9
 pfqt4lUkymFu6QhSfeFyz/bfzVarsSPT4C9j1NmH9QjcFKF0u4RGnLKuPjX9HmMDM7jA
 olKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=noZudTuffjhJMDakBtGQYFNuEz5wGpF5Wmt03Wj6COA=;
 b=pFn8+Tt7RUlQ74w5RckkZXeJ4CG9GR+8lfTGmOjCJf9j2X7OVA8Dhh4OizfEThRDS8
 Drl7gRKkrVC/ftWRboPkintxMR9b7h+UktRhpejwuCiuFp0pPlx0ytAzBtCmx/VRIPpJ
 JINUatcM0IlvlfKVqs6sVpesI0PwT+q3Nsw6S6PbnegHCI+6l0DBWWpLLXcQx9nDMNal
 bguX4y70J5/I9g8azCPw4xDUnyfTThOvSExGXn4Kc3qHyQ+J8M2TZBzeVgbeRFFZEBhp
 QeDxNOAxSieK/f+6ZC/WYyFTEkKQecjrNSci/oCSArRrrim+uaLNfph8K/gmAflOHbUR
 ertA==
X-Gm-Message-State: AOAM531PvhT5eld8xkwD6XseDiFs5ykvp3f22cVI26r9zb/e0WF0Un0I
 aQBtqzTm6vTcFIZQww9JPmGTkTHVJ131bB9oHxQ=
X-Google-Smtp-Source: ABdhPJyhUGRzzSPiOZPOj9EiR9vDWWTjBBaDVkVi2PJR3i4KzRPw9cDpTrF1TMOPisrFjQ6urF7izXAwIMgn0jElu3E=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr25376841ion.118.1629693749185; 
 Sun, 22 Aug 2021 21:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-2-bmeng.cn@gmail.com>
In-Reply-To: <20210823020813.25192-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 14:42:03 +1000
Message-ID: <CAKmqyKPnAQHi4hkTrSVCkHX4tHZyXFnkoESh9svc-qQNqG5-2Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: zynq_slcr: Correctly compute output clocks
 in the reset exit phase
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 12:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> does not receive anything. Debugging shows that the UART input clock
> frequency is zero which prevents the UART from receiving anything as
> per the logic in uart_receive().
>
> From zynq_slcr_reset_exit() comment, it intends to compute output
> clocks according to ps_clk and registers. zynq_slcr_compute_clocks()
> is called to accomplish the task, inside which device_is_in_reset()
> is called to actually make the attempt in vain.
>
> Rework reset_hold() and reset_exit() so that in the reset exit phase,
> the logic can really compute output clocks in reset_exit().
>
> With this change, upstream U-Boot boots properly again with:
>
> $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
>     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>
> Fixes: 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/misc/zynq_slcr.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 5086e6b7ed..8b70285961 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -269,6 +269,21 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
>      zynq_slcr_compute_clock((plls), (state)->regs[reg], \
>                              reg ## _ ## enable_field ## _SHIFT)
>
> +static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
> +{
> +    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
> +    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
> +    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
> +
> +    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
> +
> +    /* compute uartX reference clocks */
> +    clock_set(s->uart0_ref_clk,
> +              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
> +    clock_set(s->uart1_ref_clk,
> +              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
> +}
> +
>  /**
>   * Compute and set the ouputs clocks periods.
>   * But do not propagate them further. Connected clocks
> @@ -283,17 +298,7 @@ static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
>          ps_clk = 0;
>      }
>
> -    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
> -    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
> -    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
> -
> -    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
> -
> -    /* compute uartX reference clocks */
> -    clock_set(s->uart0_ref_clk,
> -              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
> -    clock_set(s->uart1_ref_clk,
> -              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
> +    zynq_slcr_compute_clocks_internal(s, ps_clk);
>  }
>
>  /**
> @@ -416,7 +421,7 @@ static void zynq_slcr_reset_hold(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will disable all output clocks */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks_internal(s, 0);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -425,7 +430,7 @@ static void zynq_slcr_reset_exit(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will compute output clocks according to ps_clk and registers */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
>      zynq_slcr_propagate_clocks(s);
>  }
>
> --
> 2.25.1
>
>

