Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EED5E91FD
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:08:11 +0200 (CEST)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOYU-0000qJ-4d
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocOUX-000585-J8
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:04:05 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:41625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocOUT-00028s-IU
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:04:02 -0400
Received: by mail-vk1-f180.google.com with SMTP id y129so2147047vkg.8
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HO51QehSp8XvFCYlK3W68oBzTrR3TsiWhpT98Yli2j0=;
 b=ExwheaU60sMo/qsD8Wff9zB2ypoi9hwAHZqCqONFKa2B2WqJ//M2RWROok+2p0rP2M
 C1gSxSaSNETunjJh7DBclI0p2Ah2MKaqX5OS/UoxYX+08ZGlgbAo5Cyi/wwoYZcE7q7X
 ksftuVCrxNvVwvkTOSYgm8eIglQ9kreyKqi9I7rscM9yyjwPh8zvJaivYTWwWzt13fRs
 DiKeKBvBvMW5v6WKld8N0Bvu4buosdmi9aHFnaCt67rhT1BP3NsWTlc7gxm3RBzbzVUg
 6aCNI370vXW/sWOUc8veLbUxVJBlt56H6z5izaFDmkR7PRaZ2zvJBhFfqFkYny82MiG8
 jIEQ==
X-Gm-Message-State: ACrzQf2qkj5VlHnCyKRxVhmZRMOZEuOsz6r6xUhlVonCRvkxcMOyJk0v
 nlExpXIF1FSZOAaSV4uKzA+NKcG24gxeFa6i6yc=
X-Google-Smtp-Source: AMsMyM5rxPXvIVhBpPNxEOxGRgDJxCQKl8Dt+RmOBo7OWGflEl31GXihRRyhXjiKjzY+Yr2QS/Ps+GvI+mHv9a2X0hY=
X-Received: by 2002:a1f:a90c:0:b0:3a2:ddcd:a0d5 with SMTP id
 s12-20020a1fa90c000000b003a2ddcda0d5mr6506675vke.19.1664100239487; Sun, 25
 Sep 2022 03:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220203000550.36711-1-f4bug@amsat.org>
 <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
 <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
 <CAFEAcA820MLMqW4k89sgxiyzYdYajnTLfwQg3JoszuTMMSA3uA@mail.gmail.com>
 <547de7d2-b7a0-5077-acf2-b72e326de544@ilande.co.uk>
 <CAFEAcA_F-gLUqrez+bhs7OLgMR7GdR-05Ze9yBuoBdQftAdm3A@mail.gmail.com>
In-Reply-To: <CAFEAcA_F-gLUqrez+bhs7OLgMR7GdR-05Ze9yBuoBdQftAdm3A@mail.gmail.com>
Date: Sun, 25 Sep 2022 12:03:48 +0200
Message-ID: <CAAdtpL46vwpK9cFENkuLAW321MZSab=mCuc=WRQAfUHijfODDQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
To: Peter Maydell <peter.maydell@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Sun, Feb 6, 2022 at 11:44 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 6 Feb 2022 at 09:30, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
> >
> > On 05/02/2022 15:39, Peter Maydell wrote:
> > > The handling of the vram buffer seems weird in this device overall,
> > > though -- the memory block is divided into three parts
> > >   * main vram, one byte per pixel
> > >   * vram24, four bytes per pixel
> > >   * cplane, four bytes per pixel
> > >
> > > As far as I can see, only if depth=24 (fixed at device creation
> > > time) do we use the vram24 and cplane parts. But we create the
> > > memory block at the same size regardless of depth and we expose
> > > the vram24 and cplane parts to the guest as sysbus MMIO regions
> > > that are mapped into guest memory regardless of depth...
> >
> > (goes and looks)
> >
> > It does look a bit odd certainly. Without Blue Swirl being around all I can only
> > guess as to why everything is configured to use an alias onto a single VRAM memory
> > region :/
> >
> > As for exposing the vram24 and cplane parts, I don't think it matters since 24-bit
> > mode is clearly designed to be backwards compatible with 8-bit mode. During
> > initialisation OpenBIOS reads the colour depth using the fw_cfg interface and adds
> > the registers for that mode into the DT as required so the correct information is
> > exposed to the guest.
>
> A guest won't notice if we expose stuff to it that it doesn't expect
> to be there -- but if the 8-bit-only device is not supposed to have
> those memory regions we shouldn't be creating them...

I guess I'll go with your code suggestion as a first step, and we can figure
out whether this MR is pointless and remove it later.

