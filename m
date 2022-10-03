Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671A5F39B6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:19:23 +0200 (CEST)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUiY-0004Ln-6x
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofUXa-0005Sf-2f
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:08:02 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:54688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofUXX-0002up-Q7
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:08:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9153B8162A
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 23:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1162C433D7
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 23:07:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YksbB82I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664838471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kVkhpjdnrE6B8B7y9+mYkzmDiKwBb8ehMPaBrwpZ6w=;
 b=YksbB82IPgMZ/PYY7Z7I64la1XmdaOQOeaDc5McUlKusJ3oqyJqAgG8N6dR9y4g35pwiUb
 RUzz2jU223DMrO1T3T6tAD04Iq/8D3DJm9ZDeJhQDuU9SjBZdVtJrVtCPUkUsb1oA4Iclb
 +uUFoP2CMMlC82oyLMhPkeEeM8/ucbw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 769cae9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 3 Oct 2022 23:07:51 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id k6so12977368vsc.8
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 16:07:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf0aN7NqSGKVBJKx0cDoByBpekAf+U3eNRTBia7Jo1RU+PWPeK/z
 2DNKrFZuKGteySyAklEfgTtT61mGiVDF96Gr3ME=
X-Google-Smtp-Source: AMsMyM5k1EJYnricRR5QUuTKdRKqdyGtiZ4OmxJLT/TqN7IKFBk6b6vHdi/CpzdX0EljHldR1kp0XKyNaIHWlvfFLAY=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr8425524vsb.55.1664838469902; Mon, 03
 Oct 2022 16:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
In-Reply-To: <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Oct 2022 01:07:38 +0200
X-Gmail-Original-Message-ID: <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
Message-ID: <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Tue, Oct 4, 2022 at 12:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Send each new revision as a new top-level thread, rather than burying it
> in-reply-to an earlier revision, as many reviewers are not looking
> inside deep threads for new patches.

Will do.

> You seem to justify this commit by the kernel commit, which justifies
> itself mentioning hypervisor use... So the egg comes first before the
> chicken.

Oh, that's not really the intention. My goal is to provide sane
interfaces for preboot environments -- whether those are in a
hypervisor like QEMU or in firmware like CFE -- to pass a random seed
along to the kernel. To that end, I've been making sure there's both a
kernel side and a QEMU side, and submitting both to see what folks
think. The fact that you have some questions (below) is a good thing;
I'm glad to have your input on it.

> > +
> > +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> > +    for (size_t i =3D 0; i < sizeof(rng_seed); ++i) {
> > +        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
> > +    }
> > +    prom_set(prom_buf, prom_index++, "rngseed");
> > +    prom_set(prom_buf, prom_index++, "%s", rng_seed_hex);
>
> You use the firmware interface to pass rng data to an hypervisor...
>
> Look to me you are forcing one API to ease another one. From the
> FW PoV it is a lie, because the FW will only change this value if
> an operator is involved. Here PROM stands for "programmable read-only
> memory", rarely modified. Having the 'rngseed' updated on each
> reset is surprising.
>
> Do you have an example of firmware doing that? (So I can understand
> whether this is the best way to mimic this behavior here).
>
> Aren't they better APIs to have hypervisors pass data to a kernel?

So a firmware interface *is* the intended situation here. To answer
your last question first: the "standard" firmware interface for
passing these seeds is via device tree's "rng-seed" field. There's
also a EFI protocol for this. And on x86 it can be passed through the
setup_data field. And on m68k the bootinfo bootloader/firmware struct
has a BI_RNG_SEED type. There's plenty of ARM and x86 hardware that
uses device tree and EFI for this, where the firmware is involved in
generating the seeds, and in the device tree case, in mangling the
device tree to have the right values. So, to answer your first
question, yes I think this is indeed a firmware-style interface.

Right now this is obviously intended for QEMU (and other hypervisors)
to implement. Later I'm hoping that firmware environments like CFE
might gain support for setting this. (You could do so interactively
now with "setenv".) So it seems like the environment block here really
is the right way to pass this. If you have a MIPS/malta platform
alternative, I'd be happy to consider it with you, but in my look at
things so far, the fw env block seems like by far the best way of
doing this, especially so considering it's part of both real firmware
environments and QEMU, and is relatively straightforward to implement.

Jason

