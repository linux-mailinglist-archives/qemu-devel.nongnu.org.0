Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D34CA6D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:58:28 +0100 (CET)
Received: from localhost ([::1]:39078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPUq-0003tA-0o
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPPSI-0000aA-4Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:55:50 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPPSF-0000cw-Nz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:55:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81104B81FF0;
 Wed,  2 Mar 2022 13:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB550C004E1;
 Wed,  2 Mar 2022 13:55:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kpzYHDtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646229339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SpVcuA/WXuSF2VylmDTidLRP/fq6dnIG3IJK6i0yAko=;
 b=kpzYHDtUAlCnEdVEte//Tt36NxH+/Ez0o+kl3YdWmtGk9TZCjSHm6oGL/AbSTrC8Y1PuRg
 jZ3NV3d2m9tjm6vre8HArSM79be/kQc4jqSkH3qUrcSXgTDy8VV6MN3iqBxSC6PUytw5x2
 eJFYg/LLjTsXb0gq+k1Xln0G4fDjTNE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fd2dbd60
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 2 Mar 2022 13:55:38 +0000 (UTC)
Date: Wed, 2 Mar 2022 14:55:29 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh93UZMQSYCe2LQ7@zx2c4.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220302074503-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org;
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Wed, Mar 02, 2022 at 07:58:33AM -0500, Michael S. Tsirkin wrote:
> > There's also the atomicity aspect, which I think makes your benchmark
> > not quite accurate. Those 16 bytes could change between the first and
> > second word (or between the Nth and N+1th word for N<=3 on 32-bit).
> > What if in that case the word you read second doesn't change, but the
> > word you read first did? So then you find yourself having to do a
> > hi-lo-hi dance.
> > And then consider the 32-bit case, where that's even
> > more annoying. This is just one of those things that comes up when you
> > compare the semantics of a "large unique ID" and "word-sized counter",
> > as general topics. (My suggestion is that vmgenid provide both.)
> 
> I don't see how this matters for any applications at all. Feel free to
> present a case that would be race free with a word but not a 16
> byte value, I could not imagine one. It's human to err of course.

Word-size reads happen all at once on systems that Linux supports,
whereas this is not the case for 16 bytes (with a few niche exceptions
like cmpxchg16b and such). If you read the counter atomically, you can
check to see whether it's changed just after encrypting but before
transmitting and not transmit if it has changed, and voila, no race.
With 16 bytes, synchronization of that read is pretty tricky (though
maybe not all together impossible), because, as I mentioned, the first
word might have changed by the time you read a matching second word. I'm
sure you're familiar with the use of seqlocks in the kernel for solving
a somewhat related problem.

Jason

