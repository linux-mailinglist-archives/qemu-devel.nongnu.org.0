Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E802313E9F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:14:34 +0100 (CET)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BzT-00018Q-MB
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l97Vt-0001hu-Fp; Mon, 08 Feb 2021 09:27:43 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l97Vq-0000c8-QP; Mon, 08 Feb 2021 09:27:40 -0500
Received: by mail-oi1-f181.google.com with SMTP id d20so15712741oiw.10;
 Mon, 08 Feb 2021 06:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3MbEztMlRu+47w9/JoRZf0jmHQQ7FUXP9YxNbBnghqQ=;
 b=ItlbeX/uknPxhcKRDupv9VTVnv0HUy1/RPPhS0W4XqSK2G9dFTu+SLXKoHU2KBzQAp
 F+CrCuIGup+m8HoM09nTI13hi0fCe4WWbw6Jl78HGFNtdR/U1yqJab4ElvEIMciD2ped
 Qllo90mlM9hZDVMELl1hQySNfIcJyADdn8OXhzCpYxJZEvxsE5gIZkC2uIK+3+55zz03
 IERIMCrMX3Q0OAFB0OIa8rGKJ+4aYYz3F+4P2sY5nPu4dGmSOWKZOtPgcNX0XqNvaAbt
 vbGA5osjYyh8txLgY5pD9+LEgMe+Bol2cE4yjGPTnQ9v/BccpPXSNsNdN50NBDu2tCYQ
 H3Mw==
X-Gm-Message-State: AOAM5323wxiIPVWUXbMIul0wKmfD3KzGU+PY4hRC8lJ57WEI5xqJ6biP
 NoTZZpGDK1WTzJDQF+UWfkoiC/nwm+sZSKo6cKs=
X-Google-Smtp-Source: ABdhPJwrdqzK8DhbYESVlD1iPjZ9u2TSZMxn5FRiwc3np/bQYQpPTxQqGd+ksiAV8laa/l5wASSNbB4zAxoxwHd46m8=
X-Received: by 2002:a54:4482:: with SMTP id v2mr11396625oiv.121.1612794457377; 
 Mon, 08 Feb 2021 06:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <20210128063035.15674-10-bmeng.cn@gmail.com>
 <16fb545a-d793-6447-d52f-f504aecc988f@amsat.org>
 <CAEUhbmW3vU2wkNL70QF__Sh3n-ZXdbuwb=fA-fUT+Ai-ptz1sQ@mail.gmail.com>
In-Reply-To: <CAEUhbmW3vU2wkNL70QF__Sh3n-ZXdbuwb=fA-fUT+Ai-ptz1sQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 8 Feb 2021 15:27:26 +0100
Message-ID: <CAAdtpL4WKEQ--D0DqJ_tMo8DxiBW-8F_6+w+PfiWtsxhi_O_5A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.181;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f181.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 3:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Mon, Feb 8, 2021 at 10:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > On 1/28/21 7:30 AM, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Besides CMD12, the following command's reponse type is R1b:
> > >
> > > - SET_WRITE_PROT (CMD28)
> > > - CLR_WRITE_PROT (CMD29)
> > > - ERASE (CMD38)
> > >
> > > Reuse the same s->stopping to indicate a R1b reponse is needed.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > > - new patch: handle the rest commands with R1b response type
> > >
> > >  hw/sd/ssi-sd.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> > > index 907d681d19..97ee58e20c 100644
> > > --- a/hw/sd/ssi-sd.c
> > > +++ b/hw/sd/ssi-sd.c
> > > @@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *d=
ev, uint32_t val)
> > >                  /* CMD13 returns a 2-byte statuse work. Other comman=
ds
> > >                     only return the first byte.  */
> > >                  s->arglen =3D (s->cmd =3D=3D 13) ? 2 : 1;
> > > +
> > > +                /* handle R1b */
> > > +                if (s->cmd =3D=3D 28 || s->cmd =3D=3D 29 || s->cmd =
=3D=3D 38) {
> >
> > Why not also check CMD13 for completeness?
> >
>
> I am not sure I got your point. CMD13 does not respond with R1b but R2.

Forget what I wrote, you are correct =3D)

BTW since you have a deep understanding of SD cards, would you like to
be listed as designated reviewer in the SD/MMC section?

> > Otherwise:
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > > +                    s->stopping =3D 1;
> > > +                }
> > > +
> > >                  cardstatus =3D ldl_be_p(longresp);
> > >                  status =3D 0;
> > >                  if (((cardstatus >> 9) & 0xf) < 4)
> > >
>
> Regards,
> Bin

