Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE27757E165
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:26:49 +0200 (CEST)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErk0-0005d2-IV
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oErfK-0001WP-A4
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:21:58 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:51888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oErfH-0001bK-1g
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:21:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FF0761EFF;
 Fri, 22 Jul 2022 12:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12858C341C6;
 Fri, 22 Jul 2022 12:21:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="maKYnBeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658492509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PdV4H36tC87FWwIgf5D/0C7b4o6qtvm9jER4e8pYdYo=;
 b=maKYnBeQr70LnysOTx3nNGdkWKomfsbU++Sn4xovo+YDQnO5FTSzFe3h1myOgL44xXzB9D
 MCoDR56Xq5J/3QfIF9FFCe46SgESh/LpgH6RNR+XVu9zAU6ZUtdhA6tG2VCa3EzqMc7R6X
 uq9z+GKDFlSBFcGXBKLcqZfNYVXzxf4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b28466f3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 22 Jul 2022 12:21:49 +0000 (UTC)
Date: Fri, 22 Jul 2022 14:21:46 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Message-ID: <YtqWWiXf3TR0zVXX@zx2c4.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
 <87tu7az28k.fsf@linaro.org> <Ytm1KiyFGNqAo/Af@zx2c4.com>
 <f1ed5194-09dc-432a-666e-b834f4252f4e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f1ed5194-09dc-432a-666e-b834f4252f4e@redhat.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Fri, Jul 22, 2022 at 02:04:45PM +0200, Paolo Bonzini wrote:
> On 7/21/22 22:20, Jason A. Donenfeld wrote:
> >> Why are we inserting this here? The guest-loader is only building on
> >> what the machine type has already constructed which in the case of -M
> >> virt for riscv and ARM already has code for this.
> > 
> > Wish you would have replied to the list patch before Paolo queued it.
> 
> Come on.
> 
> You posted a couple patches for this work 1 week before soft freeze 
> (which is when maintainer trees should be ready for merge), so that some 
> platforms get the support and some don't depending on how ready they 
> are for the freeze itself.
> 
> Then you post the rest of the implementation on the day of the freeze. 
> This patch has a pretty bad commit message too because any discussion on 
> boot loader chaining belonged there.
> 
> Your own timing was completely off, and the right thing to do would have 
> been to post a single series for all machines.  This way, even if the 
> patches were to go via individual trees, maintainers could coordinate on 
> which version to include, on how to handle migration, and so on.
> 
> Imagine doing the same thing for Linux, you'd be either ignored until 
> the merge window ends, or alternatively shouted at.  Ignoring patches 
> sent so close the soft freeze was my first instinct and it would have 
> been the right call, except that in the meanwhile some architecture had 
> their patches merged and here we are.
> 
> If anything _I_ have to apologize to Alex for picking up the patch in 
> his stead, and for bending the soft freeze rules in an attempt to avoid 
> having half-assed support where some architectures export the seed and 
> some don't.  But you really have no standing to complain to him about 
> not replying timely.

Please simmer down and quit the inane drama.

I don't have any qualms about Alex not replying in the two days before
you sent this pull. What I wish is that this was discussed on the list
before the pull so that we're now not in this awkward situation of
patch review inside of a pull. I don't know the procedures on what
happens now with that. Will this get pulled and now we have to revert?
Do you have to roll a new pull? I just have no idea, as this is all a
new thing for me. So my comment is more about the awkward state of
things than about some kind of failure from Alex. Obviously Alex is fine
here.

Your comments about my timing are also completely unjustified,
ridiculous, and actually a tad bit offensive. For the "high profile"
archs that I really wanted to hit 7.1, I started sending in DTB patches
a good deal of time ago. The only big arch I really wanted to hit 7.1
that wasn't queued up was the i386 patch, which I first posted in June.
Anyway, after it became clear that the i386 work was finally going to be
picked up, I breathed easy and decided to send in patches for the
remaining archs, to be picked up whenever. It was *your* decision that
all the DTB archs get in at the same time, hence picking this up; I had
no particular feelings on it, particularly as I don't know how to test
those remaining architectures like I did with the others. Anyway,
timing-wise, in my own planning, I handled risc-v, or1k, ppc, arm, i386,
and m68k well in advance and have been itching every single day since
posting those patches for them to be queued up somewhere.

So I really find your whole email just obnoxious and unnecessary. I've
been spending time trying to get the rng-seed stuff working on QEMU.
It's been a bit of a learning curve trying to figure out the QEMU
development model, and so I've miss-CC'd a few patches here and there.
But I've definitely tried to get an important subset of those patches in
in a timely manner. As a maintainer, you're definitely having the effect
of turning me off of the project rather than trying to acquaint me with
norms or be helpful.

Please, quit the drama. Enough of this stuff.

Jason

