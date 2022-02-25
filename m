Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00BD4C43FE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:56:58 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZDU-0002F0-6J
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNZ23-000820-9O
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:45:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNZ21-0002Ct-37
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:45:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 778E1B82F53
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 11:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01BCC340F6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645789499;
 bh=SyCcd5YyTFEoGeGsYaB35HytNVv8VEbM/zH5Nnq5ve0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UA1J9wUChl+3NAGjvYQsIrCIUKBsdCbyK5N29bUZyjGQnA02heNKfk5Dn2ZJtsylZ
 9yYbb0x00luCWmM2biJtE3AMv+3fjLudhyN3RgkQGTuu/0I1x2ovnW1dPI3lnLxVJ3
 XxcGmvFsgCD2uLuXqn1Wbv9aNHrfJeUc2RgB6i1ZhSLktnz/2oQLcDrI2/LsQ2aLHO
 awHBMZueY5I2cnfWxiWttBCdi00+NNONLvKnPxCrw5IAbNIjVw4kVWJ4aEeHnRLIYv
 dCsjPUKcTSKtcbgbStHoaD9JR8YEUdt6SHv6X5/DbVPxKjDmCuo0FZ5JQLYGgW40Vu
 Za6rCXxmqRQ0Q==
Received: by mail-yb1-f170.google.com with SMTP id p19so5306312ybc.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:44:59 -0800 (PST)
X-Gm-Message-State: AOAM530ZZSAYRQuIPKabX+ZqWUSWLxgkNLyxAs0HUxxnIrX0KVb5hnc/
 8K7ayLFy75uaCICF/dALWKiqHF/G5lbRoC6dpaw=
X-Google-Smtp-Source: ABdhPJw20WQ6OeE6e3QFGaeduOMLc1gtByftoR3pgLNQmEnrN6vNG+m6AxxfV6mUzDPnla1p5Et4lg45CPQ/LSYqTqY=
X-Received: by 2002:a25:6c43:0:b0:61d:e94b:3c55 with SMTP id
 h64-20020a256c43000000b0061de94b3c55mr6880234ybc.224.1645789498678; Fri, 25
 Feb 2022 03:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20220224133906.751587-1-Jason@zx2c4.com>
 <20220224133906.751587-2-Jason@zx2c4.com>
 <CAMj1kXGuh62A8=43NjSMLRkux_TCFULXtw5a1C5w=gy9A8dO6w@mail.gmail.com>
 <CAHmME9r_WZ7hTaPpq=JKzVj-9bfnbE=J_z+aMHzrjPv=6y2_CA@mail.gmail.com>
In-Reply-To: <CAHmME9r_WZ7hTaPpq=JKzVj-9bfnbE=J_z+aMHzrjPv=6y2_CA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Feb 2022 12:44:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF9-JcjRoUgJgdVZo0Q6E5GezH1YGtE4H-u-kMjGHzQgg@mail.gmail.com>
Message-ID: <CAMj1kXF9-JcjRoUgJgdVZo0Q6E5GezH1YGtE4H-u-kMjGHzQgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] random: add mechanism for VM forks to reinitialize
 crng
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75; envelope-from=ardb@kernel.org;
 helo=ams.source.kernel.org
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 KY Srinivasan <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, ben@skyportsystems.com,
 Eric Biggers <ebiggers@google.com>, Dexuan Cui <decui@microsoft.com>,
 Eric Biggers <ebiggers@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, adrian@parity.io,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Alexander Graf <graf@amazon.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 12:44, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Fri, Feb 25, 2022 at 12:26 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 24 Feb 2022 at 14:39, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > When a VM forks, we must immediately mix in additional information to
> > > the stream of random output so that two forks or a rollback don't
> > > produce the same stream of random numbers, which could have catastrophic
> > > cryptographic consequences. This commit adds a simple API, add_vmfork_
> > > randomness(), for that, by force reseeding the crng.
> > >
> > > This has the added benefit of also draining the entropy pool and setting
> > > its timer back, so that any old entropy that was there prior -- which
> > > could have already been used by a different fork, or generally gone
> > > stale -- does not contribute to the accounting of the next 256 bits.
> > >
> > > Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> > > Cc: Theodore Ts'o <tytso@mit.edu>
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Eric Biggers <ebiggers@google.com>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
>
> Okay if I treat this as a Reviewed-by instead?

Sure no problem.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

