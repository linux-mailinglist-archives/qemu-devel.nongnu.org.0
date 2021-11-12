Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C911144E2CD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 09:05:54 +0100 (CET)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlRZJ-0003rO-GN
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 03:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlRXy-00032K-Sz; Fri, 12 Nov 2021 03:04:30 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:33074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlRXu-0008AN-1W; Fri, 12 Nov 2021 03:04:29 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 95CE62E0DA3;
 Fri, 12 Nov 2021 11:04:21 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BJiAxrDwi7-4Js03quk; Fri, 12 Nov 2021 11:04:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636704260; bh=VJoJppDe2IA4qbA1tDfzpAdDn4K7vwA1/59xkoB5PMg=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=Iyn2h5yFspJ86iH9JIbIury/x/o/ym0o9W4ZKUvuA6kfnWsCwD9gFO3QUHxK4RC3n
 a1u0ARIcdHfvDcQvqPakLk2xgTd1bVZPFfJC21wpaYa46VgtdFVYwbrpTJod6pij7q
 0LOarphbdnkMKwHcFzUW9MuCvud2by7b6szC0tH0=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:14::1:32])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 kNq9N6QnvA-4JwWuYGe; Fri, 12 Nov 2021 11:04:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 11:04:18 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/10] vhost: stick to -errno error return convention
Message-ID: <YY4gAgUO5UoIN1Ps@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 yc-core@yandex-team.ru, qemu-block@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111151419-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111151419-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 03:14:56PM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 06:33:44PM +0300, Roman Kagan wrote:
> > Error propagation between the generic vhost code and the specific backends is
> > not quite consistent: some places follow "return -1 and set errno" convention,
> > while others assume "return negated errno".  Furthermore, not enough care is
> > taken not to clobber errno.
> > 
> > As a result, on certain code paths the errno resulting from a failure may get
> > overridden by another function call, and then that zero errno inidicating
> > success is propagated up the stack, leading to failures being lost.  In
> > particular, we've seen errors in the communication with a vhost-user-blk slave
> > not trigger an immediate connection drop and reconnection, leaving it in a
> > broken state.
> > 
> > Rework error propagation to always return negated errno on errors and
> > correctly pass it up the stack.
> 
> Looks like something we want post release. I'll tag it
> but pls ping me after the release to help make sure
> it's not lost.

It doesn't introduce new features so I guess it might qualify for rc0,
but the churn is somewhat too big indeed.

OK I'll reiterate once 6.2 is out; meanwhile if anyone has spare cycles
to review it, it'll be much appreciated.

Thanks,
Roman.

> 
> 
> > Roman Kagan (10):
> >   vhost-user-blk: reconnect on any error during realize
> >   chardev/char-socket: tcp_chr_recv: don't clobber errno
> >   chardev/char-socket: tcp_chr_sync_read: don't clobber errno
> >   chardev/char-fe: don't allow EAGAIN from blocking read
> >   vhost-backend: avoid overflow on memslots_limit
> >   vhost-backend: stick to -errno error return convention
> >   vhost-vdpa: stick to -errno error return convention
> >   vhost-user: stick to -errno error return convention
> >   vhost: stick to -errno error return convention
> >   vhost-user-blk: propagate error return from generic vhost
> > 
> >  chardev/char-fe.c         |   7 +-
> >  chardev/char-socket.c     |  17 +-
> >  hw/block/vhost-user-blk.c |   4 +-
> >  hw/virtio/vhost-backend.c |   4 +-
> >  hw/virtio/vhost-user.c    | 401 +++++++++++++++++++++-----------------
> >  hw/virtio/vhost-vdpa.c    |  37 ++--
> >  hw/virtio/vhost.c         |  98 +++++-----
> >  7 files changed, 307 insertions(+), 261 deletions(-)
> > 
> > -- 
> > 2.33.1
> > 
> 

