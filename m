Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D9672D94
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 01:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIJ0R-0005Ru-4S; Wed, 18 Jan 2023 19:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIJ0O-0005Rg-6O; Wed, 18 Jan 2023 19:42:12 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIJ0M-0003ch-7D; Wed, 18 Jan 2023 19:42:11 -0500
Received: by mail-ua1-x929.google.com with SMTP id o8so130512uaw.5;
 Wed, 18 Jan 2023 16:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=os8ISr1qekJC2Kdy31xqUE3rwuUYjA10vSUZ0febqKY=;
 b=E0nsc45ogFDvyQBMJqIt8nMR72wcQ/qvJZ/34T19dV1/US79uTaDKbsdvqyBtRUAxm
 T7ghRoNhrajyyPxOFSduoU8I+bzB1KZB7ciBh0aqFvNEx1DAhbuwLeA8r3N3fpyFLaVX
 TUpeiVfQRAp/1glIPeQUEXZwQr99BVG5LDyAc+LG9C8Fjgy7NR1f/PWF0pgqse6Cu4Bk
 pxNGkzgwv76FlPerzGNDHtXGf9vhIY2XqLDz89xah8rCwQ6uD3ZVudyO1t55+1LTh22y
 a7RxTzn2Fr/ZOGZZ9gHRX0CmCbBHgd3dbU2QsCA40S0V7VaPcWpKcY8ZUz3K0HCLRq6I
 oyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=os8ISr1qekJC2Kdy31xqUE3rwuUYjA10vSUZ0febqKY=;
 b=FLPas+oSPMmc8e+X9oGaWC69RDBffyOpxViG+4LevqF2TxCz6Z7zJtMBo9teWs2Zol
 p0p9ETgZNP1NaEeB3NBUz3sTRsZzwKdUjXHSZvYsoZlcW7q3pG535IE2sfMy9j+1tNI+
 wiRIMWbfkr812CKVIInmOnVvLGCQXk/5IqhEzhjN4eaoHQRKi/bRoKPrE8J4PULXJ5C5
 1b8smPeEKiMVEPt7E2B84WsW6hFNA1pFe7oGrkzdZz4D03cRGfjfoDcrN/4ft4hv0qyj
 YryaaWmIVxUfFhJo9HpnJ5oAzCWNgickUnR19uEchn6oEmqI7lETQMCJ6YQG+IO6uyUm
 TBow==
X-Gm-Message-State: AFqh2krPnamL1Vl8C1EaoNed3s7Uw7XniOmir9ulwigColXtBhu8Z4C8
 +/15h88l268UnUWtWm97S0yiZv34zKH4JLrxWKk=
X-Google-Smtp-Source: AMrXdXupiWHmErhf/AtP1UQ1VxxIcyiGHH227P3x4dyqKu23FG5DEBpEqzuV0ErADpRUCEOTDoiOqXLBazU8ceX3DXM=
X-Received: by 2002:ab0:3b8d:0:b0:419:2865:3ae7 with SMTP id
 p13-20020ab03b8d000000b0041928653ae7mr1072202uaw.70.1674088928508; Wed, 18
 Jan 2023 16:42:08 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
 <Y8Yq5faCjAKzMa9O@kbusch-mbp> <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
In-Reply-To: <Y8h7aOuVfCb+RsAP@kbusch-mbp>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 10:41:42 +1000
Message-ID: <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Keith Busch <kbusch@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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

On Thu, Jan 19, 2023 at 9:07 AM Keith Busch <kbusch@kernel.org> wrote:
>
> On Wed, Jan 18, 2023 at 09:33:05AM -0700, Keith Busch wrote:
> > On Wed, Jan 18, 2023 at 03:04:06PM +0000, Peter Maydell wrote:
> > > On Tue, 17 Jan 2023 at 19:21, Guenter Roeck <linux@roeck-us.net> wrot=
e:
> > > > Anyway - any idea what to do to help figuring out what is happening=
 ?
> > > > Add tracing support to pci interrupt handling, maybe ?
> > >
> > > For intermittent bugs, I like recording the QEMU session under
> > > rr (using its chaos mode to provoke the failure if necessary) to
> > > get a recording that I can debug and re-debug at leisure. Usually
> > > you want to turn on/add tracing to help with this, and if the
> > > failure doesn't hit early in bootup then you might need to
> > > do a QEMU snapshot just before point-of-failure so you can
> > > run rr only on the short snapshot-to-failure segment.
> > >
> > > https://translatedcode.wordpress.com/2015/05/30/tricks-for-debugging-=
qemu-rr/
> > > https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-=
qemu-savevm-snapshots/
> > >
> > > This gives you a debugging session from the QEMU side's perspective,
> > > of course -- assuming you know what the hardware is supposed to do
> > > you hopefully wind up with either "the guest software did X,Y,Z
> > > and we incorrectly did A" or else "the guest software did X,Y,Z,
> > > the spec says A is the right/a permitted thing but the guest got conf=
used".
> > > If it's the latter then you have to look at the guest as a separate
> > > code analysis/debug problem.
> >
> > Here's what I got, though I'm way out of my depth here.
> >
> > It looks like Linux kernel's fasteoi for RISC-V's PLIC claims the
> > interrupt after its first handling, which I think is expected. After
> > claiming, QEMU masks the pending interrupt, lowering the level, though
> > the device that raised it never deasserted.
>
> I'm not sure if this is correct, but this is what I'm coming up with and
> appears to fix the problem on my setup. The hardware that sets the
> pending interrupt is going clear it, so I don't see why the interrupt
> controller is automatically clearing it when the host claims it.
>
> ---
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..f8f7af08dc 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -157,7 +157,6 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
>              uint32_t max_irq =3D sifive_plic_claimed(plic, addrid);
>
>              if (max_irq) {
> -                sifive_plic_set_pending(plic, max_irq, false);
>                  sifive_plic_set_claimed(plic, max_irq, true);
>              }
>

This change isn't correct. The PLIC spec
(https://github.com/riscv/riscv-plic-spec/releases/download/1.0.0_rc5/riscv=
-plic-1.0.0_rc5.pdf)
states:

"""
On receiving a claim message, the PLIC core will atomically determine
the ID of the highest-priority pending interrupt for the target and
then clear down the corresponding source=E2=80=99s IP bit
"""

which is what we are doing here. We are clearing the pending interrupt
inside the PLIC

Alistair

