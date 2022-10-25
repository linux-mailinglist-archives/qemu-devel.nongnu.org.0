Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1260CBF1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ7T-0000FV-2w; Tue, 25 Oct 2022 08:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onJ7R-0008Tk-5p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:33:21 -0400
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onJ7B-0000pR-DU
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:33:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A325B81A9C
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 12:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F83C433C1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 12:33:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nATaEe50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666701179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqz1AH2UpaKnFn2dbVB88prQlz71jUHnJpdq9mpUdJ8=;
 b=nATaEe50grGhnmLfiOYauUxl5nqPk+1IPqxk/hnUCky0z983dmbiF8oAc6EcUpZ2bNatj2
 wdY3WXT/1WmYDw0xWzvyT0vTmLfUHgyql1T6lQOOmrEe7960SP83aWE3TY8cE+ZuGoZJ9S
 CZDXzRXv6TY3zUm6kMl/bjy4MSJ+eLk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e7e316e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 25 Oct 2022 12:32:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id h3so10771949vsa.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:32:59 -0700 (PDT)
X-Gm-Message-State: ACrzQf18A3UpSMKDdJXj+8pfTPUNz+DpcLPbLy0URkRSld8k/YVCve3K
 HPstgPl9VNNQDqat1DDP6wIxo9AV1ptEeN9Epzo=
X-Google-Smtp-Source: AMsMyM6Ftw3r3wjK3TErk4OshL+xB/acXUDK8ny3foH/u1NtpaPv0ud4IrG1QBpYwoUno1fRKp1PdPMwA4u5rDwiyQ8=
X-Received: by 2002:a05:6102:f9a:b0:3aa:1a11:2702 with SMTP id
 e26-20020a0561020f9a00b003aa1a112702mr5833488vsv.73.1666701178630; Tue, 25
 Oct 2022 05:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
In-Reply-To: <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 14:32:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
Message-ID: <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Oct 25, 2022 at 2:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 25 Oct 2022 at 13:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Markus,
> >
> > On Tue, Oct 25, 2022 at 08:11:51AM +0200, Markus Armbruster wrote:
> > > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > > index 49989d30e6..e44c0de914 100644
> > > > --- a/qapi/run-state.json
> > > > +++ b/qapi/run-state.json
> > > > @@ -86,12 +86,15 @@
> > > >  #                   ignores --no-reboot. This is useful for sanitizing
> > > >  #                   hypercalls on s390 that are used during kexec/kdump/boot
> > > >  #
> > > > +# @snapshot-load: A snapshot is being loaded by the record & replay
> > > > +#                 subsystem; internal value (since 7.2)
> > > > +#
> > >
> > > If "internal value" was an established way to mark parts that aren't
> > > visible externally, this would do.  Since it isn't, it's too terse.
> > > Suggest something like "This value is used only within QEMU.  It doesn't
> > > occur in QMP."
> >
> > Thanks for the precise text. I can do that for a v5, or, Peter - do you
> > want to just fold that in upon committing these patches?
>
> If there's no other issues with the series I'll just fold that change in.

Great, okay. Last time when we found this original snapshot reset
issue, it surfaced because you put this somewhere that the CI ran on.
It might not be a bad idea to give this another whirl in the same CI
there.

Jason

