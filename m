Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A060CDAB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:37:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onK3A-000809-Nd; Tue, 25 Oct 2022 09:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onK36-0007XH-BQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:32:56 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onK34-0003FP-9J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:32:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EA4EB81D19
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B048EC433D7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:32:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QJWiE9dZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666704766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nes5IXo2rKDfXrPOG1Mr7gYWwwmwcSZPvfq7eQBhNyE=;
 b=QJWiE9dZCJU0UlW91xJd91731R2GzzgBP06O8G11JJYV3bE42UObHtBrCWx34Wea9+wlRk
 nzQPi/TM5WPsiDTqyrU8iFtrZMhUgNo947afuNeHq2I49qf61tqmo84CKhQD/YhLeMxQDV
 rZNTDcTVaWazcyPw6bCdN51g6h/LYjo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b5e9dad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 25 Oct 2022 13:32:46 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id n63so10944672vsc.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:32:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf24gw7R8rM3o7E7/OdEuJoVEGQbWVIEmt01ARGjaNHMx4ugxTWD
 FxcYX8sLeJsAzuXUlxTcODehp0TuvY5aCK1Gxmc=
X-Google-Smtp-Source: AMsMyM4JP7l0KIEP4KKUStr4F2nEPEHTGWalJY5gMpU+biOtait6ixfIWppnf3C+eN7mDWdKl2F8wHmdh4b28ksCU5E=
X-Received: by 2002:a67:ed9a:0:b0:3a7:718a:7321 with SMTP id
 d26-20020a67ed9a000000b003a7718a7321mr17631400vsp.55.1666704764697; Tue, 25
 Oct 2022 06:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-3-Jason@zx2c4.com>
 <6fcfcf5a-55bc-e77e-2a36-4ac68f56bdfa@linaro.org>
In-Reply-To: <6fcfcf5a-55bc-e77e-2a36-4ac68f56bdfa@linaro.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 15:32:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9rnFL3jFg_FJz3q9VRnBnCq35XELhyBWz=wzZWd7X62fA@mail.gmail.com>
Message-ID: <CAHmME9rnFL3jFg_FJz3q9VRnBnCq35XELhyBWz=wzZWd7X62fA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] device-tree: add re-randomization helper function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 richard.henderson@linaro.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 3:30 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 25/10/22 02:43, Jason A. Donenfeld wrote:
> > When the system reboots, the rng-seed that the FDT has should be
> > re-randomized, so that the new boot gets a new seed. Several
> > architectures require this functionality, so export a function for
> > injecting a new seed into the given FDT.
> >
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >   include/sysemu/device_tree.h |  9 +++++++++
> >   softmmu/device_tree.c        | 21 +++++++++++++++++++++
> >   2 files changed, 30 insertions(+)
>
> > +void qemu_fdt_randomize_seeds(void *fdt)
> > +{
> > +    int noffset, poffset, len;
> > +    const char *name;
> > +    uint8_t *data;
> > +
> > +    for (noffset =3D fdt_next_node(fdt, 0, NULL);
> > +         noffset >=3D 0;
> > +         noffset =3D fdt_next_node(fdt, noffset, NULL)) {
> > +        for (poffset =3D fdt_first_property_offset(fdt, noffset);
> > +             poffset >=3D 0;
> > +             poffset =3D fdt_next_property_offset(fdt, poffset)) {
> > +            data =3D (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &n=
ame, &len);
>
> Is this non-const cast is safe?

This is how the libfdt/fdt_rw.c helpers of libfdt do it, so I think so.

Jason

