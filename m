Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37264CAA53
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:34:12 +0100 (CET)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRvX-0002W4-Qc
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:34:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPRtt-0000Wg-1l
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:32:29 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:37344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPRtq-0000wM-Ot
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:32:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 33AA5CE2189;
 Wed,  2 Mar 2022 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDCBC004E1;
 Wed,  2 Mar 2022 16:32:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Jx2KF4SC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646238734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pn15odJ1axHr1tSHXKM6R6gy8OQYz+UX/tuJV8kTZOI=;
 b=Jx2KF4SCMS6oQ81ruL+PmUOxb313LAgFJH4b+Nm/AbpnaHEQrJ93HFFJlkrZFljIclR1Ig
 7MjMDAT88vIHvYQ5jVCXMswnqvnSTAn/DRep7zjTiB1RFfgW3eKlFxCp1420xGYalEM2Wc
 ntxUnKyAuMw/wp27G1pbbLokW2Kvk8w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b026337
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 2 Mar 2022 16:32:14 +0000 (UTC)
Date: Wed, 2 Mar 2022 17:32:07 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh+cB5bWarl8CFN1@zx2c4.com>
References: <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
 <20220302101602-mutt-send-email-mst@kernel.org>
 <Yh+PET49oHNpxn+H@zx2c4.com>
 <20220302111737-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220302111737-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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

On Wed, Mar 02, 2022 at 11:22:46AM -0500, Michael S. Tsirkin wrote:
> > Because that 16 byte read of vmgenid is not atomic. Let's say you read
> > the first 8 bytes, and then the VM is forked.
> 
> But at this point when VM was forked plaintext key and nonce are all in
> buffer, and you previously indicated a fork at this point is harmless.
> You wrote "If it changes _after_ that point of check ... it doesn't
> matter:"

Ahhh, fair point. I think you're right.

Alright, so all we're talking about here is an ordinary 16-byte read,
and 16 bytes of storage per keypair, and a 16-byte comparison.

Still seems much worse than just having a single word...

Jason

