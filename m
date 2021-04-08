Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72467358AE1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:08:26 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY8n-00057U-7N
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUY5d-0003PZ-Hv; Thu, 08 Apr 2021 13:05:09 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:50696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUY5Y-0003jM-VG; Thu, 08 Apr 2021 13:05:08 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CCCE92E1702;
 Thu,  8 Apr 2021 20:04:59 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HkuOhFLH1N-4x0uCoMj; Thu, 08 Apr 2021 20:04:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617901499; bh=v6srq9VkqJJfFxT9buaVVrbGcoRvYXhm2fKzBRciIJ8=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=ZrhbGerHkpATgY6ObjhSK1Mw9rF4pNoi0+SPGi6OGQjBrJ/GJ9nGsP+dRJ7DsWEtW
 Pmec8Rl8MoP3gv8apcABrwcttSuGk8rP40N28duGOAmv9lkH+RuhOw7KSnP4EOASGJ
 tphtiq73kiZPp3HQmPJD40OqYO3tdnVhsosFOtMk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 h18redGAXx-4xpmIhdU; Thu, 08 Apr 2021 20:04:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 20:04:55 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 10/10] nbd: move connection code from block/nbd to
 nbd/client-connection
Message-ID: <YG83t4s9kYLFRqUC@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-11-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On Thu, Apr 08, 2021 at 05:08:27PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We now have bs-independent connection API, which consists of four
> functions:
> 
>   nbd_client_connection_new()
>   nbd_client_connection_unref()
>   nbd_co_establish_connection()
>   nbd_co_establish_connection_cancel()
> 
> Move them to a separate file together with NBDClientConnection
> structure which becomes private to the new API.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hmm. I keep only Virtuozzo's copyright in a new file, as actually I've
> developed nbd-reconnection code. Still probably safer to save all
> copyrights. Let me now if you think so and I'll add them.

Not my call.

>  include/block/nbd.h     |  11 +++
>  block/nbd.c             | 167 ----------------------------------
>  nbd/client-connection.c | 192 ++++++++++++++++++++++++++++++++++++++++
>  nbd/meson.build         |   1 +
>  4 files changed, 204 insertions(+), 167 deletions(-)
>  create mode 100644 nbd/client-connection.c

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

