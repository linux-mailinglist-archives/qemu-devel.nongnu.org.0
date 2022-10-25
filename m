Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE660CC42
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:44:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJGr-0008OE-3x; Tue, 25 Oct 2022 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onJGn-000890-UB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:43:01 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onJGa-0002pa-Ip
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:43:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7BFE6191C
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 12:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158C2C4347C
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 12:42:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="f6UI0c/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666701762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MWSC40VcA+t6TbjTHMAxL90NX+uowi3SDLcd/+h4Sfk=;
 b=f6UI0c/UdkEat1Rm2LJXNzI8rWeeVy2w5kwXHBAsHn6wa1AggBDp7oC0/eRAyQB1d7cjFO
 KzPUeZT0+1v8aPzte+FhIhbjP1QByaEoj/tmn65TXHiABG3omKQhCaxT8bu0r9+vPIhPA5
 ZCHH6MMEqUk1d4dfW+DlBRGGcMNoGQE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6819baae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 25 Oct 2022 12:42:42 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id v81so6078543vkv.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:42:42 -0700 (PDT)
X-Gm-Message-State: ACrzQf26vkqJgFqSf8In9jGfRmIGOJRVoRqe2LrgyY967FU5a4m5btc7
 TbpO0Rg3IhyhkSCpYoSFpHuXTQ4C/x0zqZ/nU18=
X-Google-Smtp-Source: AMsMyM7FRtLOJHZNH42sG9aivVeBNz0IG6ewMWWYfTH3n6XE8mWN9ROMP1hEKjZPXdriDW82jWkqYVCBPgPRM+6L6ZE=
X-Received: by 2002:a05:6122:317:b0:3b7:6590:daa1 with SMTP id
 c23-20020a056122031700b003b76590daa1mr4338177vko.37.1666701761739; Tue, 25
 Oct 2022 05:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
 <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
 <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
In-Reply-To: <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 14:42:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9rhXu6MuDPAYK0te8NBEHeJE17oNV6e-v6O+4U1-0s_Ew@mail.gmail.com>
Message-ID: <CAHmME9rhXu6MuDPAYK0te8NBEHeJE17oNV6e-v6O+4U1-0s_Ew@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Oct 25, 2022 at 2:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 25 Oct 2022 at 13:33, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 2:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Tue, 25 Oct 2022 at 13:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > >
> > > > Hi Markus,
> > > >
> > > > On Tue, Oct 25, 2022 at 08:11:51AM +0200, Markus Armbruster wrote:
> > > > > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > > > > index 49989d30e6..e44c0de914 100644
> > > > > > --- a/qapi/run-state.json
> > > > > > +++ b/qapi/run-state.json
> > > > > > @@ -86,12 +86,15 @@
> > > > > >  #                   ignores --no-reboot. This is useful for sanitizing
> > > > > >  #                   hypercalls on s390 that are used during kexec/kdump/boot
> > > > > >  #
> > > > > > +# @snapshot-load: A snapshot is being loaded by the record & replay
> > > > > > +#                 subsystem; internal value (since 7.2)
> > > > > > +#
> > > > >
> > > > > If "internal value" was an established way to mark parts that aren't
> > > > > visible externally, this would do.  Since it isn't, it's too terse.
> > > > > Suggest something like "This value is used only within QEMU.  It doesn't
> > > > > occur in QMP."
> > > >
> > > > Thanks for the precise text. I can do that for a v5, or, Peter - do you
> > > > want to just fold that in upon committing these patches?
> > >
> > > If there's no other issues with the series I'll just fold that change in.
> >
> > Great, okay. Last time when we found this original snapshot reset
> > issue, it surfaced because you put this somewhere that the CI ran on.
>
> No, I was just running "make check-avocado" locally.

Oh, okay. I'll try out a full `make check` locally then just to be sure.

Jason

