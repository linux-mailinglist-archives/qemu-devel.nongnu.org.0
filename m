Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C14308626
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:06:09 +0100 (CET)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Nr6-0008GP-9X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5Nos-0007iW-AH; Fri, 29 Jan 2021 02:03:50 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:60756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5Non-0005wU-De; Fri, 29 Jan 2021 02:03:48 -0500
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5E6FE2E2418;
 Fri, 29 Jan 2021 10:03:40 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Vqu5mkInZT-3dxmwFDh; Fri, 29 Jan 2021 10:03:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611903820; bh=RT+p/nHYKuh62hI0FSkJtTtr66TOIFCFaG5Op2wBjLw=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=QDmXto6k4vZtJQjqF6ollReaXlYBCqH6Jm5K1pwDJNNIviKPQh4kBJfEnfrnAhiuP
 F6ERXKpHxRDV73jg9kGfdw1pD9bZA9vzBRgpwU5lvVKmqg7c8IPEoN+ZE4qabpfzJt
 DtOPtjezGDIF30/ORAtbQ1zItcAANUKkekMOAhOU=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ODuXM4u2JX-3dneieEo; Fri, 29 Jan 2021 10:03:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 29 Jan 2021 10:03:36 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/3] block/nbd: only detach existing iochannel from
 aio_context
Message-ID: <20210129070336.GB3053@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <20210128201418.607640-2-rvkagan@yandex-team.ru>
 <8b3ec104-420d-1504-454c-3f6560850087@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b3ec104-420d-1504-454c-3f6560850087@virtuozzo.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Jan 29, 2021 at 08:37:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 28.01.2021 23:14, Roman Kagan wrote:
> > When the reconnect in NBD client is in progress, the iochannel used for
> > NBD connection doesn't exist.  Therefore an attempt to detach it from
> > the aio_context of the parent BlockDriverState results in a NULL pointer
> > dereference.
> > 
> > The problem is triggerable, in particular, when an outgoing migration is
> > about to finish, and stopping the dataplane tries to move the
> > BlockDriverState from the iothread aio_context to the main loop.  If the
> > NBD connection is lost before this point, and the NBD client has entered
> > the reconnect procedure, QEMU crashes:
> > 
> >      at /build/qemu-gYtjVn/qemu-5.0.1/io/channel.c:452
> >      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6151
> >      new_context=new_context@entry=0x562a260c9580,
> >      ignore=ignore@entry=0x7feeadc9b780)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6230
> >      (bs=bs@entry=0x562a268d6a00, ctx=0x562a260c9580,
> >      ignore_child=<optimized out>, errp=<optimized out>)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6332
> >      new_context=0x562a260c9580,
> >      update_root_node=update_root_node@entry=true, errp=errp@entry=0x0)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:1989
> >      new_context=<optimized out>, errp=errp@entry=0x0)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:2010
> >      out>)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
> >      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio-bus.c:245
> >      running=0, state=<optimized out>)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio.c:3220
> >      state=state@entry=RUN_STATE_FINISH_MIGRATE)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/softmmu/vl.c:1275
> >      send_stop=<optimized out>)
> >      at /build/qemu-gYtjVn/qemu-5.0.1/cpus.c:1032
> >      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:2914
> >      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3275
> >      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3439
> >      at /build/qemu-gYtjVn/qemu-5.0.1/util/qemu-thread-posix.c:519
> >      at pthread_create.c:333
> >      oldval=0x562a2452b138, oldlenp=0x0, newval=0x562a2452c5e0
> >      <__func__.28102>, newlen=0)
> >      at ../sysdeps/unix/sysv/linux/sysctl.c:30
> 
> function names are somehow lost :(

Oops.  Backtraces in gdb have frame numbers prefixed with a hash which
got interpreted as comments by git commit; I should have offset the
backtrace when pasting.

Will respin with fixed log messages, thanks.

Roman.

