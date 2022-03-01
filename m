Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316B4C9551
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:02:02 +0100 (CET)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8h8-0002jb-2y
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nP8NV-0000VG-Ru
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:41:45 -0500
Received: from [2604:1380:4641:c500::1] (port=48534 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nP8NT-0001Fp-4u
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:41:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64A3F61593;
 Tue,  1 Mar 2022 19:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58888C340EE;
 Tue,  1 Mar 2022 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646163700;
 bh=C1fiXSQzp/6mGSE4wF5VaDuuI40Za2PZjhJbinmIoDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sFIIaOr3qhOtKIiGkw47+sRkCTakK6s4LOKKAyeJYuUR4/NwdOwfdasXUZZE+y2dN
 qTfAkZtm3bVoFwgnBR5c5AAcIWhrEK1eSu+jJttv2IPEGbRWp65T3CHVpPdKS0aQpb
 RsAEvhp7ssUECvOQfFWuscCf7xqrvhDIw/AQ44yk=
Date: Tue, 1 Mar 2022 20:41:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh528WPZrQn5s7vO@kroah.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com> <Yh5fbe71BTT6xc8h@kroah.com>
 <CAHmME9oGcp7HNLeieptMKztgg7Fq4MnOuAEsiFJxsLbmjSuFCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9oGcp7HNLeieptMKztgg7Fq4MnOuAEsiFJxsLbmjSuFCw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 07:24:11PM +0100, Jason A. Donenfeld wrote:
> Hi Greg,
> 
> On Tue, Mar 1, 2022 at 7:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > A notifier block like this makes sense, but why tie onto the PM_ stuff?
> > This isn't power management issues, it's a system-wide change that I am
> > sure others will want to know about that doesn't reflect any power
> > changes.
> >
> > As much as I hate adding new notifiers in the kernel, that might be all
> > you need here.
> 
> You might indeed be right. I guess I was thinking that "resuming from
> suspend" and "resuming from a VM fork" are kind of the same thing.
> There _is_ a certain kind of similarity between the two. I was hoping
> if the similarity was a strong enough one, maybe it'd make sense to do
> them together rather than adding another notifier. But I suppose you
> disagree, and it sounds like Rafael might too --
> <https://lore.kernel.org/lkml/CAJZ5v0g+GihH_b9YvwuHzdrUVNGXOeabOznDC1vK6qLi8gtSTQ@mail.gmail.com/>.

Hey, nice, we agree!  :)

> Code-wise for me with WireGuard it's of course appealing to treat them
> the same, since it's like a one line change, but if I need to add a
> new notifier call there, it's not the end of the world.

I know there are other places in the kernel that would like to be
notified when they have been moved to another machine so that they can
do things like determine if the CPU functionality has changed (or not),
and perhaps do other types of device reconfiguration.  Right now the
kernel does not have any way of knowing this, so it makes sense that if
the platform (i.e. ACPI here) has a way of creating such a event, it
should and then we can start tieing in other subsystems to use it
as-needed.

thanks,

greg k-h

