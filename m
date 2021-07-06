Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC33BD7FC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:44:23 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lN8-0007On-5Q
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0lM2-0006ae-9t
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0lLz-0003F3-AP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625578990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HUnIPUu5ZAm72271XjwUtAOAl7HP+jYQNp54LkyphI=;
 b=VXECx+FivTspm1aYbxNRxCmTrOOkhVpb9dNFri0oArmz4abdwP8uxwQS0G8/yCwl4wBglq
 aD3PZ3KvniWkQ+qFBE31QQahyv1At/t/wXgyjfacusAa7djMugJW9nLLooYeHvr9Wlkv8F
 QoD94jVyYfvEn5ml09sY0g1CtShfjtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-135aehr9PLaJt4ZJrk1vUA-1; Tue, 06 Jul 2021 09:43:07 -0400
X-MC-Unique: 135aehr9PLaJt4ZJrk1vUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01E641084F58;
 Tue,  6 Jul 2021 13:43:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8AB60CC9;
 Tue,  6 Jul 2021 13:43:04 +0000 (UTC)
Date: Tue, 6 Jul 2021 15:43:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 1/6] qcow2: Fix dangling pointer after reopen for 'file'
Message-ID: <YORd55VP0OFy6noV@redhat.com>
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-2-kwolf@redhat.com>
 <9b8d2ae9-d4fe-8643-b384-5de2e8bea5ce@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9b8d2ae9-d4fe-8643-b384-5de2e8bea5ce@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: berto@igalia.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.07.2021 um 15:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 06.07.2021 14:23, Kevin Wolf wrote:
> > Without an external data file, s->data_file is a second pointer with the
> > same value as bs->file. When changing bs->file to a different BdrvChild
> > and freeing the old BdrvChild, s->data_file must also be updated,
> > otherwise it points to freed memory and causes crashes.
> > 
> > This problem was caught by iotests case 245.
> > 
> > Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Still, some ideas below:
> 
> > ---
> >   block/qcow2.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index ee4530cdbd..cb459ef6a6 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -962,6 +962,7 @@ static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
> >   }
> >   typedef struct Qcow2ReopenState {
> > +    bool had_data_file;
> >       Qcow2Cache *l2_table_cache;
> >       Qcow2Cache *refcount_block_cache;
> >       int l2_slice_size; /* Number of entries in a slice of the L2 table */
> > @@ -1932,6 +1933,8 @@ static int qcow2_reopen_prepare(BDRVReopenState *state,
> >       r = g_new0(Qcow2ReopenState, 1);
> >       state->opaque = r;
> > +    r->had_data_file = has_data_file(state->bs);
> > +
> 
> So, during reopen, at some moment s->data_file become invalid. So, we
> shouldn't rely on it..
> 
> Maybe we need
> 
>        s->data_file = NULL;
> 
> here..

"need" is a strong word, but I guess we shouldn't access it between
prepare and commit, so I agree setting it to NULL would make bugs in
this area very visible.

In fact, we wouldn't even need r->had_data_file then because commit
could just set s->data_file = state->bs->file if it's NULL.

> >       ret = qcow2_update_options_prepare(state->bs, r, state->options,
> >                                          state->flags, errp);
> >       if (ret < 0) {
> > @@ -1966,7 +1969,18 @@ fail:
> >   static void qcow2_reopen_commit(BDRVReopenState *state)
> >   {
> > +    BDRVQcow2State *s = state->bs->opaque;
> > +    Qcow2ReopenState *r = state->opaque;
> > +
> >       qcow2_update_options_commit(state->bs, state->opaque);
> 
> Worth doing
> 
>        assert(r->had_data_file == has_data_file(state->bs));
> 
> here, to be double sure?

This would be wrong because at the time that this runs, state->bs->file
is already updated and this is what has_data_file() checks against. So
you can't use has_data_file() any more until it's synced again with the
code below.

In fact, this is why I even added r->had_data_file. At first I directly
used has_data_file(state->bs) here and watched it break.

> > +    if (!r->had_data_file && s->data_file != state->bs->file) {
> > +        /*
> > +         * If s->data_file is just a second pointer to bs->file (which is the
> > +         * case without an external data file), it may need to be updated.
> > +         */
> > +        s->data_file = state->bs->file;
> > +        assert(!has_data_file(state->bs));
> > +    }
> >       g_free(state->opaque);
> >   }

Kevin


