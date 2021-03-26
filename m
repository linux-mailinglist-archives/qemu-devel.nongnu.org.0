Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C234A2A6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:43:33 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPh80-00080v-9w
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPh6e-0007Vw-5U; Fri, 26 Mar 2021 03:42:08 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:51974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPh6a-00076W-6d; Fri, 26 Mar 2021 03:42:06 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 73FBE2E19A8;
 Fri, 26 Mar 2021 10:41:57 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CdKYrXEisn-fusqZieB; Fri, 26 Mar 2021 10:41:57 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616744517; bh=25Iaq6fpDl4qLGF92uASM3h87CI2HbZQkEzQfvPOsNs=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=eSVQOPSUwwMgmMWUc/UG3UY2Zx4ZgEuQJQClyQSd2Dckzo21l7VB84LMSWv5rlJ7k
 /dpi8KDxdUTIsQkUKpfl8+Qk8sgAToVTwDREzupANm9FQaT3s8vN//eNSuvvRSCgGb
 o8xVXk9ae4CN1hBwJtAjP2DFBOnMmYcYuaN6qjMI=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8226::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 thb5KuQuqY-fup46GDr; Fri, 26 Mar 2021 10:41:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 26 Mar 2021 10:41:53 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 7/7] block/nbd: stop manipulating in_flight counter
Message-ID: <YF2QQdwmuc6GgO9g@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-8-rvkagan@yandex-team.ru>
 <de4fd61f-ccd3-125b-b636-aa06efe5823a@virtuozzo.com>
 <YFDX7aZngRCZF9Ew@rvkaganb.lan>
 <37c7fd4a-fa68-22b0-6d4c-4a161116515a@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37c7fd4a-fa68-22b0-6d4c-4a161116515a@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On Tue, Mar 16, 2021 at 09:37:13PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 16.03.2021 19:08, Roman Kagan wrote:
> > On Mon, Mar 15, 2021 at 11:15:44PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 15.03.2021 09:06, Roman Kagan wrote:
> > > > As the reconnect logic no longer interferes with drained sections, it
> > > > appears unnecessary to explicitly manipulate the in_flight counter.
> > > > 
> > > > Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> > > 
> > > And here you actually allow qemu_aio_coroutine_enter() call in
> > > nbd_client_attach_aio_context_bh() to enter connection_co in any yield
> > > point which is possible during drained section. The analysis should be
> > > done to be sure that all these yield points are safe for reentering by
> > > external qemu_aio_coroutine_enter(). (By external I mean not by the
> > > actual enter() we are waiting for at the yield() point. For example
> > > qemu_channel_yield() supports reentering.. And therefore (as I
> > > understand after fast looking through) nbd_read() should support
> > > reentering too..
> > 
> > I'll do a more thorough analysis of how safe it is.
> > 
> > FWIW this hasn't triggered any test failures yet, but that assert in
> > patch 3 didn't ever go off either so I'm not sure I can trust the tests
> > on this.
> > 
> 
> Hmm. First, we should consider qemu_coroutine_yield() in
> nbd_co_establish_connection().
> 
> Most of nbd_co_establish_connection_cancel() purpose is to avoid
> reentering this yield()..

Unless I'm overlooking something, nbd_co_establish_connection() is fine
with spurious entering at this yield point.  What does look problematic,
though, is your next point:

> And I don't know, how to make it safely reenterable: keep in mind bh
> that may be already scheduled by connect_thread_func(). And if bh is
> already scheduled, can we cancel it? I'm not sure.
> 
> We have qemu_bh_delete(). But is it possible, that BH is near to be
> executed and already cannot be removed by qemu_bh_delete()? I don't
> know.
> 
> And if we can't safely drop the bh at any moment, we should wait in
> nbd_client_detach_aio_context until the scheduled bh enters the
> connection_co.. Or something like this

So I think it's not the reentry at this yield point per se which is
problematic, it's that that bh may have been scheduled before the
aio_context switch so once it runs it would wake up connection_co on the
old aio_context.  I think it may be possible to address by adding a
check into connect_bh().

Thanks,
Roman.

