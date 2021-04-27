Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFD36C4A8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:11:58 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLdF-0007ZI-6J
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbLbE-0006Xp-BO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbLbC-000516-GM
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619521789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3Oniydz1FUJiJMStFUGJQT6re9XHenPsAfCvVfK/Ic=;
 b=K6qaiMzohwRnU59LdbU5tuBOo/qAWTQkEsoUaTq7Q6QvnsBRTI477DrHFE7b4xbpfZNS7m
 TLeLzJMdVV524bgOUtb9AYJf/PvK+yxIRhJx1lrSnERf1TTQ/jjTcnqIwfAuh/z9grM63P
 UR20yTlvRFioseUOO+IzyxLaPUKi4cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Bb6077zmPl2MEFeVEVQZUA-1; Tue, 27 Apr 2021 07:09:47 -0400
X-MC-Unique: Bb6077zmPl2MEFeVEVQZUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43D480402F;
 Tue, 27 Apr 2021 11:09:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-101.ams2.redhat.com [10.36.114.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D835A5D769;
 Tue, 27 Apr 2021 11:09:41 +0000 (UTC)
Date: Tue, 27 Apr 2021 13:09:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 22/36] block: add bdrv_remove_filter_or_cow
 transaction action
Message-ID: <YIfw9PtwFpx1aNmx@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-23-vsementsov@virtuozzo.com>
 <YIbpoWMyxkgRUtki@merkur.fritz.box>
 <f6bb0393-220f-09bf-9b2c-73fd68ee9967@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f6bb0393-220f-09bf-9b2c-73fd68ee9967@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.04.2021 um 19:18 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 26.04.2021 19:26, Kevin Wolf wrote:
> > Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > ---
> > >   block.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> > >   1 file changed, 76 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/block.c b/block.c
> > > index 11f7ad0818..2fca1f2ad5 100644
> > > --- a/block.c
> > > +++ b/block.c
> > > @@ -2929,12 +2929,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
> > >       }
> > >   }
> > > +static void bdrv_child_free(void *opaque)
> > > +{
> > > +    BdrvChild *c = opaque;
> > > +
> > > +    g_free(c->name);
> > > +    g_free(c);
> > > +}
> > > +
> > >   static void bdrv_remove_empty_child(BdrvChild *child)
> > >   {
> > >       assert(!child->bs);
> > >       QLIST_SAFE_REMOVE(child, next);
> > > -    g_free(child->name);
> > > -    g_free(child);
> > > +    bdrv_child_free(child);
> > >   }
> > >   typedef struct BdrvAttachChildCommonState {
> > > @@ -4956,6 +4963,73 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
> > >       return ret;
> > >   }
> > > +typedef struct BdrvRemoveFilterOrCowChild {
> > > +    BdrvChild *child;
> > > +    bool is_backing;
> > > +} BdrvRemoveFilterOrCowChild;
> > > +
> > > +/* this doesn't restore original child bs, only the child itself */
> > 
> > Hm, this comment tells me that it's intentional, but why is it correct?
> 
> that's because bdrv_remove_filter_or_cow_child_abort() aborts only
> part of  bdrv_remove_filter_or_cow_child().

I see that it aborts only part of it, but why?

Normally, a function getting a Transaction object suggests to me that on
failure, all changes the function made will be reverted, not just parts
of the changes.

> Look: bdrv_remove_filter_or_cow_child() firstly do
> bdrv_replace_child_safe(child, NULL, tran);, so bs would be restored
> by .abort() of bdrv_replace_child_safe() action.

Ah! So the reason is not that we don't want to restore child->bs, but
that bdrv_replace_child_safe() is already transactionable and will
automatically do this.

> So, improved comment may look like:
> 
> This doesn't restore original child bs, only the child itself. The bs
> would be restored by .abort() bdrv_replace_child_safe() subation of
> bdrv_remove_filter_or_cow_child() action.

"subation" is a typo for "subaction"?

Maybe something like this:

    We don't have to restore child->bs here to undo bdrv_replace_child()
    because that function is already transactionable and will do so in
    its own .abort() callback.

> Probably it would be more correct to rename
> 
> BdrvRemoveFilterOrCowChild -> BdrvRemoveFilterOrCowChildNoBs
> bdrv_remove_filter_or_cow_child_abort -> bdrv_remove_filter_or_cow_child_no_bs_abort
> bdrv_remove_filter_or_cow_child_commit -> bdrv_remove_filter_or_cow_child_no_bs_commit
> 
> and assert on .abort() and .commit() that s->child->bs is NULL.

I wouldn't bother with that. It was just that the comment confused me
because it seemed to suggest that we actually don't want to restore
child->bs, when its real intention was to say that it's already restored
somewhere else.

Kevin


