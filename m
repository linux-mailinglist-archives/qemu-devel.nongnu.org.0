Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE64623F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4bZ-0004Aw-VC; Thu, 10 Nov 2022 05:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot4bS-00048e-0R
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot4bQ-0003uy-Fw
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668075367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kRdaLTYPkNURvFNeb9bd1oYhyKCeM2KOO3ZyrAe9hMw=;
 b=bDCVB0PzHsGkB+8d6mINonBYEoH3IOoUTfloxMQ3zyzz4B0okVHBjmoyqQeU0ynR5Iqa/H
 nCgWl40wDeBHqt8Ai+xmQOEW6Xt/Hcj+bdi5zHNEJ5TuIaiaQOYXpdiTsQHidQ7xrQtuIR
 W+u9ORxYSw9KYGVIkHLvYfW8L/YwrvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-dqCCh0FIPl6BEakRLw5q1w-1; Thu, 10 Nov 2022 05:16:04 -0500
X-MC-Unique: dqCCh0FIPl6BEakRLw5q1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F6F3101A52A;
 Thu, 10 Nov 2022 10:16:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 275EE40C83DD;
 Thu, 10 Nov 2022 10:16:02 +0000 (UTC)
Date: Thu, 10 Nov 2022 11:16:01 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 08/13] stream: Replace subtree drain with a single node
 drain
Message-ID: <Y2zPYbwEAqbg68KJ@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-9-kwolf@redhat.com>
 <f44e394a-e447-dae1-5ee8-c5b1a34f6db8@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44e394a-e447-dae1-5ee8-c5b1a34f6db8@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.11.2022 um 17:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/8/22 15:37, Kevin Wolf wrote:
> > The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
> > graph changes between finding the base node and changing the block graph
> > as necessary on completion of the image streaming job.
> > 
> > The block graph could change between these two points because
> > bdrv_set_backing_hd() first drains the parent node, which involved
> > polling and can do anything.
> > 
> > Subtree draining was an imperfect way to make this less likely (because
> > with it, fewer callbacks are called during this window). Everyone agreed
> > that it's not really the right solution, and it was only committed as a
> > stopgap solution.
> > 
> > This replaces the subtree drain with a solution that simply drains the
> > parent node before we try to find the base node, and then call a version
> > of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
> > parent node is already drained.
> > 
> > This way, any graph changes caused by draining happen before we start
> > looking at the graph and things stay consistent between finding the base
> > node and changing the graph.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> [..]
> 
> >       base = bdrv_filter_or_cow_bs(s->above_base);
> > -    if (base) {
> > -        bdrv_ref(base);
> > -    }
> > -
> >       unfiltered_base = bdrv_skip_filters(base);
> >       if (bdrv_cow_child(unfiltered_bs)) {
> > @@ -82,7 +85,7 @@ static int stream_prepare(Job *job)
> >               }
> >           }
> > -        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
> > +        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
> >           ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
> 
> If we have yield points / polls during bdrv_set_backing_hd_drained()
> and bdrv_change_backing_file(), it's still bad and another
> graph-modifying operation may interleave. But b1e1af394d9 reports only
> polling in bdrv_set_backing_hd(), so I think it's OK to not care about
> other cases.

At this point in the series, bdrv_replace_child_noperm() can indeed
still poll. I'm not sure how bad it is, but at this point we're already
reconfiguring the graph with two specific nodes and somehow this poll
hasn't caused problems in the past. Anyway, at the end of the series,
there isn't be any polling left in bdrv_set_backing_hd_drained(), as far
as I can tell.

bdrv_change_backing_file() will certainly poll because it does I/O to
the image file. However, the change to the graph is completed at that
point, so I don't think it's a problem. Do you think it would be worth
putting a comment before bdrv_change_backing_file() that mentions that
the graph may change again from here on, but we've completed the graph
change?

> >           if (local_err) {
> >               error_report_err(local_err);
> > @@ -92,10 +95,7 @@ static int stream_prepare(Job *job)
> >       }
> >   out:
> > -    if (base) {
> > -        bdrv_unref(base);
> > -    }
> > -    bdrv_subtree_drained_end(s->above_base);
> > +    bdrv_drained_end(unfiltered_bs);
> >       return ret;
> >   }
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.

Kevin


