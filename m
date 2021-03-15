Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF733AB17
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:39:40 +0100 (CET)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfx5-0001T8-5d
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLfuX-0000si-49; Mon, 15 Mar 2021 01:37:01 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLfuT-00044Y-2q; Mon, 15 Mar 2021 01:36:59 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 57E3A2E145B;
 Mon, 15 Mar 2021 08:36:49 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 GP1o4DYCz0-amC8rcwX; Mon, 15 Mar 2021 08:36:49 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615786609; bh=4dlUTjEpRn6ddtJC3ldLGnMUrlMYRBlnnx4LRGv9QGM=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=XyCDG3H2ytfnhq0/2a6YeOHMu2CVCWejseWWhD2g0o7j5MybrHjgZc3eOdfq66DAI
 hFWILxrd3qxLVbWi8rpGO5+8svN5mrZZzw5suSp2Bu2f2atYB7H9KqrPKLPh/tk0cK
 uikuBVUZj/d5oL8zjoy6o1HH14wYiTpwRq9mRUhg=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 91xQJCzdSo-amnu2rhh; Mon, 15 Mar 2021 08:36:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Mon, 15 Mar 2021 08:36:44 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC] nbd: decouple reconnect from drain
Message-ID: <YE7ybMq7YdkSrFco@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, yc-core@yandex-team.ru,
 Max Reitz <mreitz@redhat.com>
References: <20210310093232.519585-1-rvkagan@yandex-team.ru>
 <a1d202b2-ddb6-e173-c0a7-e3199b641499@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1d202b2-ddb6-e173-c0a7-e3199b641499@virtuozzo.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 03:35:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 10.03.2021 12:32, Roman Kagan wrote:
> > NBD connect coroutine takes an extra in_flight reference as if it's a
> > request handler.  This prevents drain from completion until the
> > connection coroutine is releases the reference.
> > 
> > When NBD is configured to reconnect, however, this appears to be fatal
> > to the reconnection idea: the drain procedure wants the reconnection to
> > be suspended, but this is only possible if the in-flight requests are
> > canceled.
> 
> As I remember from our conversation, the problem is not that we don't
> reconnect during drained section, but exactly that we cancel requests
> on drained begins starting from 8c517de24a8a1dcbeb.

Well, I'd put it the other way around: the problem is that we don't
reconnect during the drained section, so the requests can't be
successfully completed if the connection breaks: they can either stall
forever (before 8c517de24a8a1dcbeb) or be aborted (after
8c517de24a8a1dcbeb).

> This is not a problem in scenarios when reconnect is rare case and
> failed request is acceptable. But if we have bad connection and
> requests should often wait for reconnect (so, it may be considered as
> a kind of "latency") then really, cancelling the waiting requests on
> any drain() kills the reconnect feature.

In our experience the primary purpose of reconnect is not to withstand
poor network links, but about being able to restart the NBD server
without disrupting the guest operation.  So failing the requests during
the server maintenance window is never acceptable, no matter how rare it
is (and in our practice it isn't).

> > Fix this by making the connection coroutine stop messing with the
> > in-flight counter.  Instead, certain care is taken to properly move the
> > reconnection stuff from one aio_context to another in
> > .bdrv_{attach,detach}_aio_context callbacks.
> > 
> > Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> > This patch passes the regular make check but fails some extra iotests,
> > in particular 277.  It obviously lacks more robust interaction with the
> > connection thread (which in general is fairly complex and hard to reason
> > about), and perhaps has some other drawbacks, so I'll work on this
> > further, but I'd appreciate some feedback on whether the idea is sound.
> > 
> 
> In general I like the idea. The logic around drain in nbd is
> overcomplicated. And I never liked the fact that nbd_read_eof() does
> dec-inc inflight section. Some notes:
> 
> 1. I hope, the patch can be divided into several ones, as there are
> several things done:
> 
> - removing use of in_flight counter introduced by 5ad81b4946
> - do reconnect during drained section
> - stop cancelling requests on .drained_begin

I've split the (somewhat extended) patch into a series of 7, but not
exactly as you suggested.  In particular, I can't just stop aborting the
requests on .drained_begin as this would reintroduce the deadlock, so I
just remove the whole .drained_begin/end in a single patch.

> 2. 5ad81b4946 was needed to make nbd_client_attach_aio_context()
> reenter connection_co only in one (or two) possible places, not on any
> yield.. And I don't see how it is achieved now.. This should be
> described in commit msg..

My problem is that I failed to figure out why it was necessary in the
first place, so I think I don't achieve this with the series.

> 3. About cancelling requests on drained_begin. The behavior was
> introduced by 8c517de24a8a1dcbeb, to fix a deadlock. So, if now the
> deadlock is fixed another way, let's change the logic (don't cancel
> requests) in a separate patch, and note 8c517de24a8a1dcbeb commit and
> the commit that fixes deadlock the other way in the commit message.

As I mentioned earlier I did a patch that removed the root cause; a
separate patch removing just the request cancelation didn't look
justified.  I did mention the commits in the log.

Thanks for the review!  I'm now on to submitting a non-RFC version.
Roman.

