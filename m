Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C103F4810
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:59:32 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6jl-0001FY-Hi
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI6iT-00008M-2g; Mon, 23 Aug 2021 05:58:05 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI6iQ-0007ZK-Ek; Mon, 23 Aug 2021 05:58:04 -0400
Received: by mail-yb1-xb33.google.com with SMTP id k65so32908453yba.13;
 Mon, 23 Aug 2021 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dSJP7vqY8fmMiEeFaZtbmFc3zOocAmOBfsrWlU+3TIw=;
 b=W6rBFuUVChzOisojXaufHPd9Fx8UoJDzu3XkKwJnT3IeJQ0xTO41Mrw+rQg0a6lvWt
 ANVrCnJbSdNHK9SEfxw32Mom87o2wTVt+cks5KKeaAI3KEYxlf61flDPyGIvVac2U3RX
 AtgSinczoqf6tzx3IwqMHuqoQai0tanC6bI7hPzhzLTRgLQ5C6Yj2R6VJnCZ6snBOk9A
 lBNuGq/H5ObxTatOl4q9iDujKjFEL9ZiHo4Uy6AQGJhlJINGN7tKsrR63uIcJwENzZ3j
 tFSyZVyHe15F/QO4/LeuT/8tQPxKeKDFfuERDoFesqsWTALsLCoH4Kq3vD3GfsrzlIqz
 piWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dSJP7vqY8fmMiEeFaZtbmFc3zOocAmOBfsrWlU+3TIw=;
 b=Du9poJaJ8yP2dpaQvUjKlOi83DLnvqnAxBOeSz98P6Ng20BXWp00tUlg3z0RoNS5K2
 ubjSZWRVAP79oFocLVM2faWqFotXC6MGEcI1MTZPlp+PxB5jbjbrjrah8Zl3MG7/x04f
 IYjsb/5fzw4I1ht159eKODPvviXP38r28BMKJayN+Xqgo4240EelBziqr2ewy+T0oZbX
 ojSp5fFi5QIhd6Mi77Sn/f6Vo4rL2lCpUC120q7BtCQYhd/rwIoWofLo5YK7KFDMtg4j
 /LNO5dKacGC7dr9TlgS6Kw/NF4vDgt7eeYnmtDAK4KRImqIFvS8Xm+IpvMGEau1CSk1c
 XHXQ==
X-Gm-Message-State: AOAM531+r6LbYaW4hLdkRjH6GAOVTbj7EbeZBzNlwKU+f1bJxGAbWrcm
 pLMwp83dahebLGi7elJAhgu7C14EcVJRjIF00pM=
X-Google-Smtp-Source: ABdhPJxcDbdivu+2/BBnn6rWEn46PHl4PXy+ebJJ1+Jk0R7O+8OWF9T8yTuL0696d+nRg5dzRVDWC9Ngv7YD+WWJqrg=
X-Received: by 2002:a25:cf8a:: with SMTP id
 f132mr44621723ybg.387.1629712681084; 
 Mon, 23 Aug 2021 02:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
In-Reply-To: <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 17:57:49 +0800
Message-ID: <CAEUhbmVVRKebU-=k0WaxpaRe-E_UsLy_82K0PzRE=7xNHp9hGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Aug 23, 2021 at 4:14 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 8/23/21 4:08 AM, Bin Meng wrote:
> > At present when input clock is disabled, any character transmitted
> > to tx fifo can still show on the serial line, which is wrong.
> >
> > Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/char/cadence_uart.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index b4b5e8a3ee..154be34992 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use=
, GIOCondition cond,
> >  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf=
,
> >                                 int size)
> >  {
> > +    /* ignore characters when unclocked or in reset */
> > +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s)))=
 {
> > +        return;
> > +    }
>
> Incorrect handler?
>

Sorry I don't get it. This patch is for the Tx path, while patch #3 is
for the Rx path.

> -- >8 --
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b4b5e8a3ee0..4f096222f52 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *=
s)
>  static int uart_can_receive(void *opaque)
>  {
>      CadenceUARTState *s =3D opaque;
> -    int ret =3D MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE=
);
> -    uint32_t ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
> +    int ret;
> +    uint32_t ch_mode;
> +
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return 0;
> +    }
> +
> +    ret =3D MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
> +    ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
>
>      if (ch_mode =3D=3D NORMAL_MODE || ch_mode =3D=3D ECHO_MODE) {
>          ret =3D MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);

Regards,
Bin

