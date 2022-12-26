Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C5656448
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 17:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9qnM-00048y-1v; Mon, 26 Dec 2022 11:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Dxcw=4Y=zx2c4.com=Jason@kernel.org>)
 id 1p9qnK-00048q-KH
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 11:57:46 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Dxcw=4Y=zx2c4.com=Jason@kernel.org>)
 id 1p9qnF-0006Nx-Qy
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 11:57:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEACEB80D68;
 Mon, 26 Dec 2022 16:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B7C433EF;
 Mon, 26 Dec 2022 16:57:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="b6POVW8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672073853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIE3Z+cKtBnA8yyHSJ3TV6iPDq1ETA37GJq6ok6agec=;
 b=b6POVW8yEcfP7tPgzQ7TRtlOal2frw2gJhyxTHnfPwvZLzRkfcu/ZvZo9GN3NYBv0WGWum
 Gs4ULzuh3nXE7ld7n+E8K1bpyHRb9AbbcdaTcAb16aydVznl/eWc6Hg3p92r263zpwS3os
 WFupn1O+/WUSx2mfPn2ca2VDAuU7uwo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abdc5615
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 26 Dec 2022 16:57:33 +0000 (UTC)
Date: Mon, 26 Dec 2022 17:57:30 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>, x86@kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v5 4/4] x86: re-enable rng seeding via SetupData
Message-ID: <Y6nSel5/wdnoSFpk@zx2c4.com>
References: <20220921093134.2936487-1-Jason@zx2c4.com>
 <20220921093134.2936487-4-Jason@zx2c4.com>
 <Y6ZESPx4ettBLuMt@sol.localdomain> <Y6ZtVGtFpUNQP+KU@zx2c4.com>
 <Y6Z+WpqN59ZjIKkk@zx2c4.com> <Y6muh1E1fNOot+VZ@zx2c4.com>
 <Y6my+Oiz67G46snj@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6my+Oiz67G46snj@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Dxcw=4Y=zx2c4.com=Jason@kernel.org;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 26, 2022 at 03:43:04PM +0100, Jason A. Donenfeld wrote:
> On Mon, Dec 26, 2022 at 03:24:07PM +0100, Jason A. Donenfeld wrote:
> > Hi,
> > 
> > I'm currently stumped at the moment, so adding linux-mm@ and x86@. Still
> > working on it though. Details of where I'm at are below the quote below.
> > 
> > On Sat, Dec 24, 2022 at 05:21:46AM +0100, Jason A. Donenfeld wrote:
> > > On Sat, Dec 24, 2022 at 04:09:08AM +0100, Jason A. Donenfeld wrote:
> > > > Hi Eric,
> > > > 
> > > > Replying to you from my telephone, and I'm traveling the next two days,
> > > > but I thought I should mention some preliminary results right away from
> > > > doing some termux compiles:
> > > > 
> > > > On Fri, Dec 23, 2022 at 04:14:00PM -0800, Eric Biggers wrote:
> > > > > Hi Jason,
> > > > > 
> > > > > On Wed, Sep 21, 2022 at 11:31:34AM +0200, Jason A. Donenfeld wrote:
> > > > > > This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), but
> > > > > > for 7.2 rather than 7.1, now that modifying setup_data is safe to do.
> > > > > > 
> > > > > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > > > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > > > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > > > > ---
> > > > > >  hw/i386/microvm.c | 2 +-
> > > > > >  hw/i386/pc_piix.c | 3 ++-
> > > > > >  hw/i386/pc_q35.c  | 3 ++-
> > > > > >  3 files changed, 5 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > 
> > > > > After upgrading to QEMU 7.2, Linux 6.1 no longer boots with some configs.  There
> > > > > is no output at all.  I bisected it to this commit, and I verified that the
> > > > > following change to QEMU's master branch makes the problem go away:
> > > > > 
> > > > > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > > > > index b48047f50c..42f5b07d2f 100644
> > > > > --- a/hw/i386/pc_piix.c
> > > > > +++ b/hw/i386/pc_piix.c
> > > > > @@ -441,6 +441,7 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
> > > > >      pc_i440fx_machine_options(m);
> > > > >      m->alias = "pc";
> > > > >      m->is_default = true;
> > > > > +    PC_MACHINE_CLASS(m)->legacy_no_rng_seed = true;
> > > > >  }
> > > > > 
> > > > > I've attached the kernel config I am seeing the problem on.
> > > > > 
> > > > > For some reason, the problem also goes away if I disable CONFIG_KASAN.
> > > > > 
> > > > > Any idea what is causing this?
> > > > 
> > > > - Commenting out the call to parse_setup_data() doesn't fix the issue.
> > > >   So there's no KASAN issue with the actual parser.
> > > > 
> > > > - Using KASAN_OUTLINE rather than INLINE does fix the issue!
> > > > 
> > > > That makes me suspect that it's file size related, and QEMU or the BIOS
> > > > is placing setup data at an overlapping offset by accident, or something
> > > > similar.
> > > 
> > > I removed the file systems from your config to bring the kernel size
> > > back down, and voila, it works, even with KASAN_INLINE. So perhaps I'm
> > > on the right track here...
> > 
> > QEMU sticks setup_data after the kernel image, the same as kexec-tools
> > and everything else. Apparently, when the kernel image is large, the
> > call to early_memremap(boot_params.hdr.setup_data, ...) returns a value
> > that points some place bogus, and the system crashes or does something
> > weird. I haven't yet determined what this limit is, but in my current
> > test kernel, a value of 0x0000000001327650 is enough to make it point to
> > rubbish.
> > 
> > Is this expected? What's going on here?
> 
> Attaching gdb to QEMU and switching it to physical memory mode
> (`maintenance packet Qqemu.PhyMemMode:1 `) indicates that it
> early_memremap is actually working fine and something *else* is at this
> address? That's kinda weird... Is KASAN populating physical addresses
> immediately after the kernel image extremely early in boot? I'm seeing
> the crash happen from early_reserve_memory()->
> memblock_x86_reserve_range_setup_data(), which should be before
> kasan_init() even runs. Is QEMU calculating kernel_size wrong, when it
> goes to determine where to put the setup_data data? But that's the same
> calculation as used everywhere else, so hmm...
> 
> Jason

If bzImage is 15770544 bytes, it does not boot. If bzImage is 15641776
bytes, it does boot. So something is happening somewhat close to the
16MB mark?

