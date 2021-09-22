Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B1414DF0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:18:06 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4wd-0003UV-CR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mT4pi-0006hJ-Rs; Wed, 22 Sep 2021 12:10:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mT4pg-0001GG-9T; Wed, 22 Sep 2021 12:10:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 851B061168;
 Wed, 22 Sep 2021 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632327050;
 bh=ZQEjt+lvFpI8dA+77HmtCoPQ51l7Q3ZOfcyOEbTaXso=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n6/GGS0YHV7LTkGgzG5UP1PRO48X/zx2paVTm9KUHn0JqIs2XLnPEX53y7jBogpQN
 eHQz+VA4g0vj/CymcrO3mXMcBgunvgZWRMuJDRyYNvTi8aI/TLlsq5aSEfzx/On34G
 +obbUVRj6xUxzIkezvGekIbBWBd5JXMmCp33r/3NhVeDNBYxoQeYtmgi7SUH7UtimD
 Tnv6G+8zAcyFbTsvxUpPNAFMQfezP9nv7v28YE3cG6I/8IuxdOYq/4b8VL1ZoS2+yA
 qMmaFTfiooz0+fCFvW4xlcEMBnKbGKD4vvXBBhYMnvT95h8Zx4A0KwVc7fnsOnikMo
 wWaUuArk0Xvdw==
Received: by mail-oi1-f182.google.com with SMTP id x124so5140153oix.9;
 Wed, 22 Sep 2021 09:10:50 -0700 (PDT)
X-Gm-Message-State: AOAM53135Ksa+pe2S0vU81BDfi8JzruwamasXqGBcXK5u4a+jucO9WMo
 hvLFWp2SbPfSIesDuQJ+oNvauyeS7K4bm5HLumg=
X-Google-Smtp-Source: ABdhPJybpo+2q3DOTCZNjGuTk5X/GyhYb0eKAmNuXxRWhFSmmQScqw18wocvEYCz0CeB19FNSS0Jgn3QxIOEBhKNqp4=
X-Received: by 2002:aca:3114:: with SMTP id x20mr28574oix.174.1632327049808;
 Wed, 22 Sep 2021 09:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
 <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
 <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
 <CAFEAcA_fxW0yKwxqBuDi8+ux-jtVKeJxNhDV1=ROb+VamLiZRQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_fxW0yKwxqBuDi8+ux-jtVKeJxNhDV1=ROb+VamLiZRQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Sep 2021 18:10:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG6VDp_rSU+S_TTPdK8rUt2zF=V1E+brGfzsTUa7oF+yw@mail.gmail.com>
Message-ID: <CAMj1kXG6VDp_rSU+S_TTPdK8rUt2zF=V1E+brGfzsTUa7oF+yw@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 14:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 22 Sept 2021 at 12:41, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 16 Sept 2021 at 18:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > I'd argue that compliance with the architecture means that the
> > > > software should not clear RES1 bits
> > >
> > > Architecturally, RES1 means that "software
> > >  * Must not rely on the bit reading as 1.
> > >  * Must use an SBOP policy to write to the bit."
> > > (SBOP=="should be 1 or preserved", ie you can preserve the existing value,
> > > as in "read register, change some bits, write back", or you can write a 1.)
> > >
> >
> > OVMF preserves the bit, and does not reason or care about its value.
> > So in this sense, it is compliant.
>
> Hmm. Alex, can you give more details about what fails here ?
>

It seems that EDK2 ends up setting EL0 r/o or r/w permissions on some
mappings, even though it never runs anything at EL0. So any execution
that gets initiated via the timer interrupt causing a EL1->EL1 IRQ
exception will run with PAN enabled and lose access to those mappings.

So it seems like a definite bug that is unrelated to reset state of
the registers and assumptions related to that.



> > > > but I don't think we can blame it
> > > > for not touching bits that were in in invalid state upon entry.
> > >
> > > SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
> > > PAN feature. It's just not the value OVMF wants, so OVMF should
> > > be setting it to what it does want. Also, as the first thing to
> > > run after reset (ie firmware) OVMF absolutely is responsible for
> > > dealing with system registers which have UNKNOWN values out of
> > > reset.
> > >
> >
> > Fair enough. But I'd still suggest fixing this at both ends.
>
> Yes, the version of this code that we committed sets SPAN to 1.
> (This argument is mostly about what the comment justifying that
> value should say :-))
>

OK, that makes sense. But I'd like to get EDK2 fixed as well, obviously.

