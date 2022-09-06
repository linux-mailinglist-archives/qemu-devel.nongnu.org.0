Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04445AE7F3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:24:02 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXcS-0006Cq-NN
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVo8-0003zh-5K
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:27:52 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:46384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVo5-0007C9-V1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:27:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76A14B816E9
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13FBC43470
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:27:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cMllzBE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662460057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T39FDK8iMqyMyizq1SH2ZaWvZv/QMzQwZFX6BD9C3AA=;
 b=cMllzBE0TGxUUQxoX0DqBzuvNk/aeBN1E4yxN7TMV7Tw1fuUvcPEfaIALmMef70D9G4tat
 TFuct8HnBsFTlOznUDUo8jD2Zlq3AfTr6WIlXQVXu6iESGaQNevTqdehJ1oGNVuzvDCo9F
 sCePfa4y+9r62hCsAH0PPS+4SpsVXTc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7aca8c4c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 6 Sep 2022 10:27:37 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-3378303138bso91375927b3.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:27:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo0OsQMDZV7S23kiXiP+FA15Zi08USvnQ75Fnrl+RMQTOW/jdYD6
 b6gpdcTAoupU/35v3lWLpRbUutO9bzpENL//psc=
X-Google-Smtp-Source: AA6agR5gs+shnpf6r1EEkzNsV3kX0HTluzlKchgrDcIrWLD2mnrtLlfQQ/ieXXF6uVSGGdlIfemk2ZX1ECmFZOA/340=
X-Received: by 2002:a0d:f082:0:b0:31f:1d1d:118d with SMTP id
 z124-20020a0df082000000b0031f1d1d118dmr42415915ywe.124.1662460055985; Tue, 06
 Sep 2022 03:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220904165058.1140503-1-Jason@zx2c4.com>
 <20220905084051.cbwjktoumwhfy5tr@sirius.home.kraxel.org>
In-Reply-To: <20220905084051.cbwjktoumwhfy5tr@sirius.home.kraxel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Sep 2022 12:27:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
Message-ID: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
Subject: Re: [PATCH] x86: only modify setup_data if the boot protocol
 indicates safety
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Gerd,

On Mon, Sep 5, 2022 at 10:40 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Sun, Sep 04, 2022 at 06:50:58PM +0200, Jason A. Donenfeld wrote:
> > This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), and
> > then makes the use of setup_data safe. It does so by checking the boot
> > protocol version. If it's sufficient, then it means EFI boots won't
> > crash. While we're at it, gate this on SEV too.
>
> > @@ -463,6 +462,7 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
>
> > +    pcmc->legacy_no_rng_seed = true;
>
> This needs go into the pc_i440fx_7_1_machine_options function, otherwise
> legacy_no_rng_seed gets flipped from false to true for 7.1 machine types
> which breaks compatibility.
>
> > @@ -398,6 +397,7 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
>
> > +    pcmc->legacy_no_rng_seed = true;
>
> Same here.

Oh. Okay so a "straight" revert won't do the trick, since this is (I
guess?) intended for 7.2 rather than 7.1. Makes sense; will do for v2.

>
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -1088,8 +1088,15 @@ void x86_load_linux(X86MachineState *x86ms,
> >          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
> >      }
> >
> > -    /* Offset 0x250 is a pointer to the first setup_data link. */
> > -    stq_p(header + 0x250, first_setup_data);
> > +    /*
> > +     * Only modify the header if doing so won't crash EFI boot, which is the
> > +     * case only for newer boot protocols, and don't do so either if SEV is
> > +     * enabled.
> > +     */
> > +    if (protocol >= 0x210 && !sev_enabled()) {
> > +        /* Offset 0x250 is a pointer to the first setup_data link. */
> > +        stq_p(header + 0x250, first_setup_data);
> > +    }
>
> This should better go into a separate patch.

Alright.

Jason

