Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554F5FBC73
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:55:05 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMHH-0005kv-TY
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM3t-0006eV-6v
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:41:18 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:55108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM3r-0000Yf-6h
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:41:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3839612AB
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 20:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67645C433D6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 20:41:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Xm0cc35V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665520867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4V2MYTZGO476H6f+FHysXwzccgohly8natdS1nAkmis=;
 b=Xm0cc35VnjWbiM51/S/xM9rbxWCRRHctepf8D7Hn9E7ttDE1q4yiicv5tNXKNvYHvCKpSO
 EO7nVNOqZS8IYaDrs1yTlgxAuxURFXGcVsK3BdigPAErDrRg12YCInL1bN2WWWf4S18V5F
 xq4kCaJz7CqXIEjzm+2J1reAlxE67bw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6370e2d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 11 Oct 2022 20:41:07 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id a2so9885678vsc.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 13:41:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf3KF9UB/su+S5+rG/ZVzAqmb9d1hfCIlkSrXfygwATuuatv6751
 WXEQiqvqNg/Bnm2qqOSztYJ3xuY1LML1v3np/M0=
X-Google-Smtp-Source: AMsMyM6/YRsH8JW+rcHKefkwltl6MF+OUlj2V9ofiWloBgcmdYYKu5DGoAGUdnQVoaw/ZqRyKSbrJi+CYJnjbHtA5S0=
X-Received: by 2002:a67:e401:0:b0:398:89f1:492f with SMTP id
 d1-20020a67e401000000b0039889f1492fmr13348057vsf.21.1665520866530; Tue, 11
 Oct 2022 13:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
 <Y0Q4Vugq+d0vaF97@zx2c4.com>
 <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
 <13302545-b542-dc43-820f-2fb46fa85cd8@ispras.ru> <Y0XMsU4XP0UX1RnO@zx2c4.com>
In-Reply-To: <Y0XMsU4XP0UX1RnO@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Oct 2022 14:40:55 -0600
X-Gmail-Original-Message-ID: <CAHmME9oyxnzhEnwRRY9MUS6pB4MVqxTbACSs70r6AuDrH42M6w@mail.gmail.com>
Message-ID: <CAHmME9oyxnzhEnwRRY9MUS6pB4MVqxTbACSs70r6AuDrH42M6w@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 11, 2022 at 2:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Oct 11, 2022 at 09:46:01AM +0300, Pavel Dovgalyuk wrote:
> > On 10.10.2022 18:32, Peter Maydell wrote:
> > > On Mon, 10 Oct 2022 at 16:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >>
> > >> On Mon, Oct 10, 2022 at 11:54:50AM +0100, Peter Maydell wrote:
> > >>> The error is essentially the record-and-replay subsystem saying "the
> > >>> replay just asked for a random number at point when the recording
> > >>> did not ask for one, and so there's no 'this is what the number was'
> > >>> info in the record".
> > >>>
> > >>> I have had a quick look, and I think the reason for this is that
> > >>> load_snapshot() ("reset the VM state to the snapshot state stored in the
> > >>> disk image or migration stream") does a system reset. The replay
> > >>> process involves a lot of "load state from a snapshot and play
> > >>> forwards from there" operations. It doesn't expect that load_snapshot()
> > >>> would result in something reading random data, but now that we are
> > >>> calling qemu_guest_getrandom() in a reset hook, that happens.
> > >>
> > >> Hmm... so this seems like a bug in the replay code then? Shouldn't that
> > >> reset handler get hit during both passes, so the entry should be in
> > >> each?
> > >
> > > No, because record is just
> > > "reset the system, record all the way to the end stop",
> > > but replay is
> > > "set the system to the point we want to start at by using
> > > load_snapshot, play from there", and depending on the actions
> > > you do in the debugger like reverse-continue we might repeatedly
> > > do "reload that snapshot (implying a system reset) and play from there"
> > > multiple times.
> >
> > The idea of the patches is fdt randomization during reset, right?
> > But reset is used not only for real reboot, but also for restoring the
> > snapshots.
> > In the latter case it is like "just clear the hw registers to simplify
> > the initialization".
> > Therefore no other virtual hardware tried to read external data yet. And
> > random numbers are external to the machine, they come from the outer world.
> >
> > It means that this is completely new reset case and new solution should
> > be found for it.
>
> Do you have any proposals for that?

Okay I've actually read your message like 6 times now and think I may
have come up with something. Initial testing indicates it works well.
I'll send a new series shortly.

Jason

