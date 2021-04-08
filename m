Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1335888D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:33:25 +0200 (CEST)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWeq-00014f-Ea
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUWd7-000066-QE; Thu, 08 Apr 2021 11:31:37 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:58856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUWd3-0006kZ-5A; Thu, 08 Apr 2021 11:31:36 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B207A2E1534;
 Thu,  8 Apr 2021 18:31:26 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 85YStUuFp3-VQ0GgX8l; Thu, 08 Apr 2021 18:31:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617895886; bh=4SsA96JhoZ4whyH4yaeTwYIEEy+IPJaZ1347vgtO4Gc=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=se9xhcbXqP7MYZxpmQQ/3OivUftsKbxmNjogqe71UPDXH4TSamTfjcNoWb8TwR4J2
 7aEDkwc3ielovMKDmuBImjbhv3HBSOpn4RjUZwSd73O15dgMGyTo8ZDt3aOADFbxdf
 uCe07tCrkNweI7ro0CDP/UmFyLpdK0VWd5xGfjgs=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 NE7fKtZvff-VQpOU73u; Thu, 08 Apr 2021 18:31:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 18:31:23 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 01/10] block/nbd: introduce NBDConnectThread reference
 counter
Message-ID: <YG8hywzTD4OtXJqo@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-2-vsementsov@virtuozzo.com>
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

On Thu, Apr 08, 2021 at 05:08:18PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> The structure is shared between NBD BDS and connection thread. And it
> is possible the connect thread will finish after closing and releasing
> for the bs. To handle this we have a concept of
> CONNECT_THREAD_RUNNING_DETACHED state and when thread is running and
> BDS is going to be closed we don't free the structure, but instead move
> it to CONNECT_THREAD_RUNNING_DETACHED state, so that thread will free
> it.
> 
> Still more native way to solve the problem is using reference counter
> for shared structure. Let's use it. It makes code smaller and more
> readable.
> 
> New approach also makes checks in nbd_co_establish_connection()
> redundant: now we are sure that s->connect_thread is valid during the
> whole life of NBD BDS.
> 
> This also fixes possible use-after-free of s->connect_thread if
> nbd_co_establish_connection_cancel() clears it during
> nbd_co_establish_connection(), and nbd_co_establish_connection() uses
> local copy of s->connect_thread after yield point.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 62 +++++++++++++++++------------------------------------
>  1 file changed, 20 insertions(+), 42 deletions(-)

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

