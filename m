Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96D2F0A9F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 01:38:25 +0100 (CET)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kylE0-00050w-C2
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 19:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kylCt-0004aG-AG
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 19:37:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:45108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kylCr-0004RZ-CN
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 19:37:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A56D222B3A
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610325430;
 bh=4BFQTd+UPZkNrIFjlFmUie86m9TadZ8ezw75yeE6ric=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dqbvn6X9uN46tZf/peQsPPiDZhrm0eraY4zO9jf72MhkK1vxnmuj2YooOc6O3pd1p
 HaOOy9HC6X/e7ZTjBL4YCXwO69/wiFW47t/6h/PXDBTknPkc7KLWflC8Adnesjx0YM
 fz5ZxLuN82wNA9DcUgPMJisGka4GABo6wx5JpvDDeoWgoo/hx1iZuJ0g2i/qfMKYE2
 NKoMixLB7SDgx+3dXD6CAYM6y+h2plkmFWkDtHki29FH/1zdYbZijgeyc/BxsY/AO5
 JgTw+B9lvpAZbuRQWO3NQWDeGbEuiuCrusLzyoLTC2SPwWYKJMPm8Vqj2VkgAYHjGA
 NL872PMIsv1lg==
Received: by mail-il1-f174.google.com with SMTP id v3so16679638ilo.5
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 16:37:10 -0800 (PST)
X-Gm-Message-State: AOAM532mUQLAaPbHdB2EM4a4aCo7yPcsf7HXR2qbe8OKcOwz1MVkq32Z
 YTrk3ofaDdzlrASreID/v48H7S7JbitWPA9RbD0=
X-Google-Smtp-Source: ABdhPJzsXMnzBmu5xZq6czhnpTgekrDdjUlQWUPADFHyAsz7zrg8uAx2PdVDwGbgFqngwQN3FOsZ0GXB0Viu6fs5Znc=
X-Received: by 2002:a92:28d:: with SMTP id 135mr13604403ilc.35.1610325430106; 
 Sun, 10 Jan 2021 16:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
In-Reply-To: <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Jan 2021 08:36:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
Message-ID: <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
To: BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think R_END should be 0x60, Jiaxun, what do you think?

Huacai

On Mon, Jan 11, 2021 at 5:51 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sun, 10 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Peter, Huacai,
> >
> > On 1/10/21 8:49 PM, Peter Maydell wrote:
> >> On Sun, 3 Jan 2021 at 21:11, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>>
> >>> From: Huacai Chen <chenhuacai@kernel.org>
> >>>
> >>> As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's lioint=
c:
> >>> 1, Move macro definitions to loongson_liointc.h;
> >>> 2, Remove magic values and use macros instead;
> >>> 3, Replace dead D() code by trace events.
> >>>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> >>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> ---
> >>>  include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
> >>>  hw/intc/loongson_liointc.c         | 36 +++++++++++++---------------=
--
> >>>  2 files changed, 38 insertions(+), 20 deletions(-)
> >>>  create mode 100644 include/hw/intc/loongson_liointc.h
> >>
> >> Hi; Coverity complains about a possible array overrun
> >> in this commit:
> >>
> >>
> >>> @@ -40,13 +39,10 @@
> >>>  #define R_IEN                   0x24
> >>>  #define R_IEN_SET               0x28
> >>>  #define R_IEN_CLR               0x2c
> >>> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> >>> +#define R_ISR_SIZE              0x8
> >>> +#define R_START                 0x40
> >>>  #define R_END                   0x64
> >>>
> >>> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> >>> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> >>> -                         TYPE_LOONGSON_LIOINTC)
> >>> -
> >>>  struct loongson_liointc {
> >>>      SysBusDevice parent_obj;
> >>>
> >>> @@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigne=
d int size)
> >>>          goto out;
> >>>      }
> >>>
> >>> -    /* Rest is 4 byte */
> >>> +    /* Rest are 4 bytes */
> >>>      if (size !=3D 4 || (addr % 4)) {
> >>>          goto out;
> >>>      }
> >>>
>
> Expanding macros in the following:
>
> >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
>
> if (addr >=3D (0x40 + 0x8 * 0) && addr < (0x40 + 0x8 * 4))
> ->
> if (addr >=3D 0x40 && addr < 0x60)
> int core =3D (addr - 0x40) / 8;
>
>
> >>> +    if (addr >=3D R_START && addr < R_END) {
> >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
>
> if (addr >=3D 0x40 && addr < 0x64)
> int core =3D (addr - 0x40) / 0x8;
>
> R_END seems to be off by 4 in the above. Should it be 0x60?
>
> Regards,
> BALATON Zoltan
>
> >> R_END is 0x64 and R_START is 0x40, so if addr is 0x60
> >> then addr - R_START is 0x32 and so core here is 4.
> >> However p->per_core_isr[] only has 4 entries, so this will
> >> be off the end of the array.
> >>
> >> This is CID 1438965.
> >>
> >>>          r =3D p->per_core_isr[core];
> >>>          goto out;
> >>>      }
> >>
> >>> -    if (addr >=3D R_PERCORE_ISR(0) &&
> >>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> >>> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> >>> +    if (addr >=3D R_START && addr < R_END) {
> >>> +        int core =3D (addr - R_START) / R_ISR_SIZE;
> >>>          p->per_core_isr[core] =3D value;
> >>>          goto out;
> >>>      }
> >>
> >> Same thing here, CID 1438967.
> >
> > Thanks Peter.
> >
> > Huacai, can you have a look please?
> >
> > Thanks,
> >
> > Phil.
> >
> >

