Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C07358965
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:13:21 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXHU-0000Nz-D0
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXFD-0006zZ-SD; Thu, 08 Apr 2021 12:10:59 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXF9-0004vI-AZ; Thu, 08 Apr 2021 12:10:58 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C55822E1534;
 Thu,  8 Apr 2021 19:10:50 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BWPL8a0Hey-An0OAAYu; Thu, 08 Apr 2021 19:10:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617898250; bh=v19KK0dTwPpjdNNhmbMXsMypnasdIAYnFUdSZrxGoWA=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=iVULPWh5VkU5QwbTC/PUoiDdWqZJvXv6y9S/TRNNcfsrhGFIwEcmYQtMJ7H8uekXq
 l/bB56nerEFwC1889rgrdOd0IILVUdALcqnmgrQU5b5a3bcqpUPlqk2SEwJl8sRYqq
 Iw4s1N1HYQdJ/cBh0ph/K5qiuiu7/WLIVvIyv0kI=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EVLLGVVmHA-AnpGbeqZ; Thu, 08 Apr 2021 19:10:49 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 19:10:46 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 04/10] block/nbd: simplify waking of
 nbd_co_establish_connection()
Message-ID: <YG8rBu/abLLSXDo5@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-5-vsementsov@virtuozzo.com>
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

On Thu, Apr 08, 2021 at 05:08:21PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Instead of connect_bh, bh_ctx and wait_connect fields we can live with
> only one link to waiting coroutine, protected by mutex.
> 
> So new logic is:
> 
> nbd_co_establish_connection() sets wait_co under mutex, release the
> mutex and do yield(). Note, that wait_co may be scheduled by thread
> immediately after unlocking the mutex. Still, in main thread (or
> iothread) we'll not reach the code for entering the coroutine until the
> yield() so we are safe.
> 
> Both connect_thread_func() and nbd_co_establish_connection_cancel() do
> the following to handle wait_co:
> 
> Under mutex, if thr->wait_co is not NULL, call aio_co_wake() (which
> never tries to acquire aio context since previous commit, so we are
> safe to do it under thr->mutex) and set thr->wait_co to NULL.
> This way we protect ourselves of scheduling it twice.
> 
> Also this commit make nbd_co_establish_connection() less connected to
> bs (we have generic pointer to the coroutine, not use s->connection_co
> directly). So, we are on the way of splitting connection API out of
> nbd.c (which is overcomplicated now).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 49 +++++++++----------------------------------------
>  1 file changed, 9 insertions(+), 40 deletions(-)

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

