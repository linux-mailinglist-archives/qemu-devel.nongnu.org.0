Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80C3BB707
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 07:58:41 +0200 (CEST)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Hcu-0002uD-0t
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 01:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Hbg-0002EV-Qq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 01:57:24 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Hbf-0007oG-45
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 01:57:24 -0400
Received: by mail-yb1-xb29.google.com with SMTP id p22so27274671yba.7
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4YnGtMwcoVo3p0TVmAL1TcpABVLBSX/YCrapATDzmAQ=;
 b=bfWua1fTrcrNuUf6VUInIKfjoMG1ZPtTE+z19lqgWT653qrxs5AKT/gotLK1JiI1lH
 wCJMW88UN90FouqfG379W50F1ILJ11dHn1AaXEcOpi1CF3vwUEhJ0ymWn9bjrSgNSFe/
 2SCo9Hb3komR8FY8J0PmkJ9ki2N/Gtyfu5iJfnUXCqc8COuSU1dlbbmH+FMrZh4Lwnz7
 rNInSzOsJFtcvakAefuzOUTDAu9nOkJbAN+kltL0wKniXkmP7bdPSpakMYS4uAcF84LU
 ZboPVg4CHPVnlwp0uNeqUc02hTYbPOKfB4Y1QXeuOHLTejr5Mcg86JVqEjRpsn6iBDs0
 75lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4YnGtMwcoVo3p0TVmAL1TcpABVLBSX/YCrapATDzmAQ=;
 b=pEcsXL+nt2V/NZwTH8s/ZEXk27xYTh6Ei7O/0R9oCsN06+gGLIPxBiL+wp3zShf06O
 9J30U/rpDGyMEwOrKPuzPcPVLqKmLeopSE9w1jUMVMxBrhtPYz92T6RGUhT3gpTVgFGc
 T/YKLNa+Jtps5BXmzyhOEsu0sB8TaP9Up/M4KgzmJwVC5aPLFFpg4rd7BzNKwkZc9GPQ
 FzaTUXEttnfc550ZmIGKlNywoxd8zILNCAch58+Al6Kv9EI/pnVioU3gnFxDFFEXsleP
 f4S9SejNElR+3KBtjuYgz+oh6sKZPYm4w8WivVbgeshf6e+a21DI74d1hYPzc8KILvXg
 vQ2A==
X-Gm-Message-State: AOAM533OoJtCeRRmb9yM1NpwvScr6eiQIEPdQq7CVDQOKTxl1qilOgwd
 yCrzDShv9GlDn7Nim4AdrhnRqmPYh32vZ39DDsA=
X-Google-Smtp-Source: ABdhPJwDpJIzC/bwNW8io9aD0cZPEfHvenn+OxwkS4oHp1hbv8CspuiSN4BDFbiVFBcrqXzQQscinJ3gQ0M8p9ZnLfU=
X-Received: by 2002:a25:df11:: with SMTP id w17mr15299986ybg.314.1625464640498; 
 Sun, 04 Jul 2021 22:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
In-Reply-To: <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 13:57:08 +0800
Message-ID: <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/2 =E4=B8=8B=E5=8D=885:24, Bin Meng =E5=86=99=E9=81=93:
> > From: Christina Wang <christina.wang@windriver.com>
> >
> > The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> > the manual and real hardware.
> >
> > While Linux e1000 driver always writes VET register to 0x8100, it is
> > not always the case for everyone. Drivers relying on the reset value
> > of VET won't be able to transmit and receive VLAN frames in QEMU.
> >
> > Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> > Signed-off-by: Christina Wang <christina.wang@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > (no changes since v1)
> >
> >   hw/net/e1000.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> > index 4f75b44cfc..20cbba6411 100644
> > --- a/hw/net/e1000.c
> > +++ b/hw/net/e1000.c
> > @@ -29,6 +29,7 @@
> >   #include "hw/pci/pci.h"
> >   #include "hw/qdev-properties.h"
> >   #include "migration/vmstate.h"
> > +#include "net/eth.h"
> >   #include "net/net.h"
> >   #include "net/checksum.h"
> >   #include "sysemu/sysemu.h"
> > @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] =3D {
> >       [MANC]    =3D E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
> >                   E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
> >                   E1000_MANC_RMCP_EN,
> > +    [VET]     =3D ETH_P_VLAN,
>
>
> I wonder if we need a compat flag for this, since we change the behavior.
>
> (See e1000_properties[])
>

No we don't need to since it does not break migration.

Regards,
Bin

