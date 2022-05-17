Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E852ACC2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:33:08 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3sL-0008AW-Eu
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1nr3qA-0006eI-OL
 for qemu-devel@nongnu.org; Tue, 17 May 2022 16:30:46 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:44428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1nr3q8-0007dm-V6
 for qemu-devel@nongnu.org; Tue, 17 May 2022 16:30:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5794616C9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DB8C385B8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652819441;
 bh=pDP9yWMHNPW8fyHXtySgvU0uF36PFGTbju9M0H1RIwg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cE5VhYpsMj5V1MmRS25k55kAKX/m3gMlTQWBV69kJg8eK6F11kqmm5AD2sWGeTX1C
 JaXyd0JND/foCk8xB9gWBsCq5HgPO17Agen+kqpUtEqf7GEZrrgqWO/roCFEWcVVze
 6R0GQDKJTflUtHrzh3t8MAw/remthJqdDcrHGUlxZlaFqvVZNoUGV6Szlw1widuN82
 P9IkIArLGGLMx1uM9HiDjGh9WY8sjP5CrTVkSDrpz5HxqnFY0Yns0M0xs02IPZNH+t
 +zFEgEz8Eru12BMKYQLDDOxi01oGoNz3tt2S7zojYkEBxWdUwE/lo5Y8ZsTLcJGp7X
 M3XA+M4bsWc8g==
Received: by mail-ej1-f41.google.com with SMTP id i19so36849776eja.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 13:30:41 -0700 (PDT)
X-Gm-Message-State: AOAM531sEPgKOTy8++S1m8Bq6i51r7CmOGoASEs64vMpT2Q9KygjhnOL
 iMk0Mk4P2c+iqkqTs7XXyJkMXurOZKWQipAGiw==
X-Google-Smtp-Source: ABdhPJzgBWRvbJT2YwRlhHplMm+Jm8hB+bufKoxzEIoMUklCco0LDqyArAh23AqxLnCueNcqPz8ojCFQbUd6mqGylC4=
X-Received: by 2002:a17:906:7952:b0:6fe:1e0b:6343 with SMTP id
 l18-20020a170906795200b006fe1e0b6343mr15729068ejo.337.1652819439409; Tue, 17
 May 2022 13:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113947.75714-1-quic_llindhol@quicinc.com>
 <CAL_JsqJirHpxC-QXDZUKbJUTgYpac3KyTh7r3v0frWg26F3rzQ@mail.gmail.com>
 <CAFEAcA_qAVQVCi8x5dAgG-6oi9k1oRR7VQtyRfsQ2+rsS57UTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_qAVQVCi8x5dAgG-6oi9k1oRR7VQtyRfsQ2+rsS57UTQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 May 2022 15:30:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2oRbHoPiyLCZWU_UXgwrQD6rgm-cDyuw0sN7kMBj_uQ@mail.gmail.com>
Message-ID: <CAL_JsqL2oRbHoPiyLCZWU_UXgwrQD6rgm-cDyuw0sN7kMBj_uQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add versioning to sbsa-ref machine DT
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=robh@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, May 17, 2022 at 11:50 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 17 May 2022 at 14:27, Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, May 5, 2022 at 6:41 AM Leif Lindholm <quic_llindhol@quicinc.com> wrote:
> > >
> > > The sbsa-ref machine is continuously evolving. Some of the changes we
> > > want to make in the near future, to align with real components (e.g.
> > > the GIC-700), will break compatibility for existing firmware.
> > >
> > > Introduce two new properties to the DT generated on machine generation:
> > > - machine-version-major
> > >   To be incremented when a platform change makes the machine
> > >   incompatible with existing firmware.
> > > - machine-version-minor
> > >   To be incremented when functionality is added to the machine
> > >   without causing incompatibility with existing firmware.
> > >   to be reset to 0 when machine-version-major is incremented.
> >
> > Where's the binding documentation for this?
> >
> > We already have a way to version DTs and that's with compatible. I'm
> > not completely opposed to a version number though, but I am opposed to
> > it not being common. We've rejected vendors (QCom in fact) doing their
> > own thing here.
> >
> >
> > > This versioning scheme is *neither*:
> > > - A QEMU versioned machine type; a given version of QEMU will emulate
> > >   a given version of the platform.
> > > - A reflection of level of SBSA (now SystemReady SR) support provided.
> >
> > FYI, it's planned to certify the virt machine for SR-IR which will
> > include DT schema validation. Undocumented properties are a problem
> > for that.
>
> This isn't the 'virt' machine :-)

Ah, okay.

> This dtb fragment is a purely private communication between
> the QEMU model and the sbsa-ref EL3 firmware. We could in

And that interface is tightly coupled and always in sync?

> theory equally replace it with a set of hardwired
> "board revision" registers. There's a comment in the existing
> sources about this:
>
> /*
>  * Firmware on this machine only uses ACPI table to load OS, these limited
>  * device tree nodes are just to let firmware know the info which varies from
>  * command line parameters, so it is not necessary to be fully compatible
>  * with the kernel CPU and NUMA binding rules.
>  */
>
> Kernels running on sbsa-ref won't see a dtb (let alone one with this
> version information in it), because firmware will always boot them
> with ACPI.

Okay, if there's no chance this moves up the stack, NM.

Rob

