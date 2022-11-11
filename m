Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BD625FA4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otX29-0001OA-J4; Fri, 11 Nov 2022 11:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otX27-0001LG-Oc
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:37:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otX26-0003dV-5N
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668184653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGyvPlqZGZW3ZvStmrgXjn2HezEFJq/AW63C2+FogI4=;
 b=NcnqM4A/USlMfqOoQysaTKUWHgUSwQvTTw8OWGAe4NH48RajOLe15kU+Cf2Ftvae3sdOeB
 +36yypAzlQTjoDjLTQiFj3kQ1DhxxY1L3lj1V6lDfyUnF6PLP2cjdnOMMU2pLg2D4PWj01
 uymQfTLgP491xZL7xiVP3SpxSctbzes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-IAZ9nCNYNy-TEKpdCBpX7g-1; Fri, 11 Nov 2022 11:37:32 -0500
X-MC-Unique: IAZ9nCNYNy-TEKpdCBpX7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C9DC185A794;
 Fri, 11 Nov 2022 16:37:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9B1F111F3BB;
 Fri, 11 Nov 2022 16:37:30 +0000 (UTC)
Date: Fri, 11 Nov 2022 17:37:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 04/13] block: Remove drained_end_counter
Message-ID: <Y256SRiR61wx2Stc@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-5-kwolf@redhat.com>
 <bf93bcbc-a6cd-95ff-dee1-7f7171a5d2de@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf93bcbc-a6cd-95ff-dee1-7f7171a5d2de@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 09.11.2022 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/8/22 15:37, Kevin Wolf wrote:
> > drained_end_counter is unused now, nobody changes its value any more. It
> > can be removed.
> > 
> > In cases where we had two almost identical functions that only differed
> > in whether the caller passes drained_end_counter, or whether they would
> > poll for a local drained_end_counter to reach 0, these become a single
> > function.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> [..]
> 
> >   /* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
> 
> Not about this patch, but what is recursive in bdrv_drain_invoke() ?

Nothing today, but it used to be the case. Looks like I forgot to remove
the comment in commit 7d40d9ef five years ago.

> > -static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
> > -                              int *drained_end_counter)
> > +static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
> >   {
> >       if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
> >               (!begin && !bs->drv->bdrv_drain_end)) {
> 
> [..]
> 
> >   /**
> >    * This function does not poll, nor must any of its recursively called
> > - * functions.  The *drained_end_counter pointee will be incremented
> > - * once
> 
> Seems that is wrong already after previous commit.. Not critical

I think it's technically correct: We don't schedule background
operations any more, so any statement about them is true.  :-)

You're right, it could be updated in the previous commit, but maybe it's
easier to read the patches when you need to verify my claim only in this
patch. As you said, it doesn't matter much anyway, at the end of the
series it's gone.

Kevin

> > for every background operation scheduled, and decremented once
> > - * the operation settles.  Therefore, the pointer must remain valid
> > - * until the pointee reaches 0.  That implies that whoever sets up the
> > - * pointee has to poll until it is 0.
> > - *
> > - * We use atomic operations to access *drained_end_counter, because
> > - * (1) when called from bdrv_set_aio_context_ignore(), the subgraph of
> > - *     @bs may contain nodes in different AioContexts,
> > - * (2) bdrv_drain_all_end() uses the same counter for all nodes,
> > - *     regardless of which AioContext they are in.
> > + * functions.
> >    */
> >   static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
> > -                                BdrvChild *parent, bool ignore_bds_parents,
> > -                                int *drained_end_counter)
> > +                                BdrvChild *parent, bool ignore_bds_parents)
> >   {
> >       BdrvChild *child;
> >       int old_quiesce_counter;
> > -    assert(drained_end_counter != NULL);
> > -
> 
> [..]
> 
> -- 
> Best regards,
> Vladimir
> 


