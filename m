Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B590639BE6B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:18:37 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDSu-0004Ix-QO
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpCUi-0002dM-8T
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpCUg-0004V2-DI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWtuOPfCoxheKsFFTC6tA0fBP0dhWlFcRqdB7yDlzoM=;
 b=e1heN6Wu+GskK1isL38MESqzv0UzgAQmMwEMw1jOWnocjcph5ym8TXY1mecvuQcqququad
 14I7AS67LVY0zQNmmfG9tE6uQFRJMKETJP8kaRRsrZO0MwH84ukiubglvTuethJbEkURfc
 nK6ojPxjG1myK+mctEfMTdH7of+iL3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-zjzXEzMLM62glVmNR36lsg-1; Fri, 04 Jun 2021 12:16:15 -0400
X-MC-Unique: zjzXEzMLM62glVmNR36lsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6276180FD6F;
 Fri,  4 Jun 2021 16:16:14 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F04D061093;
 Fri,  4 Jun 2021 16:16:12 +0000 (UTC)
Date: Fri, 4 Jun 2021 11:16:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v4 1/6] blkdebug: refactor removal of a suspended request
Message-ID: <20210604161610.6we6yk2e77borfif@redhat.com>
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210604100741.18966-2-eesposit@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 12:07:36PM +0200, Emanuele Giuseppe Esposito wrote:
> Extract to a separate function.  Do not rely on FOREACH_SAFE, which is
> only "safe" if the *current* node is removed---not if another node is
> removed.  Instead, just walk the entire list from the beginning when
> asked to resume all suspended requests with a given tag.
> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/blkdebug.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 2c0b9b0ee8..8f19d991fa 100644
> --- a/block/blkdebug.c

> -static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
> +static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
>  {
> -    BDRVBlkdebugState *s = bs->opaque;
> -    BlkdebugSuspendedReq *r, *next;
> +    BlkdebugSuspendedReq *r;
>  
> -    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, next) {
> +retry:
> +    QLIST_FOREACH(r, &s->suspended_reqs, next) {
>          if (!strcmp(r->tag, tag)) {
> +            QLIST_REMOVE(r, next);

Isn't the whole point of using QLIST_FOREACH_SAFE the ability to call
QLIST_REMOVE on an element in that list while still iterating?

>              qemu_coroutine_enter(r->co);
> +            if (all) {
> +                goto retry;
> +            }
>              return 0;

Oh, I see - you abandon the iteration in all control flow paths, so
the simpler loop is still okay.  Still, this confused me enough on
first read that it may be worth a comment, maybe:

/* No need for _SAFE, because iteration stops on first hit */

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


