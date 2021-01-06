Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015492EB9D6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:08:22 +0100 (CET)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1zZ-0003on-3l
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1yJ-0002xS-93; Wed, 06 Jan 2021 01:07:07 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1yG-0001sp-4z; Wed, 06 Jan 2021 01:07:03 -0500
Received: by mail-yb1-xb32.google.com with SMTP id f6so1795244ybq.13;
 Tue, 05 Jan 2021 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7y0hhbvZTznMMzCHGJlFZj/YuRRiB2TedVaDCsTT4PY=;
 b=gmo6TMLNjkZ+LXD9KNQ6joWIfjYt/yxzKe1zk2Sq9lOqGuVaNVVU7uVHReXflEvL+E
 3LytJUIN2gUn/rEn5JNaV9hQJsJdBC4m3Fkt4Nq70jdQt9RANyk1fgfAa7gM/cyKJg6j
 b8Vf8/Pst+iTe6EhdLCzEAqiRdeT6+jfyrkZgjgpc6Uxwm15jdW+lTw+w2nx9ONJfBz5
 MEKja0MXw3EHK8WPivgHXJ73Oq4wLHqQcolZXhD/dJ1w7Kfz5swReX/gXYGNFymP9emf
 VzSockhQgeGvRJl0PurMUwvjXGdD9EfifReIVr0aU0KilJvmIg6bygCgMSob+IdGzDhS
 Qr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7y0hhbvZTznMMzCHGJlFZj/YuRRiB2TedVaDCsTT4PY=;
 b=LQFCjF+AY41RtPbhXQAaiMDppKNFhB6WNleBnxN477hlRYYdUoTyFQraX5o2uH15gz
 sFPEYJLTvL3BbukEKTDpakhriFDTMAgf5BhGzUfwt0lREIBI+B+F7v0uMVmsMTITx58p
 L9uUsZ9WxZA65c1O4LGEl1QDhXlQ3YCJuBuetOnPXoCeV9d/TL1WAv635WgQI+m8B4V3
 0Txakknl15R2k0qQerUNwuuFrCVkMJQ+81Infz6+YssDjh9K8OxgwuAPuYZ3XE6GGZPI
 xU1K56yP6BRtF4CxAFYpCbVdGEKD8emPZ4fmioh1LGxVGVydk0wAvKwauDZKooyYgbfK
 OGdA==
X-Gm-Message-State: AOAM531NiRUPPDz1CvZZ8ItJGF7M30l1tmBcSiAxheLh2aZ4Qk3GgjAp
 R3gshLMLb1iBEBu9B/8WaNLtVWGmBB1turQvdr8=
X-Google-Smtp-Source: ABdhPJxgm3Tqb6yigalIvoRLJHxDyKUSdTWUPB7s7RQp3FJpIv8R4P1yNhsLo8AgxnuT+HetG8Q9O3VKGG2AnB54dDc=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr4193590ybs.122.1609913218717; 
 Tue, 05 Jan 2021 22:06:58 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
 <54a57f94-e0e5-6dfd-2813-a38e374f221c@amsat.org>
In-Reply-To: <54a57f94-e0e5-6dfd-2813-a38e374f221c@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Jan 2021 14:06:47 +0800
Message-ID: <CAEUhbmX9LMEV1UahWB4F2B=eX503D6dJXV3-KtBNuL7_SrNYkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 31, 2020 at 6:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/17/20 6:28 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
> >
> > 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in s=
econd word.
> > 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in s=
econd word.
> >
> > Current logic uses either s->burst_length or 32, whichever smaller,
> > to determine how many bits it should read from the tx fifo each time.
> > For example, for a 48 bit burst length, current logic transfers the
> > first 32 bit from the first word in the tx fifo, followed by a 16
> > bit from the second word in the tx fifo, which is wrong. The correct
> > logic should be: transfer the first 16 bit from the first word in
> > the tx fifo, followed by a 32 bit from the second word in the tx fifo.
> >
> > With this change, SPI flash can be successfully probed by U-Boot on
> > imx6 sabrelite board.
> >
> >   =3D> sf probe
> >   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, =
total 2 MiB
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/ssi/imx_spi.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 85c172e..509fb9f 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -178,7 +178,10 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >
> >          DPRINTF("data tx:0x%08x\n", tx);
> >
> > -        tx_burst =3D MIN(s->burst_length, 32);
> > +        tx_burst =3D s->burst_length % 32;
> > +        if (tx_burst =3D=3D 0) {
> > +            tx_burst =3D 32;
> > +        }
>
> Or alternatively using ternary operator:
>
>            tx_burst =3D (s->burst_length % 32) ?: 32;

Updated this in v2 series:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D222931

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Regards,
Bin

