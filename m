Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB221308688
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:37:13 +0100 (CET)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OLA-0006Yo-UX
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5OJl-0005r7-8k; Fri, 29 Jan 2021 02:35:45 -0500
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:60170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5OJf-00032w-Ii; Fri, 29 Jan 2021 02:35:43 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id CDCB72E2457;
 Fri, 29 Jan 2021 10:35:31 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
 (myt4-18a966dbd9be.qloud-c.yandex.net [2a02:6b8:c00:12ad:0:640:18a9:66db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 rR40cTfnqK-ZVxajLUq; Fri, 29 Jan 2021 10:35:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611905731; bh=eSy/hFtMjme0cKvjgfrHJGEgYTr1RcBHqENidzSSCvA=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=mgMFWu5KJmxlDoueEjQ6PpG39jO+YCYMA+SN0IXYWMgNcHGX28wW96x7VSmBddZux
 rGL9n48mJXZXGKC99wtCx1sH6cFo7H1Jtqd59PN3ZY7bqjvEF3ZafM6tm/wonOFeIu
 oNjNgQitdxVIypbJcj1FEjvo6qaaDa8MkdGHIUT4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 16f3mkE43s-ZUmKJJTn; Fri, 29 Jan 2021 10:35:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 29 Jan 2021 10:35:27 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/3] block/nbd: fix crashers in reconnect while migrating
Message-ID: <20210129073527.GC3053@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <7555daaf-1e1b-1ef7-a5d1-24d98a18599d@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7555daaf-1e1b-1ef7-a5d1-24d98a18599d@virtuozzo.com>
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
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 08:51:39AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 28.01.2021 23:14, Roman Kagan wrote:
> > During the final phase of migration the NBD reconnection logic may
> > encounter situations it doesn't expect during regular operation.
> > 
> > This series addresses some of them that make qemu crash.  They are
> > reproducible when a vm with a secondary drive attached via nbd with
> > non-zero "reconnect-delay" runs a stress load (fio with big queue depth)
> > in the guest on that drive and is migrated (e.g. to a file), while the
> > nbd server is SIGKILL-ed and restarted every second.
> > 
> > See the individual patches for specific crash conditions and more
> > detailed explanations.
> > 
> > Roman Kagan (3):
> >    block/nbd: only detach existing iochannel from aio_context
> >    block/nbd: only enter connection coroutine if it's present
> >    nbd: make nbd_read* return -EIO on error
> > 
> >   include/block/nbd.h |  7 ++++---
> >   block/nbd.c         | 25 +++++++++++++++++--------
> >   2 files changed, 21 insertions(+), 11 deletions(-)
> > 
> 
> Thanks a lot for fixing!
> 
> Do you have some reproducer scripts? Could you post them or may be add
> an iotest?

I don't have it scripted, just ad hoc command lines.  I'll look into
making up a test.  Can you perhaps suggest what existing test to base
on?

Thanks,
Roman.

