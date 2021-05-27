Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE13931AC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:04:30 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHYj-0003ys-Ce
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmHJO-0001VB-Jt
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmHJL-000203-Lt
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622126915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2sfU8Aeh6l/tao4QBooIJZegQd6WRDU9Mu1Ku4gVPB4=;
 b=PIT9j8FZBNJ4YcqnSHioB6jiGyEbvXF5cl5xuVYLBe41bMnBEVjT/lbIAtiDy0Bsjsg3OC
 gGmAUdK9lV/sr/jSiy7lu6Db1BnyRwvGs35ZZt+bBCI7ZuP86H5NakxjdYC7VnhNt76yZ9
 kOStetL5L8J45GVnF9et8bMARlzC8JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-RDzehyHxN2G29_tWDp0_CA-1; Thu, 27 May 2021 10:48:31 -0400
X-MC-Unique: RDzehyHxN2G29_tWDp0_CA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 597CA1020C2E;
 Thu, 27 May 2021 14:48:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-201.ams2.redhat.com [10.36.114.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 996F36267D;
 Thu, 27 May 2021 14:48:25 +0000 (UTC)
Date: Thu, 27 May 2021 16:48:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/3] block: consistently use bdrv_is_read_only()
Message-ID: <YK+xOEw90TYg+Ub1@merkur.fritz.box>
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
 <20210526211534.524597-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210526211534.524597-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, qemu-block@nongnu.org, codyprime@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.05.2021 um 23:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
> It's better to use accessor function instead of bs->read_only directly.
> In some places use bdrv_is_writable() instead of
> checking both BDRV_O_RDWR set and BDRV_O_INACTIVE not set.
> 
> In bdrv_open_common() it's a bit strange to add one more variable, but
> we are going to drop bs->read_only in the next patch, so new ro local
> variable substitutes it here.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> diff --git a/block/qcow2.c b/block/qcow2.c
> index 39b91ef940..d39d9f4e9b 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -1724,7 +1724,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>      /* Clear unknown autoclear feature bits */
>      update_header |= s->autoclear_features & ~QCOW2_AUTOCLEAR_MASK;
>      update_header =
> -        update_header && !bs->read_only && !(flags & BDRV_O_INACTIVE);
> +        update_header && bdrv_is_writable(bs);

This statement fits on a single line now.

Kevin


