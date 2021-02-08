Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A963140BE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:44:46 +0100 (CET)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DOn-0001E9-7d
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97PG-0000HX-Pg; Mon, 08 Feb 2021 09:20:52 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:34211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97PC-0006sK-JD; Mon, 08 Feb 2021 09:20:50 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id d184so3399599ybf.1;
 Mon, 08 Feb 2021 06:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6p9usCBS5d23b+ZoLvnsrTeZeGzHSQarppTQHFE1osc=;
 b=ERxITJrxZXC2giflJbDczLsPcpQ29s3NKT6woFYVrCc3+mNhPU7xMdZdmIFBfXH0E7
 bSo+WpRTf5KRQdcX2ipaNL5huzUm5z1gvwsInTZ3YUNwj8PrZ0AotA2l5Y3xeaJVAQYt
 RjWil2WQgWTIvg+mVbsXIoDuVTy7vIM0Guj6vtcGwZhqVKT+l7SL09ysq2UjkmgCBAiQ
 FOCfUN0cJkEpIaUEXdN1XVmlPSSVCsGveUaIQr8K+523R6UCE/UBMGv+fBTeTG5yfC4T
 ySzOMIfD3BEXyhgGSeDdQke3HUbxLbWk0LoKCnGx4cephS4vTFyU/8vfP8DoU24TVLJk
 3yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6p9usCBS5d23b+ZoLvnsrTeZeGzHSQarppTQHFE1osc=;
 b=p/9/6Cs3nCRYTgaKQIRWcb80p1ELd94Lxjan8A87H5zLo75YpS378mFrsKfUveKL5a
 orOZ8pYaC8DQ7pd/PpPLHHIs6cil9yCeE0oYeUZ3iliB/UGJNrHqOl9TcNRXNo5EaN43
 Ur84HvkpZ20Xf30LDPl+IGv/wWWfEJe2Y+uDYeGoiw1VNIBbyXLe3mbJbiHRaTXQX2yV
 9tP54FsKxC1bUtSF13NqQn0bbND/SPCV5zx9iRxTk3RDl0Y9ZnzjqcFVJwLGLuIQepgP
 IzT3M6xvj3dtDZY7t5bryA3ab+GDtbWDiawCnGnHtg+lG6x3W3nqMcFuQ1ck3CMINgKf
 JHAQ==
X-Gm-Message-State: AOAM533U5mLOlCyMH4bZaP0Jtlix2SpKLxiR3cPUBO3+FT22C81eB/ix
 h+wjqbfMyNW0ra3uGW9nY2FRuaXti+sN1+f1728=
X-Google-Smtp-Source: ABdhPJw2R7J5XgCdXjZi8qgdJRBPxODhQ9bPFs/ZKW2jgR04osYv4FTOJXhSQ6S4TJB0l4jFV00rMe5+wDWk8nmd8sk=
X-Received: by 2002:a25:3bc5:: with SMTP id
 i188mr25792589yba.332.1612794043774; 
 Mon, 08 Feb 2021 06:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <20210128063035.15674-10-bmeng.cn@gmail.com>
 <16fb545a-d793-6447-d52f-f504aecc988f@amsat.org>
In-Reply-To: <16fb545a-d793-6447-d52f-f504aecc988f@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:20:32 +0800
Message-ID: <CAEUhbmW3vU2wkNL70QF__Sh3n-ZXdbuwb=fA-fUT+Ai-ptz1sQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, Feb 8, 2021 at 10:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/28/21 7:30 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Besides CMD12, the following command's reponse type is R1b:
> >
> > - SET_WRITE_PROT (CMD28)
> > - CLR_WRITE_PROT (CMD29)
> > - ERASE (CMD38)
> >
> > Reuse the same s->stopping to indicate a R1b reponse is needed.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - new patch: handle the rest commands with R1b response type
> >
> >  hw/sd/ssi-sd.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> > index 907d681d19..97ee58e20c 100644
> > --- a/hw/sd/ssi-sd.c
> > +++ b/hw/sd/ssi-sd.c
> > @@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev=
, uint32_t val)
> >                  /* CMD13 returns a 2-byte statuse work. Other commands
> >                     only return the first byte.  */
> >                  s->arglen =3D (s->cmd =3D=3D 13) ? 2 : 1;
> > +
> > +                /* handle R1b */
> > +                if (s->cmd =3D=3D 28 || s->cmd =3D=3D 29 || s->cmd =3D=
=3D 38) {
>
> Why not also check CMD13 for completeness?
>

I am not sure I got your point. CMD13 does not respond with R1b but R2.

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > +                    s->stopping =3D 1;
> > +                }
> > +
> >                  cardstatus =3D ldl_be_p(longresp);
> >                  status =3D 0;
> >                  if (((cardstatus >> 9) & 0xf) < 4)
> >

Regards,
Bin

