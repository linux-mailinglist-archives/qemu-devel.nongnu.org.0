Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB34C43E4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:48:42 +0100 (CET)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZ5U-0000hQ-JY
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZ1H-0006te-Fs
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:44:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZ1E-0000qu-5t
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:44:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50A22B82F56
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 11:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25ECC340EF
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 11:44:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WgPgrIJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645789447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4DOzzb5bPeBm91aTgBwVBtXqFO7gEojNByIp2VrGcGI=;
 b=WgPgrIJv+eJCiP+RNC0ak+loKvoPTiafXcrUvinRxFYUL1PWjSadCXR5waFlKO1kJmQRVA
 bdrbktrP5mLSIYYN2L/qsfe07mlZfPavWrylrtCcbbdaUL08/LxurZlwVTz+yWLW/N55rA
 SYWkCEP5k6fLWlIfwPUfFQxYxk6nlyI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76304ef5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 25 Feb 2022 11:44:06 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso30234037b3.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:44:05 -0800 (PST)
X-Gm-Message-State: AOAM533q4r2U23WwEQ5Op9vjS9COZLK6FR+ugdxHlBgu3sSbcCsaP0Mo
 vqgsWkoZHxwYh8oM3s54TSWf20cB9wYIBWVKDxA=
X-Google-Smtp-Source: ABdhPJzv+CVGB9ScV57HLQEIPOB4K2x1NdbhDdZ7xG0urOaWpqGNRrFO4DDY8yMZvr/ISU1ydibFfeHHEc/MZpaqSq0=
X-Received: by 2002:a81:7d04:0:b0:2d0:d0e2:126f with SMTP id
 y4-20020a817d04000000b002d0d0e2126fmr6922055ywc.485.1645789444259; Fri, 25
 Feb 2022 03:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20220224133906.751587-1-Jason@zx2c4.com>
 <20220224133906.751587-2-Jason@zx2c4.com>
 <CAMj1kXGuh62A8=43NjSMLRkux_TCFULXtw5a1C5w=gy9A8dO6w@mail.gmail.com>
In-Reply-To: <CAMj1kXGuh62A8=43NjSMLRkux_TCFULXtw5a1C5w=gy9A8dO6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Feb 2022 12:43:53 +0100
X-Gmail-Original-Message-ID: <CAHmME9r_WZ7hTaPpq=JKzVj-9bfnbE=J_z+aMHzrjPv=6y2_CA@mail.gmail.com>
Message-ID: <CAHmME9r_WZ7hTaPpq=JKzVj-9bfnbE=J_z+aMHzrjPv=6y2_CA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] random: add mechanism for VM forks to reinitialize
 crng
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Fri, Feb 25, 2022 at 12:26 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 24 Feb 2022 at 14:39, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > When a VM forks, we must immediately mix in additional information to
> > the stream of random output so that two forks or a rollback don't
> > produce the same stream of random numbers, which could have catastrophic
> > cryptographic consequences. This commit adds a simple API, add_vmfork_
> > randomness(), for that, by force reseeding the crng.
> >
> > This has the added benefit of also draining the entropy pool and setting
> > its timer back, so that any old entropy that was there prior -- which
> > could have already been used by a different fork, or generally gone
> > stale -- does not contribute to the accounting of the next 256 bits.
> >
> > Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> > Cc: Theodore Ts'o <tytso@mit.edu>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

Okay if I treat this as a Reviewed-by instead?

