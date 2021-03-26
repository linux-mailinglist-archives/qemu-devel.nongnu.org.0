Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EE134A1A2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:19:13 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfoO-0002aY-59
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPfmB-0001yY-FA; Fri, 26 Mar 2021 02:16:57 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:51806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPflz-0005nt-RE; Fri, 26 Mar 2021 02:16:52 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 933012E1580;
 Fri, 26 Mar 2021 09:16:32 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 uPC0gkWNS6-GWsO9lHR; Fri, 26 Mar 2021 09:16:32 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616739392; bh=V/vScFLqb93iTELWeeomlZ9mp4NGRb5LeSIIvTGScSo=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=ur26GMhebtjGLyf/EGV9C9ec6FXBusyd+LhMzNrMMCrWmcO6DXFCbjBV/H7sfjqFF
 hqX+LH1n7hIvTT8P9Wd7xb6P+Mn0XvtGFPWIX1XU0zu3/5lx5WxAKvQUJaSz0Vjj21
 QU8kmV6kF09XTU5Cy4ZZGTqREj6wWu8SECj4LdK4=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8226::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 opaFtuo9xn-GWpSB89b; Fri, 26 Mar 2021 09:16:32 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 26 Mar 2021 09:16:28 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 6/7] block/nbd: decouple reconnect from drain
Message-ID: <YF18PIGa/6AXq3Z0@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-7-rvkagan@yandex-team.ru>
 <995a9667-b7ae-3e00-caa5-6c80fc0962f3@virtuozzo.com>
 <YFDWuJ48WU3f6feI@rvkaganb.lan>
 <4fa12179-109e-2f5e-71c4-ff078d59db4d@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa12179-109e-2f5e-71c4-ff078d59db4d@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 09:09:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 16.03.2021 19:03, Roman Kagan wrote:
> > On Mon, Mar 15, 2021 at 11:10:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 15.03.2021 09:06, Roman Kagan wrote:
> > > > The reconnection logic doesn't need to stop while in a drained section.
> > > > Moreover it has to be active during the drained section, as the requests
> > > > that were caught in-flight with the connection to the server broken can
> > > > only usefully get drained if the connection is restored.  Otherwise such
> > > > requests can only either stall resulting in a deadlock (before
> > > > 8c517de24a), or be aborted defeating the purpose of the reconnection
> > > > machinery (after 8c517de24a).
> > > > 
> > > > Since the pieces of the reconnection logic are now properly migrated
> > > > from one aio_context to another, it appears safe to just stop messing
> > > > with the drained section in the reconnection code.
> > > > 
> > > > Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> > > 
> > > I'd not think that it "fixes" it. Behavior changes.. But 5ad81b4946
> > > didn't introduce any bugs.
> > 
> > I guess you're right.
> > 
> > In fact I did reproduce the situation when the drain made no progress
> > exactly becase the only in-flight reference was taken by the
> > connection_co, but it may be due to some intermediate stage of the patch
> > development so I need to do a more thorough analysis to tell if it was
> > triggerable with the original code.
> > 
> > > > Fixes: 8c517de24a ("block/nbd: fix drain dead-lock because of nbd reconnect-delay")
> > > 
> > > And here..
> > > 
> > > 1. There is an existing problem (unrelated to nbd) in Qemu that long
> > > io request which we have to wait for at drained_begin may trigger a
> > > dead lock
> > > (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html)
> > > 
> > > 2. So, when we have nbd reconnect (and therefore long io requests) we
> > > simply trigger this deadlock.. That's why I decided to cancel the
> > > requests (assuming they will most probably fail anyway).
> > > 
> > > I agree that nbd driver is wrong place for fixing the problem
> > > described in
> > > (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html),
> > > but if you just revert 8c517de24a, you'll see the deadlock again..
> > 
> > I may have misunderstood that thread, but isn't that deadlock exactly
> > due to the requests being unable to ever drain because the
> > reconnection process is suspended while the drain is in progress?
> > 
> 
> 
> Hmm, I didn't thought about it this way.  What you mean is that
> reconnection is cancelled on drain_begin, so drain_begin will never
> finish, because it waits for requests, which will never be
> reconnected. So, you are right it's a deadlock too.

Right.

> But as I remember what is described in 8c517de24a is another deadlock,
> triggered by "just a long request during drain_begin". And it may be
> triggered again, if the we'll try to reconnect for several seconds
> during drained_begin() instead of cancelling requests.

IMO it wasn't a different deadlock, it wass exactly this one: the drain
got stuck the way described above with the qemu global mutex taken, so
the rest of qemu got stuck too.

> Didn't you try the scenario described in 8c517de24a on top of your
> series?

I've tried it with the current master with just 8c517de24a reverted --
the deadlock reproduced in all several attempts.  Then with my series --
the deadlock didn't reproduce in any of my several attempts.  More
precisely, qemu appeared frozen once the guest timed out the requests
and initiated ATA link soft reset, which presumably caused that drain,
but, as soon as the reconnect timer expired (resulting in requests
completed into the guest with errors) or the connection was restored
(resulting in requests completed successfully), it resumed normal
operation.

So yes, I think this series does address that deadlock.

Thanks,
Roman.

