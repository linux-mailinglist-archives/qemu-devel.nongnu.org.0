Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C672B35BCF2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:48:17 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsEy-0005h1-Ji
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lVsCD-0004Zz-8q; Mon, 12 Apr 2021 04:45:25 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:58508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lVsC7-0003tT-RI; Mon, 12 Apr 2021 04:45:23 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id D537E2E1849;
 Mon, 12 Apr 2021 11:45:11 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 demZ3frBK9-jB0edI8B; Mon, 12 Apr 2021 11:45:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1618217111; bh=JXL9v/x3n7/ZBjosbGOweqUL2O9M5jpsCniI93pF3vI=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=CL062NVtsVYxeFcrmkpRwKfJ7acZ+esR5B2Blq2fruFjUohtdlqkBdBban7BpjQqA
 qt81u0TFRFI0FQycDMRJUBL2IbGEqavlf06OYYs00aUqxM6ZVXRFmE4P5kT6gvO7iT
 jXoYxYK8TY5cMFgVg68Usr3mDmHhItihWkZekPAE=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 1lodiDqhzN-jBouRwel; Mon, 12 Apr 2021 11:45:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Mon, 12 Apr 2021 11:45:07 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
Message-ID: <YHQIk6PF6F3+dl7J@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 06:51:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> If on nbd_close() we detach the thread (in
> nbd_co_establish_connection_cancel() thr->state becomes
> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
> s->connect_thread (which is set to NULL), as running thread may free it
> at any time.
> 
> Still nbd_co_establish_connection() does exactly this: it saves
> s->connect_thread to local variable (just for better code style) and
> use it even after yield point, when thread may be already detached.
> 
> Fix that. Also check thr to be non-NULL on
> nbd_co_establish_connection() start for safety.
> 
> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
> impossible in the second switch in nbd_co_establish_connection().
> Still, don't add extra abort() just before the release. If it somehow
> possible to reach this "case:" it won't hurt. Anyway, good refactoring
> of all this reconnect mess will come soon.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
> reproduce it on master, it reproduces only on my branch with nbd
> reconnect refactorings.
> 
> Still, it seems very possible that it may crash under some conditions.
> So I propose this patch for 6.0. It's written so that it's obvious that
> it will not hurt:
> 
>  pre-patch, on first hunk we'll just crash if thr is NULL,
>  on second hunk it's safe to return -1, and using thr when
>  s->connect_thread is already zeroed is obviously wrong.
> 
>  block/nbd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Can we please get it merged in 6.0 as it's a genuine crasher fix?

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

