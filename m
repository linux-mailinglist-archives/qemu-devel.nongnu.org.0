Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D9358B2F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:18:03 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYI5-00035A-BV
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUYGQ-00027b-B4; Thu, 08 Apr 2021 13:16:18 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:55840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUYGL-000190-EB; Thu, 08 Apr 2021 13:16:16 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 76F762E1515;
 Thu,  8 Apr 2021 20:16:07 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 wJZMJiZNPn-G60e9uHH; Thu, 08 Apr 2021 20:16:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617902167; bh=o0CFIyuLjzTT9DEV9YXn3DVquKAoDsput6oNacbs4mI=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=mwGMLn1al/kJmosG+9BzMLOG6ZAYxbAf5KFnTzvSn0edTuv/XbWB0Seni9CoMznoR
 /XJyV8Yj7QOofsS36sGB4kTEQxHLv3EXAlPUynE+AT2J7CnwZa0pWEzhKCxYVnemkF
 Xc+mCrdPMeU+UMyfWImogGbaAaWSPx507INDjlUU=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yUn0yWZDIH-G6oi25H5; Thu, 08 Apr 2021 20:16:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 20:16:02 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 00/10] block/nbd: move connection code to separate file
Message-ID: <YG86Up9+3vkZQK/H@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
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
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 05:08:17PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> This substitutes "[PATCH 00/14] nbd: move reconnect-thread to separate file"
> Supersedes: <20210407104637.36033-1-vsementsov@virtuozzo.com>
> 
> I want to simplify block/nbd.c which is overcomplicated now. First step
> is splitting out what could be split.
> 
> These series creates new file nbd/client-connection.c and part of
> block/nbd.c is refactored and moved.
> 
> v2 is mostly rewritten. I decided move larger part, otherwise it doesn't
> make real sense.
> 
> Note also that v2 is based on master. Patch 01 actually solves same
> problem as
> "[PATCH for-6.0] block/nbd: fix possible use after free of s->connect_thread" [*]
> in a smarter way. So, if [*] goes first, this will be rebased to undo
> [*].
> 
> Vladimir Sementsov-Ogievskiy (10):
>   block/nbd: introduce NBDConnectThread reference counter
>   block/nbd: BDRVNBDState: drop unused connect_err and connect_status
>   util/async: aio_co_enter(): do aio_co_schedule in general case
>   block/nbd: simplify waking of nbd_co_establish_connection()
>   block/nbd: drop thr->state
>   block/nbd: bs-independent interface for nbd_co_establish_connection()
>   block/nbd: make nbd_co_establish_connection_cancel() bs-independent
>   block/nbd: rename NBDConnectThread to NBDClientConnection
>   block/nbd: introduce nbd_client_connection_new()
>   nbd: move connection code from block/nbd to nbd/client-connection
> 
>  include/block/nbd.h     |  11 ++
>  block/nbd.c             | 288 ++--------------------------------------
>  nbd/client-connection.c | 192 +++++++++++++++++++++++++++
>  util/async.c            |  11 +-
>  nbd/meson.build         |   1 +
>  5 files changed, 218 insertions(+), 285 deletions(-)
>  create mode 100644 nbd/client-connection.c

I think this is a nice cleanup overall, and makes the logic in
block/nbd.c much easier to reason about.

I guess it's 6.1 material though, as it looks somewhat too big for 6.0,
and the only serious bug it actually fixes can be addressed with a
band-aid mentioned above.

The problem I originally came across with, that of the requests being
canceled on drain despite reconnect, still remains, but I think the fix
for it should build up on this series (and thus probably wait till after
6.0).

Thanks,
Roman.

