Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B639776A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:02:23 +0200 (CEST)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6qU-0003N8-TJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo6na-0000x3-8F
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo6nX-0000AZ-BA
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622563158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVR1XKs5qy5IE4eNcapT4ccFBpI8jY+4aGtGFBtR/Yg=;
 b=G0RmITpg/UE0sLplsmv2dr///dbEJxvqIMVQUTLAl+FVmm7hPvnGpXAdFiHTfWgfeDWP4m
 WayI/A3zASwvIYTHsuN2JJWweVXPGrvQHC/qudkNx5f29cBg7G6sebe8AvuVqky6J0JyZe
 lKiwfnZnFulUTEBZ4IfC4TzvOCA+xW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-oapyY_qaNCSBLO34ytpVCQ-1; Tue, 01 Jun 2021 11:59:17 -0400
X-MC-Unique: oapyY_qaNCSBLO34ytpVCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 665B11854E29;
 Tue,  1 Jun 2021 15:59:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F11415D6CF;
 Tue,  1 Jun 2021 15:59:11 +0000 (UTC)
Date: Tue, 1 Jun 2021 17:59:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] block-backend: add drained_poll
Message-ID: <YLZZTgcWUliRhtT2@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-2-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601055728.90849-2-slp@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.06.2021 um 07:57 hat Sergio Lopez geschrieben:
> Allow block backends to poll their devices/users to check if they have
> been quiesced when entering a drained section.
> 
> This will be used in the next patch to wait for the NBD server to be
> completely quiesced.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  block/block-backend.c          | 7 ++++++-
>  include/sysemu/block-backend.h | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index de5496af66..163ca05b97 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2393,8 +2393,13 @@ static void blk_root_drained_begin(BdrvChild *child)
>  static bool blk_root_drained_poll(BdrvChild *child)
>  {
>      BlockBackend *blk = child->opaque;
> +    int ret = 0;

It's really a bool.

>      assert(blk->quiesce_counter);
> -    return !!blk->in_flight;
> +
> +    if (blk->dev_ops && blk->dev_ops->drained_poll) {
> +        ret = blk->dev_ops->drained_poll(blk->dev_opaque);
> +    }
> +    return ret || !!blk->in_flight;
>  }

Doesn't make a difference for correctness, of course, so whether you
change it or not:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


