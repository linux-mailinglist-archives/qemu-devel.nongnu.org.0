Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267149E479
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:19:54 +0100 (CET)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5cv-0004ig-8U
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5WY-0005XM-JG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:13:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5WX-00022r-17
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643292796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKwfXq+CHyCBTzR0oeCh4cb5kq+0oSrO6qVfuYRnwRc=;
 b=DiIPN1kZ3LulbczW8QCdpTd5tdDm+24OWLwh6MZ+ZSXqnloKPwtKP240oAqjirxOVmY/sT
 VVSWXT+KKZgQHM/VWHVBvNo4FLVCS8kcAnygpO3KLgCeUCkQQBsVs0iPWC7yB2TycsXFb+
 EmYIfO2cREr/8bfFwF8byzQaez6XHeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-7nqBmMLdO5mJgTH0K90Kxw-1; Thu, 27 Jan 2022 09:13:13 -0500
X-MC-Unique: 7nqBmMLdO5mJgTH0K90Kxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F74100CC87;
 Thu, 27 Jan 2022 14:13:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF9A78ABF;
 Thu, 27 Jan 2022 14:13:04 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:13:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
Message-ID: <YfKobj+ZpzIxLasz@redhat.com>
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
 <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
 <4aa42545-e0da-2a15-110e-3d7b2d8cd273@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <4aa42545-e0da-2a15-110e-3d7b2d8cd273@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, den@openvz.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.2022 um 11:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 25.01.2022 12:24, Paolo Bonzini wrote:
> > On 1/24/22 18:37, Vladimir Sementsov-Ogievskiy wrote:
> > > Graph modifications should be done in drained section. stream_prepare()
> > > handler of block stream job call bdrv_set_backing_hd() without using
> > > drained section and it's theoretically possible that some IO request
> > > will interleave with graph modification and will use outdated pointers
> > > to removed block nodes.
> > > 
> > > Some other callers use bdrv_set_backing_hd() not caring about drained
> > > sections too. So it seems good to make a drained section exactly in
> > > bdrv_set_backing_hd().
> > 
> > Emanuele has a similar patch in his series to protect all graph
> > modifications with drains:
> > 
> > @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> > 
> >       assert(qemu_in_main_thread());
> > 
> > +    bdrv_subtree_drained_begin_unlocked(bs);
> > +    if (backing_hd) {
> > +        bdrv_subtree_drained_begin_unlocked(backing_hd);
> > +    }
> > +
> >       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
> >       if (ret < 0) {
> >           goto out;
> > @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> >       ret = bdrv_refresh_perms(bs, errp);
> >   out:
> >       tran_finalize(tran, ret);
> > +    if (backing_hd) {
> > +        bdrv_subtree_drained_end_unlocked(backing_hd);
> > +    }
> > +    bdrv_subtree_drained_end_unlocked(bs);
> > 
> >       return ret;
> >   }
> > 
> > so the idea at least is correct.
> > 
> > I don't object to fixing this independently, but please check
> > 1) if a subtree drain would be more appropriate, 2) whether
> > backing_hd should be drained as well, 3) whether we're guaranteed
> > to be holding the AioContext lock as required for
> > bdrv_drained_begin/end.
> > 
> 
> Hmm.
> 
> 1. Subtree draining of backing_hd will not help, as bs is not drained,
> we still may have in-fight request in bs, touching old bs->backing.
> 
> 2. I think non-recursive drain of bs is enough. We modify only bs
> node, so we should drain it. backing_hd itself is not modified. If
> backing_hd participate in some other backing chain - it's not touched,
> and in-flight requests in that other chain are not broken by
> modification, so why to drain it? Same for old bs->backing and other
> bs children. We are not interested in in-flight requests in subtree
> which are not part of request in bs. So, if no inflight requests in
> bs, we can modify bs and not care about requests in subtree.

I agree on both points. Emanuele's patch seems to be doing unnecessary
work there.

> 3. Jobs are bound to aio context, so I believe that they care to hold
> AioContext lock. For example, on path job_prepare may be called
> through job_exit(), job_exit() does
> aio_context_acquire(job->aio_context), or it may be called through
> job_cancel(), which seems to be called under aio_context_acquire() as
> well. So, seems in general we care about it, and of course
> bdrv_set_backing_hd() must be called with AioContext lock held. If for
> some code path it isn't, it's a bug..

We do have some code that does exactly that: In the main thread, we
often don't hold the AioContext lock, but only the BQL. I find it quite
ugly, but it works as long as the node is in the main AioContext.

One path where this is relevant is bdrv_open_inherit() ->
bdrv_open_backing_file() -> bdrv_set_backing_hd(). This one is harmless
because we know that we just created the new node in the main
AioContext.

All the other paths seem to come either from jobs (which take the
AioContext as you explained) or directly from monitor commands, which I
just checked to take the lock as well.

Kevin


